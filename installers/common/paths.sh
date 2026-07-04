# Wspolna logika instalatorow (bash) dla patcha Lucky Tower Ultimate.
# Uzycie: source "$(dirname "$0")/../common/paths.sh"

DATA_DIR_NAME="Lucky Tower Ultimate_Data"
PATCH_FILES=(
  "data.unity3d"
  "StreamingAssets/SaveFiles/LocalFiles/LocaDatabase.ltu"
)

resolve_game_root() {
  local root="$1"
  shift
  local candidates=("$@")

  if [[ -n "${LTU_GAME_ROOT:-}" ]]; then
    echo "$LTU_GAME_ROOT"
    return 0
  fi

  local env_file="$root/game-path.env"
  if [[ -f "$env_file" ]]; then
    # shellcheck source=/dev/null
    source "$env_file"
    if [[ -n "${LTU_GAME_ROOT:-}" ]]; then
      echo "$LTU_GAME_ROOT"
      return 0
    fi
  fi

  local path
  for path in "${candidates[@]}"; do
    if [[ -d "$path/$DATA_DIR_NAME" ]]; then
      echo "$path"
      return 0
    fi
  done
  return 1
}

file_size() {
  local f="$1"
  stat -c%s "$f" 2>/dev/null || stat -f%z "$f" 2>/dev/null
}

install_patch() {
  local patches="$1"
  local game_root="$2"
  local backup="$3"

  local rel patch target bak
  for rel in "${PATCH_FILES[@]}"; do
    patch="$patches/$rel"
    target="$game_root/$DATA_DIR_NAME/$rel"
    bak="$backup/$rel"

    if [[ ! -f "$patch" ]]; then
      echo "  blad: brak $patches/$rel - pobierz paczke z zakladki Releases i rozpakuj do patches/"
      exit 1
    fi
    if [[ ! -f "$target" ]]; then
      echo "  blad: brak oryginalu $target"
      exit 1
    fi
    mkdir -p "$(dirname "$bak")" "$(dirname "$target")"
    if [[ ! -f "$bak" ]]; then
      cp "$target" "$bak"
      echo "  backup: $rel ($(file_size "$bak") B)"
    fi
    cp "$patch" "$target"
    echo "  zainstalowano: $rel ($(file_size "$target") B)"
  done
}

verify_patch() {
  local patches="$1"
  local game_root="$2"
  local rel target
  for rel in "${PATCH_FILES[@]}"; do
    target="$game_root/$DATA_DIR_NAME/$rel"
    if cmp -s "$patches/$rel" "$target" 2>/dev/null; then
      echo "  weryfikacja $rel: OK"
    else
      echo "  UWAGA: $rel rozni sie od paczki w patches/ (lub nie zainstalowano)"
    fi
  done
}

restore_patch() {
  local backup="$1"
  local game_root="$2"
  local rel bak target restored=0
  for rel in "${PATCH_FILES[@]}"; do
    bak="$backup/$rel"
    target="$game_root/$DATA_DIR_NAME/$rel"
    if [[ -f "$bak" ]]; then
      mkdir -p "$(dirname "$target")"
      cp "$bak" "$target"
      echo "  przywrocono oryginal: $rel"
      restored=1
    else
      echo "  brak kopii zapasowej: $rel"
    fi
  done
  if [[ "$restored" -eq 0 ]]; then
    echo "  brak kopii zapasowej - nic do przywrocenia."
  fi
}

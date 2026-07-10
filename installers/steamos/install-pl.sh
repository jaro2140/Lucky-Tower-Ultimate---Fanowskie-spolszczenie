#!/usr/bin/env bash
# Instalator tlumaczenia PL: Lucky Tower Ultimate
# Wygenerowano automatycznie przez _App - nie edytuj recznie.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DIST_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
PAYLOAD="$DIST_DIR/payload"
BACKUP="$SCRIPT_DIR/backup"
DATA_DIR_NAME="Lucky Tower Ultimate_Data"

CANDIDATES=(
  "$HOME/.steam/steam/steamapps/common/Lucky Tower Ultimate"
  "$HOME/.local/share/Steam/steamapps/common/Lucky Tower Ultimate"
  "$HOME/.var/app/com.valvesoftware.Steam/.local/share/Steam/steamapps/common/Lucky Tower Ultimate"
  "/home/deck/.local/share/Steam/steamapps/common/Lucky Tower Ultimate"
  "/run/media/mmcblk0p1/steamapps/common/Lucky Tower Ultimate"
  "/run/media/deck/mmcblk0p1/steamapps/common/Lucky Tower Ultimate"
  "$HOME/GOG Games/Lucky Tower Ultimate"
)

resolve_game_root() {
  if [[ -n "${GAME_ROOT:-}" ]]; then
    echo "$GAME_ROOT"
    return 0
  fi
  local env_file="$SCRIPT_DIR/game-path.env"
  if [[ -f "$env_file" ]]; then
    # shellcheck source=/dev/null
    source "$env_file"
    if [[ -n "${GAME_ROOT:-}" ]]; then
      echo "$GAME_ROOT"
      return 0
    fi
  fi
  if [[ $# -ge 1 && -n "${1:-}" ]]; then
    echo "$1"
    return 0
  fi
  local path
  for path in "${CANDIDATES[@]}"; do
    if [[ -d "$path/$DATA_DIR_NAME" ]]; then
      echo "$path"
      return 0
    fi
  done
  for path in /run/media/"${USER:-deck}"/*/steamapps/common/"Lucky Tower Ultimate" /run/media/*/*/steamapps/common/"Lucky Tower Ultimate"; do
    if [[ -d "$path/$DATA_DIR_NAME" ]]; then
      echo "$path"
      return 0
    fi
  done
  return 1
}

if ! GAME_ROOT="$(resolve_game_root "${1:-}")"; then
  echo "Nie znaleziono folderu gry 'Lucky Tower Ultimate'."
  echo "Podaj sciezke jako argument:  ./install-pl.sh "/sciezka/do/gry""
  echo "albo utworz plik game-path.env (GAME_ROOT=/sciezka/do/gry) obok tego skryptu."
  exit 1
fi

if [[ ! -d "$GAME_ROOT/$DATA_DIR_NAME" ]]; then
  echo "Blad: '$GAME_ROOT' nie wyglada na folder gry 'Lucky Tower Ultimate' (brak $DATA_DIR_NAME)."
  exit 1
fi

echo "Gra:    $GAME_ROOT"
echo "Pakiet: $PAYLOAD"
mkdir -p "$BACKUP"

while IFS= read -r src; do
  rel="${src#"$PAYLOAD"/}"
  target="$GAME_ROOT/$rel"
  bak="$BACKUP/$rel"
  if [[ ! -f "$target" ]]; then
    echo "  BLAD: brak oryginalnego pliku $target"
    exit 1
  fi
  mkdir -p "$(dirname "$bak")"
  if [[ ! -f "$bak" ]]; then
    cp "$target" "$bak"
    echo "  backup: $rel"
  fi
  mkdir -p "$(dirname "$target")"
  cp "$src" "$target"
  echo "  zainstalowano: $rel"
done < <(find "$PAYLOAD" -type f)

echo ""
echo "Gotowe! Tlumaczenie Lucky Tower Ultimate (PL) zostalo zainstalowane."
echo ""
echo "Uruchamiam weryfikacje instalacji..."
bash "$SCRIPT_DIR/verify-install.sh" "$GAME_ROOT"
echo ""
echo "Aby przywrocic oryginal: ./uninstall-pl.sh"

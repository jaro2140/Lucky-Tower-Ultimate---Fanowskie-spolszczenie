#!/usr/bin/env bash
# Przywraca oryginalne (angielskie) pliki gry: Lucky Tower Ultimate
# Wygenerowano automatycznie przez _App - nie edytuj recznie.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
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

if [[ ! -d "$BACKUP" ]]; then
  echo "Brak backupu (folder $BACKUP nie istnieje) - nic do przywrocenia."
  exit 0
fi

if ! GAME_ROOT="$(resolve_game_root "${1:-}")"; then
  echo "Nie znaleziono folderu gry 'Lucky Tower Ultimate'."
  echo "Podaj sciezke jako argument:  ./uninstall-pl.sh "/sciezka/do/gry""
  exit 1
fi

echo "Gra: $GAME_ROOT"

while IFS= read -r src; do
  rel="${src#"$BACKUP"/}"
  target="$GAME_ROOT/$rel"
  mkdir -p "$(dirname "$target")"
  cp "$src" "$target"
  echo "  przywrocono: $rel"
done < <(find "$BACKUP" -type f)

echo ""
echo "Gotowe - przywrocono oryginalne (angielskie) pliki Lucky Tower Ultimate."

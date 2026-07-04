#!/usr/bin/env bash
# Przywraca oryginalny (angielski) plik danych gry — Linux / SteamOS.
set -euo pipefail

INSTALLER_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT="$(cd "$INSTALLER_DIR/../.." && pwd)"
# shellcheck source=../common/paths.sh
source "$INSTALLER_DIR/../common/paths.sh"

BACKUP="$ROOT/backup"

LINUX_CANDIDATES=(
  "$HOME/.local/share/Steam/steamapps/common/Lucky Tower Ultimate"
  "$HOME/.steam/steam/steamapps/common/Lucky Tower Ultimate"
  "$HOME/.steam/root/steamapps/common/Lucky Tower Ultimate"
  "$HOME/.var/app/com.valvesoftware.Steam/data/Steam/steamapps/common/Lucky Tower Ultimate"
)

if ! GAME_ROOT="$(resolve_game_root "$ROOT" "${LINUX_CANDIDATES[@]}")"; then
  echo "Nie znaleziono instalacji gry."
  exit 1
fi

echo "Gra: $GAME_ROOT"
restore_patch "$BACKUP" "$GAME_ROOT"

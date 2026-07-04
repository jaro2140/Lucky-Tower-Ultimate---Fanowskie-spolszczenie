#!/usr/bin/env bash
# Instaluje polski patch — Linux / SteamOS.
set -euo pipefail

INSTALLER_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT="$(cd "$INSTALLER_DIR/../.." && pwd)"
# shellcheck source=../common/paths.sh
source "$INSTALLER_DIR/../common/paths.sh"

PATCHES="$ROOT/patches"
BACKUP="$ROOT/backup"

LINUX_CANDIDATES=(
  "$HOME/.local/share/Steam/steamapps/common/Lucky Tower Ultimate"
  "$HOME/.steam/steam/steamapps/common/Lucky Tower Ultimate"
  "$HOME/.steam/root/steamapps/common/Lucky Tower Ultimate"
  "$HOME/.var/app/com.valvesoftware.Steam/data/Steam/steamapps/common/Lucky Tower Ultimate"
)

if ! GAME_ROOT="$(resolve_game_root "$ROOT" "${LINUX_CANDIDATES[@]}")"; then
  echo "Nie znaleziono instalacji gry."
  echo "Skopiuj game-path.env.example jako game-path.env w katalogu glownym repo"
  echo "i ustaw LTU_GAME_ROOT na sciezke do folderu gry."
  exit 1
fi

echo "Gra:   $GAME_ROOT"
echo "Patch: $PATCHES"
echo ""
install_patch "$PATCHES" "$GAME_ROOT" "$BACKUP"

echo ""
echo "Gotowe!"
echo "Wybierz w grze jezyk turecki - ten slot jest uzywany jako polski."
echo "Przetlumaczone linie pojawia sie po polsku, reszta zostaje po angielsku"
echo "do czasu ukonczenia tlumaczenia albo dodania wlasnego przelacznika PL."
echo "Weryfikacja: $INSTALLER_DIR/verify-install.sh"
echo "Przywroc EN:  $INSTALLER_DIR/restore-en.sh"

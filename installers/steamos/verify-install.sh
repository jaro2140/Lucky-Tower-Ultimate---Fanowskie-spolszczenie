#!/usr/bin/env bash
# Weryfikuje integralnosc zainstalowanego tlumaczenia PL: Lucky Tower Ultimate
# Wygenerowano automatycznie przez _App - nie edytuj recznie.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DIST_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
MANIFEST="$DIST_DIR/translation_manifest.json"
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

sha256_of() {
  if command -v shasum >/dev/null 2>&1; then
    shasum -a 256 "$1" | awk '{print $1}'
  else
    sha256sum "$1" | awk '{print $1}'
  fi
}

if [[ ! -f "$MANIFEST" ]]; then
  echo "Brak translation_manifest.json obok skryptu."
  exit 1
fi

if ! GAME_ROOT="$(resolve_game_root "${1:-}")"; then
  echo "Nie znaleziono folderu gry 'Lucky Tower Ultimate'."
  echo "Podaj sciezke jako argument:  ./verify-install.sh "/sciezka/do/gry""
  exit 1
fi

echo "Gra: $GAME_ROOT"
echo ""

ALL_OK=1
while IFS= read -r line; do
  rel="$(sed -E 's/^"(.*)": "[0-9a-f]{64}"$/\1/' <<<"$line")"
  expected="$(sed -E 's/^"(.*)": "([0-9a-f]{64})"$/\2/' <<<"$line")"
  target="$GAME_ROOT/$rel"
  if [[ ! -f "$target" ]]; then
    echo "  BRAK: $rel"
    ALL_OK=0
    continue
  fi
  actual="$(sha256_of "$target")"
  if [[ "$actual" == "$expected" ]]; then
    echo "  OK: $rel"
  else
    echo "  ROZNI SIE: $rel (plik zmodyfikowany / inna wersja patcha)"
    ALL_OK=0
  fi
done < <(grep -oE '"[^"]+": "[0-9a-f]{64}"' "$MANIFEST")

echo ""
if [[ "$ALL_OK" -eq 1 ]]; then
  echo "Wszystko zgodne - tlumaczenie Lucky Tower Ultimate (PL) zainstalowane poprawnie."
else
  echo "Znaleziono niezgodnosci - patrz szczegoly powyzej."
  exit 1
fi

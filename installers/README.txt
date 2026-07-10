Tłumaczenie PL gry: Lucky Tower Ultimate
================================

Uwaga:
  Ten wariant nie nadpisuje jezyka angielskiego. W grze wybierz jezyk niemiecki,
  aby korzystac z polskiego tlumaczenia. Nieprzetlumaczone jeszcze teksty w tym
  slocie beda wyswietlane po angielsku.


Instalacja:
  Linux:   cd Linux && ./install-pl.sh [opcjonalna sciezka do gry]
  SteamOS: cd SteamOS && ./install-pl.sh [opcjonalna sciezka do gry]
  Windows: powershell -ExecutionPolicy Bypass -File Windows\install-pl.ps1 [-GameRoot "sciezka"]

Jesli automatyczne wykrycie gry (Steam/GOG) nie zadziala, podaj sciezke recznie jako
argument albo utworz plik game-path.env (linia: GAME_ROOT=/sciezka/do/gry) obok skryptu.

Weryfikacja instalacji:
  Linux:   cd Linux && ./verify-install.sh [opcjonalna sciezka do gry]
  SteamOS: cd SteamOS && ./verify-install.sh [opcjonalna sciezka do gry]
  Windows: powershell -ExecutionPolicy Bypass -File Windows\verify-install.ps1 [-GameRoot "sciezka"]

Przywrocenie oryginalu (jezyk angielski):
  Linux:   cd Linux && ./uninstall-pl.sh [opcjonalna sciezka do gry]
  SteamOS: cd SteamOS && ./uninstall-pl.sh [opcjonalna sciezka do gry]
  Windows: powershell -ExecutionPolicy Bypass -File Windows\uninstall-pl.ps1 [-GameRoot "sciezka"]

Instalator zawsze robi kopie zapasowa oryginalnych plikow przed podmiana (folder
backup/), wiec odinstalowanie przywraca dokladnie to, co bylo przed patchem.

macOS nie jest wspierany przez te paczke.

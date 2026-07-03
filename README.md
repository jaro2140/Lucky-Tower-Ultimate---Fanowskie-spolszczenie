# Lucky Tower Ultimate - Fanowskie spolszczenie

Nieoficjalne spolszczenie gry **Lucky Tower Ultimate** (Studio Seufz).
Potrzebujesz **legalnie posiadanej kopii** gry (Steam).


## Po co to jest?
Lucky Tower Ultimate to absurdalna, czarnohumorystyczna gra roguelite/przygodowa w klimacie średniowiecznego fantasy, ale oficjalnie dostępna jest tylko w kilku językach (bez polskiego). Ten projekt to:
- **Fanowski patch językowy** — polskie dialogi, opisy przedmiotów i teksty interfejsu
- **Tłumaczenie z zachowaniem klimatu** — czarny humor, slapstick, ironia, a nie tłumaczenie słowo w słowo
- **Instalator** — Linux / SteamOS (macOS / Windows w planach)
- **Docelowo prawdziwy przełącznik PL w menu gry** — na razie patch podmienia dane silnika


## Status
**Wczesna wersja ALPHA — w trakcie tłumaczenia, jeszcze nie w pełni grywalna po polsku**


## Skala
- **8480** unikalnych linii dialogów i tekstów do przetłumaczenia, w **48** tabelach językowych


## Postęp
| Etap | Status |
|------|--------|
| Teksty | ⏳ ~55% (4678 / 8480 linii) |
| Przełącznik PL w menu gry | ⏳ planowane (patch obecnie podmienia dane w silniku, patrz niżej) |


## Jak to działa
Gra przechowuje teksty w wewnętrznych tabelach z kolumnami dla każdego języka (`en`, `de`, `fr`, `es`, `pt`, `zh`, `ru`, `it`, `tr`). Nasze tłumaczenie jest wstrzykiwane jako nowa kolumna `pl` obok nich.

Gra **nie ma jeszcze** własnego przycisku "Polski" w menu wyboru języka — jej menu językowe jest zaszyte na sztywno w kodzie i obsługuje tylko powyższe 9 języków. Dodanie prawdziwej pozycji "Polski" wymaga dodatkowej pracy nad silnikiem gry i jest zaplanowane na dalszy etap projektu. Do tego czasu paczki testowe tymczasowo podmieniają jeden z istniejących, rzadziej używanych języków, żeby można było zweryfikować tłumaczenie bezpośrednio w grze.


## Instalacja
Paczka z gotowym tłumaczeniem (plik `data.unity3d`) będzie publikowana w zakładce **Releases**,
gdy tłumaczenie osiągnie stabilny, grywalny stan — obecnie projekt jest w fazie aktywnego
tłumaczenia tekstów, więc release jeszcze się nie ukazał.

Gdy release będzie dostępny:
1. Pobierz paczkę z *Releases* i rozpakuj `data.unity3d` do folderu `patches/` w tym repozytorium.
2. Uruchom `installers/linux/install-pl.sh` (Linux / SteamOS; wykrywa instalację Steam automatycznie,
   w razie potrzeby wskaż ścieżkę w pliku `game-path.env` — patrz `game-path.env.example`).
3. W menu gry wybierz język **Turecki** — to tymczasowy nośnik polskiego tłumaczenia, dopóki gra
   nie ma własnego przełącznika "Polski" (patrz sekcja wyżej).
4. Weryfikacja: `installers/linux/verify-install.sh`. Przywrócenie oryginału: `installers/linux/restore-en.sh`.

Instalator zawsze robi kopię zapasową oryginalnego pliku przed podmianą (folder `backup/`).

Źródła tłumaczeń (do przeglądu, w formacie `key,en,pl`) są w folderze `translations/`,
a zasady stylu i glosariusz w `STYLE_GUIDE.md`.


## Disclaimer
Fanowski projekt **niezwiązany ze Studio Seufz**.
Lucky Tower Ultimate jest znakiem towarowym jego właścicieli.
Gra musi być legalnie zakupiona. Patch nie zawiera plików gry.

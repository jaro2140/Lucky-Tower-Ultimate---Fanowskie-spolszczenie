# Lucky Tower Ultimate - Fanowskie spolszczenie

Nieoficjalne spolszczenie gry **Lucky Tower Ultimate** (Studio Seufz).
Potrzebujesz **legalnie posiadanej kopii** gry (Steam).


## Po co to jest?
Lucky Tower Ultimate to absurdalna, czarnohumorystyczna gra roguelite/przygodowa w klimacie średniowiecznego fantasy, ale oficjalnie dostępna jest tylko w kilku językach (bez polskiego). Ten projekt to:
- **Fanowski patch językowy** — polskie dialogi, opisy przedmiotów i teksty interfejsu
- **Tłumaczenie z zachowaniem klimatu** — czarny humor, slapstick, ironia, a nie tłumaczenie słowo w słowo
- **Instalator** — Linux / SteamOS (macOS / Windows w planach)


## Status
**Wersja ALPHA — tłumaczenie działa w grze, ale projekt nadal jest w trakcie prac**


## Skala
- **8480** unikalnych linii dialogów i tekstów do przetłumaczenia, w **48** tabelach językowych


## Postęp
| Etap | Status |
|------|--------|
| Teksty | ⏳ ~90% |
| Menu i UI | ✅ przetłumaczone |
| Czcionki | ⏳ ~90% | 
| Drobne błędy tekstowe (odstępy, literówki) | ⏳ ~80% |
| Paczka testowa | ✅ dostępna |
| Polski jako osobny język | ⏳ wariant testowy: polski w slocie `tr` |
| Osobny przycisk "Polski" w menu | 📋 planowane |


## Jak to działa
Gra przechowuje teksty w wewnętrznych tabelach z kolumnami dla każdego języka (`en`, `de`, `fr`, `es`, `pt`, `zh`, `ru`, `it`, `tr`). Nasze tłumaczenie jest docelowo wstrzykiwane jako nowa kolumna `pl` obok nich.

Gra **nie ma jeszcze** własnego przycisku "Polski" w menu wyboru języka — jej menu językowe
jest zaszyte na sztywno w kodzie i obsługuje tylko powyższe 9 języków. 

Aktualny wariant testowy używa slotu **tureckiego** (`tr`) jako polskiego.


## Instalacja
Paczka z gotowym tłumaczeniem będzie publikowana w zakładce **Releases**,
gdy patch przejdzie stabilne testy w grze — czcionki i większość tekstów
działają już poprawnie.

Release będzie dostępny:
1. Pobierz paczkę z *Releases* i rozpakuj pliki
2. Uruchom `.\install-pl.sh` (Linux / SteamOS; wykrywa instalację Steam automatycznie,
   w razie potrzeby wskaż ścieżkę w pliku `game-path.env` — patrz `game-path.env.example`).
3. Wybierz w grze język **turecki** — ten slot jest używany jako polski. Przetłumaczone
   linie pojawią się po polsku, reszta zostaje po angielsku (patrz sekcja wyżej).
4. Weryfikacja: `.\verify-install.sh`. Przywrócenie oryginału: `.\restore-en.sh`.

Instalator zawsze robi kopię zapasową oryginalnych plików przed podmianą (folder `backup/`).


## Disclaimer
Fanowski projekt **niezwiązany ze Studio Seufz**.
Lucky Tower Ultimate jest znakiem towarowym jego właścicieli.
Gra musi być legalnie zakupiona. Patch nie zawiera plików gry.

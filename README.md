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
**Wersja ALPHA — tłumaczenie działa w grze, ale projekt nadal jest w trakcie prac**


## Skala
- **8480** unikalnych linii dialogów i tekstów do przetłumaczenia, w **48** tabelach językowych


## Postęp
| Etap | Status |
|------|--------|
| Teksty | ⏳ 95.8% (8122 / 8480 linii) |
| Menu i UI | ✅ przetłumaczone |
| Paczka testowa | ✅ działa w grze |
| Polski jako osobny język | ⏳ wariant testowy: polski w slocie `tr` |

Ukończone są m.in. pełne pliki `EA Milestone 1`, `EA Milestone 2`, `EA Milestone 3`,
`Endgame`, `Final 1.0`, `Wanst x Evelius`, `UI Texts`, `Companion Oneliner`,
`Alva Oneliner - Basic` oraz większość krótszych tabel dialogowych. Ostatni pozostały
blok to `New Wanst - Evelius` — zostało w nim **358** linii.


## Jak to działa
Gra przechowuje teksty w wewnętrznych tabelach z kolumnami dla każdego języka (`en`, `de`, `fr`, `es`, `pt`, `zh`, `ru`, `it`, `tr`). Nasze tłumaczenie jest docelowo wstrzykiwane jako nowa kolumna `pl` obok nich.

Gra **nie ma jeszcze** własnego przycisku "Polski" w menu wyboru języka — jej menu językowe
jest zaszyte na sztywno w kodzie i obsługuje tylko powyższe 9 języków. Dodanie prawdziwej
pozycji "Polski" wymaga dodatkowej pracy nad kodem gry.

Aktualny wariant testowy używa slotu **tureckiego** (`tr`) jako polskiego:
- język angielski (`en`) zostaje nietknięty,
- przetłumaczone linie są wstawiane do slotu `tr`,
- nieprzetłumaczone jeszcze linie w slocie `tr` automatycznie zostają po angielsku,
- patch podmienia zarówno `data.unity3d`, jak i runtime'ową bazę lokalizacji `LocaDatabase.ltu`.

W praktyce: po instalacji patcha wybierz w grze język turecki, aby testować polskie
tłumaczenie. Fragmenty jeszcze nieprzetłumaczone będą wyświetlane po angielsku.


## Instalacja
Paczka z gotowym tłumaczeniem będzie publikowana w zakładce **Releases**,
gdy tłumaczenie osiągnie stabilny, grywalny stan — obecnie projekt jest w fazie aktywnego
tłumaczenia tekstów, więc release jeszcze się nie ukazał.

Gdy release będzie dostępny:
1. Pobierz paczkę z *Releases* i rozpakuj pliki patcha do folderu `patches/` w tym repozytorium.
2. Uruchom `installers/linux/install-pl.sh` (Linux / SteamOS; wykrywa instalację Steam automatycznie,
   w razie potrzeby wskaż ścieżkę w pliku `game-path.env` — patrz `game-path.env.example`).
3. Wybierz w grze język **turecki** — ten slot jest używany jako polski. Przetłumaczone
   linie pojawią się po polsku, reszta zostaje po angielsku (patrz sekcja wyżej).
4. Weryfikacja: `installers/linux/verify-install.sh`. Przywrócenie oryginału: `installers/linux/restore-en.sh`.

Instalator zawsze robi kopię zapasową oryginalnych plików przed podmianą (folder `backup/`).

Źródła tłumaczeń (do przeglądu, w formacie `key,en,pl`) są w folderze `translations/`,
a zasady stylu i glosariusz w `STYLE_GUIDE.md`.


## Disclaimer
Fanowski projekt **niezwiązany ze Studio Seufz**.
Lucky Tower Ultimate jest znakiem towarowym jego właścicieli.
Gra musi być legalnie zakupiona. Patch nie zawiera plików gry.

# Lucky Tower Ultimate - Fanowskie spolszczenie

Nieoficjalne spolszczenie gry **Lucky Tower Ultimate** (Studio Seufz).
Potrzebujesz **legalnie posiadanej kopii** gry (Steam/GoG/Pozostałe).

## Podoba Ci się to co robie?
Postaw mi kawe! - https://buymeacoffee.com/jaro2140

## Po co to jest?
Lucky Tower Ultimate to absurdalna, czarnohumorystyczna gra roguelite/przygodowa w klimacie średniowiecznego fantasy, ale oficjalnie dostępna jest tylko w kilku językach (bez polskiego). Ten projekt to:
- **Fanowski patch językowy** — polskie dialogi, opisy przedmiotów i teksty interfejsu
- **Tłumaczenie z zachowaniem klimatu** — czarny humor, slapstick, ironia, a nie tłumaczenie słowo w słowo
- **Instalator** — macOS / Linux / SteamOS / Windows


## Status
**Wersja ALPHA — aktualny build testowy jest przygotowany pod Lucky Tower Ultimate V1.1**


## Skala
- Patch wstawia tłumaczenia do **48** tabel językowych oraz runtime'owej bazy `LocaDatabase.ltu`
- Aktualny build podmienia **17 867** wpisów tekstowych w slocie `tr`
- Dodatkowo patchowane są statyczne teksty Unity, które nie siedzą w zwykłych tabelach lokalizacji


## Postęp
| Etap | Status |
|------|--------|
| Teksty główne | ✅ większość przetłumaczona |
| Menu i UI | ✅ przetłumaczone |
| Statyczne teksty Unity | ✅ patchowane |
| Czcionki PL | ⏳ główne fonty i menu w trakcie naprawy |
| Drobne błędy tekstowe (odstępy, literówki) | ⏳ testy trwają |
| Polski jako osobny język | ⏳ wariant testowy: polski w slocie `tr` |
| Osobny przycisk "Polski" w menu | 📋 planowane |


## Jak to działa
Gra przechowuje teksty w wewnętrznych tabelach z kolumnami dla każdego języka (`en`, `de`, `fr`, `es`, `pt`, `zh`, `ru`, `it`, `tr`). Nasze tłumaczenie jest docelowo wstrzykiwane jako nowa kolumna `pl` obok nich.

Gra **nie ma jeszcze** własnego przycisku "Polski" w menu wyboru języka — jej menu językowe
jest zaszyte na sztywno w kodzie i obsługuje tylko powyższe 9 języków. 

Aktualny wariant testowy używa slotu **tureckiego** (`tr`) jako polskiego.


## Instalacja
Aktualna paczka testowa:

```text
Lucky_Tower_Ultimate_PL_TR_SLOT_patch.zip
```

1. Pobierz paczkę z **Releases** i rozpakuj ją w dowolnym folderze.
2. Uruchom instalator dla swojego systemu:
   - macOS / Linux / SteamOS: `./install-pl.sh`
   - Windows: `powershell -ExecutionPolicy Bypass -File install-pl.ps1`
3. Wybierz w grze język **turecki** — ten slot jest używany jako polski. Przetłumaczone
   linie pojawią się po polsku, reszta zostaje po angielsku (patrz sekcja wyżej).
4. Weryfikacja:
   - macOS / Linux / SteamOS: `./verify-install.sh`
   - Windows: `powershell -ExecutionPolicy Bypass -File verify-install.ps1`
5. Przywrócenie oryginału:
   - macOS / Linux / SteamOS: `./uninstall-pl.sh`
   - Windows: `powershell -ExecutionPolicy Bypass -File uninstall-pl.ps1`

Instalator zawsze robi kopię zapasową oryginalnych plików przed podmianą (folder `backup/)


## Disclaimer
Fanowski projekt **niezwiązany ze Studio Seufz**.
Lucky Tower Ultimate jest znakiem towarowym jego właścicieli.
Gra musi być legalnie zakupiona. Patch nie zawiera plików gry.

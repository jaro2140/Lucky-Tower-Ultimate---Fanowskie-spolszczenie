# Lucky Tower Ultimate - Fanowskie spolszczenie

Nieoficjalne spolszczenie gry **Lucky Tower Ultimate** (Studio Seufz).
Potrzebujesz **legalnie posiadanej kopii** gry (Steam/GoG/Pozostałe).

## Podoba Ci się to co robie?
Postaw mi kawe! - https://buymeacoffee.com/jaro2140

---

## Po co to jest?
Lucky Tower Ultimate to absurdalna, czarnohumorystyczna gra roguelite/przygodowa w klimacie średniowiecznego fantasy, ale oficjalnie dostępna jest tylko w kilku językach (bez polskiego). Ten projekt to:
- **Fanowski patch językowy** — polskie dialogi, opisy przedmiotów i teksty interfejsu
- **Tłumaczenie z zachowaniem klimatu** — czarny humor, slapstick, ironia i gry słowne (m.in. przerobione zagadki Mistrza Zagadek), a nie tłumaczenie słowo w słowo
- **Instalator** — Linux / SteamOS / Windows, z weryfikacją i pełnym odinstalowaniem


## Status
**Wersja stabilna — pełne tłumaczenie, przygotowane pod Lucky Tower Ultimate V1.1.0**

Tłumaczenie tekstu jest **ukończone w 100%** (8 484 wiersze dialogów i UI + 541
statycznych tekstów Unity). Czcionki — łącznie z ozdobnymi fontami menu
(gotycki CloisterBlack, MedievalSharp) — renderują komplet polskich znaków
diakrytycznych.


## Skala
- Patch wstawia tłumaczenia do **48** tabel językowych oraz runtime'owej bazy `LocaDatabase.ltu`
- Aktualny build podmienia **17 867** wpisów tekstowych w slocie `de`
- Dodatkowo patchowane są statyczne teksty Unity, które nie siedzą w zwykłych tabelach lokalizacji, oraz atlasy czcionek TMP (polskie znaki w fontach menu i dialogów)


## Postęp
| Etap | Status |
|------|--------|
| Teksty główne (dialogi, przedmioty, zagadki) | ✅ 100% |
| Menu i UI | ✅ 100% |
| Statyczne teksty Unity | ✅ patchowane |
| Czcionki PL (dialogi + menu) | ✅ naprawione i potwierdzone w grze |
| Polski w slocie języka niemieckiego | ✅ wariant produkcyjny |
| Osobny przycisk "Polski" w menu | 📋 planowane (wymaga patchowania kodu gry) |

Znane drobiazgi: pojedyncza litera „ą" w napisach końcowych może renderować się
z czcionki zastępczej.


## Jak to działa
Gra przechowuje teksty w wewnętrznych tabelach z kolumnami dla każdego języka (`en`, `de`, `fr`, `es`, `pt`, `zh`, `ru`, `it`, `tr`). Menu wyboru języka jest zaszyte na sztywno w kodzie gry i obsługuje tylko te 9 języków — nie da się dodać osobnego przycisku "Polski" bez modyfikacji skompilowanego kodu.

Dlatego patch wstawia polskie tłumaczenie do slotu **niemieckiego** (`de`):
po instalacji wybierz w grze język **Deutsch**, a cała gra będzie po polsku.
Oryginalny niemiecki jest w tej wersji niedostępny; pozostałe języki działają
bez zmian. Nieprzetłumaczalne wstawki (pseudo-łacińskie zaklęcia, żarty
językowe typu „Romanes eunt domus") celowo pozostają w oryginale.


## Instalacja
Aktualna paczka (zakładka **Releases**):

```text
Lucky_Tower_Ultimate_Patch_PL.zip
```

1. Pobierz paczkę z **Releases** i rozpakuj ją w dowolnym folderze.
2. Uruchom instalator dla swojego systemu:
   - Linux: `./dist/Linux/install-pl.sh`
   - SteamOS (Steam Deck): `./dist/SteamOS/install-pl.sh`
   - Windows: `powershell -ExecutionPolicy Bypass -File dist\Windows\install-pl.ps1`
3. Wybierz w grze język **niemiecki (Deutsch)** — ten slot jest używany jako polski.
4. Weryfikacja instalacji: `verify-install.sh` / `verify-install.ps1` (w tym samym folderze).
5. Przywrócenie oryginału: `uninstall-pl.sh` / `uninstall-pl.ps1`.

Instalator zawsze robi kopię zapasową oryginalnych plików przed podmianą
(folder `backup/`). Kopie skryptów instalatora do wglądu: folder `installers/`.

### Sumy kontrolne aktualnego wydania (SHA-256)

| Plik | SHA-256 |
|---|---|
| `Lucky_Tower_Ultimate_Patch_PL.zip` | `d6eba8d4a4bb947f59f17328d128660c1729100645e6653533bde0ed79082756` |
| `data.unity3d` | `a87fa70a8b94cbe5fb09ff427c719979cdce5cc396ff4db132c3524349543a21` |
| `LocaDatabase.ltu` | `9ecb427369e011855c8ed3b368d357f5a0f4c4be517cfe737aa50c1dc8cd1dc2` |

Wymagana wersja gry: **V1.1.0**. Nie instalować na innych wersjach.


## Zgłaszanie błędów
Zauważysz angielski tekst, źle wyświetlony znak albo literówkę? Zgłoś issue z
dokładną treścią kwestii (albo screenshotem) i miejscem w grze.


## Disclaimer
Fanowski projekt **niezwiązany ze Studio Seufz**.
Lucky Tower Ultimate jest znakiem towarowym jego właścicieli.
Gra musi być legalnie zakupiona. Patch nie zawiera plików gry.

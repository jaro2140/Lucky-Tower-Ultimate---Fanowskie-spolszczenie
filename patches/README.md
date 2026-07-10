# Paczka patcha

Skompilowana paczka z wstrzykniętym tłumaczeniem PL jest publikowana w zakładce
**Releases** tego repozytorium (plik `Lucky_Tower_Ultimate_Patch_PL.zip`).

Paczka jest **samowystarczalna** — zawiera payload (2 pliki gry) oraz skrypty
instalacji, weryfikacji i odinstalowania dla Linux / SteamOS / Windows:

```text
dist/Linux/install-pl.sh      dist/Linux/uninstall-pl.sh      dist/Linux/verify-install.sh
dist/SteamOS/...              dist/Windows/*.ps1
dist/payload/Lucky Tower Ultimate_Data/data.unity3d
dist/payload/Lucky Tower Ultimate_Data/StreamingAssets/SaveFiles/LocalFiles/LocaDatabase.ltu
dist/translation_manifest.json
```

Pobierz najnowszy release, rozpakuj ZIP w dowolnym folderze i uruchom
`dist/<Twój system>/install-pl.sh` (lub `.ps1`). Po instalacji wybierz w grze
język **niemiecki (Deutsch)** — ten slot jest używany jako polski.

Kopie skryptów instalatora (do wglądu) są w folderze `installers/` tego repo.

## Sumy kontrolne aktualnego wydania (SHA-256)

| Plik | SHA-256 |
|---|---|
| `Lucky_Tower_Ultimate_Patch_PL.zip` | `d6eba8d4a4bb947f59f17328d128660c1729100645e6653533bde0ed79082756` |
| `data.unity3d` | `a87fa70a8b94cbe5fb09ff427c719979cdce5cc396ff4db132c3524349543a21` |
| `LocaDatabase.ltu` | `9ecb427369e011855c8ed3b368d357f5a0f4c4be517cfe737aa50c1dc8cd1dc2` |

Wymagana wersja gry: **V1.1**. Nie instalować na innych wersjach.

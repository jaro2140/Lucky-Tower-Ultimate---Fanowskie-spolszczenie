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
| `Lucky_Tower_Ultimate_Patch_PL.zip` | `c306c48e102a9e450379ef9ce760078424e067a275b8a24755a71453cfe6610c` |
| `data.unity3d` | `b506a1e46dba14c5b57788d8703089ee98f8f8c60b03e993a9e1f052f7f315d4` |
| `LocaDatabase.ltu` | `1afed791d40ab06158a448e51c19a016a263304a7213acae6cc36c7b8dec2dd8` |

Wymagana wersja gry: **v1.1.2**. Nie instalować na innych wersjach.

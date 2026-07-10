# Weryfikuje integralnosc zainstalowanego tlumaczenia PL: Lucky Tower Ultimate
# Wygenerowano automatycznie przez _App - nie edytuj recznie.
param(
    [string]$GameRoot
)
$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$DistDir = Split-Path -Parent $ScriptDir
$Manifest = Join-Path $DistDir "translation_manifest.json"
$DataDirName = "Lucky Tower Ultimate_Data"

$Candidates = @(
    "C:\Program Files (x86)\Steam\steamapps\common\Lucky Tower Ultimate"
    "C:\Program Files\Steam\steamapps\common\Lucky Tower Ultimate"
    "C:\GOG Games\Lucky Tower Ultimate"
)

function Resolve-GameRoot {
    param([string]$Explicit)
    if ($Explicit) { return $Explicit }
    $envFile = Join-Path $ScriptDir "game-path.env"
    if (Test-Path $envFile) {
        $line = Get-Content $envFile | Where-Object { $_ -match '^GAME_ROOT=' } | Select-Object -First 1
        if ($line) { return ($line -replace '^GAME_ROOT=', '').Trim() }
    }
    foreach ($c in $Candidates) {
        if (Test-Path (Join-Path $c $DataDirName)) { return $c }
    }
    foreach ($drive in Get-PSDrive -PSProvider FileSystem) {
        $root = $drive.Root
        $libraryCandidates = @(
            (Join-Path $root "SteamLibrary\steamapps\common\Lucky Tower Ultimate")
            (Join-Path $root "Steam\steamapps\common\Lucky Tower Ultimate")
            (Join-Path $root "GOG Games\Lucky Tower Ultimate")
        )
        foreach ($path in $libraryCandidates) {
            if (Test-Path (Join-Path $path $DataDirName)) { return $path }
        }
    }
    return $null
}

if (-not (Test-Path $Manifest)) {
    Write-Host "Brak translation_manifest.json obok skryptu."
    exit 1
}

$GameRoot = Resolve-GameRoot -Explicit $GameRoot
if (-not $GameRoot) {
    Write-Host "Nie znaleziono folderu gry 'Lucky Tower Ultimate'."
    Write-Host "Uruchom:  .\verify-install.ps1 -GameRoot 'C:\sciezka\do\gry'"
    exit 1
}

Write-Host "Gra: $GameRoot"
Write-Host ""

$manifestData = Get-Content $Manifest -Raw | ConvertFrom-Json
$allOk = $true

foreach ($prop in $manifestData.files.PSObject.Properties) {
    $rel = $prop.Name
    $expected = $prop.Value
    $target = Join-Path $GameRoot $rel
    if (-not (Test-Path $target)) {
        Write-Host "  BRAK: $rel"
        $allOk = $false
        continue
    }
    $actual = (Get-FileHash -Path $target -Algorithm SHA256).Hash.ToLower()
    if ($actual -eq $expected) {
        Write-Host "  OK: $rel"
    } else {
        Write-Host "  ROZNI SIE: $rel (plik zmodyfikowany / inna wersja patcha)"
        $allOk = $false
    }
}

Write-Host ""
if ($allOk) {
    Write-Host "Wszystko zgodne - tlumaczenie Lucky Tower Ultimate (PL) zainstalowane poprawnie."
} else {
    Write-Host "Znaleziono niezgodnosci - patrz szczegoly powyzej."
    exit 1
}

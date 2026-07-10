# Instalator tlumaczenia PL: Lucky Tower Ultimate
# Wygenerowano automatycznie przez _App - nie edytuj recznie.
param(
    [string]$GameRoot
)
$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$DistDir = Split-Path -Parent $ScriptDir
$Payload = Join-Path $DistDir "payload"
$Backup = Join-Path $ScriptDir "backup"
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

$GameRoot = Resolve-GameRoot -Explicit $GameRoot
if (-not $GameRoot) {
    Write-Host "Nie znaleziono folderu gry 'Lucky Tower Ultimate'."
    Write-Host "Uruchom:  .\install-pl.ps1 -GameRoot 'C:\sciezka\do\gry'"
    exit 1
}
if (-not (Test-Path (Join-Path $GameRoot $DataDirName))) {
    Write-Host "Blad: '$GameRoot' nie wyglada na folder gry 'Lucky Tower Ultimate' (brak $DataDirName)."
    exit 1
}

Write-Host "Gra:    $GameRoot"
Write-Host "Pakiet: $Payload"
New-Item -ItemType Directory -Force -Path $Backup | Out-Null

Get-ChildItem -Path $Payload -Recurse -File | ForEach-Object {
    $rel = $_.FullName.Substring($Payload.Length + 1)
    $target = Join-Path $GameRoot $rel
    $bak = Join-Path $Backup $rel

    if (-not (Test-Path $target)) {
        Write-Host "  BLAD: brak oryginalnego pliku $target"
        exit 1
    }
    New-Item -ItemType Directory -Force -Path (Split-Path $bak) | Out-Null
    if (-not (Test-Path $bak)) {
        Copy-Item $target $bak
        Write-Host "  backup: $rel"
    }
    New-Item -ItemType Directory -Force -Path (Split-Path $target) | Out-Null
    Copy-Item $_.FullName $target -Force
    Write-Host "  zainstalowano: $rel"
}

Write-Host ""
Write-Host "Gotowe! Tlumaczenie Lucky Tower Ultimate (PL) zostalo zainstalowane."
Write-Host ""
Write-Host "Uruchamiam weryfikacje instalacji..."
& (Join-Path $ScriptDir "verify-install.ps1") -GameRoot $GameRoot
Write-Host ""
Write-Host "Aby przywrocic oryginal: .\uninstall-pl.ps1"

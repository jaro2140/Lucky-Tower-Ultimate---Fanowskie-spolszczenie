# Przywraca oryginalne (angielskie) pliki gry: Lucky Tower Ultimate
# Wygenerowano automatycznie przez _App - nie edytuj recznie.
param(
    [string]$GameRoot
)
$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
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

if (-not (Test-Path $Backup)) {
    Write-Host "Brak backupu (folder $Backup nie istnieje) - nic do przywrocenia."
    exit 0
}

$GameRoot = Resolve-GameRoot -Explicit $GameRoot
if (-not $GameRoot) {
    Write-Host "Nie znaleziono folderu gry 'Lucky Tower Ultimate'."
    Write-Host "Uruchom:  .\uninstall-pl.ps1 -GameRoot 'C:\sciezka\do\gry'"
    exit 1
}

Write-Host "Gra: $GameRoot"

Get-ChildItem -Path $Backup -Recurse -File | ForEach-Object {
    $rel = $_.FullName.Substring($Backup.Length + 1)
    $target = Join-Path $GameRoot $rel
    New-Item -ItemType Directory -Force -Path (Split-Path $target) | Out-Null
    Copy-Item $_.FullName $target -Force
    Write-Host "  przywrocono: $rel"
}

Write-Host ""
Write-Host "Gotowe - przywrocono oryginalne (angielskie) pliki Lucky Tower Ultimate."

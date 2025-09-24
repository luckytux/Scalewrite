# tools\stage.ps1
param(
  [string]$BuildMode = "Release"  # Debug/Release
)

$ErrorActionPreference = "Stop"

# Paths
$repo = Split-Path -Parent $PSScriptRoot
$buildOut = Join-Path $repo "build\windows\x64\runner\$BuildMode"
$stage = Join-Path $repo "dist\stage"

# Clean stage
if (Test-Path $stage) { Remove-Item $stage -Recurse -Force }
New-Item -ItemType Directory -Path $stage | Out-Null

# Build
pushd $repo
flutter build windows --$BuildMode
popd

# Copy runner output
Copy-Item "$buildOut\*" $stage -Recurse

# (Optional) verify must-have files
$must = @(
  "scalewrite_v2.exe",
  "flutter_windows.dll",
  "data\icudtl.dat",
  "data\app.so",
  "data\flutter_assets\AssetManifest.json",
  "data\flutter_assets\FontManifest.json",
  "data\flutter_assets\NOTICES.Z",
  "sqlite3.dll"
)
$missing = @()
foreach ($m in $must) {
  if (-not (Test-Path (Join-Path $stage $m))) { $missing += $m }
}
if ($missing.Count) {
  Write-Host "Missing:" -ForegroundColor Red
  $missing | ForEach-Object { " - $_" } | Write-Host
  throw "Staging failed: missing files above."
}

Write-Host "Stage ready at $stage" -ForegroundColor Green

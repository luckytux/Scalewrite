# Deploy-ScaleWrite.ps1
# Run from your Flutter project root (where pubspec.yaml lives)

$ErrorActionPreference = 'Stop'

# ----- SETTINGS -----
$TargetDir   = 'C:\ScaleWrite_v2'           # where you run the EXE from
$BuildDir    = 'build\windows\x64\runner\Release'  # Flutter Release output
$ExeName     = 'scalewrite_v2.exe'
$ProcessName = [IO.Path]::GetFileNameWithoutExtension($ExeName)

# ----- FUNCTIONS -----
function Kill-App {
  Write-Host "Killing any running '$ExeName'..." -ForegroundColor Yellow
  try {
    # Try graceful, then force
    Get-Process $ProcessName -ErrorAction Stop | ForEach-Object {
      Write-Host " - PID $($_.Id) → stopping..." -ForegroundColor DarkYellow
      Stop-Process -Id $_.Id -Force -ErrorAction SilentlyContinue
    }
  } catch {
    Write-Host " - No running processes found." -ForegroundColor DarkGray
  }

  # Wait for handles to release
  Start-Sleep -Milliseconds 300
}

function Build-App {
  Write-Host "`nBuilding Windows release..." -ForegroundColor Cyan
  flutter clean
  flutter pub get
  flutter build windows --release
}

function Copy-App {
  Write-Host "`nCopying files to $TargetDir ..." -ForegroundColor Cyan
  if (-not (Test-Path $TargetDir)) {
    New-Item -ItemType Directory -Force -Path $TargetDir | Out-Null
  }

  # Mirror build to target
  robocopy $BuildDir $TargetDir /MIR /R:2 /W:1 | Out-Null

  # Unblock all files (SmartScreen)
  Get-ChildItem $TargetDir -Recurse | Unblock-File -ErrorAction SilentlyContinue

  # Quick sanity check
  $must = @(
    "$TargetDir\$ExeName",
    "$TargetDir\flutter_windows.dll",
    "$TargetDir\data\icudtl.dat",
    "$TargetDir\sqlite3.dll",
    "$TargetDir\data\app.so",
    "$TargetDir\data\flutter_assets\AssetManifest.json"
  )
  $missing = $must | Where-Object { -not (Test-Path $_) }
  if ($missing) {
    Write-Host "`n❌ Missing required files:" -ForegroundColor Red
    $missing | ForEach-Object { Write-Host " - $_" -ForegroundColor Red }
    throw "Build copy incomplete. See missing files above."
  } else {
    Write-Host "✅ Core files present." -ForegroundColor Green
  }
}

function Launch-App {
  Write-Host "`nLaunching $ExeName ..." -ForegroundColor Cyan
  $exePath = Join-Path $TargetDir $ExeName
  Start-Process $exePath
  Write-Host "If SmartScreen appears, click 'More info' → 'Run anyway'." -ForegroundColor DarkGray
}

function Tail-Logs {
  # Try both native runner log and Dart startup log locations
  $localAppData = $env:LOCALAPPDATA
  $runnerLog    = Join-Path $localAppData 'ScaleWrite_v2\logs\runner.log'
  $startupLog   = Join-Path $localAppData 'ScaleWrite_v2\logs\startup.log'
  $localRunner  = Join-Path $TargetDir 'runner_local.log'

  Start-Sleep -Seconds 1
  Write-Host "`nRecent logs (if any):" -ForegroundColor Cyan

  if (Test-Path $runnerLog) {
    Write-Host "`n--- runner.log ---" -ForegroundColor DarkCyan
    Get-Content $runnerLog -Tail 20
  }
  if (Test-Path $startupLog) {
    Write-Host "`n--- startup.log ---" -ForegroundColor DarkCyan
    Get-Content $startupLog -Tail 20
  }
  if (Test-Path $localRunner) {
    Write-Host "`n--- runner_local.log ---" -ForegroundColor DarkCyan
    Get-Content $localRunner -Tail 20
  }
}

# ----- RUN -----
try {
  Kill-App
  Build-App
  Copy-App
  Launch-App
  Tail-Logs
  Write-Host "`nDone." -ForegroundColor Green
} catch {
  Write-Host "`nFAILED: $($_.Exception.Message)" -ForegroundColor Red
  throw
}

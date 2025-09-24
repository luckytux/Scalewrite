# ScaleWrite – Release Guide

This document describes how to build, stage, and package ScaleWrite for Windows, plus quick smoke tests and troubleshooting.

## Prerequisites

- Flutter SDK (stable) with Windows desktop enabled  
- Visual Studio 2022 (Desktop C++ workload)  
- Inno Setup 6 (CLI):  
  `C:\Users\<you>\AppData\Local\Programs\Inno Setup 6\ISCC.exe`
- PowerShell

> App data location at runtime:  
> `%AppData%\com.example\scalewrite_v2\ScaleWrite_v2\scalewrite.sqlite`

---

## 1) Build (Release)

```powershell
# From repo root
flutter clean
flutter pub get
flutter build windows --release
```

Artifacts land in: `build\windows\x64\runner\Release\`

---

## 2) Stage Files for Packaging

```powershell
# From repo root
powershell -ExecutionPolicy Bypass -File tools\stage.ps1
```

Output: `dist\stage\` containing:
- `scalewrite_v2.exe`
- `flutter_windows.dll`
- `sqlite3.dll` & plugin DLLs
- `data\app.so`, `data\icudtl.dat`, `data\flutter_assets\...`

Quick check:

```powershell
$root = "C:\Projects\scalewrite_v2\dist\stage"
@(
  "$root\scalewrite_v2.exe",
  "$root\flutter_windows.dll",
  "$root\sqlite3.dll",
  "$root\data\app.so",
  "$root\data\icudtl.dat",
  "$root\data\flutter_assets\AssetManifest.json"
) | % { "{0}  {1}" -f ($(Test-Path $_) ? "OK " : "MISS"), $_ }
```

---

## 3) Build the Installer (Inno Setup)

```powershell
$ISCC = "C:\Users\$env:USERNAME\AppData\Local\Programs\Inno Setup 6\ISCC.exe"
& $ISCC "tools\ScaleWriteInstaller.iss"
```

Result: `dist\ScaleWrite-Setup-<version>.exe`

> The script packs everything from `dist\stage\` and creates Start Menu/Desktop shortcuts.

---

## 4) Smoke Test (Fresh Machine/VM)

1. Run the installer (SmartScreen → **More info** → **Run anyway** if unsigned).
2. Launch **ScaleWrite** from the Start Menu or Desktop.
3. Verify logs & DB:
   - Logs: `%AppData%\com.example\scalewrite_v2\ScaleWrite_v2\logs\startup.log`
   - DB: `%AppData%\com.example\scalewrite_v2\ScaleWrite_v2\scalewrite.sqlite`
4. Login with default admin:  
   **Username:** `admin` | **Password:** `password`
5. Navigate core pages: Home → Admin → Inventory → Prices, etc.

---

## 5) Versioning

- Bump app version in `pubspec.yaml` (e.g., `version: 2.0.0+2000`).
- Optionally add an `APP_VERSION` define to the runner or use `package_info_plus` in-app.
- Tag the commit: `git tag v2.0.0 && git push --tags`.

---

## Troubleshooting

**Missing stage files during packaging**  
Re-run:
```powershell
flutter build windows --release
powershell -ExecutionPolicy Bypass -File tools\stage.ps1
```

**SmartScreen warning**  
Expected if unsigned. To avoid it, code sign the EXE and installer with a trusted certificate.

**Login fails on fresh install**  
Check DB path above. Confirm a row exists in `users` where `uid='admin'` and `password_hash` is present. The app seeds an admin with password `password` if none exists.

**Unique constraint errors during seed**  
The seeder uses `insertOrIgnore` for service reports and skips if data already exists. Delete the DB to reseed:
```powershell
Remove-Item "$env:AppData\com.example\scalewrite_v2\ScaleWrite_v2\scalewrite.sqlite"
```

---

## Release Checklist

- [ ] `flutter build windows --release`
- [ ] `tools\stage.ps1` completes; required files present
- [ ] Inno Setup build produces `ScaleWrite-Setup-<version>.exe`
- [ ] Fresh VM install passes smoke test
- [ ] Version bumped & git tag created
- [ ] Release artifact uploaded/shared

---

## Future Enhancements

- Code signing (EXE + installer)
- Auto-update channel (e.g., Squirrel, custom updater)
- Silent install switches in `.iss`
- Per-user vs per-machine install choice

--- 

_End of guide._

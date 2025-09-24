; tools\ScaleWriteInstaller.iss
#define MyAppName "ScaleWrite"
#define MyAppExe "scalewrite_v2.exe"
#define MyAppVersion "2.0.0"         ; <- update as needed
#define MyCompany "Southern Scale Co"
#define MyURL "https://example.com"  ; <- optional
#define StageDir "..\dist\stage"     ; relative to this .iss file

[Setup]
AppId={{C2E42F86-3D3E-4B68-9D4C-0E2D5CE6A9C1}   ; GUID (keep stable once chosen)
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyCompany}
AppPublisherURL={#MyURL}
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
DisableDirPage=no
DisableProgramGroupPage=yes
OutputDir=..\dist
OutputBaseFilename=ScaleWrite-Setup-{#MyAppVersion}
Compression=lzma
SolidCompression=yes
ArchitecturesInstallIn64BitMode=x64
PrivilegesRequired=admin
WizardStyle=modern
UninstallDisplayIcon={app}\{#MyAppExe}
CloseApplications=yes
RestartApplications=no
; Ensure upgrades can replace files while app is running:
AppMutex=ScaleWriteMutex

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "Create a &desktop shortcut"; GroupDescription: "Additional icons:"; Flags: unchecked

[Files]
; Everything we staged goes to {app}
Source: "{#StageDir}\*"; DestDir: "{app}"; Flags: recursesubdirs ignoreversion

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExe}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExe}"; Tasks: desktopicon

[Run]
; Offer to launch after install
Filename: "{app}\{#MyAppExe}"; Description: "Launch {#MyAppName}"; Flags: nowait postinstall skipifsilent

[InstallDelete]
; If you ever changed app name/exe, you could clean old filenames here on upgrade.

[UninstallDelete]
; We intentionally DO NOT delete per-user data. It lives under:
; %APPDATA%\com.example\scalewrite_v2\ScaleWrite_v2
; If you want to offer a "remove all data" checkbox, you can add a task and delete that folder.

[Code]
procedure InitializeWizard;
begin
  WizardForm.SelectTasksLabel.Caption := 'Choose additional options:';
end;

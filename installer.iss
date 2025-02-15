[Setup]
AppName=Deltaforge
AppVersion=0.0.1
DefaultDirName={autopf}\Deltaforge
DisableProgramGroupPage=no
OutputDir=installer
OutputBaseFilename=deltaforge
Compression=lzma
SolidCompression=yes
WizardStyle=modern
ChangesEnvironment=no
SetupIconFile=icons\deltaforge_icon.ico
WizardImageFile=icons\Welcome_Image.bmp
DisableWelcomePage=no
LicenseFile=LICENSE

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
; The pixi-pack executable - in a temp directory that will be removed
Source: "Z:/bin/pixi-pack.exe"; DestDir: "{tmp}"; Flags: ignoreversion deleteafterinstall
; The packed environment
Source: "deltaforge.tar"; DestDir: "{tmp}"; Flags: ignoreversion deleteafterinstall
; Any additional files like README, LICENSE, etc.
Source: "LICENSE"; DestDir: "{app}"; Flags: ignoreversion
; Custom prompt batch file
Source: "deltaforge_prompt.bat"; DestDir: "{app}"; Flags: ignoreversion
; Icon
Source: "icons\deltaforge_icon.ico"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\Deltaforge Prompt"; Filename: "%comspec%"; \
    Parameters: "/k ""{app}\deltaforge_prompt.bat"""; \
    WorkingDir: "{%USERPROFILE}"; \
    Comment: "Opens Deltaforge environment prompt"; \
    IconFilename: "{app}\deltaforge_icon.ico"

[Run]
; Run pixi-pack to unpack the environment during installation
Filename: "{tmp}\pixi-pack.exe"; \
    Parameters: "unpack --output-directory ""{app}"" --env-name deltaforge ""{tmp}\deltaforge.tar"""; \
    WorkingDir: "{app}"; \
    StatusMsg: "Unpacking Deltaforge..."; \
    Flags: shellexec waituntilterminated; \
    Check: RunUnpack

[Code]
function RunUnpack: Boolean;
begin
  Result := True;
end;

[UninstallDelete]
Type: files; Name: "{app}\activate.bat"
Type: filesandordirs; Name: "{app}\deltaforge"
Type: dirifempty; Name: "{app}"

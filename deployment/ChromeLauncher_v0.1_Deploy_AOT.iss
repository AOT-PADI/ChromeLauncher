; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "ChromeLauncher"
#define MyAppVersion "0.0.1"
#define MyAppPublisher "Rectorat Orl�ans-Tours - DEP - P�le analyse & d�veloppement"
#define MyAppURL "http://www.ac-orleans-tours.fr/stats/"
#define MyAppExeName "ChromeLauncher.exe"
#define MyAppBatch "/batch/ChromeLauncher.bat"

; Get the path where the script iss is placed
#define MyPathRelease SourcePath + "..\source\ChromeLauncher\bin\Release\"
#define MyOutputDir SourcePath + "..\bin\" + MyAppVersion + "\"
#define MyRessources SourcePath + "\Ressources\"

; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
#define MyAppGUID "4F7DBD1B-F8E8-4A95-BDEB-764BC0D90593"
#define MyAppId MyAppName + "_" + MyAppGUID
                 
[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={#MyAppId}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={sd}\{#MyAppName}
DefaultGroupName={#MyAppName}
;LicenseFile={#MyPathRelease}Ressources\LICENCE.txt
;InfoBeforeFile={#MyPathRelease}Ressources\BEFORE_INSTALL.txt
;InfoAfterFile={#MyPathRelease}Ressources\AFTER_INSTALL.txt
OutputDir={#MyOutputDir}
OutputBaseFilename=Setup_{#MyAppName}_v{#MyAppVersion}
Compression=lzma
SolidCompression=yes
AppContact=ce.dep@ac-orleans-tours.fr
UninstallDisplayIcon={#MyRessources}icon_app_uninstall.ico
WizardImageFile={#MyRessources}innosetup_background.bmp
WizardImageStretch=no
WizardSmallImageFile={#MyRessources}icon_app_55x55.bmp
SetupIconFile={#MyPathRelease}icon_app.ico
DisableProgramGroupPage=yes

[Languages]
Name: "french"; MessagesFile: "compiler:Languages\French.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "{#MyPathRelease}ChromeLauncher.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MyPathRelease}*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
                                                                          
[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppBatch}"; IconFilename: {app}\icon_app.ico; Flags: runmaximized;
Name: "{group}\{cm:ProgramOnTheWeb,{#MyAppName}}"; Filename: "{#MyAppURL}";
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"; IconFilename: {#MyRessources}icon_app_uninstall.ico;
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppBatch}"; IconFilename: {app}\icon_app.ico; IconIndex: 0; Flags: runmaximized; 

[Run]
Filename: "{app}\{#MyAppBatch}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: shellexec postinstall skipifsilent runmaximized;

[Registry]
Root: HKCR; Subkey: AOT_Application_ChromeLauncher; ValueType: string; ValueName: ; ValueData: Program ChromeLauncher; Flags: uninsdeletekey
Root: HKCR; Subkey: AOT_Application_ChromeLauncher\DefaultIcon; ValueType: string; ValueName: ; ValueData: {app}\ChromeLauncher.exe,0; Flags: uninsdeletevalue
Root: HKCR; Subkey: AOT_Application_ChromeLauncher\shell\open\command; ValueType: string; ValueName: ; ValueData: """{app}\ChromeLauncher.exe"" ""%1"""; Flags: uninsdeletevalue

; Add in %PATH% the executable (variable environement windows)
Root: HKCU; Subkey: "Environment"; ValueType: string; ValueName: "PATH"; ValueData: "{reg:HKCU\Environment\,PATH};{app}"
Root: HKLM; SubKey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment\"; ValueType: string; ValueName: "Path"; ValueData: "{reg:HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\,Path};{app}"

[Code]
function InitializeSetup(): Boolean;
var
  ResultCode: Integer;
  ResultStr:string;
begin
  // Check if the application is already install
  // MsgBox('MyAppId = ' + '{#MyAppId}', mbInformation, mb_Ok);
  begin
    If RegQueryStringValue(HKLM, 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{#MyAppId}_is1', 'UninstallString', ResultStr) then begin
      If ResultStr<>'' then begin
        ResultStr:=RemoveQuotes(ResultStr);
          if MsgBox('L''installation a d�tect� que le programme ChromeLauncher est d�j� install�. ' #13#13 'Souhaitez-vous d�sinstaller cette version existante avant de poursuivre?', mbConfirmation, MB_YESNO) = idYes then
          if not Exec(ResultStr, '/silent', '', SW_SHOW, ewWaitUntilTerminated, ResultCode) then
            MsgBox('Erreur !!! ' #13#13 '' + SysErrorMessage(ResultCode) + '.', mbError, MB_OK);
      end;
    end;
  end ;
  Result := True;
end;

procedure InitializeWizard();
var
  WLabel1, WLabel2,FLabel1, FLabel2: TLabel;
  TypesComboItemIndex: integer;
begin
  WizardForm.WelcomeLabel1.Hide;
  WizardForm.WelcomeLabel2.Hide;
  WizardForm.FinishedHeadingLabel.Hide;

  //WizardForm.Font.Name := 'tahoma';
  //WizardForm.LicenseMemo.Font.Name := 'Consolas';
  //WizardForm.InfoBeforeMemo.Font.Name := 'Consolas';
  //WizardForm.InfoAfterMemo.Font.Name := 'Consolas';

  WizardForm.WizardBitmapImage.Width := 500;
  WizardForm.WizardBitmapImage.Height := 315;

  WLabel1 := TLabel.Create(WizardForm);
  WLabel1.Left := ScaleX(176); 
  WLabel1.Top := ScaleY(16);
  WLabel1.Width := ScaleX(301); 
  WLabel1.Height := ScaleY(54); 
  WLabel1.AutoSize := False;
  WLabel1.WordWrap := True;
  WLabel1.Font.Name := 'tahoma'; 
  WLabel1.Font.Size := 12; 
  WLabel1.Font.Style := [fsBold];
  WLabel1.Font.Color:= clBlack; 
  WLabel1.ShowAccelChar := False;
  WLabel1.Caption := WizardForm.WelcomeLabel1.Caption;
  WLabel1.Transparent := True;
  WLabel1.Parent := WizardForm.WelcomePage;
  WLabel1.Hide;

  WLabel2 :=TLabel.Create(WizardForm);
  WLabel2.Left := ScaleX(176); 
  WLabel2.Top := ScaleY(136);
  WLabel2.Width := ScaleX(301); 
  WLabel2.Height := ScaleY(234); 
  WLabel2.AutoSize := False;
  WLabel2.WordWrap := True;
  WLabel2.Font.Name := 'tahoma'; 
  WLabel2.Font.Color:= clBlack; 
  WLabel2.ShowAccelChar := False;
  WLabel2.Caption := WizardForm.WelcomeLabel2.Caption;
  WLabel2.Transparent := True;
  WLabel2.Parent := WizardForm.WelcomePage;

  WizardForm.WizardBitmapImage2.Width := 500; 
  WizardForm.WizardBitmapImage2.Height := 315; 

  WizardForm.FinishedLabel.Left := ScaleX(176);
  WizardForm.FinishedLabel.Top := ScaleY(116);
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  // you must do this as late as possible, because the RunList is being modified
  // after installation; so this will check if there's at least one item in the
  // RunList and then set to the first item (indexing starts at 0) Enabled state
  // to False
  if (CurPageID = wpFinished) then    
    //WizardForm.RunList.Visible := False;
    WizardForm.RunList.Left := ScaleX(176);
    WizardForm.RunList.Top := ScaleY(214);
end;

// Remove variable environement
procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
var
  Path, AppDir: string;
  Index: Integer;
begin
  if CurUninstallStep = usUninstall then
  begin
    if RegQueryStringValue(HKEY_LOCAL_MACHINE,
      'SYSTEM\CurrentControlSet\Control\Session Manager\Environment\',
      'Path', Path) then
    begin
      AppDir := ExpandConstant('{app}');
      Index := Pos(AppDir, Path);
      Delete(Path, Index-1, Length(AppDir)+1);
      RegWriteStringValue(HKEY_LOCAL_MACHINE,
        'SYSTEM\CurrentControlSet\Control\Session Manager\Environment\',
        'Path', Path);
    end;
    
    if RegQueryStringValue(HKEY_CURRENT_USER,
      'Environment',
      'PATH', Path) then
    begin
      AppDir := ExpandConstant('{app}');
      Index := Pos(AppDir, Path);
      Delete(Path, Index-1, Length(AppDir)+1);
      RegWriteStringValue(HKEY_CURRENT_USER,
        'Environment\',
        'PATH', Path);
    end;
  end;
end;
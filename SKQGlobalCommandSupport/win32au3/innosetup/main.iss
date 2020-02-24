; Script generated by the Inno Script Studio Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "StreamKeys Quantum (Firefox extension)"
#define MyAppVersion "1.0.180"
#define MyAppPublisher "efprojects.com"
#define MyAppURL "https://lnurl.ru/streamkeys-quantum"
#define SkqgcsFolder ""
                                 

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{C5CD94C2-FCCE-4B5A-B270-1392283BD14A}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion} Beta
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={localappdata}\SKQGlobalCommandSupport
DisableDirPage=yes
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
InfoBeforeFile=C:\Users\ef\Documents\Developing\mediaff\streamkeys-quantum\SKQGlobalCommandSupport\win32au3\innosetup\info.txt
InfoAfterFile=C:\Users\ef\Documents\Developing\mediaff\streamkeys-quantum\SKQGlobalCommandSupport\win32au3\innosetup\info2.txt
OutputBaseFilename=StreamKeys_Firefox_Quantum
SetupIconFile=C:\Users\ef\Documents\Developing\mediaff\streamkeys-quantum\code\favicon.ico
Compression=lzma
SolidCompression=True
DisableWelcomePage=False
AlwaysShowComponentsList=False
PrivilegesRequired=lowest
ShowLanguageDialog=no
LanguageDetectionMethod=none
UninstallDisplayName={#MyAppName}
MinVersion=0,6.1

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
; NOTE: Don't use "Flags: ignoreversion" on any shared system files
Source: "..\extension\skq@efprojects.com.xpi"; DestDir: "{userappdata}\Mozilla\Extensions\{{ec8030f7-c20a-464f-9b0e-13a3a9e97384}\"; DestName: "skq@efprojects.com.xpi"; Flags: ignoreversion
Source: "..\config.ini"; DestDir: "{localappdata}\SKQGlobalCommandSupport"; Flags: ignoreversion
Source: "..\manifest.json"; DestDir: "{localappdata}\SKQGlobalCommandSupport"; Flags: ignoreversion
Source: "..\script\streamkeyshelper.exe"; DestDir: "{localappdata}\SKQGlobalCommandSupport"; Flags: ignoreversion

[Icons]
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"; Flags: preventpinning excludefromshowinnewinstall

[Dirs]
Name: "{localappdata}\SKQGlobalCommandSupport"
Name: "{userappdata}\Mozilla\Extensions\{{ec8030f7-c20a-464f-9b0e-13a3a9e97384}"

[Registry]
Root: "HKCU"; Subkey: "Software\Mozilla\NativeMessagingHosts\skqgcs"; ValueType: string; ValueData: "{localappdata}\SKQGlobalCommandSupport\manifest.json"; Flags: createvalueifdoesntexist deletekey uninsdeletekey

[Messages]
WelcomeLabel2=This will install StreamKeys-Quantum Beta version. It misses some important features, such as key remapping, so watch for release version soon! %n%nAttention! Please, close all Firefox windows before continuation!

[CustomMessages]
ffnotinst=Firefox is not installed on your PC. This plugin is for Firefox only.

[Code]
function InitializeSetup(): Boolean;
begin
 if (DirExists(ExpandConstant('{localappdata}\Mozilla\Firefox\Profiles\'))) then
 begin
   Result := True;
 end
 else
 begin
   MsgBox(ExpandConstant('{cm:ffnotinst}'), mbCriticalError, MB_OK);
   Result := False;
 end;
end;

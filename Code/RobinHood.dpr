program RobinHood;

uses
  System.StartUpCopy,
  FMX.Forms,
  Winapi.TlHelp32,
  Winapi.Windows,
  uMain in 'uMain.pas' {Form1},
  uNaviPanel in 'uNaviPanel.pas',
  uDashPanel in 'uDashPanel.pas',
  uLogin in 'uLogin.pas' {frmLogin},
  Datamodule in 'Datamodule.pas' {DataModule1: TDataModule},
  uDonationsThread in 'uDonationsThread.pas',
  uSplashscreen in 'uSplashscreen.pas' {Splashscreen},
  FMX.GIFImage in 'FMX.GIFImage.pas',
  uPreferences in 'uPreferences.pas' {frmPreferences},
  uSettingsTab in 'uSettingsTab.pas';

{$R *.res}

var
  Semafor: THandle; { Identifier for processes running in windows }

  // Brings the window back into users view if it has been minimised
  // and user tries to open application
procedure RestoreWindow(aFormName: string);
var
  Wnd, App: HWND;
begin
  Wnd := FindWindow(PChar(aFormName), nil);
  if (Wnd <> 0) then
  begin { Set Window to foreground }
    App := GetWindowLong(Wnd, GWL_HWNDPARENT);
    // if IsIconic(App) then
    ShowWindow(App, SW_RESTORE);

    SetForegroundwindow(App);
  end;
end;

begin
  // Creates semaphore with default security attributes (nil).
  // Sets the initial semaphore count and the maximum (0, 1)
  Semafor := CreateSemaphore(nil, 0, 1, 'MY_APPLICATION_IS_RUNNING');
  if ((Semafor <> 0) and { application is already running }
    (GetLastError = ERROR_ALREADY_EXISTS)) then
  begin
    RestoreWindow('RobinHood');
    CloseHandle(Semafor);
    Halt;
  end;

  Application.CreateForm(TDataModule1, DataModule1);
  if TfrmLogin.Execute then
  begin
    Application.Initialize;
    Application.CreateForm(TForm1, Form1);
    Application.Run;
  end;

end.

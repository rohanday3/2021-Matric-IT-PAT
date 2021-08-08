program prjPAT2021;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMain in 'uMain.pas' {Form1},
  uNaviPanel in 'uNaviPanel.pas',
  uDashPanel in 'uDashPanel.pas',
  uDonationPanel in 'uDonationPanel.pas',
  uLogin in 'uLogin.pas' {Form2},
  Datamodule in 'Datamodule.pas' {DataModule1: TDataModule},
  uDonationsThread in 'uDonationsThread.pas',
  uSplashscreen in 'uSplashscreen.pas' {Splashscreen};

{$R *.res}

begin
  Application.CreateForm(TDataModule1, DataModule1);
  if TForm2.Execute then
  begin
    Application.Initialize;
    Application.CreateForm(TForm1, Form1);
    Application.Run;
  end;

end.

program prjPAT2021;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMain in 'uMain.pas' {Form1},
  uNaviPanel in 'uNaviPanel.pas',
  uDashPanel in 'uDashPanel.pas',
  uDonationPanel in 'uDonationPanel.pas',
  uLogin in 'uLogin.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.

program DonationsValidator;

uses
  Vcl.Forms,
  uDatamodule in 'uDatamodule.pas' {DataModule3: TDataModule},
  uMain in 'uMain.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule3, DataModule3);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.

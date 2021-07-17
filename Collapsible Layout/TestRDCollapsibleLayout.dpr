program TestRDCollapsibleLayout;

uses
  System.StartUpCopy,
  FMX.Forms,
  uTestRDCollapsibleLayout in 'uTestRDCollapsibleLayout.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

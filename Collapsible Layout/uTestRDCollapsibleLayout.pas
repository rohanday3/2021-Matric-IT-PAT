unit uTestRDCollapsibleLayout;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  uRDCollapsibleLayout, FMX.Objects, RDCollapsiblePanel;

type
  TForm1 = class(TForm)
    RDCollapsibleLayout1: TRDCollapsibleLayout;
    RDCollapsiblePanel1: TRDCollapsiblePanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

end.

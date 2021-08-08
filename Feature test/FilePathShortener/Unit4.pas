unit Unit4;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.Objects;

type
  TForm4 = class(TForm)
    rectDatabase2: TRectangle;
    rectDatabaseEdit: TRectangle;
    edtDatabase1: TEdit;
    Label1: TLabel;
    btnDatabase1: TButton;
    Button1: TButton;
    StyleBook1: TStyleBook;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    function shortenPath(PATH: string; rect_width: integer;
      AFont: TFont = nil): string;
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}

procedure TForm4.Button1Click(Sender: TObject);
begin
  edtDatabase1.Text := shortenPath(edtDatabase1.Text,
    round(rectDatabaseEdit.Width));
end;

function TForm4.shortenPath(PATH: string; rect_width: integer;
  AFont: TFont = nil): string;
var
  p, p2: integer;
  tempstr, endstr: string;
  lbl: TLabel;
begin
  lbl := TLabel.Create(Self);
  lbl.Parent := Self;
  lbl.WordWrap := False;
  lbl.AutoSize := True;
  if AFont <> nil then
  begin
    lbl.Font := AFont;
  end;
  TLabel(lbl).Text := PATH;
  while TLabel(lbl).Width > rect_width do
  begin
    p := LastDelimiter('\', PATH);
    tempstr := Copy(PATH, 0, p - 1);
    p2 := LastDelimiter('\', tempstr);
    TLabel(lbl).Text := Copy(PATH, 0, p2) + '...' + Copy(PATH, p, length(PATH));
    PATH := Copy(PATH, 0, p2 - 1) + '...' + Copy(PATH, p, length(PATH));
  end;
  endstr := TLabel(lbl).Text;
  lbl.Free;
  result := endstr;;
end;

end.

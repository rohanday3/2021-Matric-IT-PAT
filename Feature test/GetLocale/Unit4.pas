unit Unit4;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, Windows;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    function GetCountryFlag(): string;
    function CountryCodeToName(CountryCode: string): string;
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}

procedure TForm4.Button1Click(Sender: TObject);
begin
Label2.Text := CountryCodeToName(GetCountryFlag);
end;

function TForm4.CountryCodeToName(CountryCode: string): string;
var
  csv: TextFile;
  line: string;
  i: integer;
begin
  if FileExists(GetCurrentDir + '\countries.csv') then
    AssignFile(csv, GetCurrentDir + '\countries.csv')
  else
    Exit;

  Reset(csv);
  while not Eof(csv) do
  begin
    Readln(csv, line);
    i := Pos(',', line);
    if Pos(CountryCode, Copy(line, i, length(line))) > 0 then
      Result := Copy(line, 1, i - 1);
  end;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  Label1.Text := GetCountryFlag;
end;

function TForm4.GetCountryFlag(): string;
var
  Buffer: PChar;
  Size: integer;
begin
  Size := GetLocaleInfo(LOCALE_USER_DEFAULT, LOCALE_SABBREVCTRYNAME, nil, 0);
  GetMem(Buffer, Size);
  try
    GetLocaleInfo(LOCALE_USER_DEFAULT, LOCALE_SABBREVCTRYNAME, Buffer, Size);
    Result := Copy(Buffer, 0, 2);
  finally
    FreeMem(Buffer);
  end;
end;

end.

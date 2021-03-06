unit Unit4;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Data.Win.ADODB,
  Data.DB, FMXTee.Engine, FMXTee.Series, FMXTee.Procs, FMXTee.Chart,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, FMX.StdCtrls;

type
  TForm4 = class(TForm)
    Chart1: TChart;
    Series1: TLineSeries;
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    ADOQuery1: TADOQuery;
    Button1: TButton;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}

procedure TForm4.Button1Click(Sender: TObject);
begin
  ADOQuery1.First;
  while not ADOQuery1.Eof do
  begin
    Memo1.Lines.Add(datetostr(ADOQuery1['donation_date']) + #9 + inttostr(ADOQuery1['quantity']));
    Chart1.Series[0].AddXY(ADOQuery1['donation_date'], ADOQuery1['quantity']);
    ADOQuery1.Next;
  end;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('SELECT donation_date, SUM(donation_quantity) AS quantity FROM Donations GROUP BY donation_date ORDER BY donation_date ASC');
  ADOQuery1.Active := True;
  Chart1.Series[0].Clear;

end;

end.

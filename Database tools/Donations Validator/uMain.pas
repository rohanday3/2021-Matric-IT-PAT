unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  uDatamodule,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TForm2 = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Edit1: TEdit;
    Button6: TButton;
    ComboBox1: TComboBox;
    Edit2: TEdit;
    TabControl1: TTabControl;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    TabSheet3: TTabSheet;
    Button7: TButton;
    Panel3: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  with DataModule3 do
  begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
      ('SELECT d.donation_date, e.employment_date FROM Donations d, Employees e Where (d.donation_date < e.employment_date) AND (d.employee_id = e.employee_id)');
    ADOQuery1.Open;
  end;
  DBGrid1.DataSource := DataModule3.DataSource2;
  ShowMessage(inttostr(DataModule3.DataSource2.DataSet.RecordCount));
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  with DataModule3 do
  begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
      ('Delete d.* FROM Donations d, Employees e Where (d.donation_date < e.employment_date) AND (d.employee_id = e.employee_id)');
    ADOQuery1.Open;
  end;
  DBGrid1.DataSource := DataModule3.DataSource2;
  ShowMessage(inttostr(DataModule3.DataSource2.DataSet.RecordCount));
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  with DataModule3 do
  begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
      ('SELECT u.username, e.username FROM Users u, Employees e Where (u.username = e.username)');
    ADOQuery1.Open;
  end;
  DBGrid1.DataSource := DataModule3.DataSource2;
  ShowMessage(inttostr(DataModule3.DataSource2.DataSet.RecordCount));
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  with DataModule3 do
  begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
      ('SELECT COUNT(*) AS TOTAL,item_category FROM Inventory GROUP BY item_category');
    ADOQuery1.Open;
  end;
  DBGrid1.DataSource := DataModule3.DataSource2;
  ShowMessage(inttostr(DataModule3.DataSource2.DataSet.RecordCount));
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
  with DataModule3 do
  begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
      ('SELECT SUM(item_quantity) AS TOTAL FROM Inventory');
    ADOQuery1.Open;
  end;
  DBGrid1.DataSource := DataModule3.DataSource2;
end;

procedure TForm2.Button6Click(Sender: TObject);
var
  colour_string: string;
  red, green, blue: integer;
const
  change_by: integer = 10;
begin
  Panel1.Color:=StringToColor(Edit1.Text);
  colour_string := copy(Edit1.Text, 4, 6);
  red := StrToInt64('$' + copy(colour_string, 1, 2));
  green := StrToInt64('$' + copy(colour_string, 3, 2));
  blue := StrToInt64('$' + copy(colour_string, 5, 2));
  if ComboBox1.ItemIndex = 1 then
    Edit2.Text := copy(Edit1.Text, 1, 3) + IntToHex(red + change_by, 1) +
      IntToHex(green + change_by, 1) + IntToHex(blue + change_by, 1);
  if ComboBox1.ItemIndex = 0 then
    Edit2.Text := copy(Edit1.Text, 1, 3) + IntToHex(red - change_by, 1) +
      IntToHex(green - change_by, 1) + IntToHex(blue - change_by, 1);
  Panel2.Color:=StringToColor(Edit2.Text);
end;

procedure TForm2.Button7Click(Sender: TObject);
begin
ShowMessage('Hello')
;Panel3.Color:=clBlue
end;

end.

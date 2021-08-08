unit Datamodule;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TDataModule1 = class(TDataModule)
    ADOConnection1: TADOConnection;
    tblDonations: TADOTable;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    tblUsers: TADOTable;
    tblEmployees: TADOTable;
    tblInventory: TADOTable;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.dfm}

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  ADOConnection1.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='
    + GetCurrentDir + '\robinhood.mdb' + ';Persist Security Info=False';
end;

end.

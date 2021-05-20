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

end.

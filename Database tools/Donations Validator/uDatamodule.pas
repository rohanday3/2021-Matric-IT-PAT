unit uDatamodule;

interface

uses
  System.SysUtils, System.Classes, Data.Win.ADODB, Data.DB;

type
  TDataModule3 = class(TDataModule)
    ADOConnection1: TADOConnection;
    tblEmployees: TADOTable;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    tblDonations: TADOTable;
    DataSource2: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule3: TDataModule3;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

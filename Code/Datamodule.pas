{ ******************************************************************************
  ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤIT MATRIC PAT 2021 - Robin Hood
  ㅤㅤㅤㅤㅤCopyright (C) 2021 by Rohan Dayaram <rohanday4@gmail.com>
  ㅤㅤㅤㅤㅤㅤㅤhttps://github.com/rohanday3/2021-Matric-IT-PAT
  ******************************************************************************
  Robin Hood is a multi-purpose company management system for the financial and
  inventory systems etc of the Robin Hood© foundation which is for the purposes
  of my matric pat, an NGO dedicated to feeding homeless children under the ages
  of 3.  The  company needed a system to manage their inventory,  payments  and
  other systems which would otherwise be managed by staff and recorded on paper.
  The design is a modern one with a  dashboard and a multiview drawer  which is
  used to navigate the other tabs.  Many additional "nice to have" features are
  included as well which are docuemented in the help tab as well as the feature
  docuement included in the same folder as the project and can also be found on
  my github page stated above.
  ****************************************************************************** }

unit Datamodule;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, IniFiles;

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
    procedure SaveSettingString(Section, Name, Value: string);
    function LoadSettingString(Section, Name, Value: string): string;
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

const
  CONFIG_FILE_NAME = 'config.ini';

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.dfm}

procedure TDataModule1.DataModuleCreate(Sender: TObject);
var
  databasepath: string;
begin
  databasepath := LoadSettingString('General', 'database_path',
    GetCurrentDir + '\robinhood.mdb');
  ADOConnection1.ConnectionString :=
    'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' + databasepath +
    ';Persist Security Info=False';
end;

function TDataModule1.LoadSettingString(Section, Name, Value: string): string;
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(GetCurrentDir + '\' + CONFIG_FILE_NAME);
  try
    Result := ini.ReadString(Section, Name, Value);
  finally
    ini.Free;
  end;
end;

procedure TDataModule1.SaveSettingString(Section, Name, Value: string);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(GetCurrentDir + '\' + CONFIG_FILE_NAME);
  try
    ini.WriteString(Section, Name, Value);
  finally
    ini.Free;
  end;
end;

end.

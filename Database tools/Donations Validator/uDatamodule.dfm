object DataModule3: TDataModule3
  OldCreateOrder = False
  Height = 295
  Width = 503
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\DELL\Docum' +
      'ents\IT PAT 2021\Database1.mdb;Persist Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 96
    Top = 72
  end
  object tblEmployees: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Employees'
    Left = 192
    Top = 72
  end
  object DataSource1: TDataSource
    DataSet = tblDonations
    Left = 280
    Top = 72
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 280
    Top = 136
  end
  object tblDonations: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Donations'
    Left = 192
    Top = 136
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery1
    Left = 280
    Top = 200
  end
end

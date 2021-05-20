object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 316
  Width = 487
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\DELL\Docum' +
      'ents\IT PAT 2021\Database1.mdb;Persist Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 32
    Top = 16
  end
  object tblDonations: TADOTable
    Connection = ADOConnection1
    TableName = 'Donations'
    Left = 112
    Top = 16
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 176
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 248
    Top = 16
  end
  object tblUsers: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Users'
    Left = 64
    Top = 120
  end
  object tblEmployees: TADOTable
    Connection = ADOConnection1
    TableName = 'Employees'
    Left = 304
    Top = 120
  end
  object tblInventory: TADOTable
    Connection = ADOConnection1
    TableName = 'Inventory'
    Left = 224
    Top = 144
  end
end

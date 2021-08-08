object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 316
  Width = 487
  object ADOConnection1: TADOConnection
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

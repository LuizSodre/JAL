object data: Tdata
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 325
  Top = 271
  Height = 232
  Width = 472
  object conDBZanc: TZConnection
    Protocol = 'mysql'
    HostName = 'localhost'
    Port = 3307
    Database = 'dbzanc'
    User = 'zanc'
    Password = '123456'
    Catalog = 'dbzanc'
    Left = 40
    Top = 32
  end
  object zqryZanc: TZQuery
    Connection = conDBZanc
    SQL.Strings = (
      'select * from tcliente')
    Params = <>
    Left = 40
    Top = 88
  end
end

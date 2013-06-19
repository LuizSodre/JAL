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
    object lrgntfldZancId: TLargeintField
      FieldName = 'Id'
      Required = True
    end
    object strngfldZancNome: TStringField
      FieldName = 'Nome'
      Required = True
      Size = 80
    end
    object strngfldZancTpPessoa: TStringField
      FieldName = 'TpPessoa'
      Required = True
      Size = 1
    end
    object strngfldZancCpfCnpj: TStringField
      FieldName = 'CpfCnpj'
      Required = True
      Size = 14
    end
    object strngfldZancEndereco: TStringField
      FieldName = 'Endereco'
      Size = 80
    end
    object strngfldZancNumero: TStringField
      FieldName = 'Numero'
      Size = 5
    end
    object strngfldZancComplemento: TStringField
      FieldName = 'Complemento'
      Size = 80
    end
    object strngfldZancBairro: TStringField
      FieldName = 'Bairro'
      Size = 50
    end
    object strngfldZancMunicipio: TStringField
      FieldName = 'Municipio'
      Size = 50
    end
    object strngfldZancUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object strngfldZancTelefone: TStringField
      FieldName = 'Telefone'
      Size = 10
    end
    object strngfldZancFax: TStringField
      FieldName = 'Fax'
      Size = 10
    end
    object strngfldZancEmail: TStringField
      FieldName = 'Email'
      Size = 60
    end
    object strngfldZancCep: TStringField
      FieldName = 'Cep'
      Size = 80
    end
  end
end

inherited ContatoEditForm: TContatoEditForm
  Caption = 'ContatoEditForm'
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel [0]
    Left = 32
    Top = 32
    Width = 35
    Height = 16
    Caption = 'Nome'
  end
  object Label2: TLabel [1]
    Left = 32
    Top = 64
    Width = 60
    Height = 16
    Caption = 'Endere'#231'o'
  end
  object Label3: TLabel [2]
    Left = 32
    Top = 97
    Width = 43
    Height = 16
    Caption = 'Cidade'
  end
  object edtNome: TEdit
    Left = 96
    Top = 32
    Width = 121
    Height = 24
    TabOrder = 1
    Text = 'edtNome'
  end
  object edtEndereco: TEdit
    Left = 96
    Top = 64
    Width = 121
    Height = 24
    TabOrder = 2
    Text = 'Edit1'
  end
  object cbCidade: TComboBox
    Left = 96
    Top = 96
    Width = 145
    Height = 24
    ItemHeight = 16
    TabOrder = 3
    Text = 'cbCidade'
  end
  object grdFones: TStringGrid
    Left = 64
    Top = 152
    Width = 320
    Height = 120
    TabOrder = 4
  end
end

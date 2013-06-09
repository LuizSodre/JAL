inherited ContatoFoneEditForm: TContatoFoneEditForm
  Width = 263
  Height = 154
  Caption = 'ContatoFoneEditForm'
  PixelsPerInch = 96
  TextHeight = 16
  object lblTipo: TLabel [0]
    Left = 12
    Top = 16
    Width = 26
    Height = 16
    Caption = 'Tipo'
  end
  object lblNumero: TLabel [1]
    Left = 11
    Top = 48
    Width = 49
    Height = 16
    Caption = 'N'#250'mero'
  end
  inherited pnlBtns: TPanel
    Top = 80
    Width = 247
    inherited btnGravar: TBitBtn
      Left = 39
    end
    inherited btnCancelar: TBitBtn
      Left = 140
    end
  end
  object cbTipoFone: TComboBox
    Left = 72
    Top = 16
    Width = 145
    Height = 24
    ItemHeight = 16
    TabOrder = 1
    Text = 'cbTipoFone'
  end
  object edtNumero: TEdit
    Left = 72
    Top = 44
    Width = 143
    Height = 24
    TabOrder = 2
    Text = 'edtNumero'
  end
end

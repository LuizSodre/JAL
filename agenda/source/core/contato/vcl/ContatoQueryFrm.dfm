inherited ContatoQueryForm: TContatoQueryForm
  Caption = 'ContatoQueryForm'
  PixelsPerInch = 96
  TextHeight = 16
  inherited grdQueryString: TStringGrid
    Top = 70
    Height = 154
  end
  inherited Panel1: TPanel
    inherited btnPesquisar: TBitBtn
      OnClick = btnPesquisarClick
    end
  end
  inherited pnl1: TPanel
    Height = 70
    object lblNome: TLabel
      Left = 16
      Top = 9
      Width = 35
      Height = 16
      Caption = 'Nome'
    end
    object lblCidade: TLabel
      Left = 16
      Top = 40
      Width = 43
      Height = 16
      Caption = 'Cidade'
    end
    object edtNome: TEdit
      Left = 62
      Top = 8
      Width = 265
      Height = 24
      TabOrder = 0
    end
    object cbCidade: TComboBox
      Left = 62
      Top = 40
      Width = 159
      Height = 24
      ItemHeight = 16
      TabOrder = 1
    end
  end
end

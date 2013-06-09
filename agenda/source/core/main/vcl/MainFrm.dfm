object MainForm: TMainForm
  Left = 192
  Top = 124
  Width = 250
  Height = 197
  Caption = 'MainForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object btnNovoContato: TBitBtn
    Left = 16
    Top = 24
    Width = 203
    Height = 25
    Caption = 'Novo Contato'
    TabOrder = 0
  end
  object btnPesquisarContato: TBitBtn
    Left = 16
    Top = 56
    Width = 203
    Height = 25
    Caption = 'Pesquisar Contato'
    TabOrder = 1
  end
  object btnPesquisarCidade: TBitBtn
    Left = 16
    Top = 88
    Width = 203
    Height = 25
    Caption = 'Pesquisar Cidade'
    TabOrder = 2
  end
  object btnFechar: TBitBtn
    Left = 16
    Top = 120
    Width = 203
    Height = 25
    Caption = 'Fechar'
    TabOrder = 3
  end
end

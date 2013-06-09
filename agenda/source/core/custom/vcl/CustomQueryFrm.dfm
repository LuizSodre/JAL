object CustomQueryForm: TCustomQueryForm
  Left = 192
  Top = 124
  Width = 350
  Height = 303
  Caption = 'CustomQueryForm'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object grdQueryString: TStringGrid
    Left = 0
    Top = 41
    Width = 334
    Height = 183
    Align = alClient
    FixedCols = 0
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 224
    Width = 334
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnPesquisar: TBitBtn
      Left = 217
      Top = 6
      Width = 106
      Height = 29
      Caption = '&Pesquisar'
      TabOrder = 0
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 334
    Height = 41
    Align = alTop
    TabOrder = 2
  end
end

object frmSenha: TfrmSenha
  Left = 623
  Top = 270
  Width = 311
  Height = 173
  Caption = 'Login'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlGenerico: TPanel
    Left = 0
    Top = 0
    Width = 295
    Height = 116
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 13
      Top = 8
      Width = 48
      Height = 13
      Caption = 'Usu'#225'rio:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 13
      Top = 48
      Width = 86
      Height = 13
      Caption = 'Senha de acesso:'
    end
    object Panel1: TPanel
      Left = 190
      Top = 2
      Width = 103
      Height = 112
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
      object btnCancelar: TBitBtn
        Left = 13
        Top = 44
        Width = 81
        Height = 25
        Hint = 'Limpar|Limpa os registros'
        Caption = 'Limpa&r'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = btnCancelarClick
        Kind = bkCancel
      end
      object btnConfirmar: TBitBtn
        Left = 13
        Top = 12
        Width = 81
        Height = 25
        Hint = 'Confirmar|Confirma opera'#231#227'o no registro ...'
        Caption = '&Confirmar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = btnConfirmarClick
        Kind = bkOK
      end
    end
    object edtusuario: TEdit
      Left = 13
      Top = 26
      Width = 124
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object edtCop: TEdit
      Left = 16
      Top = 168
      Width = 177
      Height = 21
      TabStop = False
      TabOrder = 3
      Text = 'edtCop'
    end
    object edtLar: TEdit
      Left = 16
      Top = 200
      Width = 177
      Height = 21
      TabStop = False
      TabOrder = 4
      Text = 'edtLar'
    end
    object edtsenha: TMaskEdit
      Left = 13
      Top = 64
      Width = 124
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
      OnChange = edtsenhaChange
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 116
    Width = 295
    Height = 19
    AutoHint = True
    Panels = <>
    ParentShowHint = False
    ShowHint = True
    SimplePanel = True
  end
  object dsGenerico: TDataSource
    Left = 192
    Top = 58
  end
end

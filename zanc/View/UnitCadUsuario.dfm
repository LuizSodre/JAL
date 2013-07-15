inherited frmCadUsuario: TfrmCadUsuario
  HorzScrollBar.Range = 0
  VertScrollBar.Range = 0
  BorderStyle = bsNone
  Caption = 'Cadastro de Usuario'
  OldCreateOrder = True
  Position = poDefaultSizeOnly
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlGenerico: TPanel
    object Label1: TLabel
      Left = 8
      Top = 41
      Width = 35
      Height = 16
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 8
      Top = 83
      Width = 34
      Height = 16
      Caption = 'Login'
    end
    object Label3: TLabel
      Left = 245
      Top = 83
      Width = 40
      Height = 16
      Caption = 'Senha'
    end
    object lblTitulo: TLabel
      Left = 9
      Top = 10
      Width = 89
      Height = 19
      Caption = 'Cadastro : '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTituloMascara: TLabel
      Left = 11
      Top = 10
      Width = 89
      Height = 19
      Caption = 'Cadastro : '
      Font.Charset = ANSI_CHARSET
      Font.Color = clTeal
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object edtNome: TEdit
      Left = 8
      Top = 57
      Width = 465
      Height = 24
      TabOrder = 0
    end
    object edtLogin: TEdit
      Left = 8
      Top = 99
      Width = 228
      Height = 24
      Hint = '|F - Pessoa F'#237'sica    J - Pessoa Jur'#237'dica'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object edtSenha: TEdit
      Left = 245
      Top = 99
      Width = 228
      Height = 24
      TabOrder = 2
    end
    object edtId: TEdit
      Left = 452
      Top = 33
      Width = 21
      Height = 24
      TabStop = False
      TabOrder = 3
      Visible = False
    end
  end
end

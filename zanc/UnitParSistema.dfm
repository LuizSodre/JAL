object frmParametroSistema: TfrmParametroSistema
  Left = 338
  Top = 235
  BorderStyle = bsNone
  Caption = 'Par'#226'metro do Sistema'
  ClientHeight = 233
  ClientWidth = 608
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object lblTitulo: TLabel
    Left = 9
    Top = 10
    Width = 190
    Height = 19
    Caption = 'Par'#226'metros do Sistema'
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
    Width = 190
    Height = 19
    Caption = 'Par'#226'metros do Sistema'
    Font.Charset = ANSI_CHARSET
    Font.Color = clTeal
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lblCatalogo: TLabel
    Left = 8
    Top = 197
    Width = 62
    Height = 16
    Caption = 'Catalogo:'
  end
  object Label1: TLabel
    Left = 8
    Top = 70
    Width = 106
    Height = 16
    Caption = 'Database Name:'
  end
  object Label2: TLabel
    Left = 8
    Top = 41
    Width = 74
    Height = 16
    Caption = 'Host Name:'
  end
  object Label3: TLabel
    Left = 8
    Top = 136
    Width = 68
    Height = 16
    Caption = 'Password:'
  end
  object Label4: TLabel
    Left = 8
    Top = 103
    Width = 34
    Height = 16
    Caption = 'User:'
  end
  object Label5: TLabel
    Left = 8
    Top = 166
    Width = 33
    Height = 16
    Caption = 'Port:'
  end
  object edtHostName: TEdit
    Left = 120
    Top = 39
    Width = 361
    Height = 24
    TabOrder = 0
  end
  object edtDataBaseName: TEdit
    Left = 120
    Top = 70
    Width = 179
    Height = 24
    TabOrder = 1
  end
  object edtUsuario: TEdit
    Left = 120
    Top = 100
    Width = 179
    Height = 24
    TabOrder = 2
  end
  object edtPassword: TEdit
    Left = 120
    Top = 131
    Width = 179
    Height = 24
    TabOrder = 3
  end
  object edtPorta: TEdit
    Left = 120
    Top = 163
    Width = 179
    Height = 24
    TabOrder = 4
  end
  object edtCatalogo: TEdit
    Left = 120
    Top = 194
    Width = 179
    Height = 24
    TabOrder = 5
  end
  object btnOk: TBitBtn
    Left = 491
    Top = 40
    Width = 109
    Height = 25
    TabOrder = 6
    OnClick = btnOkClick
    Kind = bkOK
  end
  object btnCancelar: TBitBtn
    Left = 491
    Top = 69
    Width = 109
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 7
    OnClick = btnCancelarClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object btn1: TButton
    Left = 352
    Top = 104
    Width = 75
    Height = 25
    Caption = 'btn1'
    TabOrder = 8
    OnClick = btn1Click
  end
end

inherited frmCadLote: TfrmCadLote
  HorzScrollBar.Range = 0
  VertScrollBar.Range = 0
  BorderStyle = bsNone
  Caption = 'Cadastro de lote'
  ClientHeight = 399
  OldCreateOrder = True
  Position = poDefaultSizeOnly
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object lblTitulo: TLabel [0]
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
  object Label14: TLabel [1]
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
  inherited pnlGenerico: TPanel
    Height = 380
    object Label1: TLabel
      Left = 9
      Top = 40
      Width = 25
      Height = 16
      Caption = 'O.S.'
    end
    object Label2: TLabel
      Left = 9
      Top = 88
      Width = 110
      Height = 16
      Caption = 'Nome do Arquivo'
    end
    object Label3: TLabel
      Left = 9
      Top = 241
      Width = 74
      Height = 16
      Caption = 'Dt. Entrada'
    end
    object Label4: TLabel
      Left = 149
      Top = 240
      Width = 151
      Height = 16
      Caption = 'Envio para higienizacao'
    end
    object Label5: TLabel
      Left = 289
      Top = 241
      Width = 156
      Height = 16
      Caption = 'Retorno da higienizacao'
    end
    object Label6: TLabel
      Left = 9
      Top = 136
      Width = 87
      Height = 16
      Caption = 'Contratantes'
    end
    object Label7: TLabel
      Left = 9
      Top = 286
      Width = 138
      Height = 16
      Caption = 'Envio para impress'#227'o'
    end
    object Label8: TLabel
      Left = 149
      Top = 285
      Width = 136
      Height = 16
      Caption = 'Envio para postagem'
    end
    object Label9: TLabel
      Left = 289
      Top = 286
      Width = 87
      Height = 16
      Caption = 'Dt. Postagem'
    end
    object Label10: TLabel
      Left = 9
      Top = 184
      Width = 51
      Height = 16
      Caption = 'Clientes'
    end
    object Label11: TLabel
      Left = 145
      Top = 40
      Width = 26
      Height = 16
      Caption = 'Ano'
    end
    object Label12: TLabel
      Left = 9
      Top = 10
      Width = 125
      Height = 19
      Caption = 'Cadastro : Lote'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 11
      Top = 10
      Width = 125
      Height = 19
      Caption = 'Cadastro : Lote'
      Font.Charset = ANSI_CHARSET
      Font.Color = clTeal
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object edtOrdemServico: TEdit
      Left = 10
      Top = 57
      Width = 121
      Height = 24
      TabOrder = 0
    end
    object edtNomeArquivo: TEdit
      Left = 9
      Top = 105
      Width = 400
      Height = 24
      TabOrder = 1
    end
    object cmbContratantes: TComboBox
      Left = 9
      Top = 153
      Width = 400
      Height = 24
      ItemHeight = 16
      TabOrder = 2
      OnDropDown = cmbContratantesDropDown
    end
    object dtpDtEntrada: TDateTimePicker
      Left = 8
      Top = 257
      Width = 120
      Height = 24
      Date = 0.561473182868212500
      Format = 'hh:mm'
      Time = 0.561473182868212500
      TabOrder = 3
    end
    object dtpDtEnvioHigiene: TDateTimePicker
      Left = 148
      Top = 257
      Width = 120
      Height = 24
      Date = 0.561473182868212500
      Format = 'DD/MM/yyyy HH:mm'
      Time = 0.561473182868212500
      TabOrder = 4
    end
    object dtpRetornoHigiene: TDateTimePicker
      Left = 288
      Top = 257
      Width = 120
      Height = 24
      Date = 0.561473182868212500
      Format = 'DD/MM/yyyy HH:mm'
      Time = 0.561473182868212500
      TabOrder = 5
    end
    object dtpDtEnvioImpressao: TDateTimePicker
      Left = 8
      Top = 303
      Width = 120
      Height = 24
      Date = 0.561473182868212500
      Format = 'DD/MM/yyyy HH:mm'
      Time = 0.561473182868212500
      TabOrder = 6
    end
    object dtpDtEnvioPostagem: TDateTimePicker
      Left = 148
      Top = 303
      Width = 120
      Height = 24
      Date = 0.561473182868212500
      Format = 'DD/MM/yyyy HH:mm'
      Time = 0.561473182868212500
      TabOrder = 7
    end
    object dtpDtPostagem: TDateTimePicker
      Left = 288
      Top = 303
      Width = 120
      Height = 24
      Date = 0.561473182868212500
      Format = 'DD/MM/yyyy HH:mm'
      Time = 0.561473182868212500
      TabOrder = 8
    end
    object cmbClientes: TComboBox
      Left = 9
      Top = 201
      Width = 400
      Height = 24
      ItemHeight = 16
      TabOrder = 9
      OnDropDown = cmbClientesDropDown
    end
    object edtId: TEdit
      Left = 452
      Top = 8
      Width = 21
      Height = 24
      TabStop = False
      TabOrder = 10
      Visible = False
    end
    object edtAno: TEdit
      Left = 146
      Top = 57
      Width = 47
      Height = 24
      TabOrder = 11
    end
    object edt1: TDateEdit
      Left = 16
      Top = 336
      Width = 121
      Height = 21
      DefaultToday = True
      NumGlyphs = 2
      Weekends = [Mon]
      YearDigits = dyFour
      TabOrder = 12
      Text = '09/06/2013'
    end
    object Button1: TButton
      Left = 264
      Top = 336
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 13
      OnClick = Button1Click
    end
    object MaskEdit1: TMaskEdit
      Left = 152
      Top = 336
      Width = 41
      Height = 24
      EditMask = '!90:00;1;'
      MaxLength = 5
      TabOrder = 14
      Text = '  :  '
    end
    object Button2: TButton
      Left = 352
      Top = 336
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 15
      OnClick = Button2Click
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 380
  end
  inherited Panel1: TPanel
    Height = 380
    inherited btnConfirmar: TBitBtn
      Kind = bkCustom
    end
  end
end

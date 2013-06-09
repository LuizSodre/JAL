inherited frmCadLote: TfrmCadLote
  Height = 401
  Caption = 'Cadastro de lote'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlGenerico: TPanel
    Height = 344
    object Label1: TLabel
      Left = 9
      Top = 16
      Width = 21
      Height = 13
      Caption = 'O.S.'
    end
    object Label2: TLabel
      Left = 9
      Top = 64
      Width = 82
      Height = 13
      Caption = 'Nome do Arquivo'
    end
    object Label3: TLabel
      Left = 9
      Top = 217
      Width = 54
      Height = 13
      Caption = 'Dt. Entrada'
    end
    object Label4: TLabel
      Left = 149
      Top = 216
      Width = 113
      Height = 13
      Caption = 'Envio para higienizacao'
    end
    object Label5: TLabel
      Left = 289
      Top = 217
      Width = 115
      Height = 13
      Caption = 'Retorno da higienizacao'
    end
    object Label6: TLabel
      Left = 9
      Top = 112
      Width = 60
      Height = 13
      Caption = 'Contratantes'
    end
    object Label7: TLabel
      Left = 9
      Top = 262
      Width = 101
      Height = 13
      Caption = 'Envio para impress'#227'o'
    end
    object Label8: TLabel
      Left = 149
      Top = 261
      Width = 100
      Height = 13
      Caption = 'Envio para postagem'
    end
    object Label9: TLabel
      Left = 289
      Top = 262
      Width = 64
      Height = 13
      Caption = 'Dt. Postagem'
    end
    object Label10: TLabel
      Left = 9
      Top = 160
      Width = 37
      Height = 13
      Caption = 'Clientes'
    end
    object Label11: TLabel
      Left = 145
      Top = 16
      Width = 19
      Height = 13
      Caption = 'Ano'
    end
    object edtOrdemServico: TEdit
      Left = 10
      Top = 33
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object edtNomeArquivo: TEdit
      Left = 9
      Top = 81
      Width = 400
      Height = 21
      TabOrder = 1
    end
    object cmbContratantes: TComboBox
      Left = 9
      Top = 129
      Width = 400
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      OnDropDown = cmbContratantesDropDown
    end
    object dtpDtEntrada: TDateTimePicker
      Left = 8
      Top = 233
      Width = 120
      Height = 21
      Date = 0.561473182868212500
      Format = 'gg'
      Time = 0.561473182868212500
      TabOrder = 3
    end
    object dtpDtEnvioHigiene: TDateTimePicker
      Left = 148
      Top = 233
      Width = 120
      Height = 21
      Date = 0.561473182868212500
      Format = 'DD/MM/yyyy HH:mm'
      Time = 0.561473182868212500
      TabOrder = 4
    end
    object dtpRetornoHigiene: TDateTimePicker
      Left = 288
      Top = 233
      Width = 120
      Height = 21
      Date = 0.561473182868212500
      Format = 'DD/MM/yyyy HH:mm'
      Time = 0.561473182868212500
      TabOrder = 5
    end
    object dtpDtEnvioImpressao: TDateTimePicker
      Left = 8
      Top = 279
      Width = 120
      Height = 21
      Date = 0.561473182868212500
      Format = 'DD/MM/yyyy HH:mm'
      Time = 0.561473182868212500
      TabOrder = 6
    end
    object dtpDtEnvioPostagem: TDateTimePicker
      Left = 148
      Top = 279
      Width = 120
      Height = 21
      Date = 0.561473182868212500
      Format = 'DD/MM/yyyy HH:mm'
      Time = 0.561473182868212500
      TabOrder = 7
    end
    object dtpDtPostagem: TDateTimePicker
      Left = 288
      Top = 279
      Width = 120
      Height = 21
      Date = 0.561473182868212500
      Format = 'DD/MM/yyyy HH:mm'
      Time = 0.561473182868212500
      TabOrder = 8
    end
    object cmbClientes: TComboBox
      Left = 9
      Top = 177
      Width = 400
      Height = 21
      ItemHeight = 13
      TabOrder = 9
      OnDropDown = cmbClientesDropDown
    end
    object edtId: TEdit
      Left = 452
      Top = 8
      Width = 21
      Height = 21
      TabStop = False
      TabOrder = 10
      Visible = False
    end
    object edtAno: TEdit
      Left = 146
      Top = 33
      Width = 47
      Height = 21
      TabOrder = 11
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 344
  end
  inherited Panel1: TPanel
    Height = 344
  end
end

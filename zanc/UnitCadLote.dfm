inherited frmCadLote: TfrmCadLote
  HorzScrollBar.Range = 0
  VertScrollBar.Range = 0
  BorderStyle = bsNone
  Caption = 'Cadastro de lote'
  ClientHeight = 399
  ClientWidth = 691
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
    Width = 549
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
    object Label6: TLabel
      Left = 9
      Top = 136
      Width = 87
      Height = 16
      Caption = 'Contratantes'
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
      TabOrder = 2
    end
    object cmbContratantes: TComboBox
      Left = 9
      Top = 153
      Width = 400
      Height = 24
      ItemHeight = 16
      TabOrder = 3
      OnDropDown = cmbContratantesDropDown
      OnEnter = cmbContratantesEnter
    end
    object cmbClientes: TComboBox
      Left = 9
      Top = 201
      Width = 400
      Height = 24
      ItemHeight = 16
      TabOrder = 4
      OnDropDown = cmbClientesDropDown
    end
    object edtId: TEdit
      Left = 452
      Top = 8
      Width = 21
      Height = 24
      TabStop = False
      TabOrder = 5
      Visible = False
    end
    object edtAno: TEdit
      Left = 146
      Top = 57
      Width = 47
      Height = 24
      TabOrder = 1
    end
    object GroupBox1: TGroupBox
      Left = 9
      Top = 231
      Width = 170
      Height = 57
      Caption = 'Dt. Entrada'
      TabOrder = 6
      object edtHoraEntrada: TMaskEdit
        Left = 120
        Top = 22
        Width = 41
        Height = 24
        EditMask = '!90:00;1;'
        MaxLength = 5
        TabOrder = 1
        Text = '  :  '
      end
      object edtDtEntrada: TMaskEdit
        Left = 8
        Top = 22
        Width = 102
        Height = 24
        EditMask = '99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
      end
    end
    object GroupBox2: TGroupBox
      Left = 186
      Top = 231
      Width = 170
      Height = 57
      Caption = 'Envio para higienizacao'
      TabOrder = 7
      object edtHoraEnvioHigi: TMaskEdit
        Left = 120
        Top = 22
        Width = 41
        Height = 24
        EditMask = '!90:00;1;'
        MaxLength = 5
        TabOrder = 1
        Text = '  :  '
      end
      object edtEnvioHigi: TMaskEdit
        Left = 8
        Top = 22
        Width = 102
        Height = 24
        EditMask = '99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
      end
    end
    object GroupBox3: TGroupBox
      Left = 363
      Top = 231
      Width = 170
      Height = 57
      Caption = 'Retorno da higienizacao'
      TabOrder = 8
      object medtHoraRetornoHigi: TMaskEdit
        Left = 120
        Top = 22
        Width = 41
        Height = 24
        EditMask = '!90:00;1;'
        MaxLength = 5
        TabOrder = 1
        Text = '  :  '
      end
      object edtRetornoHigi: TMaskEdit
        Left = 8
        Top = 22
        Width = 102
        Height = 24
        EditMask = '99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
      end
    end
    object GroupBox4: TGroupBox
      Left = 9
      Top = 289
      Width = 170
      Height = 57
      Caption = 'Envio para impress'#227'o'
      TabOrder = 9
      object medtHoraEnvioImpress: TMaskEdit
        Left = 120
        Top = 22
        Width = 41
        Height = 24
        EditMask = '!90:00;1;'
        MaxLength = 5
        TabOrder = 1
        Text = '  :  '
      end
      object medtEnvioImpress: TMaskEdit
        Left = 8
        Top = 22
        Width = 102
        Height = 24
        EditMask = '99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
      end
    end
    object GroupBox5: TGroupBox
      Left = 185
      Top = 289
      Width = 170
      Height = 57
      Caption = 'Envio para postagem'
      TabOrder = 10
      object medtHoraEnvioPostagem: TMaskEdit
        Left = 120
        Top = 22
        Width = 41
        Height = 24
        EditMask = '!90:00;1;'
        MaxLength = 5
        TabOrder = 1
        Text = '  :  '
      end
      object edtEnvioPostagem: TMaskEdit
        Left = 8
        Top = 22
        Width = 102
        Height = 24
        EditMask = '99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
      end
    end
    object GroupBox6: TGroupBox
      Left = 362
      Top = 289
      Width = 170
      Height = 57
      Caption = 'Dt. Postagem'
      TabOrder = 11
      object medtHoraPostagem: TMaskEdit
        Left = 120
        Top = 22
        Width = 41
        Height = 24
        EditMask = '!90:00;1;'
        MaxLength = 5
        TabOrder = 1
        Text = '  :  '
      end
      object edtDtPostagem: TMaskEdit
        Left = 8
        Top = 22
        Width = 102
        Height = 24
        EditMask = '99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 380
    Width = 691
  end
  inherited Panel1: TPanel
    Left = 549
    Height = 380
    inherited btnConfirmar: TBitBtn
      ModalResult = 0
      Kind = bkCustom
    end
  end
  inherited dsGenerico: TDataSource
    Left = 600
  end
end

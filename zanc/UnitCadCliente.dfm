inherited frmCadCliente: TfrmCadCliente
  HorzScrollBar.Range = 0
  VertScrollBar.Range = 0
  BorderStyle = bsNone
  Caption = 'Cadastro de Cliente'
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
      Top = 89
      Width = 76
      Height = 16
      Caption = 'Tipo Pessoa'
    end
    object Label3: TLabel
      Left = 88
      Top = 89
      Width = 60
      Height = 16
      Caption = 'CPF/CNPJ'
    end
    object Label4: TLabel
      Left = 8
      Top = 137
      Width = 60
      Height = 16
      Caption = 'Endere'#231'o'
    end
    object Label5: TLabel
      Left = 8
      Top = 233
      Width = 39
      Height = 16
      Caption = 'Bairro'
    end
    object Label6: TLabel
      Left = 200
      Top = 233
      Width = 59
      Height = 16
      Caption = 'Munic'#237'pio'
    end
    object Label7: TLabel
      Left = 440
      Top = 233
      Width = 14
      Height = 16
      Caption = 'UF'
    end
    object Label8: TLabel
      Left = 408
      Top = 137
      Width = 49
      Height = 16
      Caption = 'Numero'
    end
    object Label9: TLabel
      Left = 96
      Top = 281
      Width = 55
      Height = 16
      Caption = 'Telefone'
    end
    object Label10: TLabel
      Left = 288
      Top = 281
      Width = 21
      Height = 16
      Caption = 'Fax'
    end
    object Label11: TLabel
      Left = 8
      Top = 329
      Width = 38
      Height = 16
      Caption = 'E-mail'
    end
    object Label12: TLabel
      Left = 8
      Top = 256
      Width = 24
      Height = 16
      Caption = 'Cep'
    end
    object Label13: TLabel
      Left = 8
      Top = 185
      Width = 87
      Height = 16
      Caption = 'Complemento'
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
    object Label15: TLabel
      Left = 8
      Top = 281
      Width = 24
      Height = 16
      Caption = 'Cep'
    end
    object edtNome: TEdit
      Left = 8
      Top = 57
      Width = 465
      Height = 24
      TabOrder = 0
    end
    object edtTpPessoa: TEdit
      Left = 8
      Top = 105
      Width = 25
      Height = 24
      Hint = '|F - Pessoa F'#237'sica    J - Pessoa Jur'#237'dica'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object edtCpfCpnj: TEdit
      Left = 88
      Top = 105
      Width = 169
      Height = 24
      TabOrder = 2
    end
    object edtEndereco: TEdit
      Left = 8
      Top = 153
      Width = 393
      Height = 24
      TabOrder = 3
    end
    object edtBairro: TEdit
      Left = 8
      Top = 249
      Width = 185
      Height = 24
      TabOrder = 5
    end
    object edtMunicipio: TEdit
      Left = 200
      Top = 249
      Width = 233
      Height = 24
      TabOrder = 6
    end
    object edtUf: TEdit
      Left = 440
      Top = 249
      Width = 33
      Height = 24
      TabOrder = 7
    end
    object edtNumero: TEdit
      Left = 408
      Top = 153
      Width = 65
      Height = 24
      TabOrder = 4
    end
    object edtTelefone: TEdit
      Left = 96
      Top = 297
      Width = 185
      Height = 24
      TabOrder = 9
    end
    object edtFax: TEdit
      Left = 288
      Top = 297
      Width = 185
      Height = 24
      TabOrder = 10
    end
    object edtEmail: TEdit
      Left = 8
      Top = 345
      Width = 465
      Height = 24
      TabOrder = 11
    end
    object btn1: TButton
      Left = 384
      Top = 97
      Width = 75
      Height = 25
      Caption = 'btn1'
      TabOrder = 12
      Visible = False
      OnClick = btn1Click
    end
    object edtCep: TEdit
      Left = 8
      Top = 297
      Width = 81
      Height = 24
      TabOrder = 8
    end
    object edtId: TEdit
      Left = 452
      Top = 33
      Width = 21
      Height = 24
      TabStop = False
      TabOrder = 13
      Visible = False
    end
    object edtComplemento: TEdit
      Left = 8
      Top = 201
      Width = 465
      Height = 24
      TabOrder = 14
    end
  end
end

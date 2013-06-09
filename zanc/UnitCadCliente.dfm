inherited frmCadCliente: TfrmCadCliente
  Caption = 'Cadastro de Cliente'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlGenerico: TPanel
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 28
      Height = 13
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 8
      Top = 64
      Width = 59
      Height = 13
      Caption = 'Tipo Pessoa'
    end
    object Label3: TLabel
      Left = 88
      Top = 64
      Width = 52
      Height = 13
      Caption = 'CPF/CNPJ'
    end
    object Label4: TLabel
      Left = 8
      Top = 112
      Width = 46
      Height = 13
      Caption = 'Endere'#231'o'
    end
    object Label5: TLabel
      Left = 8
      Top = 208
      Width = 27
      Height = 13
      Caption = 'Bairro'
    end
    object Label6: TLabel
      Left = 200
      Top = 208
      Width = 47
      Height = 13
      Caption = 'Munic'#237'pio'
    end
    object Label7: TLabel
      Left = 440
      Top = 208
      Width = 14
      Height = 13
      Caption = 'UF'
    end
    object Label8: TLabel
      Left = 408
      Top = 112
      Width = 37
      Height = 13
      Caption = 'Numero'
    end
    object Label9: TLabel
      Left = 96
      Top = 256
      Width = 42
      Height = 13
      Caption = 'Telefone'
    end
    object Label10: TLabel
      Left = 288
      Top = 256
      Width = 17
      Height = 13
      Caption = 'Fax'
    end
    object Label11: TLabel
      Left = 8
      Top = 304
      Width = 28
      Height = 13
      Caption = 'E-mail'
    end
    object Label12: TLabel
      Left = 8
      Top = 256
      Width = 19
      Height = 13
      Caption = 'Cep'
    end
    object Label13: TLabel
      Left = 8
      Top = 160
      Width = 64
      Height = 13
      Caption = 'Complemento'
    end
    object edtNome: TEdit
      Left = 8
      Top = 32
      Width = 465
      Height = 21
      TabOrder = 0
    end
    object edtTpPessoa: TEdit
      Left = 8
      Top = 80
      Width = 25
      Height = 21
      Hint = '|F - Pessoa F'#237'sica    J - Pessoa Jur'#237'dica'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object edtCpfCpnj: TEdit
      Left = 88
      Top = 80
      Width = 169
      Height = 21
      TabOrder = 2
    end
    object edtEndereco: TEdit
      Left = 8
      Top = 128
      Width = 393
      Height = 21
      TabOrder = 3
    end
    object edtBairro: TEdit
      Left = 8
      Top = 224
      Width = 185
      Height = 21
      TabOrder = 5
    end
    object edtMunicipio: TEdit
      Left = 200
      Top = 224
      Width = 233
      Height = 21
      TabOrder = 6
    end
    object edtUf: TEdit
      Left = 440
      Top = 224
      Width = 33
      Height = 21
      TabOrder = 7
    end
    object edtNumero: TEdit
      Left = 408
      Top = 128
      Width = 65
      Height = 21
      TabOrder = 4
    end
    object edtTelefone: TEdit
      Left = 96
      Top = 272
      Width = 185
      Height = 21
      TabOrder = 9
    end
    object edtFax: TEdit
      Left = 288
      Top = 272
      Width = 185
      Height = 21
      TabOrder = 10
    end
    object edtEmail: TEdit
      Left = 8
      Top = 320
      Width = 465
      Height = 21
      TabOrder = 11
    end
    object btn1: TButton
      Left = 384
      Top = 72
      Width = 75
      Height = 25
      Caption = 'btn1'
      TabOrder = 12
      Visible = False
      OnClick = btn1Click
    end
    object edtCep: TEdit
      Left = 8
      Top = 272
      Width = 81
      Height = 21
      TabOrder = 8
    end
    object edtId: TEdit
      Left = 452
      Top = 8
      Width = 21
      Height = 21
      TabStop = False
      TabOrder = 13
      Visible = False
    end
    object edtComplemento: TEdit
      Left = 8
      Top = 176
      Width = 465
      Height = 21
      TabOrder = 14
    end
  end
end

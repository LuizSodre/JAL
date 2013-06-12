object MainForm: TMainForm
  Left = 192
  Top = 124
  Width = 488
  Height = 267
  Caption = 'MainForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = mm1
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object btnNovoContato: TBitBtn
    Left = 16
    Top = 88
    Width = 203
    Height = 25
    Caption = 'Novo Contato'
    TabOrder = 0
  end
  object btnPesquisarContato: TBitBtn
    Left = 16
    Top = 120
    Width = 203
    Height = 25
    Caption = 'Pesquisar Contato'
    TabOrder = 1
  end
  object btnPesquisarCidade: TBitBtn
    Left = 16
    Top = 152
    Width = 203
    Height = 25
    Caption = 'Pesquisar Cidade'
    TabOrder = 2
  end
  object btnFechar: TBitBtn
    Left = 16
    Top = 184
    Width = 203
    Height = 25
    Caption = 'Fechar'
    TabOrder = 3
  end
  object mm1: TMainMenu
    Left = 288
    Top = 112
    object mnuCadastro: TMenuItem
      Caption = '&Cadastro'
      object mnuCadContato: TMenuItem
        Caption = 'Contato'
      end
      object mnuCadCidade: TMenuItem
        Caption = 'Cidade'
      end
    end
    object mnuConsulta: TMenuItem
      Caption = 'Consulta'
      object mnuConsContato: TMenuItem
        Caption = 'Contato'
      end
      object mnuConsCidade: TMenuItem
        Caption = 'Cidade'
      end
    end
    object mnuRelatorio: TMenuItem
      Caption = 'Relatorio'
    end
    object mnuSair: TMenuItem
      Caption = 'Sair'
    end
  end
end

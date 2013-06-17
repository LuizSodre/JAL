object MainForm: TMainForm
  Left = 192
  Top = 124
  Width = 488
  Height = 99
  Caption = 'MainForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  Menu = mm1
  OldCreateOrder = False
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 472
    Height = 37
    ButtonHeight = 32
    ButtonWidth = 32
    Caption = 'ToolBar1'
    TabOrder = 0
    object btnNovoContato: TToolButton
      Left = 0
      Top = 2
      Caption = 'btnNovoContato'
      ImageIndex = 0
    end
    object btnPesquisarContato: TToolButton
      Left = 32
      Top = 2
      Caption = 'btnPesquisarContato'
      ImageIndex = 1
    end
    object btnPesquisarCidade: TToolButton
      Left = 64
      Top = 2
      Caption = 'btnPesquisarCidade'
      ImageIndex = 2
    end
    object ToolButton3: TToolButton
      Left = 96
      Top = 2
      Caption = 'ToolButton3'
      ImageIndex = 3
    end
    object btnFechar: TToolButton
      Left = 128
      Top = 2
      Caption = 'btnFechar'
      ImageIndex = 4
    end
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

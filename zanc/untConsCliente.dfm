inherited frmConsCliente: TfrmConsCliente
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlGenerico: TPanel
    inherited grdConsulta: TStringGrid
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    end
  end
  inherited Panel1: TPanel
    object BitBtn2: TBitBtn
      Left = 24
      Top = 192
      Width = 75
      Height = 25
      Caption = 'BitBtn2'
      TabOrder = 4
      OnClick = BitBtn2Click
    end
  end
  object frprt1: TfrReport
    Dataset = frdbdtst1
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Left = 666
    Top = 240
    ReportForm = {17000000}
  end
  object frdbdtst1: TfrDBDataSet
    DataSet = data.zqryZanc
    Left = 666
    Top = 272
  end
  object zrdnlyqry1: TZReadOnlyQuery
    Connection = data.conDBZanc
    Active = True
    SQL.Strings = (
      'select * from tcliente')
    Params = <>
    Left = 714
    Top = 272
  end
  object frsrdtst1: TfrUserDataset
    Left = 666
    Top = 312
  end
  object frlbjct1: TfrOLEObject
    Left = 634
    Top = 280
  end
end

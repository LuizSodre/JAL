inherited frmConsContratante: TfrmConsContratante
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlGenerico: TPanel
    inherited grdConsulta: TStringGrid
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    end
  end
  inherited Panel1: TPanel
    inherited btnFechar: TBitBtn
      Top = 165
    end
    inherited btnImprimir: TBitBtn
      OnClick = btnImprimirClick
    end
  end
  inherited frRelatorio: TfrReport
    ReportForm = {17000000}
  end
end

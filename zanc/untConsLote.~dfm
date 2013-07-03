inherited frmConsLote: TfrmConsLote
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
  end
  inherited frRelatorio: TfrReport
    ReportForm = {17000000}
  end
  inherited zQryConsulta: TZQuery
    AutoCalcFields = False
    SQL.Strings = (
      'SELECT '
      'TLOTE.ID, '
      'TLOTE.NOMEARQUIVO, '
      'TCONTRATANTE.NOME AS CONTRATANTE, '
      'TCLIENTE.NOME AS CLIENTE, '
      'TLOTE.ID_CONTRATO, '
      'TLOTE.DT_CRIACAO, '
      'TLOTE.DT_ENVIO_HIGIENIZACAO, '
      'TLOTE.DT_RETORNO_HIGIENIZACAO, '
      'TLOTE.DT_ENVIO_IMPRESSAO, '
      'TLOTE.DT_ENVIO_POSTAGEM, '
      'TLOTE.DT_POSTAGEM, '
      'TLOTE.ORDEMSERVICO, '
      'TLOTE.ANO'
      'FROM '
      'TLOTE, '
      'TCLIENTE, '
      'TCONTRATANTE'
      'WHERE '
      'TLOTE.ID_CLIENTE = TCLIENTE.ID '
      'AND TLOTE.ID_CONTRANTE = TCONTRATANTE.ID')
  end
end

unit Lote_DAO;

interface
uses
  Windows, Messages, SysUtils, Variants, TypInfo, ActiveX, Lote_MDL, Classes, Constantes,
  DB, ADODB, ZConnection, ZAbstractRODataset, ZAbstractDataset, ZDataset;
type
  TLote_DAO = class(TObject)
  public
    function getById(prId : Integer) : TLote;
    function getAll : TList;
    function isValido(prLote : TLote; var MsgErro : String): Boolean;
    function Gravar(prLote : TLote; var MsgErro : String): Boolean;
    function Excluir(prId : Integer; var MsgErro : String) : Boolean;

  end;

implementation

uses dmdata, Base_MDL;

{ TLote_DAO }

function TLote_DAO.Excluir(prId: Integer; var MsgErro: String): Boolean;
begin
  Result := True;
end;

function TLote_DAO.getAll: TList;
begin
  Result := nil;
end;

function TLote_DAO.getById(prId: Integer): TLote;
var
  qry : TZQuery;
  Lote : TLote;
begin
  Lote := TLote.Create;
  qry := TZQuery.Create(nil);
  try
    data.conDBZanc.Connect;
    qry.Connection := data.conDBZanc;
    qry.SQL.Add('select * from tlote where id = ' + IntToStr(prId));
    qry.Open;
    if not qry.IsEmpty
     then begin
       Lote.Id := qry.fieldbyname('Id').AsInteger;
       Lote.IdContratante := qry.fieldbyname('Id_contrante').AsInteger;
       Lote.IdCliente := qry.fieldbyname('Id_cliente').AsInteger;
       Lote.OrdemServico := qry.fieldbyname('OrdemServico').AsString;
       Lote.NomeArquivo := qry.fieldbyname('NomeArquivo').AsString;
       Lote.DtEntrada := qry.fieldbyname('dt_criacao').AsDateTime;
       Lote.DtEnvioHigiene := qry.fieldbyname('dt_envio_higienizacao').AsDateTime;
       Lote.DtRetornoHigiene := qry.fieldbyname('dt_retorno_higienizacao').AsDateTime;
       Lote.DtEnvioImpressao := qry.fieldbyname('dt_envio_impressao').AsDateTime;
       Lote.DtEnvioPostagem := qry.fieldbyname('dt_envio_postagem').AsDateTime;
       Lote.DtPostagem := qry.fieldbyname('dt_postagem').AsDateTime;
       Lote.Ano := qry.fieldbyname('Ano').AsInteger;
     end
     else
       Lote := nil;
  finally
    FreeAndNil(qry);
  end;

  Result := Lote;
end;

function TLote_DAO.Gravar(prLote: TLote; var MsgErro: String): Boolean;
var
  qry, qryExec : TZQuery;
begin

  qry := TZQuery.Create(nil);
  qryExec := TZQuery.Create(nil);
  try
    data.conDBZanc.Connect;
    qry.Connection := data.conDBZanc;
    qryExec.Connection := data.conDBZanc;
    qry.SQL.Add('select * from tlote where id = ' + IntToStr(prLote.Id));
    qry.Open;
    if not qry.IsEmpty
     then begin
       qryExec.SQL.Add('update tlote set ');
       qryExec.SQL.Add(' Id_contrante = :Id_contrante');
       qryExec.SQL.Add(' Id_cliente = :Id_cliente,');
       qryExec.SQL.Add(' OrdemServico = :OrdemServico,');
       qryExec.SQL.Add(' NomeArquivo = :NomeArquivo,');
       qryExec.SQL.Add(' dt_criacao = :dt_criacao,');
       qryExec.SQL.Add(' dt_envio_higienizacao = :dt_envio_higienizacao,');
       qryExec.SQL.Add(' dt_retorno_higienizacao = :dt_retorno_higienizacao,');
       qryExec.SQL.Add(' dt_envio_impressao = :dt_envio_impressao,');
       qryExec.SQL.Add(' dt_envio_postagem = :dt_envio_postagem,');
       qryExec.SQL.Add(' dt_postagem = :dt_postagem,');
       qryExec.SQL.Add(' Ano = :Ano,');
       qryExec.SQL.Add(' where id = :id');

       qryExec.ParamByName('id').AsInteger :=  prLote.Id;
     end
     else begin
       qryExec.SQL.Add('insert into tlote (');
       qryExec.SQL.Add(' Id_contrante,');
       qryExec.SQL.Add(' Id_cliente,');
       qryExec.SQL.Add(' OrdemServico,');
       qryExec.SQL.Add(' NomeArquivo,');
       qryExec.SQL.Add(' dt_criacao,');
       qryExec.SQL.Add(' dt_envio_higienizacao,');
       qryExec.SQL.Add(' dt_retorno_higienizacao,');
       qryExec.SQL.Add(' dt_envio_impressao,');
       qryExec.SQL.Add(' dt_envio_postagem,');
       qryExec.SQL.Add(' dt_postagem,');
       qryExec.SQL.Add(' Ano,');
       qryExec.SQL.Add(') values( ');
       qryExec.SQL.Add(' :Id_contrante,');
       qryExec.SQL.Add(' :Id_cliente,');
       qryExec.SQL.Add(' :OrdemServico,');
       qryExec.SQL.Add(' :NomeArquivo,');
       qryExec.SQL.Add(' :dt_criacao,');
       qryExec.SQL.Add(' :dt_envio_higienizacao,');
       qryExec.SQL.Add(' :dt_retorno_higienizacao,');
       qryExec.SQL.Add(' :dt_envio_impressao,');
       qryExec.SQL.Add(' :dt_envio_postagem,');
       qryExec.SQL.Add(' :dt_postagem,');
       qryExec.SQL.Add(' :Ano)');
     end;

     qryExec.ParamByName('Id_contrante').AsInteger             := prLote.IdContratante;
     qryExec.ParamByName('Id_cliente').AsInteger               := prLote.IdCliente;
     qryExec.ParamByName('OrdemServico').AsString              := prLote.OrdemServico;
     qryExec.ParamByName('NomeArquivo').AsString               := prLote.NomeArquivo;
     if prLote.DtEntrada > 0
      then qryExec.ParamByName('dt_criacao').AsDateTime        := prLote.DtEntrada
      else qryExec.ParamByName('dt_criacao').DataType          := ftDateTime;

     if prLote.DtEnvioHigiene > 0
      then qryExec.ParamByName('dt_envio_higienizacao').AsDateTime   := prLote.DtEnvioHigiene
      else qryExec.ParamByName('dt_envio_higienizacao').DataType          := ftDateTime;

     if  prLote.DtRetornoHigiene > 0
      then qryExec.ParamByName('dt_retorno_higienizacao').AsDateTime := prLote.DtRetornoHigiene
      else qryExec.ParamByName('dt_retorno_higienizacao').DataType          := ftDateTime;

     if prLote.DtEnvioImpressao > 0
      then qryExec.ParamByName('dt_envio_impressao').AsDateTime      := prLote.DtEnvioImpressao
      else qryExec.ParamByName('dt_envio_impressao').DataType          := ftDateTime;

     if prLote.DtEnvioPostagem > 0
      then qryExec.ParamByName('dt_envio_postagem').AsDateTime       := prLote.DtEnvioPostagem
      else qryExec.ParamByName('dt_envio_postagem').DataType          := ftDateTime;

     if prLote.DtPostagem > 0
      then qryExec.ParamByName('dt_postagem').AsDateTime             := prLote.DtPostagem
      else qryExec.ParamByName('dt_postagem').DataType          := ftDateTime;

     qryExec.ParamByName('Ano').AsInteger                      := prLote.Ano;

     data.conDBZanc.StartTransaction;
     try
       qryExec.ExecSQL;
       data.conDBZanc.Commit;
       Result := True;
       MsgErro := 'Lote gravado com sucesso.';
     except
       on E: Exception do
        begin
          data.conDBZanc.Rollback;
          Result := False;

          MsgErro := 'Erro ao executar comando SQL'
                   + #13 + E.Message;
        end;
     end;
  finally
    qry.Close;
    FreeAndNil(qry);
    FreeAndNil(qryExec);
    data.conDBZanc.Disconnect;
  end;
end;

function TLote_DAO.isValido(prLote: TLote; var MsgErro: String): Boolean;
begin
  Result := True;
end;

end.

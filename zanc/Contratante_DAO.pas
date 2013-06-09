unit Contratante_DAO;

interface
uses
  Windows, Messages, SysUtils, Variants, TypInfo, ActiveX, Contratante_MDL, Classes, Constantes,
  DB, ADODB, ZConnection, ZAbstractRODataset, ZAbstractDataset, ZDataset;
type
  TContratante_DAO = class(TObject)
  public
    function getById(prId : Integer) : TContratante;
    function getAll : TList;
    function isValido(prContratante : TContratante; var MsgErro : String): Boolean;
    function Gravar(prContratante : TContratante; var MsgErro : String): Boolean;
    function Excluir(prId : Integer; var MsgErro : String) : Boolean;

  end;

implementation
uses dmdata;

{ TCliente_DAO }

function  TContratante_DAO.Excluir(prId: Integer; var MsgErro: String): Boolean;
begin
  Result := True;
end;

function  TContratante_DAO.getAll: TList;
begin
  Result := nil;
end;

function  TContratante_DAO.getById(prId: Integer): TContratante;
var
  qry : TZQuery;
   Contratante :  TContratante;
begin
   Contratante :=  TContratante.Create;
  qry := TZQuery.Create(nil);
  try
    data.conDBZanc.Connect;
    qry.Connection := data.conDBZanc;
    qry.SQL.Add('select * from tcontratante where id = ' + IntToStr(prId));
    qry.Open;
    if not qry.IsEmpty
     then begin
       Contratante.Id := qry.fieldbyname('Id').AsInteger;
       Contratante.Nome := qry.fieldbyname('Nome').AsString;
       Contratante.TpPessoa := qry.fieldbyname('TpPessoa').AsString;
       Contratante.CpfCnpj := qry.fieldbyname('CpfCnpj').AsString;
       Contratante.Endereco := qry.fieldbyname('Endereco').AsString;
       Contratante.Numero := qry.fieldbyname('Numero').AsString;
       Contratante.Complemento := qry.fieldbyname('Complemento').AsString;
       Contratante.Bairro := qry.fieldbyname('Bairro').AsString;
       Contratante.Municipio := qry.fieldbyname('Municipio').AsString;
       Contratante.Uf := qry.fieldbyname('Uf').AsString;
       Contratante.Cep := qry.fieldbyname('Cep').AsString;
       Contratante.Telefone := qry.fieldbyname('Telefone').AsString;
       Contratante.Fax := qry.fieldbyname('Fax').AsString;
       Contratante.Email := qry.fieldbyname('Email').AsString;
     end
     else
       Contratante := nil;
  finally
    FreeAndNil(qry);
  end;

  Result := Contratante;
end;

function TContratante_DAO.Gravar(prContratante: TContratante;
  var MsgErro: String): Boolean;
var
  qry, qryExec : TZQuery;
begin

  qry := TZQuery.Create(nil);
  qryExec := TZQuery.Create(nil);
  try
    data.conDBZanc.Connect;
    qry.Connection := data.conDBZanc;
    qryExec.Connection := data.conDBZanc;
    qry.SQL.Add('select * from tcontratante where id = ' + IntToStr(prContratante.Id));
    qry.Open;
    if not qry.IsEmpty
     then begin
       qryExec.SQL.Add('update tcontratante set ');
       qryExec.SQL.Add(' Nome        = :Nome');
       qryExec.SQL.Add(' TpPessoa    = :TpPessoa,');
       qryExec.SQL.Add(' CpfCnpj     = :CpfCnpj,');
       qryExec.SQL.Add(' Endereco    = :Endereco,');
       qryExec.SQL.Add(' Numero      = :Numero,');
       qryExec.SQL.Add(' Complemento = :Complemento,');
       qryExec.SQL.Add(' Bairro      = :Bairro,');
       qryExec.SQL.Add(' Municipio   = :Municipio,');
       qryExec.SQL.Add(' Uf          = :Uf,');
       qryExec.SQL.Add(' Cep         = :Cep,');
       qryExec.SQL.Add(' Telefone    = :Telefone,');
       qryExec.SQL.Add(' Fax         = :Fax,');
       qryExec.SQL.Add(' Email       = :Email');
       qryExec.SQL.Add(' where id = :id');

       qryExec.ParamByName('id').AsInteger :=  prContratante.Id;
     end
     else begin
       qryExec.SQL.Add('insert into tcontratante (');
       qryExec.SQL.Add(' Nome,');
       qryExec.SQL.Add(' TpPessoa,');
       qryExec.SQL.Add(' CpfCnpj,');
       qryExec.SQL.Add(' Endereco,');
       qryExec.SQL.Add(' Numero,');
       qryExec.SQL.Add(' Complemento,');
       qryExec.SQL.Add(' Bairro,');
       qryExec.SQL.Add(' Municipio,');
       qryExec.SQL.Add(' Uf,');
       qryExec.SQL.Add(' Cep,');
       qryExec.SQL.Add(' Telefone,');
       qryExec.SQL.Add(' Fax,');
       qryExec.SQL.Add(' Email');
       qryExec.SQL.Add(') values( ');
       qryExec.SQL.Add(' :Nome,');
       qryExec.SQL.Add(' :TpPessoa,');
       qryExec.SQL.Add(' :CpfCnpj,');
       qryExec.SQL.Add(' :Endereco,');
       qryExec.SQL.Add(' :Numero,');
       qryExec.SQL.Add(' :Complemento,');
       qryExec.SQL.Add(' :Bairro,');
       qryExec.SQL.Add(' :Municipio,');
       qryExec.SQL.Add(' :Uf,');
       qryExec.SQL.Add(' :Cep,');
       qryExec.SQL.Add(' :Telefone,');
       qryExec.SQL.Add(' :Fax,');
       qryExec.SQL.Add(' :Email)');
     end;

     qryExec.ParamByName('Nome').AsString         := prContratante.Nome;
     qryExec.ParamByName('TpPessoa').AsString     := prContratante.TpPessoa;
     qryExec.ParamByName('CpfCnpj').AsString      := prContratante.CpfCnpj;
     qryExec.ParamByName('Endereco').AsString     := prContratante.Endereco;
     qryExec.ParamByName('Numero').AsString       := prContratante.Numero;
     qryExec.ParamByName('Complemento').AsString  := prContratante.Complemento;
     qryExec.ParamByName('Bairro').AsString       := prContratante.Bairro;
     qryExec.ParamByName('Municipio').AsString    := prContratante.Municipio;
     qryExec.ParamByName('Uf').AsString           := prContratante.Uf;
     qryExec.ParamByName('Cep').AsString          := prContratante.Cep;
     qryExec.ParamByName('Telefone').AsString     := prContratante.Telefone;
     qryExec.ParamByName('Fax').AsString          := prContratante.Fax;
     qryExec.ParamByName('Email').AsString        := prContratante.Email;

     data.conDBZanc.StartTransaction;
     try
       qryExec.ExecSQL;
       data.conDBZanc.Commit;
       Result := True;
       MsgErro := 'Contratante gravado com sucesso.';
     except
       data.conDBZanc.Rollback;
       Result := False;
       MsgErro := 'Erro ao executar comando SQL';
     end;
  finally
    qry.Close;
    FreeAndNil(qry);
    FreeAndNil(qryExec);
    data.conDBZanc.Disconnect;
  end;
end;

function TContratante_DAO.isValido(prContratante: TContratante;
  var MsgErro: String): Boolean;
begin
  Result := True;
end;

end.

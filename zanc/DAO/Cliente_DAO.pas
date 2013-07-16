unit Cliente_DAO;

interface
uses
  Windows, Messages, SysUtils, Variants, TypInfo, ActiveX, Cliente_MDL, Classes, Constantes,
  DB, ADODB, ZConnection, ZAbstractRODataset, ZAbstractDataset, ZDataset;
type
  TCliente_DAO = class(TObject)
  public
    function getById(prId : Integer) : TCliente;
    function getAll : TList;
    function getByCampo(prCampo, prValor : String) : TList;
    function isValido(prCliente : TCliente; var MsgErro : String): Boolean;
    function Gravar(prCliente : TCliente; var MsgErro : String): Boolean;
    function Excluir(prId : Integer; var MsgErro : String) : Boolean;
  end;

implementation

uses dmdata;

{ TCliente_DAO }

function TCliente_DAO.Excluir(prId: Integer; var MsgErro: String): Boolean;
var
  qryExec : TZQuery;
begin
  qryExec := TZQuery.Create(nil);
  try
    data.conDBZanc.Connect;
    qryExec.Connection := data.conDBZanc;
    qryExec.SQL.Add('delete from tcliente where id = ' + IntToStr(prId));

    data.conDBZanc.StartTransaction;
    try
      qryExec.ExecSQL;
      data.conDBZanc.Commit;
      Result := True;
      MsgErro := 'Cliente excluído com sucesso.';
    except
      data.conDBZanc.Rollback;
      Result := False;
      MsgErro := 'Erro ao executar comando SQL';
    end;
  finally
    FreeAndNil(qryExec);
    data.conDBZanc.Disconnect;
  end;
end;

function TCliente_DAO.getAll: TList;
var
  qry : TZQuery;
  Cliente : TCliente;
  ListaRetorno : TList;
begin
  ListaRetorno := TList.Create;
  ListaRetorno.Clear;
  qry := TZQuery.Create(nil);
  try
    data.conDBZanc.Connect;
    qry.Connection := data.conDBZanc;
    qry.SQL.Add('select * from tcliente');
    qry.Open;

    if not qry.IsEmpty
     then begin
       while not qry.Eof do
       begin
         Cliente := TCliente.Create;
         Cliente.Clear;
         Cliente.Id := qry.fieldbyname('Id').AsInteger;
         Cliente.Nome := qry.fieldbyname('Nome').AsString;
         Cliente.TpPessoa := qry.fieldbyname('TpPessoa').AsString;
         Cliente.CpfCnpj := qry.fieldbyname('CpfCnpj').AsString;
         Cliente.Endereco := qry.fieldbyname('Endereco').AsString;
         Cliente.Numero := qry.fieldbyname('Numero').AsString;
         Cliente.Complemento := qry.fieldbyname('Complemento').AsString;
         Cliente.Bairro := qry.fieldbyname('Bairro').AsString;
         Cliente.Municipio := qry.fieldbyname('Municipio').AsString;
         Cliente.Uf := qry.fieldbyname('Uf').AsString;
         Cliente.Cep := qry.fieldbyname('Cep').AsString;
         Cliente.Telefone := qry.fieldbyname('Telefone').AsString;
         Cliente.Fax := qry.fieldbyname('Fax').AsString;
         Cliente.Email := qry.fieldbyname('Email').AsString;
         ListaRetorno.Add(Cliente);
         qry.Next;
       end;
     end;
  finally
    FreeAndNil(qry);
  end;
  Result := ListaRetorno;
end;


function TCliente_DAO.getByCampo(prCampo, prValor: String): TList;
var
  qry : TZQuery;
  Cliente : TCliente;
  ListaRetorno : TList;
begin
  ListaRetorno := TList.Create;
  ListaRetorno.Clear;
  qry := TZQuery.Create(nil);
  try
    data.conDBZanc.Connect;
    qry.Connection := data.conDBZanc;
    qry.SQL.Add('select * from tcliente where ' + prCampo + ' like ''%' + prValor + '%''');
    qry.Open;

    if not qry.IsEmpty
     then begin
       while not qry.Eof do
       begin
         Cliente := TCliente.Create;
         Cliente.Clear;
         Cliente.Id := qry.fieldbyname('Id').AsInteger;
         Cliente.Nome := qry.fieldbyname('Nome').AsString;
         Cliente.TpPessoa := qry.fieldbyname('TpPessoa').AsString;
         Cliente.CpfCnpj := qry.fieldbyname('CpfCnpj').AsString;
         Cliente.Endereco := qry.fieldbyname('Endereco').AsString;
         Cliente.Numero := qry.fieldbyname('Numero').AsString;
         Cliente.Complemento := qry.fieldbyname('Complemento').AsString;
         Cliente.Bairro := qry.fieldbyname('Bairro').AsString;
         Cliente.Municipio := qry.fieldbyname('Municipio').AsString;
         Cliente.Uf := qry.fieldbyname('Uf').AsString;
         Cliente.Cep := qry.fieldbyname('Cep').AsString;
         Cliente.Telefone := qry.fieldbyname('Telefone').AsString;
         Cliente.Fax := qry.fieldbyname('Fax').AsString;
         Cliente.Email := qry.fieldbyname('Email').AsString;
         ListaRetorno.Add(Cliente);
         qry.Next;
       end;
     end;
  finally
    FreeAndNil(qry);
  end;
  Result := ListaRetorno;
end;

function TCliente_DAO.getById(prId: Integer): TCliente;
var
  qry : TZQuery;
  Cliente : TCliente;
begin
  Cliente := TCliente.Create;
  qry := TZQuery.Create(nil);
  try
    data.conDBZanc.Connect;
    qry.Connection := data.conDBZanc;
    qry.SQL.Add('select * from tcliente where id = ' + IntToStr(prId));
    qry.Open;
    if not qry.IsEmpty
     then begin
       Cliente.Id := qry.fieldbyname('Id').AsInteger;
       Cliente.Nome := qry.fieldbyname('Nome').AsString;
       Cliente.TpPessoa := qry.fieldbyname('TpPessoa').AsString;
       Cliente.CpfCnpj := qry.fieldbyname('CpfCnpj').AsString;
       Cliente.Endereco := qry.fieldbyname('Endereco').AsString;
       Cliente.Numero := qry.fieldbyname('Numero').AsString;
       Cliente.Complemento := qry.fieldbyname('Complemento').AsString;
       Cliente.Bairro := qry.fieldbyname('Bairro').AsString;
       Cliente.Municipio := qry.fieldbyname('Municipio').AsString;
       Cliente.Uf := qry.fieldbyname('Uf').AsString;
       Cliente.Cep := qry.fieldbyname('Cep').AsString;
       Cliente.Telefone := qry.fieldbyname('Telefone').AsString;
       Cliente.Fax := qry.fieldbyname('Fax').AsString;
       Cliente.Email := qry.fieldbyname('Email').AsString;
     end
     else
       Cliente := nil;
  finally
    FreeAndNil(qry);
  end;

  Result := Cliente;
end;

function TCliente_DAO.Gravar(prCliente: TCliente;
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
    qry.SQL.Add('select * from tcliente where id = ' + IntToStr(prCliente.Id));
    qry.Open;
    if not qry.IsEmpty
     then begin
       qryExec.SQL.Add('update tcliente set ');
       qryExec.SQL.Add(' Nome        = :Nome,');
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

       qryExec.ParamByName('id').AsInteger :=  prCliente.Id;
     end
     else begin
       qryExec.SQL.Add('insert into tcliente (');
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

     qryExec.ParamByName('Nome').AsString         := prCliente.Nome;
     qryExec.ParamByName('TpPessoa').AsString     := prCliente.TpPessoa;
     qryExec.ParamByName('CpfCnpj').AsString      := prCliente.CpfCnpj;
     qryExec.ParamByName('Endereco').AsString     := prCliente.Endereco;
     qryExec.ParamByName('Numero').AsString       := prCliente.Numero;
     qryExec.ParamByName('Complemento').AsString  := prCliente.Complemento;
     qryExec.ParamByName('Bairro').AsString       := prCliente.Bairro;
     qryExec.ParamByName('Municipio').AsString    := prCliente.Municipio;
     qryExec.ParamByName('Uf').AsString           := prCliente.Uf;
     qryExec.ParamByName('Cep').AsString          := prCliente.Cep;
     qryExec.ParamByName('Telefone').AsString     := prCliente.Telefone;
     qryExec.ParamByName('Fax').AsString          := prCliente.Fax;
     qryExec.ParamByName('Email').AsString        := prCliente.Email;

     data.conDBZanc.StartTransaction;
     try
       qryExec.ExecSQL;
       data.conDBZanc.Commit;
       Result := True;
       MsgErro := 'Cliente gravado com sucesso.';
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

function TCliente_DAO.isValido(prCliente: TCliente;
  var MsgErro: String): Boolean;
var
  vResultado: Boolean;
begin
  Result := False;

  vResultado := getCpfCnpjValido(prCliente.TpPessoa, prCliente.CpfCnpj, MsgErro);
  if  vResultado
    or(MsgErro = NO_STRING)
   then Result := True;
end;

end.

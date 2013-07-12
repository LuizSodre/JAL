unit Usuario_DAO;

interface
uses
  Windows, Messages, SysUtils, Variants, TypInfo, ActiveX, Usuario_MDL, Classes, Constantes,
  DB, ADODB, ZConnection, ZAbstractRODataset, ZAbstractDataset, ZDataset;
type
  TUsuario_DAO = class(TObject)
  public
    function getById(prId : Integer) : TUsuario;
    function getAll : TList;
    function getByCampo(prCampo, prValor : String) : TList;
    function isValido(prUsuario : TUsuario; var MsgErro : String): Boolean;
    function Gravar(prUsuario : TUsuario; var MsgErro : String): Boolean;
    function Excluir(prId : Integer; var MsgErro : String) : Boolean;

  end;

implementation
uses dmdata;

{ TUsuario_DAO }

function TUsuario_DAO.Excluir(prId: Integer; var MsgErro: String): Boolean;
var
  qryExec : TZQuery;
begin
  qryExec := TZQuery.Create(nil);
  try
    data.conDBZanc.Connect;
    qryExec.Connection := data.conDBZanc;
    qryExec.SQL.Add('delete from tUsuario where id = ' + IntToStr(prId));

    data.conDBZanc.StartTransaction;
    try
      qryExec.ExecSQL;
      data.conDBZanc.Commit;
      Result := True;
      MsgErro := 'Usuario excluído com sucesso.';
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

function TUsuario_DAO.getAll: TList;
var
  qry : TZQuery;
  Usuario : TUsuario;
  ListaRetorno : TList;
begin
  ListaRetorno := TList.Create;
  ListaRetorno.Clear;
  qry := TZQuery.Create(nil);
  try
    data.conDBZanc.Connect;
    qry.Connection := data.conDBZanc;
    qry.SQL.Add('select * from tUsuario');
    qry.Open;

    if not qry.IsEmpty
     then begin
       while not qry.Eof do
       begin
         Usuario := TUsuario.Create;
         Usuario.Clear;
         Usuario.Id := qry.fieldbyname('Id').AsInteger;
         Usuario.Nome := qry.fieldbyname('Nome').AsString;
         Usuario.Login := qry.fieldbyname('Login').AsString;
         Usuario.Senha := qry.fieldbyname('Senha').AsString;
         ListaRetorno.Add(Usuario);
         qry.Next;
       end;
     end;
  finally
    FreeAndNil(qry);
  end;
  Result := ListaRetorno;
end;


function TUsuario_DAO.getByCampo(prCampo, prValor: String): TList;
var
  qry : TZQuery;
  Usuario : TUsuario;
  ListaRetorno : TList;
begin
  ListaRetorno := TList.Create;
  ListaRetorno.Clear;
  qry := TZQuery.Create(nil);
  try
    data.conDBZanc.Connect;
    qry.Connection := data.conDBZanc;
    qry.SQL.Add('select * from tUsuario where ' + prCampo + ' like ''%' + prValor + '%''');
    qry.Open;

    if not qry.IsEmpty
     then begin
       while not qry.Eof do
       begin
         Usuario := TUsuario.Create;
         Usuario.Clear;
         Usuario.Id := qry.fieldbyname('Id').AsInteger;
         Usuario.Nome := qry.fieldbyname('Nome').AsString;
         Usuario.Login := qry.fieldbyname('Login').AsString;
         Usuario.Senha := qry.fieldbyname('Senha').AsString;
         ListaRetorno.Add(Usuario);
         qry.Next;
       end;
     end;
  finally
    FreeAndNil(qry);
  end;
  Result := ListaRetorno;
end;

function TUsuario_DAO.getById(prId: Integer): TUsuario;
var
  qry : TZQuery;
  Usuario : TUsuario;
begin
  Usuario := TUsuario.Create;
  qry := TZQuery.Create(nil);
  try
    data.conDBZanc.Connect;
    qry.Connection := data.conDBZanc;
    qry.SQL.Add('select * from tUsuario where id = ' + IntToStr(prId));
    qry.Open;
    if not qry.IsEmpty
     then begin
       Usuario.Id := qry.fieldbyname('Id').AsInteger;
       Usuario.Nome := qry.fieldbyname('Nome').AsString;
       Usuario.Login := qry.fieldbyname('Login').AsString;
       Usuario.Senha := qry.fieldbyname('Senha').AsString;
     end
     else
       Usuario := nil;
  finally
    FreeAndNil(qry);
  end;

  Result := Usuario;
end;

function TUsuario_DAO.Gravar(prUsuario: TUsuario;
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
    qry.SQL.Add('select * from tUsuario where id = ' + IntToStr(prUsuario.Id));
    qry.Open;
    if not qry.IsEmpty
     then begin
       qryExec.SQL.Add('update tUsuario set ');
       qryExec.SQL.Add(' Nome     = :Nome,');
       qryExec.SQL.Add(' Login    = :Login,');
       qryExec.SQL.Add(' Senha    = :Senha');
       qryExec.SQL.Add(' where id = :id');

       qryExec.ParamByName('id').AsInteger :=  prUsuario.Id;
     end
     else begin
       qryExec.SQL.Add('insert into tUsuario (');
       qryExec.SQL.Add(' Nome,');
       qryExec.SQL.Add(' Login,');
       qryExec.SQL.Add(' Senha');
       qryExec.SQL.Add(') values( ');
       qryExec.SQL.Add(' :Nome,');
       qryExec.SQL.Add(' :Login,');
       qryExec.SQL.Add(' :Senha)');

     end;

     qryExec.ParamByName('Nome').AsString         := prUsuario.Nome;
     qryExec.ParamByName('Login').AsString     := prUsuario.Login;
     qryExec.ParamByName('Senha').AsString      := prUsuario.Senha;

     data.conDBZanc.StartTransaction;
     try
       qryExec.ExecSQL;
       data.conDBZanc.Commit;
       Result := True;
       MsgErro := 'Usuario gravado com sucesso.';
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

function TUsuario_DAO.isValido(prUsuario: TUsuario;
  var MsgErro: String): Boolean;
begin
  Result := True;
end;

end.

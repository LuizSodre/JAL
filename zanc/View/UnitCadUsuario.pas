unit UnitCadUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, dmdata,
  unitCadGenerico, StdCtrls, DB, Buttons, ComCtrls, ExtCtrls,
  Dialogs, Usuario_MDL, Constantes;

type
  TfrmCadUsuario = class(TfrmCadGenerico)
    Label1: TLabel;
    edtNome: TEdit;
    edtLogin: TEdit;
    Label2: TLabel;
    edtSenha: TEdit;
    Label3: TLabel;
    edtId: TEdit;
    lblTitulo: TLabel;
    lblTituloMascara: TLabel;
    procedure btn1Click(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LoadUsuarioToControls(prUsuario : TUsuario);
    function LoadClinteFromControls : TUsuario;
  end;

var
  frmCadUsuario: TfrmCadUsuario;

implementation

uses Usuario_DAO, unitMain;


{$R *.dfm}

procedure TfrmCadUsuario.btn1Click(Sender: TObject);
{var
  Usuario : TUsuario;
  dao : TUsuario_DAO;}
begin
  inherited;
  {dao := TUsuario_DAO.Create;
  Usuario := dao.getById(1);
  if Assigned(Usuario)
   then begin
     Edit1.Text := Usuario.Nome;
     Edit2.Text := Usuario.Login;
     Edit3.Text := Usuario.CpfCnpj;
   end;
  FreeAndNil(Usuario);}
end;

procedure TfrmCadUsuario.LoadUsuarioToControls(prUsuario: TUsuario);
begin
  edtId.Text          := IntToStr(prUsuario.Id);
  edtNome.Text        := prUsuario.Nome;
  edtLogin.Text       := prUsuario.Login;
  edtSenha.Text       := getSenhaDesCripto(prUsuario.Senha);
end;

function TfrmCadUsuario.LoadClinteFromControls: TUsuario;
var
  Usuario : TUsuario;
begin
  Usuario := TUsuario.Create;
  if edtId.Text <> NO_STRING
   then Usuario.Id := StrToInt(edtId.Text)
   else Usuario.Id := 0;

  Usuario.Nome         := edtNome.Text;
  Usuario.Login        := edtLogin.Text;
  if edtSenha.Text <> no_string
   then Usuario.Senha        := getSenhaCripto(edtSenha.Text);
  
  Result := Usuario;
end;

procedure TfrmCadUsuario.btnConfirmarClick(Sender: TObject);
var
  Usuario : TUsuario;
  dao : TUsuario_DAO;
  vErroMsg : string;
begin
  inherited;
  if (edtNome.Text <> NO_STRING) and
     (edtLogin.Text <> NO_STRING) and
     (edtSenha.Text <> NO_STRING)
   then begin
     Usuario := LoadClinteFromControls;
     if Assigned(Usuario)
      then begin
        dao := TUsuario_DAO.Create;
        try
          vErroMsg := NO_STRING;
          if dao.Gravar(Usuario,vErroMsg)
           then begin
             ShowMessage(vErroMsg);
             Close;
           end
           else ShowMessage(vErroMsg);
        finally
          FreeAndNil(dao);
        end;
      end;
   end;
end;

procedure TfrmCadUsuario.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadUsuario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //Action := caFree;
end;

end.

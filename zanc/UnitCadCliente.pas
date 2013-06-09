unit UnitCadCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, dmdata,
  unitCadGenerico, StdCtrls, DB, Buttons, ComCtrls, ExtCtrls,
  Dialogs, Cliente_MDL, Constantes;

type
  TfrmCadCliente = class(TfrmCadGenerico)
    Label1: TLabel;
    edtNome: TEdit;
    edtTpPessoa: TEdit;
    Label2: TLabel;
    edtCpfCpnj: TEdit;
    Label3: TLabel;
    edtEndereco: TEdit;
    Label4: TLabel;
    edtBairro: TEdit;
    Label5: TLabel;
    edtMunicipio: TEdit;
    Label6: TLabel;
    edtUf: TEdit;
    Label7: TLabel;
    edtNumero: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    edtTelefone: TEdit;
    Label10: TLabel;
    edtFax: TEdit;
    Label11: TLabel;
    edtEmail: TEdit;
    btn1: TButton;
    Label12: TLabel;
    edtCep: TEdit;
    edtId: TEdit;
    Label13: TLabel;
    edtComplemento: TEdit;
    procedure btn1Click(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LoadClienteToControls(prCliente : TCliente);
    function LoadClinteFromControls : TCliente;
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

uses Cliente_DAO;


{$R *.dfm}

procedure TfrmCadCliente.btn1Click(Sender: TObject);
{var
  Cliente : TCliente;
  dao : TCliente_DAO;}
begin
  inherited;
  {dao := TCliente_DAO.Create;
  Cliente := dao.getById(1);
  if Assigned(Cliente)
   then begin
     Edit1.Text := Cliente.Nome;
     Edit2.Text := Cliente.TpPessoa;
     Edit3.Text := Cliente.CpfCnpj;
   end;
  FreeAndNil(Cliente);}
end;

procedure TfrmCadCliente.LoadClienteToControls(prCliente: TCliente);
begin
  edtId.Text          := IntToStr(prCliente.Id);
  edtNome.Text        := prCliente.Nome;
  edtTpPessoa.Text    := prCliente.TpPessoa;
  edtCpfCpnj.Text     := prCliente.CpfCnpj;
  edtEndereco.Text    := prCliente.Endereco;
  edtNumero.Text      := prCliente.Numero;
  edtComplemento.Text := prCliente.Complemento;
  edtBairro.Text      := prCliente.Bairro;
  edtMunicipio.Text   := prCliente.Municipio;
  edtUf.Text          := prCliente.Uf;
  edtCep.Text         := prCliente.Cep;
  edtTelefone.Text    := prCliente.Telefone;
  edtFax.Text         := prCliente.Fax;
  edtEmail.Text       := prCliente.Email;
end;

function TfrmCadCliente.LoadClinteFromControls: TCliente;
var
  Cliente : TCliente;
begin
  Cliente := TCliente.Create;
  if edtId.Text <> NO_STRING
   then Cliente.Id := StrToInt(edtId.Text)
   else Cliente.Id := 0;

  Cliente.Nome         := edtNome.Text;
  Cliente.TpPessoa     := edtTpPessoa.Text;
  Cliente.CpfCnpj      := edtCpfCpnj.Text;
  Cliente.Endereco     := edtEndereco.Text;
  Cliente.Numero       := edtNumero.Text;
  Cliente.Complemento  := edtComplemento.Text;
  Cliente.Bairro       := edtBairro.Text;
  Cliente.Municipio    := edtMunicipio.Text;
  Cliente.Uf           := edtUf.Text;
  Cliente.Cep          := edtCep.Text;
  Cliente.Telefone     := edtTelefone.Text;
  Cliente.Fax          := edtFax.Text;
  Cliente.Email        := edtEmail.Text;

  Result := Cliente;
end;

procedure TfrmCadCliente.btnConfirmarClick(Sender: TObject);
var
  Cliente : TCliente;
  dao : TCliente_DAO;
  vErroMsg : string;
begin
  inherited;
  if (edtNome.Text <> NO_STRING) and
     (edtTpPessoa.Text <> NO_STRING) and
     (edtCpfCpnj.Text <> NO_STRING)
   then begin
     Cliente := LoadClinteFromControls;
     if Assigned(Cliente)
      then begin
        dao := TCliente_DAO.Create;
        try
          vErroMsg := NO_STRING;
          if dao.Gravar(Cliente,vErroMsg)
           then ShowMessage(vErroMsg)
           else ShowMessage(vErroMsg);
        finally
          FreeAndNil(dao);
        end;
      end;
   end;
end;

end.

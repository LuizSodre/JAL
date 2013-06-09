unit UnitCadContratante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitCadCliente, DB, StdCtrls, Buttons, ComCtrls, ExtCtrls,
  Contratante_DAO, Contratante_MDL, Constantes;

type
  TfrmCadContratante = class(TfrmCadCliente)
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LoadContratanteToControls(prContratante : TContratante);
    function LoadContratanteFromControls : TContratante;
  end;

var
  frmCadContratante: TfrmCadContratante;

implementation

{$R *.dfm}

procedure TfrmCadContratante.btnConfirmarClick(Sender: TObject);
var
  Contratante : TContratante;
  dao : TContratante_DAO;
  vErroMsg : string;
begin
  if (edtNome.Text <> NO_STRING) and
     (edtTpPessoa.Text <> NO_STRING) and
     (edtCpfCpnj.Text <> NO_STRING)
   then begin
     Contratante := LoadContratanteFromControls;
     if Assigned(Contratante)
      then begin
        dao := TContratante_DAO.Create;
        try
          vErroMsg := NO_STRING;
          if dao.Gravar(Contratante,vErroMsg)
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

function TfrmCadContratante.LoadContratanteFromControls: TContratante;
var
  Contratante : TContratante;
begin
  Contratante := TContratante.Create;
  if edtId.Text <> NO_STRING
   then Contratante.Id := StrToInt(edtId.Text)
   else Contratante.Id := 0;

  Contratante.Nome         := edtNome.Text;
  Contratante.TpPessoa     := edtTpPessoa.Text;
  Contratante.CpfCnpj      := edtCpfCpnj.Text;
  Contratante.Endereco     := edtEndereco.Text;
  Contratante.Numero       := edtNumero.Text;
  Contratante.Complemento  := edtComplemento.Text;
  Contratante.Bairro       := edtBairro.Text;
  Contratante.Municipio    := edtMunicipio.Text;
  Contratante.Uf           := edtUf.Text;
  Contratante.Cep          := edtCep.Text;
  Contratante.Telefone     := edtTelefone.Text;
  Contratante.Fax          := edtFax.Text;
  Contratante.Email        := edtEmail.Text;

  Result := Contratante;
end;


procedure TfrmCadContratante.LoadContratanteToControls(
  prContratante: TContratante);
begin
  edtId.Text          := IntToStr(prContratante.Id);
  edtNome.Text        := prContratante.Nome;
  edtTpPessoa.Text    := prContratante.TpPessoa;
  edtCpfCpnj.Text     := prContratante.CpfCnpj;
  edtEndereco.Text    := prContratante.Endereco;
  edtNumero.Text      := prContratante.Numero;
  edtComplemento.Text := prContratante.Complemento;
  edtBairro.Text      := prContratante.Bairro;
  edtMunicipio.Text   := prContratante.Municipio;
  edtUf.Text          := prContratante.Uf;
  edtCep.Text         := prContratante.Cep;
  edtTelefone.Text    := prContratante.Telefone;
  edtFax.Text         := prContratante.Fax;
  edtEmail.Text       := prContratante.Email;
end;

end.

unit UnitAcesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ComCtrls, Mask, StdCtrls, Buttons, ExtCtrls,dmdata,unitMain,
  jpeg, Constantes;

type
  TfrmSenha = class(TForm)
    pnlGenerico: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtusuario: TEdit;
    edtCop: TEdit;
    edtLar: TEdit;
    edtsenha: TMaskEdit;
    dsGenerico: TDataSource;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    imgSplash: TImage;
    Image2: TImage;
    procedure btnCancelarClick(Sender: TObject);
    procedure edtusuarioExit(Sender: TObject);
    procedure edtsenhaChange(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    nrTentativas : SmallInt;
    function isLoginValido : Boolean;
  public
    { Public declarations }
  end;

var
  frmSenha: TfrmSenha;

implementation

{$R *.dfm}

procedure TfrmSenha.btnCancelarClick(Sender: TObject);
begin
  edtusuario.Clear;
  edtusuario.Enabled := true;
  edtusuario.SetFocus;
  edtsenha.Clear;
  btnConfirmar.Default := true;
end;

procedure TfrmSenha.edtusuarioExit(Sender: TObject);
begin
 { with Data.qryUsuario do
    begin
      if locate('usuario', edtusuario.Text, []) = true then
        begin
          edtCop.text := Fieldbyname('senha').asstring;
          edtusuario.Enabled := false;
          edtsenha.SetFocus;
          //exit;
        end
      else
        begin
          MessageDlg((edtusuario.Text) + #13 + 'Erro ao digitar o seu nome, por favor digite-o novamente',
            MtError, [MbOk], 0);
          edtusuario.clear;
          edtusuario.setfocus;
        end;
    end;      }
end;


procedure TfrmSenha.edtsenhaChange(Sender: TObject);
begin
  btnCancelar.Visible := edtsenha.Text <> '';
  btnConfirmar.Enabled := edtsenha.Text <> '';
end;

procedure TfrmSenha.btnConfirmarClick(Sender: TObject);
begin
  if edtusuario.Text = no_string
  then begin
    MessageDlg('O campo Usuário deve ser preenchido.', mtInformation, [mbOK], 0);
    if edtusuario.CanFocus
     then edtusuario.SetFocus;
    Exit;
  end;

  if edtsenha.Text = no_string
   then begin
     MessageDlg('O campo Senha de Acesso deve ser preenchido.', mtInformation, [mbOK], 0);
     if edtsenha.CanFocus
      then edtsenha.SetFocus;
     Exit;
   end;

  if isLoginValido
   then ModalResult := mrOk
   else begin
     inc(nrTentativas);
     if nrTentativas < 3
      then begin
        MessageDlg(Format('Tentativa %d de 3', [nrTentativas]), mtError, [mbOk], 0);
        edtSenha.SetFocus;
      end
      else begin
        MessageDlg(Format('%dª tentativa de acesso ao sistema.',[nrTentativas]) + #13 + 'A aplicação será fechada!', mtError,[mbOk], 0);
        ModalResult := mrCancel;
      end;
   end;


  {with Data.qryUsuario do
  begin
    Data.qryUsuario.Close;
    Data.qryUsuario.Parameters.ParamByName('iusuario').Value := edtusuario.Text;
    Data.qryUsuario.Open;

    // verifica se encontrou o Login.
    if Data.qryUsuario.IsEmpty then
    begin
      ShowMessage('Login não cadastrado! Contate o Administrador do Sistema...');
      edtusuario.SetFocus;
      Exit;
    end;
    // verifica se a senha está correta.

    if UpperCase( trim(edtsenha.Text)) <> UpperCase( Trim(Data.qryUsuario.FieldByName('SENHA').AsString)) then
 //     if edSenha.Text <> Trim(Cript(sdsUsuarios.FieldByName('USU_SENHA').AsString, 'DESCRIPT')) then
    begin
      ShowMessage('Senha Incorreta, tente novamente!');
      edtsenha.SetFocus;
      Exit;
    end;

 frmMain.ShowModal;
 frmSenha.close;
 frmSenha.Free;
 //close;    }

end;



function TfrmSenha.isLoginValido: Boolean;
var
  vUsuario, vSenha : string;
begin
  vUsuario := edtusuario.Text;
  vSenha := edtsenha.Text;
  Result := False;
  UsuarioLogado := NO_STRING;
  if (vUsuario = USUARIOADM) and (vSenha = PASSADM)
   then Result := True
   else begin
     Result := False;
   end;

  if Result
   then UsuarioLogado := vUsuario; 
  //ShowMessage(IntToStr(Length(md5(edtsenha.Text))));
end;

procedure TfrmSenha.FormCreate(Sender: TObject);
begin
  nrTentativas := 0;
end;

end.

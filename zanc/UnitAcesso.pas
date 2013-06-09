unit UnitAcesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ComCtrls, Mask, StdCtrls, Buttons, ExtCtrls,dmdata,unitMain;

type
  TfrmSenha = class(TForm)
    pnlGenerico: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    btnCancelar: TBitBtn;
    btnConfirmar: TBitBtn;
    edtusuario: TEdit;
    edtCop: TEdit;
    edtLar: TEdit;
    edtsenha: TMaskEdit;
    StatusBar1: TStatusBar;
    dsGenerico: TDataSource;
    procedure btnCancelarClick(Sender: TObject);
    procedure edtusuarioExit(Sender: TObject);
    procedure edtsenhaChange(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
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



end.

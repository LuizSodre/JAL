unit UnitParSistema;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IniFiles, Constantes;

type
  TfrmParametroSistema = class(TForm)
    lblTitulo: TLabel;
    lblTituloMascara: TLabel;
    lblCatalogo: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtHostName: TEdit;
    edtDataBaseName: TEdit;
    edtUsuario: TEdit;
    edtPassword: TEdit;
    edtPorta: TEdit;
    edtCatalogo: TEdit;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParametroSistema: TfrmParametroSistema;

implementation

{$R *.dfm}

procedure TfrmParametroSistema.btnOkClick(Sender: TObject);
var
  vIniFile : TIniFile;
  vNomeArquivo : string;
begin
  //application.Name
  vNomeArquivo := NO_STRING;
  vNomeArquivo := ExtractFilePath(Application.ExeName) + Application.Title;
  vIniFile := TIniFile.Create(vNomeArquivo + '.INI');
  vIniFile.WriteString('BASE',HOSTNAME, edtHostName.Text);
  vIniFile.WriteString('BASE',DATABASE, edtDataBaseName.Text);
  vIniFile.WriteString('BASE',USER, edtUsuario.Text);
  vIniFile.WriteString('BASE',PASSWORD, edtPassword.Text);
  vIniFile.WriteString('BASE',PORT, edtPorta.Text);
  vIniFile.WriteString('BASE',CATALOG, edtCatalogo.Text);
  ShowMessage('Parâmetros gravados com sucesso.');
  vIniFile.Free;
  Close;
end;

procedure TfrmParametroSistema.FormCreate(Sender: TObject);
var
  vIniFile : TIniFile;
  vNomeArquivo : string;
begin
  //application.Name
  vNomeArquivo          := NO_STRING;
  vNomeArquivo          := ExtractFilePath(Application.ExeName) + Application.Title;
  vIniFile              := TIniFile.Create(vNomeArquivo + '.INI');
  edtHostName.Text      := vIniFile.ReadString('BASE',HOSTNAME,'localhost');
  edtDataBaseName.Text  := vIniFile.ReadString('BASE',DATABASE,'dbzanc');
  edtUsuario.Text       := vIniFile.ReadString('BASE',USER,'zanc');
  edtPassword.Text      := vIniFile.ReadString('BASE',PASSWORD, '123456');
  edtPorta.Text         := vIniFile.ReadString('BASE',PORT, '3307');
  edtCatalogo.Text      := vIniFile.ReadString('BASE',CATALOG, 'dbzanc');
  vIniFile.Free;
end;


procedure TfrmParametroSistema.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmParametroSistema.btn1Click(Sender: TObject);
begin
  ShowMessage(ExtractFilePath(Application.ExeName));
  ShowMessage(Application.Title);
end;

end.

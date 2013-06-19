unit dmdata;

interface

uses
  SysUtils, Classes, DB, ADODB, ZConnection, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, IniFiles, Constantes, Forms;

type
  Tdata = class(TDataModule)
    conDBZanc: TZConnection;
    zqryZanc: TZQuery;
    lrgntfldZancId: TLargeintField;
    strngfldZancNome: TStringField;
    strngfldZancTpPessoa: TStringField;
    strngfldZancCpfCnpj: TStringField;
    strngfldZancEndereco: TStringField;
    strngfldZancNumero: TStringField;
    strngfldZancComplemento: TStringField;
    strngfldZancBairro: TStringField;
    strngfldZancMunicipio: TStringField;
    strngfldZancUF: TStringField;
    strngfldZancTelefone: TStringField;
    strngfldZancFax: TStringField;
    strngfldZancEmail: TStringField;
    strngfldZancCep: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  data: Tdata;

implementation

{$R *.dfm}

procedure Tdata.DataModuleCreate(Sender: TObject);
var
  vIniFile : TIniFile;
  vNomeArquivo : string;
begin
  //application.Name
  vNomeArquivo := NO_STRING;
  vNomeArquivo        := ExtractFilePath(Application.ExeName) + Application.Title;
  vIniFile            := TIniFile.Create(vNomeArquivo + '.INI');
  conDBZanc.HostName  := vIniFile.ReadString('BASE',HOSTNAME,'localhost');
  conDBZanc.Database  := vIniFile.ReadString('BASE',DATABASE,'dbzanc');
  conDBZanc.User      := vIniFile.ReadString('BASE',USER,'zanc');
  conDBZanc.Password  := vIniFile.ReadString('BASE',PASSWORD, '123456');
  conDBZanc.Port      := StrToInt(vIniFile.ReadString('BASE',PORT, '3307'));
  conDBZanc.Catalog   := vIniFile.ReadString('BASE',CATALOG, 'dbzanc');
  vIniFile.Free;
end;

end.

unit UntConsGenerico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, Grids, Cliente_MDL, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, FR_DSet, FR_DBSet,
  FR_Class, Constantes;

type
  TfrmConsGenerico = class(TForm)
    pnlGenerico: TPanel;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    btnExcluir: TBitBtn;
    btnEditar: TBitBtn;
    pnlPesquisa: TPanel;
    grdConsulta: TStringGrid;
    lblTitulo: TLabel;
    lblTituloMascara: TLabel;
    cmbCampo: TComboBox;
    Label1: TLabel;
    edtCampoPesquisa: TEdit;
    btnPesquisar: TBitBtn;
    btnFechar: TBitBtn;
    frRelatorio: TfrReport;
    frdbRelatorio: TfrDBDataSet;
    zQryConsulta: TZQuery;
    btnImprimir: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure LoadComboCampos; virtual;
    procedure LoadGridCampos(prLista : TList); virtual;
    procedure SetupGridCampos; virtual;
    procedure PesquisarRegistro; virtual;
    procedure EditarRegistro; virtual;
    procedure ExcluirRegistro; virtual;
    procedure InicializaRelatorio; virtual;
    procedure OpenConsultaRelatrorio; virtual;
    procedure FinalizaRelatorio;
    procedure ProcessaRelatorio(prNomeRelatorio : String = '');
    procedure Imprimir(prNomeRelatorio : String = '');
  public
    { Public declarations }
  end;

var
  frmConsGenerico: TfrmConsGenerico;

implementation

uses dmdata, UnitPreviewRel;

{$R *.dfm}

procedure TfrmConsGenerico.EditarRegistro;
begin

end;

procedure TfrmConsGenerico.ExcluirRegistro;
begin

end;

procedure TfrmConsGenerico.PesquisarRegistro;
begin

end;

procedure TfrmConsGenerico.LoadComboCampos;
begin

end;

procedure TfrmConsGenerico.FormCreate(Sender: TObject);
begin
  LoadComboCampos;
  SetupGridCampos;
end;

procedure TfrmConsGenerico.btnPesquisarClick(Sender: TObject);
begin
  PesquisarRegistro;
end;

procedure TfrmConsGenerico.btnEditarClick(Sender: TObject);
begin
  EditarRegistro;
end;

procedure TfrmConsGenerico.btnExcluirClick(Sender: TObject);
begin
  ExcluirRegistro;
end;

procedure TfrmConsGenerico.LoadGridCampos(prLista: TList);
begin

end;

procedure TfrmConsGenerico.SetupGridCampos;
begin

end;

procedure TfrmConsGenerico.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConsGenerico.FinalizaRelatorio;
begin
  zQryConsulta.Close;
  if data.conDBZanc.Connected
   then data.conDBZanc.Disconnect;
end;

procedure TfrmConsGenerico.InicializaRelatorio;
begin
  if not data.conDBZanc.Connected
   then data.conDBZanc.Connect;
end;

procedure TfrmConsGenerico.OpenConsultaRelatrorio;
begin
  zQryConsulta.SQL.Clear;
  if edtCampoPesquisa.Text = NO_STRING
   then begin
     zQryConsulta.SQL.Add('SELECT  ID, NOME, IF(TPPESSOA = ''F'', ''FISICA'', IF (TPPESSOA = ''J'', ''JURIDICA'', '''')) AS TPPESSOA, CPFCNPJ  FROM TCLIENTE');
   end
   else begin
     if cmbCampo.ItemIndex = 0
      then  zQryConsulta.SQL.Add('SELECT ID, NOME, IF(TPPESSOA = ''F'', ''FISICA'', IF (TPPESSOA = ''J'', ''JURIDICA'', '''')) AS TPPESSOA, CPFCNPJ FROM TCLIENTE WHERE ' + cmbCampo.Text + ' = ' + edtCampoPesquisa.Text)
      else zQryConsulta.SQL.Add('SELECT ID, NOME, IF(TPPESSOA = ''F'', ''FISICA'', IF (TPPESSOA = ''J'', ''JURIDICA'', '''')) AS TPPESSOA, CPFCNPJ FROM TCLIENTE WHERE ' + cmbCampo.Text + ' = ' + QuotedStr(edtCampoPesquisa.Text));
   end;

  zQryConsulta.Open;
end;

procedure TfrmConsGenerico.ProcessaRelatorio(prNomeRelatorio : String);
begin
  if prNomeRelatorio <> ''
   then begin
     frmPreviewRel := TfrmPreviewRel.Create(nil);
     try
       InicializaRelatorio;

       OpenConsultaRelatrorio;

       frRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName) + prNomeRelatorio +'.frf');
       frRelatorio.Preview := frmPreviewRel.frPreview1;
       frRelatorio.ShowReport;
       frmPreviewRel.ShowModal;
     finally
       FinalizaRelatorio;
       FreeAndNil(frmPreviewRel);
     end;
   end;

end;

procedure TfrmConsGenerico.btnImprimirClick(Sender: TObject);
begin
  Imprimir;
end;

procedure TfrmConsGenerico.Imprimir(prNomeRelatorio: String);
begin
  ProcessaRelatorio(prNomeRelatorio);
end;

end.

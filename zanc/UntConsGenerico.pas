unit UntConsGenerico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, Grids, Cliente_MDL;

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
    BitBtn1: TBitBtn;
    btnCancelar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure LoadComboCampos; virtual;
    procedure LoadGridCampos(prLista : TList); virtual;
    procedure SetupGridCampos; virtual;
    procedure PesquisarRegistro; virtual;
    procedure EditarRegistro; virtual;
    procedure ExcluirRegistro; virtual;
  public
    { Public declarations }
  end;

var
  frmConsGenerico: TfrmConsGenerico;

implementation

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

procedure TfrmConsGenerico.BitBtn1Click(Sender: TObject);
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

procedure TfrmConsGenerico.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

end.

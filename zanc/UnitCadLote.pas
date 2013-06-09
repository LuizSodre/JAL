unit UnitCadLote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unitCadGenerico, StdCtrls, DB, Buttons, ComCtrls, ExtCtrls, Lote_MDL,
  Lote_DAO, Constantes;

type
  TfrmCadLote = class(TfrmCadGenerico)
    edtOrdemServico: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtNomeArquivo: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cmbContratantes: TComboBox;
    Label6: TLabel;
    dtpDtEntrada: TDateTimePicker;
    dtpDtEnvioHigiene: TDateTimePicker;
    dtpRetornoHigiene: TDateTimePicker;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    dtpDtEnvioImpressao: TDateTimePicker;
    dtpDtEnvioPostagem: TDateTimePicker;
    dtpDtPostagem: TDateTimePicker;
    Label10: TLabel;
    cmbClientes: TComboBox;
    edtId: TEdit;
    Label11: TLabel;
    edtAno: TEdit;
    procedure cmbContratantesDropDown(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure cmbClientesDropDown(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LoadLoteToControls(prLote : TLote);
    function LoadLoteFromControls : TLote;
  end;

var
  frmCadLote: TfrmCadLote;

implementation

{$R *.dfm}

{ TfrmCadLote }

procedure TfrmCadLote.LoadLoteToControls(prLote: TLote);
begin
  edtId.Text := IntToStr(prLote.Id);
  edtOrdemServico.Text  := prLote.OrdemServico;
  edtNomeArquivo.Text   := prLote.NomeArquivo;
  edtAno.Text           := IntToStr(prLote.Ano);
  cmbContratantes.Text  := ''; {localizar pela id}
  cmbClientes.Text      := ''; {localizar pela id}
  dtpDtEntrada.DateTime := prLote.DtEntrada;
  dtpDtEnvioHigiene.DateTime   := prLote.DtEnvioHigiene;
  dtpRetornoHigiene.DateTime   := prLote.DtRetornoHigiene;
  dtpDtEnvioImpressao.DateTime := prLote.DtEnvioImpressao;
  dtpDtEnvioPostagem.DateTime  := prLote.DtEnvioPostagem;
  dtpDtPostagem.DateTime       := prLote.DtPostagem;
end;

function TfrmCadLote.LoadLoteFromControls: TLote;
var
  Lote : TLote;
begin
  Lote := TLote.Create;
  if edtId.Text <> NO_STRING
   then Lote.Id := StrToInt(edtId.Text)
   else Lote.Id := 0;

  Lote.OrdemServico     := edtOrdemServico.Text;
  Lote.NomeArquivo      := edtNomeArquivo.Text;
  Lote.IdContratante    := 0{Carregar o ID};
  Lote.IdCliente        := 0{Carregar o ID};
  Lote.DtEntrada        := dtpDtEntrada.DateTime;
  Lote.DtEnvioHigiene   := dtpDtEnvioHigiene.DateTime;
  Lote.DtRetornoHigiene := dtpRetornoHigiene.DateTime;
  Lote.DtEnvioImpressao := dtpDtEnvioImpressao.DateTime;
  Lote.DtEnvioPostagem  := dtpDtEnvioPostagem.DateTime;
  Lote.DtPostagem       := dtpDtPostagem.DateTime;
  Lote.Ano              := StrToIntDef(edtAno.Text, 0);

  Result := Lote;
end;

procedure TfrmCadLote.cmbContratantesDropDown(Sender: TObject);
begin
  inherited;
  cmbContratantes.Items.Clear;
  {Carregar a Combo}
end;

procedure TfrmCadLote.cmbClientesDropDown(Sender: TObject);
begin
  inherited;
  cmbClientes.Items.Clear;
  {Carregar a Combo}
end;

procedure TfrmCadLote.btnConfirmarClick(Sender: TObject);
var
  Lote : TLote;
  dao : TLote_DAO;
  vErroMsg : string;

begin
  inherited;
  if (edtOrdemServico.Text <> NO_STRING) and
     (edtNomeArquivo.Text <> NO_STRING) and
     (edtAno.Text <> NO_STRING)
   then begin
     Lote := LoadLoteFromControls;
     if Assigned(Lote)
      then begin
        dao := TLote_DAO.Create;
        try
          vErroMsg := NO_STRING;
          if dao.Gravar(Lote, vErroMsg)
           then ShowMessage(vErroMsg)
           else ShowMessage(vErroMsg);
        finally
          FreeAndNil(dao);
        end;
      end;
   end;
end;

end.

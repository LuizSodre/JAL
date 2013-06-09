unit UnitCadLote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unitCadGenerico, StdCtrls, DB, Buttons, ComCtrls, ExtCtrls, Lote_MDL,
  Lote_DAO,Cliente_DAO, Cliente_MDL,Base_MDL, Contratante_DAO, Contratante_MDL,
  Constantes, Mask, ToolEdit;

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
    edt1: TDateEdit;
    Button1: TButton;
    MaskEdit1: TMaskEdit;
    Button2: TButton;
    procedure cmbContratantesDropDown(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure cmbClientesDropDown(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure LoadCombos;
    function GetIdByCombo(const prCombo : TComboBox) : Integer;
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
  //cmbContratantes.Items.Clear;
  {Carregar a Combo}
end;

procedure TfrmCadLote.cmbClientesDropDown(Sender: TObject);
begin
  inherited;
  //cmbClientes.Items.Clear;
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

procedure TfrmCadLote.Button1Click(Sender: TObject);
var
  data : TDateTime;
  listacli : TList;
  daocli : TCliente_DAO;
  i : Integer;
begin
  inherited;
  {data := edt1.Date;
  data := data + StrToTime(MaskEdit1.Text);
  ShowMessage(FormatDateTime('ddmmyy hhmm',data));}
  daocli := TCliente_DAO.Create;
  listacli := daocli.getAll;
  cmbClientes.Clear;
  for i := 0 to pred(listacli.Count) do
  begin
    cmbClientes.AddItem(TCliente(listacli[i]).Nome,TCliente(listacli[i]));
{    cmbClientes.Items.Add(TCliente(listacli[i]).Nome);
    cmbClientes.Items.AddObject(TCliente(listacli[i]).Nome, TCliente(listacli[i]));}
  end;
end;

procedure TfrmCadLote.Button2Click(Sender: TObject);
begin
  inherited;
  ShowMessage(IntToStr(GetIdByCombo(cmbClientes)));
end;

function TfrmCadLote.GetIdByCombo(const prCombo : TComboBox): Integer;
begin
  Result := TBase(prCombo.Items.Objects[prCombo.ItemIndex]).Id;
end;

procedure TfrmCadLote.LoadCombos;
var
  ClienteList : TList;
  Cliente_DAO : TCliente_DAO;

  ContratanteList : TList;
  Contratante_DAO : TContratante_DAO;

  Interador : Integer;
begin
  inherited;
  //Carregando Combo de Clientes

  Cliente_DAO := TCliente_DAO.Create;
  try
  ClienteList := Cliente_DAO.getAll;
  cmbClientes.Clear;
  for Interador := 0 to pred(ClienteList.Count) do
  begin
    cmbClientes.AddItem(TCliente(ClienteList[Interador]).Nome,TCliente(ClienteList[Interador]));
  end;
  finally
    FreeAndNil(Cliente_DAO);
  end;

  //Carregando a combo de Contratante
  Contratante_DAO := TContratante_DAO.Create;
  try
  ContratanteList := Contratante_DAO.getAll;
  cmbContratantes.Clear;
  for Interador := 0 to pred(ContratanteList.Count) do
  begin
    cmbContratantes.AddItem(TContratante(ContratanteList[Interador]).Nome,TContratante(ContratanteList[Interador]));
  end;
  finally
    FreeAndNil(Contratante_DAO);
  end;

end;

procedure TfrmCadLote.FormCreate(Sender: TObject);
begin
  inherited;
  LoadCombos;
end;

end.

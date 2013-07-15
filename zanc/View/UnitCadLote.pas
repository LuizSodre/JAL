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
    cmbContratantes: TComboBox;
    Label6: TLabel;
    Label10: TLabel;
    cmbClientes: TComboBox;
    edtId: TEdit;
    Label11: TLabel;
    edtAno: TEdit;
    lblTitulo: TLabel;
    lblTituloMascara: TLabel;
    GroupBox1: TGroupBox;
    edtHoraEntrada: TMaskEdit;
    GroupBox2: TGroupBox;
    edtHoraEnvioHigi: TMaskEdit;
    GroupBox3: TGroupBox;
    medtHoraRetornoHigi: TMaskEdit;
    GroupBox4: TGroupBox;
    medtHoraEnvioImpress: TMaskEdit;
    GroupBox5: TGroupBox;
    medtHoraEnvioPostagem: TMaskEdit;
    GroupBox6: TGroupBox;
    medtHoraPostagem: TMaskEdit;
    edtDtEntrada: TMaskEdit;
    edtEnvioHigi: TMaskEdit;
    edtRetornoHigi: TMaskEdit;
    medtEnvioImpress: TMaskEdit;
    edtEnvioPostagem: TMaskEdit;
    edtDtPostagem: TMaskEdit;
    procedure cmbContratantesDropDown(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure cmbClientesDropDown(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmbContratantesEnter(Sender: TObject);
  private
    { Private declarations }
    procedure LoadCombos;
    procedure LoadComboCliente;
    procedure LoadComboContratante;
    function GetClienteByCombo(const prCombo : TComboBox) : TCliente;
    function GetContratanteByCombo(const prCombo : TComboBox) : TContratante;
    function GetIndexByCombo(const prCombo : TComboBox; prId : Integer) : Integer;
    //procedure LimpaCampos;
    function ConcatenaDataHora(prData, prHora : String) : TDateTime;
    procedure SeparaDataHora(var prEditData, prEditHora : TMaskEdit; prDataHora : TDateTime);
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
  LimpaCampos;
  edtId.Text := IntToStr(prLote.Id);
  edtOrdemServico.Text      := prLote.OrdemServico;
  edtNomeArquivo.Text       := prLote.NomeArquivo;
  edtAno.Text               := IntToStr(prLote.Ano);
  cmbContratantes.ItemIndex := GetIndexByCombo(cmbContratantes, prLote.Contratante.Id);
  cmbClientes.ItemIndex     := GetIndexByCombo(cmbClientes, prLote.Cliente.Id);

  if prLote.DtEntrada > 0
   then SeparaDataHora(edtDtEntrada, edtHoraEntrada, prLote.DtEntrada);
  if prLote.DtEnvioHigiene > 0
   then SeparaDataHora(edtEnvioHigi, edtHoraEnvioHigi, prLote.DtEnvioHigiene);
  if prLote.DtRetornoHigiene > 0
   then SeparaDataHora(edtRetornoHigi, medtHoraRetornoHigi, prLote.DtRetornoHigiene);
  if prLote.DtEnvioImpressao >  0
   then SeparaDataHora(medtEnvioImpress, medtHoraEnvioImpress, prLote.DtEnvioImpressao);
  if prLote.DtEnvioPostagem > 0
   then SeparaDataHora(edtEnvioPostagem, medtHoraEnvioPostagem, prLote.DtEnvioPostagem);
  if prLote.DtPostagem > 0
   then SeparaDataHora(edtDtPostagem, medtHoraPostagem, prLote.DtPostagem);
   
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
  Lote.Contratante      := GetContratanteByCombo(cmbContratantes);
  Lote.Cliente          := GetClienteByCombo(cmbClientes);

  Lote.DtEntrada        := ConcatenaDataHora(edtDtEntrada.Text    ,edtHoraEntrada.Text);
  Lote.DtEnvioHigiene   := ConcatenaDataHora(edtEnvioHigi.Text    ,edtHoraEnvioHigi.Text);
  Lote.DtRetornoHigiene := ConcatenaDataHora(edtRetornoHigi.Text  ,medtHoraRetornoHigi.Text);
  Lote.DtEnvioImpressao := ConcatenaDataHora(medtEnvioImpress.Text,medtHoraEnvioImpress.Text);
  Lote.DtEnvioPostagem  := ConcatenaDataHora(edtEnvioPostagem.Text,medtHoraEnvioPostagem.Text);
  Lote.DtPostagem       := ConcatenaDataHora(edtDtPostagem.Text   ,medtHoraPostagem.Text);
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
             LimpaCampos;
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
  daocli : TCliente_DAO;
  i : Integer;
begin
  inherited;
  data := StrToDate(edtDtEntrada.Text);
  data := data + StrToTime(edtHoraEntrada.Text);
  ShowMessage(FormatDateTime('dd;mm;yy hhmm',data));
{  daocli := TCliente_DAO.Create;
  listacli := daocli.getAll;
  cmbClientes.Clear;
  for i := 0 to pred(listacli.Count) do
  begin
    cmbClientes.AddItem(TCliente(listacli[i]).Nome,TCliente(listacli[i]));
{    cmbClientes.Items.Add(TCliente(listacli[i]).Nome);
    cmbClientes.Items.AddObject(TCliente(listacli[i]).Nome, TCliente(listacli[i]));
  end;}
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
  LimpaCampos;
  LoadCombos;
end;

procedure TfrmCadLote.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

{procedure TfrmCadLote.LimpaCampos;
begin
  cmbClientes.ItemIndex := -1;
  cmbContratantes.ItemIndex := -1;
  edtOrdemServico.Text := NO_STRING;
  edtId.Text := NO_STRING;
  edtAno.Text := NO_STRING;
  edtNomeArquivo.Text := NO_STRING;
  edtDtEntrada.Text := NO_STRING;
  edtHoraEntrada.Text := NO_STRING;
  edtEnvioHigi.Text := NO_STRING;
  edtHoraEnvioHigi.Text := NO_STRING;
  edtRetornoHigi.Text := NO_STRING;
  medtHoraRetornoHigi.Text := NO_STRING;
  medtEnvioImpress.Text := NO_STRING;
  medtHoraEnvioImpress.Text := NO_STRING;
  edtEnvioPostagem.Text := NO_STRING;
  medtHoraEnvioPostagem.Text := NO_STRING;
  edtDtPostagem.Text := NO_STRING;
  medtHoraPostagem.Text := NO_STRING;
end;}

function TfrmCadLote.ConcatenaDataHora(prData, prHora: String): TDateTime;
var
  data : TDateTime;
begin
  Result := 0;
  if (prData <> NO_DATESTRING) and (prHora <> NO_DATESTRING)
   then begin
     data := StrToDate(prData);
     data := data + StrToTime(prHora);
     Result := data;
   end;

end;

procedure TfrmCadLote.SeparaDataHora(var prEditData, prEditHora: TMaskEdit;
  prDataHora: TDateTime);
begin
  if Assigned(prEditData)
   then TMaskEdit(prEditData).Text := FormatDateTime('dd/mm/yyyy', prDataHora);

  if Assigned(prEditHora)
   then TMaskEdit(prEditHora).Text := FormatDateTime('hh:mm', prDataHora);
end;

function TfrmCadLote.GetIndexByCombo(const prCombo: TComboBox; prId : Integer): Integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to pred(prCombo.Items.Count) do
  begin
    if TBase(prCombo.Items.Objects[i]).Id = prId
     then Result := i;
  end;
end;

procedure TfrmCadLote.FormShow(Sender: TObject);
begin
  inherited;
  edtOrdemServico.SetFocus;
end;

procedure TfrmCadLote.LoadComboCliente;
var
  ClienteList : TList;
  Cliente_DAO : TCliente_DAO;
  Interador : Integer;
begin
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
end;

procedure TfrmCadLote.LoadComboContratante;
var
  ContratanteList : TList;
  Contratante_DAO : TContratante_DAO;
  Interador : Integer;
begin
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

procedure TfrmCadLote.cmbContratantesEnter(Sender: TObject);
begin
  inherited;
  if cmbContratantes.ItemIndex = -1
   then LoadComboContratante;
end;

function TfrmCadLote.GetClienteByCombo(const prCombo: TComboBox): TCliente;
begin
  Result := TCliente(prCombo.Items.Objects[prCombo.ItemIndex]);
end;

function TfrmCadLote.GetContratanteByCombo(
  const prCombo: TComboBox): TContratante;
begin
  Result := TContratante(prCombo.Items.Objects[prCombo.ItemIndex]);
end;

end.

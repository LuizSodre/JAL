unit untConsCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UntConsGenerico, StdCtrls, ComCtrls, Grids, Buttons, ExtCtrls,
  Cliente_MDL, Cliente_DAO, Constantes, FR_Class, FR_DSet, FR_DBSet, RpCon,
  RpConDS, RpConBDE, RpDefine, RpRave, DB, ZAbstractRODataset, ZDataset,
  FR_OLE, ZAbstractDataset;

const
  //Campos do Grid
  Id            = 0;
  Nome          = 1;
  TpPessoa      = 2;
  CpfCnpj       = 3;
  Endereco      = 4;
  Numero        = 5;
  Complemento   = 6;
  Bairro        = 7;
  Municipio     = 8;
  Uf            = 9;
  Cep           = 10;
  Telefone      = 11;
  Fax           = 12;
  Email         = 13;


type
  TfrmConsCliente = class(TfrmConsGenerico)
    procedure btnCancelarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure LoadComboCampos; override;
    procedure LoadGridCampos(prLista : Tlist); override;
    procedure SetupGridCampos; override;
    procedure PesquisarRegistro; override;
    procedure EditarRegistro; override;
    procedure ExcluirRegistro; override;
    procedure OpenConsultaRelatrorio; override;
  public
    { Public declarations }
  end;

var
  frmConsCliente: TfrmConsCliente;

implementation

uses UnitCadCliente, unitMain, dmdata, UnitPreviewRel;

{$R *.dfm}

{ TfrmConsCliente }

procedure TfrmConsCliente.PesquisarRegistro;
var
  Cliente_DAO : TCliente_DAO;
begin
  Cliente_DAO := TCliente_DAO.Create;
  try
    grdConsulta.RowCount := 2;
    grdConsulta.Rows[1].Clear;
    if edtCampoPesquisa.Text = NO_STRING
     then LoadGridCampos(Cliente_DAO.getAll)
     else LoadGridCampos(Cliente_DAO.getByCampo(cmbCampo.Text, edtCampoPesquisa.Text));
  finally
    FreeAndNil(Cliente_DAO);
  end;

end;

procedure TfrmConsCliente.LoadComboCampos;
begin
  cmbCampo.Items.Add('Id');
  cmbCampo.Items.Add('Nome');
  cmbCampo.Items.Add('CpfCnpj');
  cmbCampo.ItemIndex := 0;
end;

procedure TfrmConsCliente.EditarRegistro;
begin
  if not Assigned(frmCadCliente)
   then begin
     frmCadCliente := TfrmCadCliente.Create(Self);
     frmCadCliente.Parent := frmMain.pnlForms;
     frmCadCliente.WindowState := wsNormal;
     frmCadCliente.StatusBar1.Visible := False;
   end;
  frmCadCliente.Left := 10;
  frmCadCliente.Top := 10;
  frmCadCliente.lblTitulo.Caption := 'Cadastro : Cliente';
  frmCadCliente.lblTituloMascara.Caption := frmCadCliente.lblTitulo.Caption;
  frmCadCliente.LoadClienteToControls(TCliente(grdConsulta.Objects[Id,grdConsulta.Row]));
  Self.Hide;
  frmCadCliente.Show;
end;

procedure TfrmConsCliente.ExcluirRegistro;
var
  Cliente_DAO : TCliente_DAO;
  vMsgErro : string;
begin
  if MessageDlg('Deseja realmente excluir o registro ' + IntToStr(TCliente(grdConsulta.Objects[Id,grdConsulta.Row]).Id) ,mtWarning,[mbYes, mbNo],0) = mrYes
   then begin
     Cliente_DAO := TCliente_DAO.Create;
     try
       vMsgErro := NO_STRING;
       if Cliente_DAO.Excluir(TCliente(grdConsulta.Objects[Id,grdConsulta.Row]).Id, vMsgErro)
        then begin
          ShowMessage(vMsgErro);
          PesquisarRegistro;
        end
        else ShowMessage(vMsgErro);
     finally
       FreeAndNil(Cliente_DAO);
     end;
   end;

end;

procedure TfrmConsCliente.LoadGridCampos(prLista : Tlist);
var
  Interador : Integer;
  LinhaGrid : Integer;
begin

  if Assigned(prLista)
  then begin
    grdConsulta.RowCount := 2;
    LinhaGrid := 1;
    for Interador := 0 to pred(prLista.Count) do
    begin
      grdConsulta.Cells[Id,LinhaGrid]           := IntToStr(TCliente(prLista[Interador]).Id);
      grdConsulta.Cells[Nome,LinhaGrid]         := TCliente(prLista[Interador]).Nome;
      grdConsulta.Cells[TpPessoa,LinhaGrid]     := TCliente(prLista[Interador]).TpPessoa;
      grdConsulta.Cells[CpfCnpj,LinhaGrid]      := TCliente(prLista[Interador]).CpfCnpj;
      grdConsulta.Cells[Endereco,LinhaGrid]     := TCliente(prLista[Interador]).Endereco;
      grdConsulta.Cells[Numero,LinhaGrid]       := TCliente(prLista[Interador]).Numero;
      grdConsulta.Cells[Complemento,LinhaGrid]  := TCliente(prLista[Interador]).Complemento;
      grdConsulta.Cells[Bairro,LinhaGrid]       := TCliente(prLista[Interador]).Bairro;
      grdConsulta.Cells[Municipio,LinhaGrid]    := TCliente(prLista[Interador]).Municipio;
      grdConsulta.Cells[Uf,LinhaGrid]           := TCliente(prLista[Interador]).Uf;
      grdConsulta.Cells[Cep,LinhaGrid]          := TCliente(prLista[Interador]).Cep;
      grdConsulta.Cells[Telefone,LinhaGrid]     := TCliente(prLista[Interador]).Telefone;
      grdConsulta.Cells[Fax,LinhaGrid]          := TCliente(prLista[Interador]).Fax;
      grdConsulta.Cells[Email,LinhaGrid]        := TCliente(prLista[Interador]).Email;
      grdConsulta.Objects[Id, LinhaGrid] := TCliente(prLista[Interador]);
      inc(LinhaGrid);
      grdConsulta.RowCount := grdConsulta.RowCount + 1;
    end;
    if prLista.Count > 0
     then grdConsulta.RowCount := grdConsulta.RowCount - 1;
  end;
end;

procedure TfrmConsCliente.SetupGridCampos;
begin
  inherited;
  grdConsulta.ColCount := 14;
  grdConsulta.RowCount := 2;
  grdConsulta.Cols[Id].SetText('Id');
  grdConsulta.ColWidths[Id] := 50;
  grdConsulta.Cols[Nome].SetText('Nome');
  grdConsulta.ColWidths[Nome] := 250;
  grdConsulta.Cols[tpPessoa].SetText('Tipo Pessoa');
  grdConsulta.ColWidths[tpPessoa] := 120;
  grdConsulta.Cols[CpfCnpj].SetText('CPF / CNPJ');
  grdConsulta.ColWidths[CpfCnpj] := 150;
  grdConsulta.Cols[Endereco].SetText('Endereco');
  grdConsulta.ColWidths[Endereco] := 350;
  grdConsulta.Cols[Numero].SetText('Número');
  grdConsulta.ColWidths[Numero] := 100;
  grdConsulta.Cols[Complemento].SetText('Complemento');
  grdConsulta.ColWidths[Complemento] := 350;
  grdConsulta.Cols[Bairro].SetText('Bairro');
  grdConsulta.ColWidths[Bairro] := 250;
  grdConsulta.Cols[Municipio].SetText('Municipio');
  grdConsulta.ColWidths[Municipio] := 250;
  grdConsulta.Cols[Uf].SetText('Uf');
  grdConsulta.ColWidths[Uf] := 50;
  grdConsulta.Cols[Cep].SetText('Cep');
  grdConsulta.ColWidths[Cep] := 100;
  grdConsulta.Cols[Telefone].SetText('Telefone');
  grdConsulta.ColWidths[Telefone] := 150;
  grdConsulta.Cols[Fax].SetText('Fax');
  grdConsulta.ColWidths[Fax] := 150;
  grdConsulta.Cols[Email].SetText('Email');
  grdConsulta.ColWidths[Email] := 450;
end;

procedure TfrmConsCliente.btnCancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmConsCliente.btnImprimirClick(Sender: TObject);
begin
  Imprimir('tcliente');
end;

procedure TfrmConsCliente.OpenConsultaRelatrorio;
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

end.

unit untConsContratante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UntConsGenerico, StdCtrls, ComCtrls, Grids, Buttons, ExtCtrls,
  contratante_MDL, contratante_DAO, Constantes, FR_Class, FR_DSet, FR_DBSet, RpCon,
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
  TfrmConsContratante = class(TfrmConsGenerico)
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
  frmConsContratante: TfrmConsContratante;

implementation

uses UnitCadcontratante, unitMain, dmdata, UnitPreviewRel;

{$R *.dfm}

{ TfrmConscontratante }

procedure TfrmConsContratante.PesquisarRegistro;
var
  contratante_DAO : Tcontratante_DAO;
begin
  contratante_DAO := Tcontratante_DAO.Create;
  try
    grdConsulta.RowCount := 2;
    grdConsulta.Rows[1].Clear;
    if edtCampoPesquisa.Text = NO_STRING
     then LoadGridCampos(contratante_DAO.getAll)
     else LoadGridCampos(contratante_DAO.getByCampo(cmbCampo.Text, edtCampoPesquisa.Text));
  finally
    FreeAndNil(contratante_DAO);
  end;

end;

procedure TfrmConsContratante.LoadComboCampos;
begin
  cmbCampo.Items.Add('Id');
  cmbCampo.Items.Add('Nome');
  cmbCampo.Items.Add('CpfCnpj');
  cmbCampo.ItemIndex := 0;
end;

procedure TfrmConsContratante.EditarRegistro;
begin
  if not Assigned(frmCadcontratante)
   then begin
     frmCadcontratante := TfrmCadcontratante.Create(Self);
     frmCadcontratante.Parent := frmMain.pnlForms;
     frmCadcontratante.WindowState := wsNormal;
     frmCadcontratante.StatusBar1.Visible := False;
   end;
  frmCadcontratante.Left := 10;
  frmCadcontratante.Top := 10;
  frmCadcontratante.lblTitulo.Caption := 'Cadastro : Contratante';
  frmCadcontratante.lblTituloMascara.Caption := frmCadcontratante.lblTitulo.Caption;
  frmCadcontratante.LoadcontratanteToControls(Tcontratante(grdConsulta.Objects[Id,grdConsulta.Row]));
  Self.Hide;
  frmCadcontratante.Show;
end;

procedure TfrmConsContratante.ExcluirRegistro;
var
  contratante_DAO : Tcontratante_DAO;
  vMsgErro : string;
begin
  if MessageDlg('Deseja realmente excluir o registro ' + IntToStr(Tcontratante(grdConsulta.Objects[Id,grdConsulta.Row]).Id) ,mtWarning,[mbYes, mbNo],0) = mrYes
   then begin
     contratante_DAO := Tcontratante_DAO.Create;
     try
       vMsgErro := NO_STRING;
       if contratante_DAO.Excluir(Tcontratante(grdConsulta.Objects[Id,grdConsulta.Row]).Id, vMsgErro)
        then begin
          ShowMessage(vMsgErro);
          PesquisarRegistro;
        end
        else ShowMessage(vMsgErro);
     finally
       FreeAndNil(contratante_DAO);
     end;
   end;

end;

procedure TfrmConsContratante.LoadGridCampos(prLista : Tlist);
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
      grdConsulta.Cells[Id,LinhaGrid]           := IntToStr(Tcontratante(prLista[Interador]).Id);
      grdConsulta.Cells[Nome,LinhaGrid]         := Tcontratante(prLista[Interador]).Nome;
      grdConsulta.Cells[TpPessoa,LinhaGrid]     := Tcontratante(prLista[Interador]).TpPessoa;
      grdConsulta.Cells[CpfCnpj,LinhaGrid]      := Tcontratante(prLista[Interador]).CpfCnpj;
      grdConsulta.Cells[Endereco,LinhaGrid]     := Tcontratante(prLista[Interador]).Endereco;
      grdConsulta.Cells[Numero,LinhaGrid]       := Tcontratante(prLista[Interador]).Numero;
      grdConsulta.Cells[Complemento,LinhaGrid]  := Tcontratante(prLista[Interador]).Complemento;
      grdConsulta.Cells[Bairro,LinhaGrid]       := Tcontratante(prLista[Interador]).Bairro;
      grdConsulta.Cells[Municipio,LinhaGrid]    := Tcontratante(prLista[Interador]).Municipio;
      grdConsulta.Cells[Uf,LinhaGrid]           := Tcontratante(prLista[Interador]).Uf;
      grdConsulta.Cells[Cep,LinhaGrid]          := Tcontratante(prLista[Interador]).Cep;
      grdConsulta.Cells[Telefone,LinhaGrid]     := Tcontratante(prLista[Interador]).Telefone;
      grdConsulta.Cells[Fax,LinhaGrid]          := Tcontratante(prLista[Interador]).Fax;
      grdConsulta.Cells[Email,LinhaGrid]        := Tcontratante(prLista[Interador]).Email;
      grdConsulta.Objects[Id, LinhaGrid] := Tcontratante(prLista[Interador]);
      inc(LinhaGrid);
      grdConsulta.RowCount := grdConsulta.RowCount + 1;
    end;
    if prLista.Count > 0
     then grdConsulta.RowCount := grdConsulta.RowCount - 1;
  end;
end;

procedure TfrmConsContratante.SetupGridCampos;
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

procedure TfrmConsContratante.btnCancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmConsContratante.btnImprimirClick(Sender: TObject);
begin
  Imprimir('tcontratante');
end;

procedure TfrmConsContratante.OpenConsultaRelatrorio;
begin
  zQryConsulta.SQL.Clear;
  if edtCampoPesquisa.Text = NO_STRING
   then begin
     zQryConsulta.SQL.Add('SELECT  ID, NOME, IF(TPPESSOA = ''F'', ''FISICA'', IF (TPPESSOA = ''J'', ''JURIDICA'', '''')) AS TPPESSOA, CPFCNPJ  FROM Tcontratante');
   end
   else begin
     if cmbCampo.ItemIndex = 0
      then  zQryConsulta.SQL.Add('SELECT ID, NOME, IF(TPPESSOA = ''F'', ''FISICA'', IF (TPPESSOA = ''J'', ''JURIDICA'', '''')) AS TPPESSOA, CPFCNPJ FROM Tcontratante WHERE ' + cmbCampo.Text + ' = ' + edtCampoPesquisa.Text)
      else zQryConsulta.SQL.Add('SELECT ID, NOME, IF(TPPESSOA = ''F'', ''FISICA'', IF (TPPESSOA = ''J'', ''JURIDICA'', '''')) AS TPPESSOA, CPFCNPJ FROM Tcontratante WHERE ' + cmbCampo.Text + ' = ' + QuotedStr(edtCampoPesquisa.Text));
   end;
  zQryConsulta.Open;
end;

end.

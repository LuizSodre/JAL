unit untConsLote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UntConsGenerico, StdCtrls, ComCtrls, Grids, Buttons, ExtCtrls,
  Lote_MDL, Lote_DAO, Constantes, FR_Class, FR_DSet, FR_DBSet, RpCon,
  RpConDS, RpConBDE, RpDefine, RpRave, DB, ZAbstractRODataset, ZDataset,
  FR_OLE, ZAbstractDataset;


const
  //Campos do Grid
  Id                =0;
  OrdemServico      =1;
  Ano               =2;
  Arquivo           =3;
  Contratante       =4;
  Cliente           =5;
  DtEntrada         =6;
  DtEnvioHigiene    =7;
  DtRetornoHigiene  =8;
  DtEnvioImpressao  =9;
  DtEnvioPostagem   =10;
  DtPostagem        =11;



type
  TfrmConsLote = class(TfrmConsGenerico)
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
  frmConsLote: TfrmConsLote;

implementation

uses UnitCadLote, unitMain, dmdata, UnitPreviewRel;

{$R *.dfm}

{ TfrmConsLote }

procedure TfrmConsLote.PesquisarRegistro;
var
  Lote_DAO : TLote_DAO;
begin
  Lote_DAO := TLote_DAO.Create;
  try
    grdConsulta.RowCount := 2;
    grdConsulta.Rows[1].Clear;
    if edtCampoPesquisa.Text = NO_STRING
     then LoadGridCampos(Lote_DAO.getAll)
     else LoadGridCampos(Lote_DAO.getByCampo(cmbCampo.Text, edtCampoPesquisa.Text));
  finally
    FreeAndNil(Lote_DAO);
  end;

end;

procedure TfrmConsLote.LoadComboCampos;
begin
  cmbCampo.Items.Add('Id');
  cmbCampo.Items.Add('OrdemServico');
  cmbCampo.Items.Add('NomeArquivo');
  cmbCampo.Items.Add('Contratante');
  cmbCampo.Items.Add('Cliente');
  cmbCampo.Items.Add('DtEntrada');
  cmbCampo.Items.Add('DtEnvioHigiene');
  cmbCampo.Items.Add('DtRetornoHigiene');
  cmbCampo.Items.Add('DtEnvioImpressao');
  cmbCampo.Items.Add('DtEnvioPostagem');
  cmbCampo.Items.Add('DtPostagem');
  cmbCampo.Items.Add('Ano');

  cmbCampo.ItemIndex := 0;
end;

procedure TfrmConsLote.EditarRegistro;
begin
  if Assigned(TLote(grdConsulta.Objects[Id,grdConsulta.Row]))
   then begin
     if not Assigned(frmCadLote)
      then begin
        frmCadLote := TfrmCadLote.Create(Self);
        frmCadLote.Parent := frmMain.pnlForms;
        frmCadLote.WindowState := wsNormal;
        frmCadLote.StatusBar1.Visible := False;
      end;
     frmCadLote.Left := 10;
     frmCadLote.Top := 10;
     frmCadLote.lblTitulo.Caption := 'Cadastro : Lote';
     frmCadLote.lblTituloMascara.Caption := frmCadLote.lblTitulo.Caption;
     frmCadLote.LoadLoteToControls(TLote(grdConsulta.Objects[Id,grdConsulta.Row]));
     Self.Hide;
     frmCadLote.Show;
   end;
end;

procedure TfrmConsLote.ExcluirRegistro;
var
  Lote_DAO : TLote_DAO;
  vMsgErro : string;
begin
  if Assigned(TLote(grdConsulta.Objects[Id,grdConsulta.Row]))
   then begin
     if MessageDlg('Deseja realmente excluir o registro ' + IntToStr(TLote(grdConsulta.Objects[Id,grdConsulta.Row]).Id) ,mtWarning,[mbYes, mbNo],0) = mrYes
      then begin
        Lote_DAO := TLote_DAO.Create;
        try
          vMsgErro := NO_STRING;
          if Lote_DAO.Excluir(TLote(grdConsulta.Objects[Id,grdConsulta.Row]).Id, vMsgErro)
           then begin
             ShowMessage(vMsgErro);
             PesquisarRegistro;
           end
           else ShowMessage(vMsgErro);
        finally
          FreeAndNil(Lote_DAO);
        end;
      end;
   end;
end;

procedure TfrmConsLote.LoadGridCampos(prLista : Tlist);
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
      grdConsulta.Cells[Id                    ,LinhaGrid]  := IntToStr(TLote(prLista[Interador]).Id);
      grdConsulta.Cells[OrdemServico          ,LinhaGrid]  := TLote(prLista[Interador]).OrdemServico;
      grdConsulta.Cells[Ano                   ,LinhaGrid]  := IntToStr(TLote(prLista[Interador]).Ano);
      grdConsulta.Cells[Arquivo               ,LinhaGrid]  := TLote(prLista[Interador]).NomeArquivo;
      grdConsulta.Cells[Contratante           ,LinhaGrid]  := TLote(prLista[Interador]).Contratante.Nome;
      grdConsulta.Cells[Cliente               ,LinhaGrid]  := TLote(prLista[Interador]).Cliente.Nome;

      if TLote(prLista[Interador]).DtEntrada > 0
       then grdConsulta.Cells[DtEntrada             ,LinhaGrid]  := FormatDateTime('dd/mm/yyyy hh:mm',TLote(prLista[Interador]).DtEntrada)
       else grdConsulta.Cells[DtEntrada             ,LinhaGrid]  := NO_STRING;

      if TLote(prLista[Interador]).DtEnvioHigiene > 0
       then grdConsulta.Cells[DtEnvioHigiene   ,LinhaGrid]  := FormatDateTime('dd/mm/yyyy hh:mm',TLote(prLista[Interador]).DtEnvioHigiene)
       else grdConsulta.Cells[DtEnvioHigiene   ,LinhaGrid]  := NO_STRING;

      if TLote(prLista[Interador]).DtRetornoHigiene > 0
       then grdConsulta.Cells[DtRetornoHigiene ,LinhaGrid]  := FormatDateTime('dd/mm/yyyy hh:mm',TLote(prLista[Interador]).DtRetornoHigiene)
       else grdConsulta.Cells[DtRetornoHigiene ,LinhaGrid]  := NO_STRING;

      if TLote(prLista[Interador]).DtEnvioImpressao > 0
       then grdConsulta.Cells[DtEnvioImpressao      ,LinhaGrid]  := FormatDateTime('dd/mm/yyyy hh:mm',TLote(prLista[Interador]).DtEnvioImpressao)
       else grdConsulta.Cells[DtEnvioImpressao      ,LinhaGrid]  := NO_STRING;

      if TLote(prLista[Interador]).DtEnvioPostagem > 0
       then grdConsulta.Cells[DtEnvioPostagem        ,LinhaGrid]  := FormatDateTime('dd/mm/yyyy hh:mm',TLote(prLista[Interador]).DtEnvioPostagem)
       else grdConsulta.Cells[DtEnvioPostagem        ,LinhaGrid]  := NO_STRING;

      if TLote(prLista[Interador]).DtPostagem > 0
       then grdConsulta.Cells[DtPostagem            ,LinhaGrid]  := FormatDateTime('dd/mm/yyyy hh:mm',TLote(prLista[Interador]).DtPostagem)
       else grdConsulta.Cells[DtPostagem            ,LinhaGrid]  := NO_STRING;

      grdConsulta.Objects[Id        , LinhaGrid] := TLote(prLista[Interador]);

      inc(LinhaGrid);
      grdConsulta.RowCount := grdConsulta.RowCount + 1;
    end;
    if prLista.Count > 0
     then grdConsulta.RowCount := grdConsulta.RowCount - 1;
  end;
end;

procedure TfrmConsLote.SetupGridCampos;
begin
  inherited;
  grdConsulta.ColCount := 12;
  grdConsulta.RowCount := 2;

  grdConsulta.Cols[Id].SetText('Id');                                             
  grdConsulta.ColWidths[Id] := 50;                                                
                                                                                  
  grdConsulta.Cols[OrdemServico].SetText('OS');                                   
  grdConsulta.ColWidths[OrdemServico] := 70;                                      
                                                                                  
  grdConsulta.Cols[Ano].SetText('Ano');                                           
  grdConsulta.ColWidths[Ano] := 60;                                               
                                                                                  
  grdConsulta.Cols[Arquivo].SetText('Arquivo');                                   
  grdConsulta.ColWidths[Arquivo] := 250;                                          
                                                                                  
  grdConsulta.Cols[Contratante].SetText('Contratante');
  grdConsulta.ColWidths[Contratante] := 250;

  grdConsulta.Cols[Cliente].SetText('Cliente');
  grdConsulta.ColWidths[Cliente] := 250;

  grdConsulta.Cols[DtEntrada].SetText('Entrada');
  grdConsulta.ColWidths[DtEntrada] := 130;

  grdConsulta.Cols[DtEnvioHigiene].SetText('Env. Higienização');
  grdConsulta.ColWidths[DtEnvioHigiene] := 130;

  grdConsulta.Cols[DtRetornoHigiene].SetText('Ret. Higienização');
  grdConsulta.ColWidths[DtRetornoHigiene] := 130;

  grdConsulta.Cols[DtEnvioImpressao].SetText('Ret. Higienização');
  grdConsulta.ColWidths[DtEnvioImpressao] := 130;

  grdConsulta.Cols[DtEnvioPostagem].SetText('Env. Postagem');
  grdConsulta.ColWidths[DtEnvioPostagem] := 130;

  grdConsulta.Cols[DtPostagem].SetText('Postagem');
  grdConsulta.ColWidths[DtPostagem] := 130;
end;

procedure TfrmConsLote.btnCancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmConsLote.btnImprimirClick(Sender: TObject);
begin
  Imprimir('tLote');
end;

procedure TfrmConsLote.OpenConsultaRelatrorio;
begin
  zQryConsulta.SQL.Clear;
  if edtCampoPesquisa.Text = NO_STRING
   then begin
     zQryConsulta.SQL.Add('SELECT');
     zQryConsulta.SQL.Add('   TLOTE.ID,');
     zQryConsulta.SQL.Add('   TLOTE.NOMEARQUIVO,');
     zQryConsulta.SQL.Add('   TCONTRATANTE.NOME AS CONTRATANTE,');
     zQryConsulta.SQL.Add('   TCLIENTE.NOME AS CLIENTE,');
     zQryConsulta.SQL.Add('   TLOTE.ID_CONTRATO,');
     zQryConsulta.SQL.Add('   TLOTE.DT_CRIACAO,');
     zQryConsulta.SQL.Add('   TLOTE.DT_ENVIO_HIGIENIZACAO,');
     zQryConsulta.SQL.Add('   TLOTE.DT_RETORNO_HIGIENIZACAO,');
     zQryConsulta.SQL.Add('   TLOTE.DT_ENVIO_IMPRESSAO,');
     zQryConsulta.SQL.Add('   TLOTE.DT_ENVIO_POSTAGEM,');
     zQryConsulta.SQL.Add('   TLOTE.DT_POSTAGEM,');
     zQryConsulta.SQL.Add('   TLOTE.ORDEMSERVICO,');
     zQryConsulta.SQL.Add('   TLOTE.ANO');
     zQryConsulta.SQL.Add(' FROM');
     zQryConsulta.SQL.Add('   TLOTE,');
     zQryConsulta.SQL.Add('   TCLIENTE,');
     zQryConsulta.SQL.Add('   TCONTRATANTE');
     zQryConsulta.SQL.Add(' WHERE');
     zQryConsulta.SQL.Add('  TLOTE.ID_CLIENTE = TCLIENTE.ID');
     zQryConsulta.SQL.Add('  AND TLOTE.ID_CONTRANTE = TCONTRATANTE.ID');
   end;

  zQryConsulta.Open;
end;

end.

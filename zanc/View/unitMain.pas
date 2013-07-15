unit unitMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, Menus, ExtCtrls, ImgList, ActnList, StdCtrls, DBTables,
  Db, dmdata, unitBiblio, unitSuporte;

type
  TfrmMain = class(TForm)
    menMain: TMainMenu;
    Arquivo1: TMenuItem;
    Cadastro1: TMenuItem;
    N1: TMenuItem;
    mnuParametroSistema: TMenuItem;
    N2: TMenuItem;
    Sair1: TMenuItem;
    stbMain: TStatusBar;
    imgMain: TImageList;
    tmrMain: TTimer;
    Sobre1: TMenuItem;
    actMain: TActionList;
    TreeView: TTreeView;
    Splitter1: TSplitter;
    imgTree: TImageList;
    mnuCadUsuario: TMenuItem;
    dsVistoria: TDataSource;
    tbrMain: TToolBar;
    btnadm: TToolButton;
    ToolButton2: TToolButton;
    btncliente: TToolButton;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    btnsair: TToolButton;
    mnuCadCliente: TMenuItem;
    mnuCadContrato: TMenuItem;
    mnuCadLote: TMenuItem;
    mnuCadContratante: TMenuItem;
    pnlForms: TPanel;
    lboLista: TListBox;
    ToolButton1: TToolButton;
    N3Consulta1: TMenuItem;
    N4Relatrio1: TMenuItem;
    mnuConsCliente: TMenuItem;
    mnuConsContratante: TMenuItem;
    mnuConsContrato: TMenuItem;
    mnuConsLote: TMenuItem;
    N41Clientes1: TMenuItem;
    N32Contratantes1: TMenuItem;
    N33Contrato1: TMenuItem;
    N34Lote2: TMenuItem;
    actCadCliente: TAction;
    actCadContratante: TAction;
    actParametroSistema: TAction;
    actCadContrato: TAction;
    actCadLote: TAction;
    actConsCliente: TAction;
    actConsContratante: TAction;
    actConsContrato: TAction;
    actConsLote: TAction;
    actRelCliente: TAction;
    actRelContratante: TAction;
    actRelContrato: TAction;
    actRelLote: TAction;
    actCadUsuario: TAction;
    procedure Sair1Click(Sender: TObject);
    procedure tmrMainTimer(Sender: TObject);
    procedure TreeViewClick(Sender: TObject);
    procedure lboListaDblClick(Sender: TObject);
    procedure Empresa1Click(Sender: TObject);
    procedure btnsairClick(Sender: TObject);
    procedure TreeViewKeyPress(Sender: TObject; var Key: Char);
    procedure actParametroSistemaExecute(Sender: TObject);
    procedure actCadClienteExecute(Sender: TObject);
    procedure actCadContratanteExecute(Sender: TObject);
    procedure actCadContratoExecute(Sender: TObject);
    procedure actCadLoteExecute(Sender: TObject);
    procedure actConsClienteExecute(Sender: TObject);
    procedure actConsContratanteExecute(Sender: TObject);
    procedure actConsContratoExecute(Sender: TObject);
    procedure actConsLoteExecute(Sender: TObject);
    procedure actCadUsuarioExecute(Sender: TObject);
  private
    { Private declarations }
    {Adicionar a liberação de instancia de janelas aqui}
    procedure tampaTela;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  frmCarregado : TForm;

implementation

uses UnitCadContratante, UnitCadCliente,{UnitCadcontrato,} UnitCadLote,
  UntConsGenerico, untConsCliente, UnitParSistema, untConsContratante,
  untConsLote, UnitCadUsuario;

{$R *.DFM}

procedure TfrmMain.Sair1Click(Sender: TObject);
begin
Close;
end;

procedure TfrmMain.tmrMainTimer(Sender: TObject);
begin
Caption:= 'cab1000 || VER 01.01.00 || SISTEMA DE CONTROLE DE ARQUIVOS || ARQUIVOSYS || '+
          DateToStr(date)+' || '+TimeToStr(Time)+' || Menu Principal ...';
end;

procedure TfrmMain.TreeViewClick(Sender: TObject);
begin
  TreeView.SetFocus;
  lboLista.Clear;
  lboLista.Visible := True;
  lboLista.Items.Add(TreeView.Selected.Text);

  tampaTela;
end;

procedure TfrmMain.lboListaDblClick(Sender: TObject);
begin
   lboLista.SetFocus;
   if Copy(lboLista.Items.Text,1,4)= '1.1.' then
   begin
     actParametroSistemaExecute(Sender);
   end
   else if Copy(lboLista.Items.Text,1,4)= '1.2.' then
   begin
     actCadUsuarioExecute(Sender);
   end
   else if Copy(lboLista.Items.Text,1,4)= '2.1.' then
   begin
     actCadClienteExecute(Sender);
   end
   else if Copy(lboLista.Items.Text,1,4)= '2.2.' then
   begin
     actCadContratanteExecute(Self);
   end
   else if Copy(lboLista.Items.Text,1,4)= '2.3.' then
   begin
     actCadContratoExecute(Self);
   end
   else if Copy(lboLista.Items.Text,1,4)= '2.4.' then
   begin
     actCadLoteExecute(Sender);
   end
   else if Copy(lboLista.Items.Text,1,4)= '2.5.' then
     //   chamafrm(TfrmEstado, self)
   else if Copy(lboLista.Items.Text,1,4)= '2.6.' then
     //   chamafrm(TfrmFabricante, self)
   else if Copy(lboLista.Items.Text,1,4)= '2.7.' then
     //   chamafrm(TfrmModelo, self)
   else if Copy(lboLista.Items.Text,1,4)= '2.8.' then
    //    chamafrm(TfrmPortador, self)
   else if Copy(lboLista.Items.Text,1,4)= '2.9.' then
      //  chamafrm(TfrmRegiao, self)
   else if Copy(lboLista.Items.Text,1,5)= '2.10.' then
     //   chamafrm(TfrmVeiculo, self)
   else if Copy(lboLista.Items.Text,1,4)= '3.1.' then
   begin
     actConsClienteExecute(Sender);
   end
    //    chamafrm(TfrmCadVistoria, self)
   else if Copy(lboLista.Items.Text,1,4)= '3.2.' then
   begin
     actConsContratanteExecute(Sender);
   end
   else if Copy(lboLista.Items.Text,1,4)= '3.3.' then
   begin
     actConsContratoExecute(Sender);
   end
   else if Copy(lboLista.Items.Text,1,4)= '3.4.' then
   begin
     actConsLoteExecute(Sender);
   end
   else if Copy(lboLista.Items.Text,1,4)= '3.5.' then
     //   chamafrm(TfrmAgendamento,self)
   else if Copy(lboLista.Items.Text,1,4)= '3.5.' then
     //   chamafrm(TfrmAbastecimento,self)
   else if Copy(lboLista.Items.Text,1,4)= '4.1.' then
        //chamafrm(TfrmLancamento, self)
   else if Copy(lboLista.Items.Text,1,4)= '5.1.' then
       // chamafrm(TfrmProc01, self)
   else if Copy(lboLista.Items.Text,1,4)= '5.2.' then
     //   chamafrm(TfrmProc02, self)
   else if Copy(lboLista.Items.Text,1,6)= '5.3.1.' then
     //   chamafrm(TfrmResp, self)
   else if Copy(lboLista.Items.Text,1,6)= '5.3.2.' then
       // chamafrm(TfrmProc04, self)
   else if Copy(lboLista.Items.Text,1,4)= '6.1.' then
        chamafrm(TfrmSuporte, self, pnlForms)
   else
       Abort;
end;

procedure TfrmMain.Empresa1Click(Sender: TObject);
begin
  actParametroSistemaExecute(Sender);
end;


procedure TfrmMain.btnsairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.TreeViewKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13
   then lboListaDblClick(Sender);
end;

procedure TfrmMain.actParametroSistemaExecute(Sender: TObject);
begin
  tampaTela;
  if not Assigned(frmParametroSistema)
   then begin
     frmParametroSistema := TfrmParametroSistema.Create(Application);
     frmCarregado := frmParametroSistema;
     frmParametroSistema.Parent := pnlForms;
     frmParametroSistema.WindowState := wsNormal;
   end;
  frmParametroSistema.Left := 10;
  frmParametroSistema.Top := 10;
  lboLista.Visible := False;
  frmParametroSistema.Show;
end;

procedure TfrmMain.actCadClienteExecute(Sender: TObject);
begin
  tampaTela;

  if not Assigned(frmCadCliente)
   then begin
     frmCadCliente := TfrmCadCliente.Create(Application);
     frmCarregado := frmCadCliente;
     frmCadCliente.Parent := pnlForms;
     frmCadCliente.WindowState := wsNormal;
     frmCadCliente.StatusBar1.Visible := False;
   end;
  //lblTitulo.Caption := 'Cadastro : Cliente';
  frmCadCliente.Left := 10;
  frmCadCliente.Top := 10;
  frmCadCliente.lblTitulo.Caption := 'Cadastro : Cliente';
  frmCadCliente.lblTituloMascara.Caption := frmCadCliente.lblTitulo.Caption;
  lboLista.Visible := False;
  frmCadCliente.Show;
end;

procedure TfrmMain.actCadContratanteExecute(Sender: TObject);
begin
  tampaTela;
  if not Assigned(frmCadContratante)
   then begin
     frmCadContratante := TfrmCadContratante.Create(Application);
     frmCarregado := frmCadContratante;
     frmCadContratante.Parent := pnlForms;
     frmCadContratante.WindowState := wsNormal;
     frmCadContratante.StatusBar1.Visible := False;
   end;
  //lblTitulo.Caption := 'Cadastro : Contratante';
  frmCadContratante.Left := 10;
  frmCadContratante.Top := 10;
  frmCadContratante.lblTitulo.Caption := 'Cadastro : Contratante';
  frmCadContratante.lblTituloMascara.Caption := frmCadContratante.lblTitulo.Caption;
  lboLista.Visible := False;
  frmCadContratante.Show;
end;

procedure TfrmMain.actCadContratoExecute(Sender: TObject);
begin
  tampaTela;
//
end;

procedure TfrmMain.actCadLoteExecute(Sender: TObject);
begin
  tampaTela;
  if not Assigned(frmCadLote)
   then begin
     frmCadLote := TfrmCadLote.Create(Application);
     frmCarregado := frmCadLote;
     frmCadLote.Parent := pnlForms;
     frmCadLote.WindowState := wsNormal;
     frmCadLote.StatusBar1.Visible := False;
   end;
   frmCadLote.Left := 10;
   frmCadLote.Top := 10;
   lboLista.Visible := False;
   frmCadLote.Show;
end;

procedure TfrmMain.actConsClienteExecute(Sender: TObject);
begin
  tampaTela;
  if not Assigned(frmConsCliente)
   then begin
     frmConsCliente := TfrmConsCliente.Create(self);
     frmCarregado := frmConsCliente;
     frmConsCliente.Parent := pnlForms;
     frmConsCliente.WindowState := wsNormal;
     frmConsCliente.StatusBar1.Visible := False;
   end;
  frmConsCliente.lblTitulo.Caption := 'Consulta : Cliente';
  frmConsCliente.lblTituloMascara.Caption := frmConsCliente.lblTitulo.Caption;
  frmConsCliente.Left := 10;
  frmConsCliente.Top := 10;
  lboLista.Visible := False;
  frmConsCliente.Show;
end;

procedure TfrmMain.actConsContratanteExecute(Sender: TObject);
begin
  tampaTela;
  if not Assigned(frmConsContratante)
      then begin
        frmConsContratante := TfrmConsContratante.Create(Application);
        frmCarregado := frmConsContratante;
        frmConsContratante.Parent := pnlForms;
        frmConsContratante.WindowState := wsNormal;
        frmConsContratante.StatusBar1.Visible := False;
      end;
     frmConsContratante.lblTitulo.Caption := 'Consulta : Contratante';
     frmConsContratante.lblTituloMascara.Caption := frmConsContratante.lblTitulo.Caption;
     frmConsContratante.Left := 10;
     frmConsContratante.Top := 10;
     lboLista.Visible := False;
     frmConsContratante.Show;
end;

procedure TfrmMain.actConsContratoExecute(Sender: TObject);
begin
  tampaTela;
//
end;

procedure TfrmMain.actConsLoteExecute(Sender: TObject);
begin
  tampaTela;
  if not Assigned(frmConsLote)
      then begin
        frmConsLote := TfrmConsLote.Create(Application);
        frmCarregado := frmConsLote;
        frmConsLote.Parent := pnlForms;
        frmConsLote.WindowState := wsNormal;
        frmConsLote.StatusBar1.Visible := False;
      end;
     frmConsLote.lblTitulo.Caption := 'Consulta : Lote';
     frmConsLote.lblTituloMascara.Caption := frmConsLote.lblTitulo.Caption;
     frmConsLote.Left := 10;
     frmConsLote.Top := 10;
     lboLista.Visible := False;
     frmConsLote.Show;
end;

procedure TfrmMain.tampaTela;
begin

  if frmCarregado is TfrmCadCliente
   then begin
     if Assigned(frmCadCliente)
      then begin
        frmCarregado := nil;
        FreeAndNil(frmCadCliente);
      end;
   end;

  if frmCarregado is TfrmCadContratante
   then begin
     if Assigned(frmCadContratante)
      then begin
        frmCarregado := nil;
        FreeAndNil(frmCadContratante);
      end;
   end;

  if frmCarregado is TfrmCadLote
   then begin
     if Assigned(frmCadLote)
      then begin
        frmCarregado := nil;
        FreeAndNil(frmCadLote);
      end;
   end;

  if frmCarregado is TfrmConsCliente
   then begin
     if Assigned(frmConsCliente)
      then begin
        frmCarregado := nil;
        FreeAndNil(frmConsCliente);
      end;
   end;

  if frmCarregado is TfrmConsContratante
   then begin
     if Assigned(frmConsContratante)
      then begin
        frmCarregado := nil;
        FreeAndNil(frmConsContratante);
      end;
   end;

  if frmCarregado is TfrmConsLote
   then begin
     if Assigned(frmConsLote)
      then begin
        frmCarregado := nil;
        FreeAndNil(frmConsLote);
      end;
   end;

  if frmCarregado is TfrmParametroSistema
   then begin
     if Assigned(frmParametroSistema)
      then begin
        frmCarregado := nil;
        FreeAndNil(frmParametroSistema);
      end;
   end;

  if frmCarregado is TfrmCadUsuario
   then begin
     if Assigned(frmCadUsuario)
      then begin
        frmCarregado := nil;
        FreeAndNil(frmCadUsuario);
      end;
   end;

end;

procedure TfrmMain.actCadUsuarioExecute(Sender: TObject);
begin
  tampaTela;

  if not Assigned(frmCadUsuario)
   then begin
     frmCadUsuario := TfrmCadUsuario.Create(Application);
     frmCarregado := frmCadUsuario;
     frmCadUsuario.Parent := pnlForms;
     frmCadUsuario.WindowState := wsNormal;
     frmCadUsuario.StatusBar1.Visible := False;
   end;

  frmCadUsuario.Left := 10;
  frmCadUsuario.Top := 10;
  frmCadUsuario.lblTitulo.Caption := 'Cadastro : Usuario';
  frmCadUsuario.lblTituloMascara.Caption := frmCadUsuario.lblTitulo.Caption;
  lboLista.Visible := False;
  frmCadUsuario.Show;
end;

end.

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
    Empresa1: TMenuItem;
    N2: TMenuItem;
    Sair1: TMenuItem;
    stbMain: TStatusBar;
    imgMain: TImageList;
    tmrMain: TTimer;
    Sobre1: TMenuItem;
    actMain: TActionList;
    TreeView: TTreeView;
    Splitter1: TSplitter;
    lboLista: TListBox;
    imgTree: TImageList;
    N12Acesso1: TMenuItem;
    dsVistoria: TDataSource;
    tbrMain: TToolBar;
    btnadm: TToolButton;
    ToolButton2: TToolButton;
    btncliente: TToolButton;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    btnsair: TToolButton;
    N21Clientes1: TMenuItem;
    N22Contrato1: TMenuItem;
    N23Lote1: TMenuItem;
    N22Contratantes1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure tmrMainTimer(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure TreeViewClick(Sender: TObject);
    procedure lboListaDblClick(Sender: TObject);
    procedure Empresa1Click(Sender: TObject);
    procedure Igreja1Click(Sender: TObject);
    procedure N12Acesso1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N23Vencimento1Click(Sender: TObject);
    procedure N24Estado1Click(Sender: TObject);
    procedure N25Fabricante1Click(Sender: TObject);
    procedure N26Modelo1Click(Sender: TObject);
    procedure N27Portador1Click(Sender: TObject);
    procedure N28Portador1Click(Sender: TObject);
    procedure Veculo1Click(Sender: TObject);
    procedure N210Regio1Click(Sender: TObject);
    procedure teste1Click(Sender: TObject);
    procedure N42Placa1Click(Sender: TObject);
    procedure btnsairClick(Sender: TObject);
    procedure N32Vistoria1Click(Sender: TObject);
    procedure N33Reagendamento1Click(Sender: TObject);
    procedure N342via1Click(Sender: TObject);
    procedure N35LaudodeVistoria1Click(Sender: TObject);
    procedure N41Lanamento1Click(Sender: TObject);
    procedure N531PortadorXPosio1Click(Sender: TObject);
    procedure N532SintticoProc041Click(Sender: TObject);
    procedure N54Vistoria1Click(Sender: TObject);
    procedure N5331Combloqueador1Click(Sender: TObject);
    procedure N5332Sembloqueador1Click(Sender: TObject);
    procedure N55MontarfiltroProc071Click(Sender: TObject);
    procedure N42Relatrio1Click(Sender: TObject);
    procedure N421Click(Sender: TObject);
    procedure N35AgendadeCondutor1Click(Sender: TObject);
    procedure N25Departamento1Click(Sender: TObject);
    procedure N36Abastecimento1Click(Sender: TObject);
    procedure btnabastecimentoClick(Sender: TObject);
    procedure btnagendamentoClick(Sender: TObject);
    procedure N511FiltroGeral1Click(Sender: TObject);
    procedure N21Clientes1Click(Sender: TObject);
    procedure N22Contrato1Click(Sender: TObject);
    procedure N23Lote1Click(Sender: TObject);
    procedure N22Contratantes1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses UnitCadContratante, UnitCadCliente,{UnitCadcontrato,} UnitCadLote;

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

procedure TfrmMain.Sobre1Click(Sender: TObject);
begin
//chamafrm(TfrmSuporte, self);
end;

procedure TfrmMain.TreeViewClick(Sender: TObject);
begin
   TreeView.SetFocus;
   lboLista.Clear;
   lboLista.Items.Add(TreeView.Selected.Text);
end;

procedure TfrmMain.lboListaDblClick(Sender: TObject);
begin
   lboLista.SetFocus;
   if Copy(lboLista.Items.Text,1,4)= '1.1.' then
     // chamafrm(TfrmCadEmpresa, self)
   else if Copy(lboLista.Items.Text,1,4)= '2.1.' then
    chamafrm(TfrmCadCliente, self)
   else if Copy(lboLista.Items.Text,1,4)= '2.2.' then
    chamafrm(TfrmCadContratante, self)
   else if Copy(lboLista.Items.Text,1,4)= '2.3.' then
//    chamafrm(TfrmCadContrato, self)
   else if Copy(lboLista.Items.Text,1,4)= '2.4.' then
    chamafrm(TfrmCadLote, self)
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
    //    chamafrm(TfrmCadVistoria, self)
   else if Copy(lboLista.Items.Text,1,4)= '3.2.' then
      //  chamafrm(TfrmCad2via, self)
   else if Copy(lboLista.Items.Text,1,4)= '3.3.' then
    //    chamafrm(TfrmCadReagendamento, self)
   else if Copy(lboLista.Items.Text,1,4)= '3.4.' then
    //    chamafrm(TfrmCadLaudo, self)
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
        chamafrm(TfrmSuporte, self)
   else
       Abort;
end;

procedure TfrmMain.Empresa1Click(Sender: TObject);
begin
try
 //  dmdata.qryEmpresa.Edit;
  // chamafrm(TfrmCadEmpresa, self);
except on E:EDBEngineError do
          MessageDlg('ERRO NO SISTEMA !!! Código do erro '+IntToStr(E.Errors[0].ErrorCode)+' = '+E.Errors[0].Message
          ,mtError,[mbOK],0);
       end;
end;


procedure TfrmMain.Igreja1Click(Sender: TObject);
begin
//chamafrm(TfrmBanco, self);
end;

procedure TfrmMain.N12Acesso1Click(Sender: TObject);
begin
//chamafrm(TfrmUsuario, self);
end;

procedure TfrmMain.N3Click(Sender: TObject);
begin
//chamafrm(TfrmCcusto, self);
end;

procedure TfrmMain.N23Vencimento1Click(Sender: TObject);
begin
//chamafrm(TfrmGerar, self);
end;

procedure TfrmMain.N24Estado1Click(Sender: TObject);
begin
// chamafrm(TfrmCredor, self);
end;

procedure TfrmMain.N25Fabricante1Click(Sender: TObject);
begin
//chamafrm(TfrmEstado, self);
end;

procedure TfrmMain.N26Modelo1Click(Sender: TObject);
begin
//chamafrm(TfrmFabricante, self);
end;

procedure TfrmMain.N27Portador1Click(Sender: TObject);
begin
//chamafrm(TfrmModelo, self);
end;

procedure TfrmMain.N28Portador1Click(Sender: TObject);
begin
//chamafrm(TfrmPortador, self);
end;

procedure TfrmMain.Veculo1Click(Sender: TObject);
begin
//chamafrm(TfrmVeiculo, self);
end;

procedure TfrmMain.N210Regio1Click(Sender: TObject);
begin
//chamafrm(TfrmRegiao, self);
end;

procedure TfrmMain.teste1Click(Sender: TObject);
begin
//chamafrm(TfrmProc01, self);
end;

procedure TfrmMain.N42Placa1Click(Sender: TObject);
begin
//chamafrm(TfrmProc02, self);
end;

procedure TfrmMain.btnsairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmMain.N32Vistoria1Click(Sender: TObject);
begin
//chamafrm(TfrmAbastecimento, self);
end;

procedure TfrmMain.N33Reagendamento1Click(Sender: TObject);
begin
//chamafrm(TfrmCad2via, self);
end;

procedure TfrmMain.N342via1Click(Sender: TObject);
begin
//chamafrm(TfrmCadReagendamento, self);
end;

procedure TfrmMain.N35LaudodeVistoria1Click(Sender: TObject);
begin
//chamafrm(TfrmCadLaudo, self);
end;

procedure TfrmMain.N41Lanamento1Click(Sender: TObject);
begin
//chamafrm(TfrmLancamento, self);
end;

procedure TfrmMain.N531PortadorXPosio1Click(Sender: TObject);
begin
//chamafrm(TfrmResp, self);
end;

procedure TfrmMain.N532SintticoProc041Click(Sender: TObject);
begin
//chamafrm(TfrmProc04, self);
end;

procedure TfrmMain.N54Vistoria1Click(Sender: TObject);
begin
//chamafrm(TfrmProc06, self);
end;

procedure TfrmMain.N5331Combloqueador1Click(Sender: TObject);
begin
//chamafrm(TfrmProc05, self);
end;

procedure TfrmMain.N5332Sembloqueador1Click(Sender: TObject);
begin
//chamafrm(TfrmProc05a, self);
end;

procedure TfrmMain.N55MontarfiltroProc071Click(Sender: TObject);
begin
//chamafrm(TfrmProc07, self);
end;

procedure TfrmMain.N42Relatrio1Click(Sender: TObject);
begin
//chamafrm(TfrmMenuRel, self);
end;

procedure TfrmMain.N421Click(Sender: TObject);
begin
//chamafrm(TfrmGeraOP, self);
end;

procedure TfrmMain.N35AgendadeCondutor1Click(Sender: TObject);
begin
//chamafrm(TfrmAgendamento,self);
end;

procedure TfrmMain.N25Departamento1Click(Sender: TObject);
begin
//chamafrm(TfrmDepartamento,self);
end;

procedure TfrmMain.N36Abastecimento1Click(Sender: TObject);
begin
//chamafrm(TfrmAbastecimento,self);
end;

procedure TfrmMain.btnabastecimentoClick(Sender: TObject);
begin
 //  chamafrm(TfrmAbastecimento, self);
end;

procedure TfrmMain.btnagendamentoClick(Sender: TObject);
begin
//chamafrm(TfrmAgendamento, self);
end;

procedure TfrmMain.N511FiltroGeral1Click(Sender: TObject);
begin
//chamafrm(TfrmMenuAbastecimento,self);
end;

procedure TfrmMain.N21Clientes1Click(Sender: TObject);
begin
chamafrm(TfrmCadCliente, self);
end;

procedure TfrmMain.N22Contrato1Click(Sender: TObject);
begin
//chamafrm(TfrmCadContrato, self);
end;

procedure TfrmMain.N23Lote1Click(Sender: TObject);
begin
  chamafrm(TfrmCadLote, self);
end;

procedure TfrmMain.N22Contratantes1Click(Sender: TObject);
begin
  chamafrm(TfrmCadContratante, self);
end;

end.

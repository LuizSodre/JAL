program Agenda;

{%File 'Agenda.cf'}

uses
  Forms,
  Brokers in '..\..\core\main\Brokers.pas',
  MainFrm in '..\..\core\main\vcl\MainFrm.pas' {MainForm},
  CustomEditFrm in '..\..\core\custom\vcl\CustomEditFrm.pas' {CustomEditForm},
  CustomMVP in '..\..\core\custom\CustomMVP.pas',
  CustomQueryFrm in '..\..\core\custom\vcl\CustomQueryFrm.pas' {CustomQueryForm},
  CustomBO in '..\..\core\custom\CustomBO.pas',
  ContatoBO in '..\..\core\contato\ContatoBO.pas',
  CidadeEditFrm in '..\..\core\contato\vcl\CidadeEditFrm.pas' {CidadeEditForm},
  CidadeQueryFrm in '..\..\core\contato\vcl\CidadeQueryFrm.pas' {CidadeQueryForm},
  ContatoEditFrm in '..\..\core\contato\vcl\ContatoEditFrm.pas' {ContatoEditForm},
  ContatoFoneEditFrm in '..\..\core\contato\vcl\ContatoFoneEditFrm.pas' {ContatoFoneEditForm},
  ContatoQueryFrm in '..\..\core\contato\vcl\ContatoQueryFrm.pas' {ContatoQueryForm},
  MainMVP in '..\..\core\main\MainMVP.pas',
  ContatoMVP in '..\..\core\contato\ContatoMVP.pas',
  PressMySQLBroker in '..\..\core\main\PressMySQLBroker.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  TMainFormPresenter.Run;
end.

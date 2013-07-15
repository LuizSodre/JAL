program ArquivoSys;

uses
  Forms,
  Controls,
  SysUtils,
  dmdata in 'View\dmdata.pas' {data: TDataModule},
  UnitAcesso in 'View\UnitAcesso.pas' {frmSenha},
  unitAguarde in 'View\unitAguarde.pas' {frmAguarde},
  unitAVI02 in 'View\unitAVI02.pas' {frmAVI02},
  unitAVI03 in 'View\unitAVI03.pas' {frmAVI03},
  unitAVI04 in 'View\unitAVI04.pas' {frmAVI04},
  unitMain in 'View\unitMain.pas' {frmMain},
  unitSuporte in 'View\unitSuporte.pas' {frmSuporte},
  unitCadGenerico in 'View\unitCadGenerico.pas' {frmCadGenerico},
  unitGenerico in 'View\unitGenerico.pas' {frmGenerico},
  unitBiblio in 'Util\unitBiblio.pas',
  UnitCadLote in 'View\UnitCadLote.pas' {frmCadLote},
  UnitCadCliente in 'View\UnitCadCliente.pas' {frmCadCliente},
  UnitCadContratante in 'View\UnitCadContratante.pas' {frmCadContratante},
  Base_MDL in 'Model\Base_MDL.pas',
  Lote_DAO in 'DAO\Lote_DAO.pas',
  Lote_MDL in 'Model\Lote_MDL.pas',
  Constantes in 'Util\Constantes.pas',
  Contratante_DAO in 'DAO\Contratante_DAO.pas',
  Contratante_MDL in 'Model\Contratante_MDL.pas',
  Cliente_DAO in 'DAO\Cliente_DAO.pas',
  Cliente_MDL in 'Model\Cliente_MDL.pas',
  UntConsGenerico in 'View\UntConsGenerico.pas' {frmConsGenerico},
  untConsContratante in 'View\untConsContratante.pas' {frmConsContratante},
  UnitLibrary in 'Util\UnitLibrary.pas',
  UnitParSistema in 'View\UnitParSistema.pas' {frmParametroSistema},
  UnitPreviewRel in 'View\UnitPreviewRel.pas' {frmPreviewRel},
  untConsLote in 'View\untConsLote.pas' {frmConsLote},
  UnitSplash in 'View\UnitSplash.pas' {frmSplash},
  untConsCliente in 'View\untConsCliente.pas' {frmConsCliente},
  Usuario_DAO in 'DAO\Usuario_DAO.pas',
  Usuario_MDL in 'Model\Usuario_MDL.pas',
  wcrypt2 in 'Util\Wcrypt2.pas',
  UnitCadUsuario in 'View\UnitCadUsuario.pas' {frmCadUsuario};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ArquivoSys';
  frmSplash := TfrmSplash.Create(Application);
  frmSplash.Show;
  frmSplash.Refresh;
  Application.CreateForm(Tdata, data);
  Sleep(2000);
  frmSplash.Hide;
  frmSplash.Free;
  Application.CreateForm(TfrmSenha, frmSenha);
  if frmSenha.ShowModal = mrOk
   then begin
     FreeAndNil(frmSenha);
     Application.CreateForm(TfrmMain, frmMain);
     Application.Run;
   end
   else
     Application.Terminate;

end.

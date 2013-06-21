program zanc;

uses
  Forms,
  SysUtils,
  dmdata in 'dmdata.pas' {data: TDataModule},
  UnitAcesso in 'UnitAcesso.pas' {frmSenha},
  unitAguarde in 'unitAguarde.pas' {frmAguarde},
  unitAVI02 in 'unitAVI02.pas' {frmAVI02},
  unitAVI03 in 'unitAVI03.pas' {frmAVI03},
  unitAVI04 in 'unitAVI04.pas' {frmAVI04},
  unitMain in 'unitMain.pas' {frmMain},
  unitSuporte in 'unitSuporte.pas' {frmSuporte},
  unitCadGenerico in 'unitCadGenerico.pas' {frmCadGenerico},
  unitGenerico in 'unitGenerico.pas' {frmGenerico},
  unitBiblio in 'unitBiblio.pas',
  UnitCadLote in 'UnitCadLote.pas' {frmCadLote},
  UnitCadCliente in 'UnitCadCliente.pas' {frmCadCliente},
  UnitCadContratante in 'UnitCadContratante.pas' {frmCadContratante},
  Base_MDL in 'Base_MDL.pas',
  Lote_DAO in 'Lote_DAO.pas',
  Lote_MDL in 'Lote_MDL.pas',
  Constantes in 'Constantes.pas',
  Contratante_DAO in 'Contratante_DAO.pas',
  Contratante_MDL in 'Contratante_MDL.pas',
  Cliente_DAO in 'Cliente_DAO.pas',
  Cliente_MDL in 'Cliente_MDL.pas',
  UntConsGenerico in 'UntConsGenerico.pas' {frmConsGenerico},
  untConsContratante in 'untConsContratante.pas' {frmConsContratante},
  UnitLibrary in 'UnitLibrary.pas',
  UnitParSistema in 'UnitParSistema.pas' {frmParametroSistema},
  UnitPreviewRel in 'UnitPreviewRel.pas' {frmPreviewRel},
  untConsCliente in 'untConsCliente.pas' {frmConsCliente},
  UnitSplash in 'UnitSplash.pas' {frmSplash};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ArquivoSys';
  frmSplash := TfrmSplash.Create(Application);
  frmSplash.Show;
  frmSplash.Refresh;
  Application.CreateForm(Tdata, data);
  Application.CreateForm(TfrmMain, frmMain);
  Sleep(2000);
  frmSplash.Hide;
  frmSplash.Free;
  Application.Run;
end.

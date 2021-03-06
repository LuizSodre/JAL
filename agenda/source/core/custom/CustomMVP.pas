unit CustomMVP;

interface

uses
  PressMVPPresenter;

type
  TCustomEditPresenter = class(TPressMVPFormPresenter)
  protected
    procedure InitPresenter; override;
  end;

  TCustomQueryPresenter = class(TPressMVPQueryPresenter)
  protected
    procedure InitPresenter; override;
  end;

implementation
uses
  PressMVPCommand, CustomBO;

{ TCustomEditPresenter }

procedure TCustomEditPresenter.InitPresenter;
begin
  inherited;
  BindCommand(TPressMVPSaveObjectCommand, 'btnGravar');
  BindCommand(TPressMVPCancelConfirmObjectCommand, 'btnCancelar');
end;

{ TCustomQueryPresenter }

procedure TCustomQueryPresenter.InitPresenter;
begin
  inherited;
  BindCommand(TPressMVPExecuteQueryCommand, 'btnPesquisar');
  CreateQueryItemsPresenter('grdQueryString');
end;

initialization
  TCustomEditPresenter.RegisterBO(TCustomObject);
  TCustomQueryPresenter.RegisterBO(TCustomQuery);

end.

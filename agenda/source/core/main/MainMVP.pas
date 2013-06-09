unit MainMVP;

interface

uses
  PressMVPPresenter;

type
  TMainFormPresenter = class(TPressMVPMainFormPresenter)
  protected
    procedure InitPresenter; override;
  end;

implementation
uses
  PressUser, PressMVPCommand, ContatoMVP;

{ TMainFormPresenter }

procedure TMainFormPresenter.InitPresenter;
begin
  inherited;
  BindPresenter(TContatoEditPresenter, 'btnNovoContato');
  BindPresenter(TContatoQueryPresenter, 'btnPesquisarContato');
  BindPresenter(TCidadeQueryPresenter, 'btnPesquisarCidade');
  BindCommand(TPressMVPCloseApplicationCommand, 'btnFechar');
  PressUserData.Logon('', '');
end;

end.

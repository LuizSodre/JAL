unit ContatoQueryFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomQueryFrm, StdCtrls, Buttons, ExtCtrls, Grids;

type
  TContatoQueryForm = class(TCustomQueryForm)
    edtNome: TEdit;
    cbCidade: TComboBox;
    lblNome: TLabel;
    lblCidade: TLabel;
    procedure btnPesquisarClick(Sender: TObject);
  end;

implementation
uses
  PressVCLBroker, ContatoMVP;

{$R *.dfm}

procedure TContatoQueryForm.btnPesquisarClick(Sender: TObject);
begin
  inherited;
//
end;

initialization
  PressVCLForm(TContatoQueryPresenter, TContatoQueryForm);
end.

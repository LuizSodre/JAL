unit ContatoFoneEditFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomEditFrm, StdCtrls, Buttons, ExtCtrls;

type
  TContatoFoneEditForm = class(TCustomEditForm)
    cbTipoFone: TComboBox;
    edtNumero: TEdit;
    lblTipo: TLabel;
    lblNumero: TLabel;
  end;

implementation
uses
  PressVCLBroker, CustomMVP;
{$R *.dfm}
initialization
  PressVCLForm(TCustomEditPresenter, TCustomEditForm);

end.

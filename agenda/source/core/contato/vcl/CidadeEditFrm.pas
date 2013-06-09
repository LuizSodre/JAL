unit CidadeEditFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomEditFrm, StdCtrls, Buttons, ExtCtrls;

type
  TCidadeEditForm = class(TCustomEditForm)
    edtNome: TEdit;
    cbUF: TComboBox;
    lblCidade: TLabel;
    lblUF: TLabel;
  end;

implementation
uses
  PressVCLBroker, ContatoMVP;

{$R *.dfm}

initialization
  PressVCLForm(TCidadeEditPresenter, TCidadeEditForm);

end.

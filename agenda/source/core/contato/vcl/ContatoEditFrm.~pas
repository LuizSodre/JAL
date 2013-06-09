unit ContatoEditFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomEditFrm, StdCtrls, Buttons, ExtCtrls, Grids;

type
  TContatoEditForm = class(TCustomEditForm)
    Label1: TLabel;
    edtNome: TEdit;
    Label2: TLabel;
    edtEndereco: TEdit;
    cbCidade: TComboBox;
    Label3: TLabel;
    grdFones: TStringGrid;
  end;

implementation

uses
  PressVCLBroker, ContatoMVP;

{$R *.dfm}

initialization
  PressVCLForm(TContatoEditPresenter, TContatoEditForm);

end.

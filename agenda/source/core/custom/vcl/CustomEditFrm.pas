unit CustomEditFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TCustomEditForm = class(TForm)
    pnlBtns: TPanel;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
  end;

implementation

uses
  PressVCLBroker, CustomMVP;

{$R *.dfm}

initialization
  PressVCLForm(TCustomEditPresenter, TCustomEditForm);

end.

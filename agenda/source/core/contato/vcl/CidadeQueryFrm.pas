unit CidadeQueryFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomQueryFrm, StdCtrls, Buttons, ExtCtrls, Grids;

type
  TCidadeQueryForm = class(TCustomQueryForm)
    edtNome: TEdit;
  end;

implementation
uses
  PressVCLBroker, ContatoMVP;

{$R *.dfm}

initialization
  PressVCLForm(TCidadeQueryPresenter, TCidadeQueryForm);

end.

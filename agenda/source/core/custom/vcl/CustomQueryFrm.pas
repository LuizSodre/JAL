unit CustomQueryFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, ExtCtrls;

type
  TCustomQueryForm = class(TForm)
    grdQueryString: TStringGrid;
    Panel1: TPanel;
    btnPesquisar: TBitBtn;
    pnl1: TPanel;
  end;

implementation
uses
  PressVCLBroker, CustomMVP;

{$R *.dfm}

initialization
  PressVCLForm(TCustomQueryPresenter, TCustomQueryForm);

end.
 
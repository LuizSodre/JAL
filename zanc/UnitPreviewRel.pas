unit UnitPreviewRel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, FR_View;

type
  TfrmPreviewRel = class(TForm)
    frprvw1: TfrPreview;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPreviewRel: TfrmPreviewRel;

implementation

{$R *.dfm}

end.

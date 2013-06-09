unit unitSuporte;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TfrmSuporte = class(TForm)
    Panel1: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    Image1: TImage;
    lblmsg: TLabel;
    btnOk: TButton;
    Label17: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label7: TLabel;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSuporte: TfrmSuporte;

implementation

{$R *.DFM}

procedure TfrmSuporte.btnOkClick(Sender: TObject);
begin
Close;
end;

end.

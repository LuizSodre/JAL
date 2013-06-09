unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls;

type
  TMainForm = class(TForm)
    btnNovoContato: TBitBtn;
    btnPesquisarContato: TBitBtn;
    btnPesquisarCidade: TBitBtn;
    btnFechar: TBitBtn;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  Clipbrd,PressOPF;

{$R *.dfm}

procedure TMainForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  opf : TPressOPF;
begin
  if (Key = Ord('9')) and (Shift = [ssShift, ssAlt])
   then begin
     Clipboard.AsText := PressOPFService.CreateDatabaseStatement;
     ShowMessage('Metadata do banco de dados copiado para o Clipboard');
   end;
end;

end.

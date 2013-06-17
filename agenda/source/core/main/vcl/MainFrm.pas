unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Menus, ComCtrls, ToolWin;

type
  TMainForm = class(TForm)
    mm1: TMainMenu;
    mnuCadastro: TMenuItem;
    mnuConsulta: TMenuItem;
    mnuRelatorio: TMenuItem;
    mnuSair: TMenuItem;
    mnuCadContato: TMenuItem;
    mnuCadCidade: TMenuItem;
    mnuConsContato: TMenuItem;
    mnuConsCidade: TMenuItem;
    ToolBar1: TToolBar;
    btnNovoContato: TToolButton;
    btnPesquisarContato: TToolButton;
    btnPesquisarCidade: TToolButton;
    ToolButton3: TToolButton;
    btnFechar: TToolButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormResize(Sender: TObject);
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

procedure TMainForm.FormActivate(Sender: TObject);
begin
  Self.Top := 0;
  Self.Left := (Screen.Width div 2) - (Self.Width div 2);
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  Self.Height := 100;
end;

end.

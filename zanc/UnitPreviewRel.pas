unit UnitPreviewRel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FR_Ctrls, FR_View, ExtCtrls;

type
  TfrmPreviewRel = class(TForm)
    Panel1: TPanel;
    frPreview1: TfrPreview;
    frSpeedButton1: TfrSpeedButton;
    frSpeedButton2: TfrSpeedButton;
    frSpeedButton3: TfrSpeedButton;
    frSpeedButton4: TfrSpeedButton;
    frSpeedButton5: TfrSpeedButton;
    frSpeedButton6: TfrSpeedButton;
    frSpeedButton7: TfrSpeedButton;
    frSpeedButton8: TfrSpeedButton;
    frSpeedButton9: TfrSpeedButton;
    frSpeedButton10: TfrSpeedButton;
    frSpeedButton11: TfrSpeedButton;
    procedure frSpeedButton4Click(Sender: TObject);
    procedure frSpeedButton5Click(Sender: TObject);
    procedure frSpeedButton6Click(Sender: TObject);
    procedure frSpeedButton7Click(Sender: TObject);
    procedure frSpeedButton8Click(Sender: TObject);
    procedure frSpeedButton9Click(Sender: TObject);
    procedure frSpeedButton10Click(Sender: TObject);
    procedure frSpeedButton1Click(Sender: TObject);
    procedure frSpeedButton2Click(Sender: TObject);
    procedure frSpeedButton3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure frSpeedButton11Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPreviewRel: TfrmPreviewRel;

implementation

{$R *.DFM}

procedure TfrmPreviewRel.frSpeedButton4Click(Sender: TObject);
begin
  frPreview1.First;
end;

procedure TfrmPreviewRel.frSpeedButton5Click(Sender: TObject);
begin
  frPreview1.Prev;
end;

procedure TfrmPreviewRel.frSpeedButton6Click(Sender: TObject);
begin
  frPreview1.Next;
end;

procedure TfrmPreviewRel.frSpeedButton7Click(Sender: TObject);
begin
  frPreview1.Last;
end;

procedure TfrmPreviewRel.frSpeedButton8Click(Sender: TObject);
begin
  frPreview1.LoadFromFile;
end;

procedure TfrmPreviewRel.frSpeedButton9Click(Sender: TObject);
begin
  frPreview1.SaveToFile;
end;

procedure TfrmPreviewRel.frSpeedButton10Click(Sender: TObject);
begin
  frPreview1.Print;
end;

procedure TfrmPreviewRel.frSpeedButton1Click(Sender: TObject);
begin
  frPreview1.OnePage;
end;

procedure TfrmPreviewRel.frSpeedButton2Click(Sender: TObject);
begin
  frPreview1.Zoom := 100;
end;

procedure TfrmPreviewRel.frSpeedButton3Click(Sender: TObject);
begin
  frPreview1.PageWidth;
end;

procedure TfrmPreviewRel.FormActivate(Sender: TObject);
begin
  frSpeedButton2.Down := True;
  frSpeedButton2Click(nil);
end;

procedure TfrmPreviewRel.frSpeedButton11Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.

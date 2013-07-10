unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    btnGerarRVS: TButton;
    procedure btnGerarRVSClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses RegistroVenda;

{$R *.dfm}

procedure TForm1.btnGerarRVSClick(Sender: TObject);
var
  rvs : IXMLIncluirRVS;
  list : TStringList;
begin
  rvs := NewIncluirRVS;
  list := TStringList.Create;
  rvs.NumeroRVSEmpresa := 'RV00012222';
  list.Text := rvs.XML;
  list.SaveToFile('incluir_registro.xml');
  ShowMessage(list.Text);
end;

end.

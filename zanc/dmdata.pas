unit dmdata;

interface

uses
  SysUtils, Classes, DB, ADODB, ZConnection, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  Tdata = class(TDataModule)
    conDBZanc: TZConnection;
    zqryZanc: TZQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  data: Tdata;

implementation

{$R *.dfm}

end.

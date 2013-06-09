unit Base_MDL;

interface

uses
  Windows, Messages, SysUtils, Variants, TypInfo, ActiveX;

type
  TBase = class(TObject)
  constructor Create; virtual;
  destructor Destroy; override;
  private
    fId : Integer;
    function getId: Integer;
    procedure setIg(const Value: Integer);
  public
    property Id : Integer read getId write setIg;
  end;

implementation

{ TBase }

constructor TBase.Create;
begin

end;

destructor TBase.Destroy;
begin
  inherited;
end;

function TBase.getId: Integer;
begin
  Result := Self.fId;
end;

procedure TBase.setIg(const Value: Integer);
begin
  Self.fId := Value;
end;

end.

unit Base_MDL;

interface

uses
  Windows, Messages, SysUtils, Variants, TypInfo, ActiveX, Constantes;

type
  TBase = class(TObject)
  constructor Create; virtual;
  destructor Destroy; override;
  private
    fId : Integer;
    function getId: Integer;
    procedure setIg(const Value: Integer);
  protected
  public
    procedure Clear; virtual;
    property Id : Integer read getId write setIg;
  end;

implementation

{ TBase }

procedure TBase.Clear;
begin
  Self.Id := NULL_INTEGER;
end;

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

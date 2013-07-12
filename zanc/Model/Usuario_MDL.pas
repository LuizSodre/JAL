unit Usuario_MDL;

interface
uses
  Windows, Messages, SysUtils, Variants, TypInfo, ActiveX, Base_MDL, Constantes;

type
  TUsuario = class(TBase)
    constructor Create; override;
    destructor Destroy; override;
  private
    fNome         : String;
    fLogin     : String;
    fSenha      : String;

    procedure setSenha(const Value: String);
    procedure setNome(const Value: String);
    procedure setLogin(const Value: String);
  protected

  public
    procedure Clear;override;
    property Nome      : String read fNome     write setNome  ;
    property Login     : String read fLogin    write setLogin ;
    property Senha     : String read fSenha    write setSenha ;
  end;

implementation

{ TUsuario }

procedure TUsuario.Clear;
begin
  inherited;
  Self.Nome := NO_STRING;
  Self.Login := NO_STRING;
  Self.Senha := NO_STRING;
end;

constructor TUsuario.Create;
begin
  inherited;
end;

destructor TUsuario.Destroy;
begin
  inherited;
end;

procedure TUsuario.setSenha(const Value: String);
begin
  fSenha := Value;
end;

procedure TUsuario.setNome(const Value: String);
begin
  fNome := Value;
end;

procedure TUsuario.setLogin(const Value: String);
begin
  fLogin := Value;
end;

end.

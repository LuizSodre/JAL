unit Cliente_MDL;

interface
uses
  Windows, Messages, SysUtils, Variants, TypInfo, ActiveX, Base_MDL;

type
  TCliente = class(TBase)
    constructor Create; override;
    destructor Destroy; override;
  private
    fNome         : String;
    fTpPessoa     : String;
    fCpfCnpj      : String;
    fEndereco     : String;
    fNumero       : String;
    fComplemento  : string;
    fBairro       : string;
    fMunicipio    : String;
    fUf           : String;
    fCep          : String;
    fTelefone     : string;
    fFax          : String;
    fEmail        : String;
    procedure setBairro(const Value: string);
    procedure setCep(const Value: String);
    procedure setComplemento(const Value: string);
    procedure setCpfCnpj(const Value: String);
    procedure setEmail(const Value: String);
    procedure setEndereco(const Value: String);
    procedure setFax(const Value: String);
    procedure setMunicipio(const Value: String);
    procedure setNome(const Value: String);
    procedure setNumero(const Value: String);
    procedure setTelefone(const Value: string);
    procedure setTpPessoa(const Value: String);
    procedure setUf(const Value: String);
  protected
  public
    property Nome         : String read fNome        write setNome       ;
    property TpPessoa     : String read fTpPessoa    write setTpPessoa   ;
    property CpfCnpj      : String read fCpfCnpj     write setCpfCnpj    ;
    property Endereco     : String read fEndereco    write setEndereco   ;
    property Numero       : String read fNumero      write setNumero     ;
    property Complemento  : string read fComplemento write setComplemento;
    property Bairro       : string read fBairro      write setBairro     ;
    property Municipio    : String read fMunicipio   write setMunicipio  ;
    property Uf           : String read fUf          write setUf         ;
    property Cep          : String read fCep         write setCep        ;
    property Telefone     : string read fTelefone    write setTelefone   ;
    property Fax          : String read fFax         write setFax        ;
    property Email        : String read fEmail       write setEmail      ;
  end;

implementation

{ TCliente }

constructor TCliente.Create;
begin
  inherited;
end;

destructor TCliente.Destroy;
begin
  inherited;
end;

procedure TCliente.setBairro(const Value: string);
begin
  fBairro := Value;
end;

procedure TCliente.setCep(const Value: String);
begin
  fCep := Value;
end;

procedure TCliente.setComplemento(const Value: string);
begin
  fComplemento := Value;
end;

procedure TCliente.setCpfCnpj(const Value: String);
begin
  fCpfCnpj := Value;
end;

procedure TCliente.setEmail(const Value: String);
begin
  fEmail := Value;
end;

procedure TCliente.setEndereco(const Value: String);
begin
  fEndereco := Value;
end;

procedure TCliente.setFax(const Value: String);
begin
  fFax := Value;
end;

procedure TCliente.setMunicipio(const Value: String);
begin
  fMunicipio := Value;
end;

procedure TCliente.setNome(const Value: String);
begin
  fNome := Value;
end;

procedure TCliente.setNumero(const Value: String);
begin
  fNumero := Value;
end;

procedure TCliente.setTelefone(const Value: string);
begin
  fTelefone := Value;
end;

procedure TCliente.setTpPessoa(const Value: String);
begin
  fTpPessoa := Value;
end;

procedure TCliente.setUf(const Value: String);
begin
  fUf := Value;
end;

end.

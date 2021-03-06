unit Lote_MDL;

interface
uses
  Windows, Messages, SysUtils, Variants, TypInfo, ActiveX, Base_MDL, Cliente_MDL,
  Contratante_MDL, Constantes;

type
  TLote = class(TBase)
    constructor Create; override;
    destructor Destroy; override;
  private
    fContratante: TContratante;
    fCliente: TCliente;
    fOrdemServico: String;
    fNomeArquivo: String;
    fDtEnvioHigiene: TDateTime;
    fDtEnvioPostagem: TDateTime;
    fDtEntrada: TDateTime;
    fDtPostagem: TDateTime;
    fDtRetornoHigiene: TDateTime;
    fDtEnvioImpressao: TDateTime;
    fAno: Integer;
    procedure setDtEntrada(const Value: TDateTime);
    procedure setDtEnvioHigiene(const Value: TDateTime);
    procedure setDtEnvioImpressao(const Value: TDateTime);
    procedure setDtEnvioPostagem(const Value: TDateTime);
    procedure setDtPostagem(const Value: TDateTime);
    procedure setDtRetornoHigiene(const Value: TDateTime);
    procedure setCliente(const Value: TCliente);
    procedure setContratante(const Value: TContratante);
    procedure setNomeArquivo(const Value: String);
    procedure setOrdemServico(const Value: String);
    procedure setAno(const Value: Integer);
  protected
  public
    procedure Clear;override;
    property OrdemServico     : String       read fOrdemServico     write setOrdemServico;
    property NomeArquivo      : String       read fNomeArquivo      write setNomeArquivo;
    property Contratante      : TContratante read fContratante      write setContratante;
    property Cliente          : TCliente     read fCliente          write setCliente;
    property DtEntrada        : TDateTime    read fDtEntrada        write setDtEntrada;
    property DtEnvioHigiene   : TDateTime    read fDtEnvioHigiene   write setDtEnvioHigiene;
    property DtRetornoHigiene : TDateTime    read fDtRetornoHigiene write setDtRetornoHigiene;
    property DtEnvioImpressao : TDateTime    read fDtEnvioImpressao write setDtEnvioImpressao;
    property DtEnvioPostagem  : TDateTime    read fDtEnvioPostagem  write setDtEnvioPostagem;
    property DtPostagem       : TDateTime    read fDtPostagem       write setDtPostagem;
    property Ano              : Integer      read fAno              write setAno;
  end;

implementation

{ TLote }

constructor TLote.Create;
begin
  inherited;
end;

destructor TLote.Destroy;
begin
  inherited;
end;

procedure TLote.setAno(const Value: Integer);
begin
  fAno := Value;
end;

procedure TLote.setDtEntrada(const Value: TDateTime);
begin
  fDtEntrada := Value;
end;

procedure TLote.setDtEnvioHigiene(const Value: TDateTime);
begin
  fDtEnvioHigiene := Value;
end;

procedure TLote.setDtEnvioImpressao(const Value: TDateTime);
begin
  fDtEnvioImpressao := Value;
end;

procedure TLote.setDtEnvioPostagem(const Value: TDateTime);
begin
  fDtEnvioPostagem := Value;
end;

procedure TLote.setDtPostagem(const Value: TDateTime);
begin
  fDtPostagem := Value;
end;

procedure TLote.setDtRetornoHigiene(const Value: TDateTime);
begin
  fDtRetornoHigiene := Value;
end;

procedure TLote.setCliente(const Value: TCliente);
begin
  fCliente := Value;
end;

procedure TLote.setContratante(const Value: TContratante);
begin
  fContratante := Value;
end;

procedure TLote.setNomeArquivo(const Value: String);
begin
  fNomeArquivo := Value;
end;

procedure TLote.setOrdemServico(const Value: String);
begin
  fOrdemServico := Value;
end;

procedure TLote.Clear;
begin
  inherited;
  fContratante      := nil;
  fCliente          := nil;
  fOrdemServico     := NO_STRING;
  fNomeArquivo      := NO_STRING;
  fDtEnvioHigiene   := 0;
  fDtEnvioPostagem  := 0;
  fDtEntrada        := 0;
  fDtPostagem       := 0;
  fDtRetornoHigiene := 0;
  fDtEnvioImpressao := 0;
  fAno              := 0;
end;

end.

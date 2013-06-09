unit Lote_MDL;

interface
uses
  Windows, Messages, SysUtils, Variants, TypInfo, ActiveX, Base_MDL;

type
  TLote = class(TBase)
    constructor Create; override;
    destructor Destroy; override;
  private
    fIdContratante: Integer;
    fIdCliente: Integer;
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
    procedure setIdCliente(const Value: Integer);
    procedure setIdContratante(const Value: Integer);
    procedure setNomeArquivo(const Value: String);
    procedure setOrdemServico(const Value: String);
    procedure setAno(const Value: Integer);

  protected

  public
    property OrdemServico     : String    read fOrdemServico     write setOrdemServico;
    property NomeArquivo      : String    read fNomeArquivo      write setNomeArquivo;
    property IdContratante    : Integer   read fIdContratante    write setIdContratante;
    property IdCliente        : Integer   read fIdCliente        write setIdCliente;
    property DtEntrada        : TDateTime read fDtEntrada        write setDtEntrada;
    property DtEnvioHigiene   : TDateTime read fDtEnvioHigiene   write setDtEnvioHigiene;
    property DtRetornoHigiene : TDateTime read fDtRetornoHigiene write setDtRetornoHigiene;
    property DtEnvioImpressao : TDateTime read fDtEnvioImpressao write setDtEnvioImpressao;
    property DtEnvioPostagem  : TDateTime read fDtEnvioPostagem  write setDtEnvioPostagem;
    property DtPostagem       : TDateTime read fDtPostagem       write setDtPostagem;
    property Ano              : Integer   read fAno              write setAno;
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

procedure TLote.setIdCliente(const Value: Integer);
begin
  fIdCliente := Value;
end;

procedure TLote.setIdContratante(const Value: Integer);
begin
  fIdContratante := Value;
end;

procedure TLote.setNomeArquivo(const Value: String);
begin
  fNomeArquivo := Value;
end;

procedure TLote.setOrdemServico(const Value: String);
begin
  fOrdemServico := Value;
end;

end.

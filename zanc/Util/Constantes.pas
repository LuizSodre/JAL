unit Constantes;

interface

uses
  Windows, SysUtils, Variants, TypInfo, StdCtrls, Wcrypt2, JvCipher;

const
  NO_STRING = '';
  NO_DATESTRING = '  /  /    ';
  NULL_INTEGER = -2147483640;
  CATALOG      = 'CATALOG';
  DATABASE     = 'DATABASE';
  HOSTNAME     = 'HOSTNAME';
  PASSWORD     = 'PASSWORD';
  PORT         = 'PORT';
  USER         = 'USER';
  USUARIOADM   = 'ADMIN';
  PASSADM      = 'PASS4ZANC';
  CHAVESYSTEM  = 'ZANC';

function md5(const Input: String): String;
function getSenhaCripto(const Input: String): String;
function getSenhaDesCripto(const Input: String): String;

function getNumerico(const Numerico: String): String;
function isCpfValido(const Cpf: String; MsgErro:String): boolean;
function isCnpjValido(const Cnpj: String; MsgErro: String): boolean;
function getCpfCnpjValido(const TpPessoa, CpfCnpj, MsgErro: String): Boolean;

var
  UsuarioLogado : string;

implementation

{ Pega somente os d�gitos num�ricos da string }
function getNumerico(const Numerico: String): String;
var
  vIndex: Integer;
begin
  Result := '';
  for vIndex := 1 to Length(Numerico) do
    if Pos(Numerico[vIndex], '0123456789') > 0 then
      Result := Result + Numerico[vIndex];
end;

function md5(const Input: String): String;
var
  hCryptProvider: HCRYPTPROV;
  hHash: HCRYPTHASH;
  bHash: array[0..$7f] of Byte;
  dwHashLen: DWORD;
  pbContent: PByte;
  i: Integer;
begin
  dwHashLen := 16;
  pbContent := Pointer(PChar(Input));
  Result := '';

  if CryptAcquireContext(@hCryptProvider, nil, nil, PROV_RSA_FULL, CRYPT_VERIFYCONTEXT or CRYPT_MACHINE_KEYSET) then
  begin
    if CryptCreateHash(hCryptProvider, CALG_MD5, 0, 0, @hHash) then
    begin
      if CryptHashData(hHash, pbContent, Length(Input), 0) then
      begin
        if CryptGetHashParam(hHash, HP_HASHVAL, @bHash[0], @dwHashLen, 0) then
        begin
          for i := 0 to dwHashLen - 1 do
          begin
            Result := Result + Format('%.2x', [bHash[i]]);
          end;
        end;
      end;
      CryptDestroyHash(hHash);
    end;
    CryptReleaseContext(hCryptProvider, 0);
  end;
  Result := AnsiLowerCase(Result);

end;

function getSenhaCripto(const Input: String): String;
var
  vCripto : TJvVigenereCipher;
begin
  vCripto := TJvVigenereCipher.Create(nil);
  try
    Result := vCripto.EncodeString(CHAVESYSTEM, Input);
  finally
    FreeAndNil(vCripto);
  end;
end;

function getSenhaDesCripto(const Input: String): String;
var
  vCripto : TJvVigenereCipher;
begin
  vCripto := TJvVigenereCipher.Create(nil);
  try
    Result := vCripto.DecodeString(CHAVESYSTEM, Input);
  finally
    FreeAndNil(vCripto);
  end;
end;

{ Retorna true se a string for um CPF v�lido }
function isCpfValido(const Cpf: String; MsgErro: String): boolean;
var
  I, Soma, Digito: integer;
  CalcCPF, S1, S2: string;
  B: boolean;
  C: Char;
begin
  Result := False;

  if Length(S1) <> 11 then
  begin
    MsgErro := 'N�o � CPF, quatidade de digitos diferente de 11.';
    Exit;
  end;

  { Teste se os 11 d�g. s�o iguais }
  B := true;
  C := S1[1];
  for I := 2 to 11 do
  begin
    B := B and (S1[I] = C);
    C := S1[I];
  end;

  if B then
  begin
    MsgErro := 'N�o � CPF, todos os digitos repetidos.';
    Exit;
  end;

  CalcCPF := Copy(S1, 1, 9);

  { C�lculo do 1� d�gito }

  Soma := 0;
  for I := 1 to 9 do
    Soma := Soma + StrToInt(Copy(CalcCPF, I, 1)) * (11 - I);

  Digito := 11 - (Soma mod 11);
  if Digito in [ 10, 11 ] then
    CalcCPF := CalcCPF + '0'
  else
    CalcCPF := CalcCPF + IntToStr(Digito);

  { C�lculo do 2� d�gito }
  Soma := 0;
  for I := 1 to 10 do
    Soma := Soma + StrToInt(Copy(CalcCPF, I, 1)) * (12 - I);

  Digito := 11 - (Soma mod 11);
  if Digito in [ 10, 11 ] then
    CalcCPF := CalcCPF + '0'
  else
    CalcCPF := CalcCPF + IntToStr(Digito);

  if CalcCPF = S1 then
    Result := True
  else
    MsgErro := 'CPF inv�lido.';
end;

{ Retorna true se a string for um CGC v�lido }
function isCnpjValido(const Cnpj: String; MsgErro: String): boolean;
var
  CalcCGC, S1, S2: string;
  I, Soma, Digito: integer;
begin
  Result := False;

  if Length(S1) <> 14  then
  begin
    MsgErro := 'N�o � CNPJ, quantidade de digitos diferente de 14.';
    Exit;
  end;

  if S1 = '00000000000000' then
  begin
    MsgErro := 'N�o � CNPJ, todos os digitos zerados.';
    Exit;
  end;

  CalcCGC := Copy(S1, 1, 12);

  { C�lculo do 1� d�gito }
  Soma := 0;
  for I := 1 to 4 do
    Soma := Soma + StrToInt(Copy(CalcCGC, I, 1)) * (6 - I);

  for I := 1 to 8 do
    Soma := Soma + StrToInt(Copy(CalcCGC, I + 4, 1)) * (10 - I);

  Digito := 11 - (Soma mod 11);
  if Digito in [ 10, 11 ] then
    CalcCGC := CalcCGC + '0'
  else
    CalcCGC := CalcCGC + IntToStr(Digito);

  { C�lculo do 2� d�gito }
  Soma := 0;
  for I := 1 to 5 do
    Soma := Soma + StrToInt(Copy(CalcCGC, I, 1)) * (7 - I);

  for I := 1 to 8 do
    Soma := Soma + StrToInt(Copy(CalcCGC, I + 5, 1)) * (10 - I);

  Digito := 11 - (Soma mod 11);
  if Digito in [ 10, 11 ] then
    CalcCGC := CalcCGC + '0'
  else
    CalcCGC := CalcCGC + IntToStr(Digito);

  if CalcCGC = S1 then
    Result := True
  else
    MsgErro := 'CNPJ inv�lido.';
end;

function getCpfCnpjValido(const TpPessoa, CpfCnpj, MsgErro: String): Boolean;
var
  vCpfCnpj: String;
begin
  Result := False;
  vCpfCnpj := getNumerico(CpfCnpj);

  if   (vCpfCnpj <> NO_STRING)
    and(TpPessoa <> NO_STRING) then
  begin
    if TpPessoa = 'J' then
      Result := isCnpjValido(vCpfCnpj, MsgErro)
    else
    begin
      if TpPessoa = 'F' then
        Result := isCpfValido(vCpfCnpj, MsgErro);
    end;
  end;
end;

end.

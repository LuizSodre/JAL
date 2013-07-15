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

var
  UsuarioLogado : string;


implementation

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

end.

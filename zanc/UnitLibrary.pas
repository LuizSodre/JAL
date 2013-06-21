unit UnitLibrary;

interface
uses
  Windows, SysConst, SysUtils, StdCtrls, IniFiles, Forms, Constantes;

procedure GetBuildInfo(var V1, V2, V3, V4: Word);
function GetVersionInfo: string;


implementation

function LerINI : TIniFile;
var
  vIniFile : TIniFile;
  vNomeArquivo : string;
begin
  //application.Name
  vNomeArquivo := NO_STRING;
  vNomeArquivo := Application.ExeName;
  vIniFile := TIniFile.Create(vNomeArquivo + '.INI');
  Result := vIniFile;
end;

procedure GetBuildInfo(var V1, V2, V3, V4: Word);
var
  VerInfoSize, VerValueSize, Dummy: DWORD;
  VerInfo: Pointer;
  VerValue: PVSFixedFileInfo;
begin
  VerInfoSize := GetFileVersionInfoSize(Pchar(ParamStr(0)), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(Pchar(ParamStr(0)), 0, VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '''', Pointer(VerValue), VerValueSize);
  with VerValue^ do
   begin
    V1 := dwFileVersionMS shr 16;
    V2 := dwFileVersionMS and $FFFF;
    V3 := dwFileVersionLS shr 16;
    V4 := dwFileVersionLS and $FFFF;
   end;
  Freemem(VerInfo, VerInfoSize);
end;

function GetVersionInfo: string;
var
  V1, V2, V3, V4: Word;
begin
  GetBuildInfo(V1, V2, V3, V4);
  Result := IntToStr(V1) + '.' + IntToStr(V2) + IntToStr(V3) + ' (Build ' + IntToStr(V4) + ')';
end;





end.

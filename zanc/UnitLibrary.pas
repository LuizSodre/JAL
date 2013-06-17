unit UnitLibrary;

interface
uses
  Windows, SysConst, SysUtils, StdCtrls, IniFiles, Forms, Constantes;

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

end.

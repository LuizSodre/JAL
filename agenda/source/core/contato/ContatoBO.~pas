unit ContatoBO;

interface

uses
  PressSubject, PressAttributes, CustomBO;

type
  TContatoFoneParts = class;

  TContato = class(TCustomObject)
    _Nome: TPressAnsiString;
    _Endereco: TPressAnsiString;
    _Fones: TContatoFoneParts;
    _Cidade: TPressReference;
  protected
    class function InternalMetadataStr: string; override;
  end;

  TContatoQuery = class(TCustomQuery)
    _Nome: TPressAnsiString;
    _Cidade: TPressReference;
  protected
    class function InternalMetadataStr: string; override;
  end;

  TTipoFone = (tfFixo, tfCelular, tfFax);

  TContatoFone = class(TCustomObject)
    _TipoFone: TPressEnum;
    _Numero: TPressPlainString;
  protected
    class function InternalMetadataStr: string; override;
  end;

  TContatoFoneParts = class(TCustomParts)
  public
    class function ValidObjectClass: TPressObjectClass; override;
  end;

  TCidade = class(TCustomObject)
    _Nome: TPressAnsiString;
    _UF: TPressAnsiString;
  protected
    class function InternalMetadataStr: string; override;
  end;

  TCidadeQuery = class(TCustomQuery)
    _Nome: TPressAnsiString;
  protected
    class function InternalMetadataStr: string; override;
  end;

implementation

{ TContato }

class function TContato.InternalMetadataStr: string;
begin
  Result := 'TContato IsPersistent (' +
   'Nome: AnsiString(60);' +
   'Endereco: AnsiString(80);' +
   'Fones: TContatoFoneParts;' +
   'Cidade: Reference(TCidade);' +
   ')';
end;

{ TContatoQuery }

class function TContatoQuery.InternalMetadataStr: string;
begin
  Result := 'TContatoQuery(TContato) (' +
   'Nome: AnsiString(60);' +
   'Cidade: Reference(TCidade);' +
   ')';
end;

{ TContatoFone }

class function TContatoFone.InternalMetadataStr: string;
begin
   Result := 'TContatoFone IsPersistent (' +
   'TipoFone: Enum(TTipoFone);' +
   'Numero: PlainString(15);' +
   ')';
end;

{ TCidade }

class function TCidade.InternalMetadataStr: string;
begin
  Result := 'TCidade IsPersistent (' +
   'Nome: AnsiString(60);' +
   'UF: AnsiString(2);' +
   ')';
end;

{ TCidadeQuery }

class function TCidadeQuery.InternalMetadataStr: string;
begin
   Result := 'TCidadeQuery(TCidade) (' +
   'Nome: AnsiString(60);' +
   ')';
end;

{ TContatoFoneParts }

class function TContatoFoneParts.ValidObjectClass: TPressObjectClass;
begin
  Result := TContatoFone;
end;

initialization
  PressModel.RegisterEnumMetadata(TypeInfo(TTipoFone), 'TTipoFone',
   ['Fone fixo', 'Celular', 'Fax']);

  TContato.RegisterClass;
  TContatoQuery.RegisterClass;
  TContatoFone.RegisterClass;
  TContatoFoneParts.RegisterAttribute;
  TCidade.RegisterClass;
  TCidadeQuery.RegisterClass;

finalization
  TContato.UnregisterClass;
  TContatoQuery.UnregisterClass;
  TContatoFone.UnregisterClass;
  TContatoFoneParts.UnregisterAttribute;
  TCidade.UnregisterClass;
  TCidadeQuery.UnregisterClass;

end.

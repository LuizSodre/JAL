unit CustomBO;

interface

uses
  PressSubject, PressAttributes;

type
  TCustomObject = class(TPressObject)
  end;

  TCustomQuery = class(TPressQuery)
  end;

  TCustomParts = class(TPressParts)
  end;

  TCustomReferences = class(TPressReferences)
  end;

implementation

initialization
  TCustomObject.RegisterClass;
  TCustomQuery.RegisterClass;
  TCustomParts.RegisterAttribute;
  TCustomReferences.RegisterAttribute;

finalization
  TCustomObject.UnregisterClass;
  TCustomQuery.UnregisterClass;
  TCustomParts.UnregisterAttribute;
  TCustomReferences.UnregisterAttribute;

end.

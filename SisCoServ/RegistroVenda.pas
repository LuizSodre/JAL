
{******************************************************************************}
{                                                                              }
{                               XML Data Binding                               }
{                                                                              }
{         Generated on: 04/07/2013 23:27:15                                    }
{       Generated from: C:\projeto\JAL\SisCoServ\Vendas\incluir_registro.xsd   }
{                                                                              }
{******************************************************************************}

unit RegistroVenda;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLIncluirRVS = interface;
  IXMLTcOperacao = interface;
  IXMLTcOperacaoList = interface;
  IXMLTcEnquadramento = interface;
  IXMLTcEnquadramentoList = interface;
  IXMLTcVincExportacaoBens = interface;
  IXMLTcVincExportacaoBensList = interface;

  IXMLRetificarRVS = interface;

{ IXMLIncluirRVS }

  IXMLIncluirRVS = interface(IXMLNode)
    ['{56A57897-EFFB-4FAF-B851-45864C16C0CB}']
    { Property Accessors }
    function Get_NumeroRVSEmpresa: WideString;
    function Get_NomeAdquirente: WideString;
    function Get_EnderecoAdquirente: WideString;
    function Get_CodigoPaisAdquirente: Integer;
    function Get_Nif: WideString;
    function Get_Operacao: IXMLTcOperacaoList;
    function Get_VincExportacaoBens: IXMLTcVincExportacaoBensList;
    function Get_InfoComplementar: WideString;
    function Get_CodigoMoeda: Integer;
    procedure Set_NumeroRVSEmpresa(Value: WideString);
    procedure Set_NomeAdquirente(Value: WideString);
    procedure Set_EnderecoAdquirente(Value: WideString);
    procedure Set_CodigoPaisAdquirente(Value: Integer);
    procedure Set_Nif(Value: WideString);
    procedure Set_InfoComplementar(Value: WideString);
    procedure Set_CodigoMoeda(Value: Integer);
    { Methods & Properties }
    property NumeroRVSEmpresa: WideString read Get_NumeroRVSEmpresa write Set_NumeroRVSEmpresa;
    property NomeAdquirente: WideString read Get_NomeAdquirente write Set_NomeAdquirente;
    property EnderecoAdquirente: WideString read Get_EnderecoAdquirente write Set_EnderecoAdquirente;
    property CodigoPaisAdquirente: Integer read Get_CodigoPaisAdquirente write Set_CodigoPaisAdquirente;
    property Nif: WideString read Get_Nif write Set_Nif;
    property Operacao: IXMLTcOperacaoList read Get_Operacao;
    property VincExportacaoBens: IXMLTcVincExportacaoBensList read Get_VincExportacaoBens;
    property InfoComplementar: WideString read Get_InfoComplementar write Set_InfoComplementar;
    property CodigoMoeda: Integer read Get_CodigoMoeda write Set_CodigoMoeda;
  end;

{ IXMLTcOperacao }

  IXMLTcOperacao = interface(IXMLNode)
    ['{4F00D323-0C4D-4376-9D50-E1BB285FDDB9}']
    { Property Accessors }
    function Get_NumeroOperacaoEmpresa: WideString;
    function Get_CodigoNbs: WideString;
    function Get_CodigoPaisDestino: Integer;
    function Get_ModoPrestacao: Integer;
    function Get_DataInicio: WideString;
    function Get_DataConclusao: WideString;
    function Get_Valor: WideString;
    function Get_Enquadramento: IXMLTcEnquadramentoList;
    procedure Set_NumeroOperacaoEmpresa(Value: WideString);
    procedure Set_CodigoNbs(Value: WideString);
    procedure Set_CodigoPaisDestino(Value: Integer);
    procedure Set_ModoPrestacao(Value: Integer);
    procedure Set_DataInicio(Value: WideString);
    procedure Set_DataConclusao(Value: WideString);
    procedure Set_Valor(Value: WideString);
    { Methods & Properties }
    property NumeroOperacaoEmpresa: WideString read Get_NumeroOperacaoEmpresa write Set_NumeroOperacaoEmpresa;
    property CodigoNbs: WideString read Get_CodigoNbs write Set_CodigoNbs;
    property CodigoPaisDestino: Integer read Get_CodigoPaisDestino write Set_CodigoPaisDestino;
    property ModoPrestacao: Integer read Get_ModoPrestacao write Set_ModoPrestacao;
    property DataInicio: WideString read Get_DataInicio write Set_DataInicio;
    property DataConclusao: WideString read Get_DataConclusao write Set_DataConclusao;
    property Valor: WideString read Get_Valor write Set_Valor;
    property Enquadramento: IXMLTcEnquadramentoList read Get_Enquadramento;
  end;

{ IXMLTcOperacaoList }

  IXMLTcOperacaoList = interface(IXMLNodeCollection)
    ['{F88C983E-2854-46F0-A572-0F3EDC63A4CB}']
    { Methods & Properties }
    function Add: IXMLTcOperacao;
    function Insert(const Index: Integer): IXMLTcOperacao;
    function Get_Item(Index: Integer): IXMLTcOperacao;
    property Items[Index: Integer]: IXMLTcOperacao read Get_Item; default;
  end;

{ IXMLTcEnquadramento }

  IXMLTcEnquadramento = interface(IXMLNode)
    ['{531BAA79-2465-4110-B28B-238EB0F634E8}']
    { Property Accessors }
    function Get_CodigoEnquadramento: Integer;
    function Get_NumeroRc: WideString;
    function Get_Exclusao: Boolean;
    procedure Set_CodigoEnquadramento(Value: Integer);
    procedure Set_NumeroRc(Value: WideString);
    procedure Set_Exclusao(Value: Boolean);
    { Methods & Properties }
    property CodigoEnquadramento: Integer read Get_CodigoEnquadramento write Set_CodigoEnquadramento;
    property NumeroRc: WideString read Get_NumeroRc write Set_NumeroRc;
    property Exclusao: Boolean read Get_Exclusao write Set_Exclusao;
  end;

{ IXMLTcEnquadramentoList }

  IXMLTcEnquadramentoList = interface(IXMLNodeCollection)
    ['{4A22E06B-8991-456E-AF42-C7ECBCBF128A}']
    { Methods & Properties }
    function Add: IXMLTcEnquadramento;
    function Insert(const Index: Integer): IXMLTcEnquadramento;
    function Get_Item(Index: Integer): IXMLTcEnquadramento;
    property Items[Index: Integer]: IXMLTcEnquadramento read Get_Item; default;
  end;

{ IXMLTcVincExportacaoBens }

  IXMLTcVincExportacaoBens = interface(IXMLNode)
    ['{97AF329B-4A1F-4071-A81C-135F603C8616}']
    { Property Accessors }
    function Get_NumeroRE: WideString;
    function Get_Exclusao: Boolean;
    procedure Set_NumeroRE(Value: WideString);
    procedure Set_Exclusao(Value: Boolean);
    { Methods & Properties }
    property NumeroRE: WideString read Get_NumeroRE write Set_NumeroRE;
    property Exclusao: Boolean read Get_Exclusao write Set_Exclusao;
  end;

{ IXMLTcVincExportacaoBensList }

  IXMLTcVincExportacaoBensList = interface(IXMLNodeCollection)
    ['{BB4D5627-5A29-491C-8178-47EE955ACB7B}']
    { Methods & Properties }
    function Add: IXMLTcVincExportacaoBens;
    function Insert(const Index: Integer): IXMLTcVincExportacaoBens;
    function Get_Item(Index: Integer): IXMLTcVincExportacaoBens;
    property Items[Index: Integer]: IXMLTcVincExportacaoBens read Get_Item; default;
  end;

  { IXMLRetificarRVS }

  IXMLRetificarRVS = interface(IXMLNode)
    ['{80C76621-61A6-481C-AADC-D57235030F46}']
    { Property Accessors }
    function Get_NumeroRVSEmpresa: WideString;
    function Get_NomeAdquirente: WideString;
    function Get_EnderecoAdquirente: WideString;
    function Get_CodigoPaisAdquirente: Integer;
    function Get_Nif: WideString;
    function Get_Operacao: IXMLTcOperacaoList;
    function Get_VincExportacaoBens: IXMLTcVincExportacaoBensList;
    function Get_InfoComplementar: WideString;
    function Get_CodigoMoeda: Integer;
    procedure Set_NumeroRVSEmpresa(Value: WideString);
    procedure Set_NomeAdquirente(Value: WideString);
    procedure Set_EnderecoAdquirente(Value: WideString);
    procedure Set_CodigoPaisAdquirente(Value: Integer);
    procedure Set_Nif(Value: WideString);
    procedure Set_InfoComplementar(Value: WideString);
    procedure Set_CodigoMoeda(Value: Integer);
    { Methods & Properties }
    property NumeroRVSEmpresa: WideString read Get_NumeroRVSEmpresa write Set_NumeroRVSEmpresa;
    property NomeAdquirente: WideString read Get_NomeAdquirente write Set_NomeAdquirente;
    property EnderecoAdquirente: WideString read Get_EnderecoAdquirente write Set_EnderecoAdquirente;
    property CodigoPaisAdquirente: Integer read Get_CodigoPaisAdquirente write Set_CodigoPaisAdquirente;
    property Nif: WideString read Get_Nif write Set_Nif;
    property Operacao: IXMLTcOperacaoList read Get_Operacao;
    property VincExportacaoBens: IXMLTcVincExportacaoBensList read Get_VincExportacaoBens;
    property InfoComplementar: WideString read Get_InfoComplementar write Set_InfoComplementar;
    property CodigoMoeda: Integer read Get_CodigoMoeda write Set_CodigoMoeda;
  end;


{ Forward Decls }

  TXMLIncluirRVS = class;
  TXMLTcOperacao = class;
  TXMLTcOperacaoList = class;
  TXMLTcEnquadramento = class;
  TXMLTcEnquadramentoList = class;
  TXMLTcVincExportacaoBens = class;
  TXMLTcVincExportacaoBensList = class;

{ TXMLIncluirRVS }

  TXMLIncluirRVS = class(TXMLNode, IXMLIncluirRVS)
  private
    FOperacao: IXMLTcOperacaoList;
    FVincExportacaoBens: IXMLTcVincExportacaoBensList;
  protected
    { IXMLIncluirRVS }
    function Get_NumeroRVSEmpresa: WideString;
    function Get_NomeAdquirente: WideString;
    function Get_EnderecoAdquirente: WideString;
    function Get_CodigoPaisAdquirente: Integer;
    function Get_Nif: WideString;
    function Get_Operacao: IXMLTcOperacaoList;
    function Get_VincExportacaoBens: IXMLTcVincExportacaoBensList;
    function Get_InfoComplementar: WideString;
    function Get_CodigoMoeda: Integer;
    procedure Set_NumeroRVSEmpresa(Value: WideString);
    procedure Set_NomeAdquirente(Value: WideString);
    procedure Set_EnderecoAdquirente(Value: WideString);
    procedure Set_CodigoPaisAdquirente(Value: Integer);
    procedure Set_Nif(Value: WideString);
    procedure Set_InfoComplementar(Value: WideString);
    procedure Set_CodigoMoeda(Value: Integer);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTcOperacao }

  TXMLTcOperacao = class(TXMLNode, IXMLTcOperacao)
  private
    FEnquadramento: IXMLTcEnquadramentoList;
  protected
    { IXMLTcOperacao }
    function Get_NumeroOperacaoEmpresa: WideString;
    function Get_CodigoNbs: WideString;
    function Get_CodigoPaisDestino: Integer;
    function Get_ModoPrestacao: Integer;
    function Get_DataInicio: WideString;
    function Get_DataConclusao: WideString;
    function Get_Valor: WideString;
    function Get_Enquadramento: IXMLTcEnquadramentoList;
    procedure Set_NumeroOperacaoEmpresa(Value: WideString);
    procedure Set_CodigoNbs(Value: WideString);
    procedure Set_CodigoPaisDestino(Value: Integer);
    procedure Set_ModoPrestacao(Value: Integer);
    procedure Set_DataInicio(Value: WideString);
    procedure Set_DataConclusao(Value: WideString);
    procedure Set_Valor(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTcOperacaoList }

  TXMLTcOperacaoList = class(TXMLNodeCollection, IXMLTcOperacaoList)
  protected
    { IXMLTcOperacaoList }
    function Add: IXMLTcOperacao;
    function Insert(const Index: Integer): IXMLTcOperacao;
    function Get_Item(Index: Integer): IXMLTcOperacao;
  end;

{ TXMLTcEnquadramento }

  TXMLTcEnquadramento = class(TXMLNode, IXMLTcEnquadramento)
  protected
    { IXMLTcEnquadramento }
    function Get_CodigoEnquadramento: Integer;
    function Get_NumeroRc: WideString;
    function Get_Exclusao: Boolean;
    procedure Set_CodigoEnquadramento(Value: Integer);
    procedure Set_NumeroRc(Value: WideString);
    procedure Set_Exclusao(Value: Boolean);
  end;

{ TXMLTcEnquadramentoList }

  TXMLTcEnquadramentoList = class(TXMLNodeCollection, IXMLTcEnquadramentoList)
  protected
    { IXMLTcEnquadramentoList }
    function Add: IXMLTcEnquadramento;
    function Insert(const Index: Integer): IXMLTcEnquadramento;
    function Get_Item(Index: Integer): IXMLTcEnquadramento;
  end;

{ TXMLTcVincExportacaoBens }

  TXMLTcVincExportacaoBens = class(TXMLNode, IXMLTcVincExportacaoBens)
  protected
    { IXMLTcVincExportacaoBens }
    function Get_NumeroRE: WideString;
    function Get_Exclusao: Boolean;
    procedure Set_NumeroRE(Value: WideString);
    procedure Set_Exclusao(Value: Boolean);
  end;

{ TXMLTcVincExportacaoBensList }

  TXMLTcVincExportacaoBensList = class(TXMLNodeCollection, IXMLTcVincExportacaoBensList)
  protected
    { IXMLTcVincExportacaoBensList }
    function Add: IXMLTcVincExportacaoBens;
    function Insert(const Index: Integer): IXMLTcVincExportacaoBens;
    function Get_Item(Index: Integer): IXMLTcVincExportacaoBens;
  end;

{ TXMLRetificarRVS }

  TXMLRetificarRVS = class(TXMLNode, IXMLRetificarRVS)
  private
    FOperacao: IXMLTcOperacaoList;
    FVincExportacaoBens: IXMLTcVincExportacaoBensList;
  protected
    { IXMLRetificarRVS }
    function Get_NumeroRVSEmpresa: WideString;
    function Get_NomeAdquirente: WideString;
    function Get_EnderecoAdquirente: WideString;
    function Get_CodigoPaisAdquirente: Integer;
    function Get_Nif: WideString;
    function Get_Operacao: IXMLTcOperacaoList;
    function Get_VincExportacaoBens: IXMLTcVincExportacaoBensList;
    function Get_InfoComplementar: WideString;
    function Get_CodigoMoeda: Integer;
    procedure Set_NumeroRVSEmpresa(Value: WideString);
    procedure Set_NomeAdquirente(Value: WideString);
    procedure Set_EnderecoAdquirente(Value: WideString);
    procedure Set_CodigoPaisAdquirente(Value: Integer);
    procedure Set_Nif(Value: WideString);
    procedure Set_InfoComplementar(Value: WideString);
    procedure Set_CodigoMoeda(Value: Integer);
  public
    procedure AfterConstruction; override;
  end;


{ Global Functions }

function GetIncluirRVS(Doc: IXMLDocument): IXMLIncluirRVS;
function LoadIncluirRVS(const FileName: WideString): IXMLIncluirRVS;
function NewIncluirRVS: IXMLIncluirRVS;
function GetRetificarRVS(Doc: IXMLDocument): IXMLRetificarRVS;
function LoadRetificarRVS(const FileName: WideString): IXMLRetificarRVS;
function NewRetificarRVS: IXMLRetificarRVS;


const
  TargetNamespace = '';

implementation

{ Global Functions }

function GetIncluirRVS(Doc: IXMLDocument): IXMLIncluirRVS;
begin
  Result := Doc.GetDocBinding('IncluirRVS', TXMLIncluirRVS, TargetNamespace) as IXMLIncluirRVS;
end;

function LoadIncluirRVS(const FileName: WideString): IXMLIncluirRVS;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('IncluirRVS', TXMLIncluirRVS, TargetNamespace) as IXMLIncluirRVS;
end;

function NewIncluirRVS: IXMLIncluirRVS;
begin
  Result := NewXMLDocument.GetDocBinding('IncluirRVS', TXMLIncluirRVS, TargetNamespace) as IXMLIncluirRVS;
end;

function GetRetificarRVS(Doc: IXMLDocument): IXMLRetificarRVS;
begin
  Result := Doc.GetDocBinding('RetificarRVS', TXMLRetificarRVS, TargetNamespace) as IXMLRetificarRVS;
end;

function LoadRetificarRVS(const FileName: WideString): IXMLRetificarRVS;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('RetificarRVS', TXMLRetificarRVS, TargetNamespace) as IXMLRetificarRVS;
end;

function NewRetificarRVS: IXMLRetificarRVS;
begin
  Result := NewXMLDocument.GetDocBinding('RetificarRVS', TXMLRetificarRVS, TargetNamespace) as IXMLRetificarRVS;
end;


{ TXMLIncluirRVS }

procedure TXMLIncluirRVS.AfterConstruction;
begin
  RegisterChildNode('Operacao', TXMLTcOperacao);
  RegisterChildNode('VincExportacaoBens', TXMLTcVincExportacaoBens);
  FOperacao := CreateCollection(TXMLTcOperacaoList, IXMLTcOperacao, 'Operacao') as IXMLTcOperacaoList;
  FVincExportacaoBens := CreateCollection(TXMLTcVincExportacaoBensList, IXMLTcVincExportacaoBens, 'VincExportacaoBens') as IXMLTcVincExportacaoBensList;
  inherited;
end;

function TXMLIncluirRVS.Get_NumeroRVSEmpresa: WideString;
begin
  Result := ChildNodes['NumeroRVSEmpresa'].Text;
end;

procedure TXMLIncluirRVS.Set_NumeroRVSEmpresa(Value: WideString);
begin
  ChildNodes['NumeroRVSEmpresa'].NodeValue := Value;
end;

function TXMLIncluirRVS.Get_NomeAdquirente: WideString;
begin
  Result := ChildNodes['NomeAdquirente'].Text;
end;

procedure TXMLIncluirRVS.Set_NomeAdquirente(Value: WideString);
begin
  ChildNodes['NomeAdquirente'].NodeValue := Value;
end;

function TXMLIncluirRVS.Get_EnderecoAdquirente: WideString;
begin
  Result := ChildNodes['EnderecoAdquirente'].Text;
end;

procedure TXMLIncluirRVS.Set_EnderecoAdquirente(Value: WideString);
begin
  ChildNodes['EnderecoAdquirente'].NodeValue := Value;
end;

function TXMLIncluirRVS.Get_CodigoPaisAdquirente: Integer;
begin
  Result := ChildNodes['CodigoPaisAdquirente'].NodeValue;
end;

procedure TXMLIncluirRVS.Set_CodigoPaisAdquirente(Value: Integer);
begin
  ChildNodes['CodigoPaisAdquirente'].NodeValue := Value;
end;

function TXMLIncluirRVS.Get_Nif: WideString;
begin
  Result := ChildNodes['Nif'].Text;
end;

procedure TXMLIncluirRVS.Set_Nif(Value: WideString);
begin
  ChildNodes['Nif'].NodeValue := Value;
end;

function TXMLIncluirRVS.Get_Operacao: IXMLTcOperacaoList;
begin
  Result := FOperacao;
end;

function TXMLIncluirRVS.Get_VincExportacaoBens: IXMLTcVincExportacaoBensList;
begin
  Result := FVincExportacaoBens;
end;

function TXMLIncluirRVS.Get_InfoComplementar: WideString;
begin
  Result := ChildNodes['InfoComplementar'].Text;
end;

procedure TXMLIncluirRVS.Set_InfoComplementar(Value: WideString);
begin
  ChildNodes['InfoComplementar'].NodeValue := Value;
end;

function TXMLIncluirRVS.Get_CodigoMoeda: Integer;
begin
  Result := ChildNodes['CodigoMoeda'].NodeValue;
end;

procedure TXMLIncluirRVS.Set_CodigoMoeda(Value: Integer);
begin
  ChildNodes['CodigoMoeda'].NodeValue := Value;
end;

{ TXMLTcOperacao }

procedure TXMLTcOperacao.AfterConstruction;
begin
  RegisterChildNode('Enquadramento', TXMLTcEnquadramento);
  FEnquadramento := CreateCollection(TXMLTcEnquadramentoList, IXMLTcEnquadramento, 'Enquadramento') as IXMLTcEnquadramentoList;
  inherited;
end;

function TXMLTcOperacao.Get_NumeroOperacaoEmpresa: WideString;
begin
  Result := ChildNodes['NumeroOperacaoEmpresa'].Text;
end;

procedure TXMLTcOperacao.Set_NumeroOperacaoEmpresa(Value: WideString);
begin
  ChildNodes['NumeroOperacaoEmpresa'].NodeValue := Value;
end;

function TXMLTcOperacao.Get_CodigoNbs: WideString;
begin
  Result := ChildNodes['CodigoNbs'].Text;
end;

procedure TXMLTcOperacao.Set_CodigoNbs(Value: WideString);
begin
  ChildNodes['CodigoNbs'].NodeValue := Value;
end;

function TXMLTcOperacao.Get_CodigoPaisDestino: Integer;
begin
  Result := ChildNodes['CodigoPaisDestino'].NodeValue;
end;

procedure TXMLTcOperacao.Set_CodigoPaisDestino(Value: Integer);
begin
  ChildNodes['CodigoPaisDestino'].NodeValue := Value;
end;

function TXMLTcOperacao.Get_ModoPrestacao: Integer;
begin
  Result := ChildNodes['ModoPrestacao'].NodeValue;
end;

procedure TXMLTcOperacao.Set_ModoPrestacao(Value: Integer);
begin
  ChildNodes['ModoPrestacao'].NodeValue := Value;
end;

function TXMLTcOperacao.Get_DataInicio: WideString;
begin
  Result := ChildNodes['DataInicio'].Text;
end;

procedure TXMLTcOperacao.Set_DataInicio(Value: WideString);
begin
  ChildNodes['DataInicio'].NodeValue := Value;
end;

function TXMLTcOperacao.Get_DataConclusao: WideString;
begin
  Result := ChildNodes['DataConclusao'].Text;
end;

procedure TXMLTcOperacao.Set_DataConclusao(Value: WideString);
begin
  ChildNodes['DataConclusao'].NodeValue := Value;
end;

function TXMLTcOperacao.Get_Valor: WideString;
begin
  Result := ChildNodes['Valor'].Text;
end;

procedure TXMLTcOperacao.Set_Valor(Value: WideString);
begin
  ChildNodes['Valor'].NodeValue := Value;
end;

function TXMLTcOperacao.Get_Enquadramento: IXMLTcEnquadramentoList;
begin
  Result := FEnquadramento;
end;

{ TXMLTcOperacaoList }

function TXMLTcOperacaoList.Add: IXMLTcOperacao;
begin
  Result := AddItem(-1) as IXMLTcOperacao;
end;

function TXMLTcOperacaoList.Insert(const Index: Integer): IXMLTcOperacao;
begin
  Result := AddItem(Index) as IXMLTcOperacao;
end;
function TXMLTcOperacaoList.Get_Item(Index: Integer): IXMLTcOperacao;
begin
  Result := List[Index] as IXMLTcOperacao;
end;

{ TXMLTcEnquadramento }

function TXMLTcEnquadramento.Get_CodigoEnquadramento: Integer;
begin
  Result := ChildNodes['CodigoEnquadramento'].NodeValue;
end;

procedure TXMLTcEnquadramento.Set_CodigoEnquadramento(Value: Integer);
begin
  ChildNodes['CodigoEnquadramento'].NodeValue := Value;
end;

function TXMLTcEnquadramento.Get_NumeroRc: WideString;
begin
  Result := ChildNodes['NumeroRc'].Text;
end;

procedure TXMLTcEnquadramento.Set_NumeroRc(Value: WideString);
begin
  ChildNodes['NumeroRc'].NodeValue := Value;
end;

function TXMLTcEnquadramento.Get_Exclusao: Boolean;
begin
  Result := ChildNodes['exclusao'].NodeValue;
end;

procedure TXMLTcEnquadramento.Set_Exclusao(Value: Boolean);
begin
  ChildNodes['exclusao'].NodeValue := Value;
end;

{ TXMLTcEnquadramentoList }

function TXMLTcEnquadramentoList.Add: IXMLTcEnquadramento;
begin
  Result := AddItem(-1) as IXMLTcEnquadramento;
end;

function TXMLTcEnquadramentoList.Insert(const Index: Integer): IXMLTcEnquadramento;
begin
  Result := AddItem(Index) as IXMLTcEnquadramento;
end;
function TXMLTcEnquadramentoList.Get_Item(Index: Integer): IXMLTcEnquadramento;
begin
  Result := List[Index] as IXMLTcEnquadramento;
end;

{ TXMLTcVincExportacaoBens }

function TXMLTcVincExportacaoBens.Get_NumeroRE: WideString;
begin
  Result := ChildNodes['NumeroRE'].Text;
end;

procedure TXMLTcVincExportacaoBens.Set_NumeroRE(Value: WideString);
begin
  ChildNodes['NumeroRE'].NodeValue := Value;
end;

function TXMLTcVincExportacaoBens.Get_Exclusao: Boolean;
begin
  Result := ChildNodes['exclusao'].NodeValue;
end;

procedure TXMLTcVincExportacaoBens.Set_Exclusao(Value: Boolean);
begin
  ChildNodes['exclusao'].NodeValue := Value;
end;

{ TXMLTcVincExportacaoBensList }

function TXMLTcVincExportacaoBensList.Add: IXMLTcVincExportacaoBens;
begin
  Result := AddItem(-1) as IXMLTcVincExportacaoBens;
end;

function TXMLTcVincExportacaoBensList.Insert(const Index: Integer): IXMLTcVincExportacaoBens;
begin
  Result := AddItem(Index) as IXMLTcVincExportacaoBens;
end;
function TXMLTcVincExportacaoBensList.Get_Item(Index: Integer): IXMLTcVincExportacaoBens;
begin
  Result := List[Index] as IXMLTcVincExportacaoBens;
end;

{ TXMLRetificarRVS }

procedure TXMLRetificarRVS.AfterConstruction;
begin
  RegisterChildNode('Operacao', TXMLTcOperacao);
  RegisterChildNode('VincExportacaoBens', TXMLTcVincExportacaoBens);
  FOperacao := CreateCollection(TXMLTcOperacaoList, IXMLTcOperacao, 'Operacao') as IXMLTcOperacaoList;
  FVincExportacaoBens := CreateCollection(TXMLTcVincExportacaoBensList, IXMLTcVincExportacaoBens, 'VincExportacaoBens') as IXMLTcVincExportacaoBensList;
  inherited;
end;

function TXMLRetificarRVS.Get_NumeroRVSEmpresa: WideString;
begin
  Result := ChildNodes['NumeroRVSEmpresa'].Text;
end;

procedure TXMLRetificarRVS.Set_NumeroRVSEmpresa(Value: WideString);
begin
  ChildNodes['NumeroRVSEmpresa'].NodeValue := Value;
end;

function TXMLRetificarRVS.Get_NomeAdquirente: WideString;
begin
  Result := ChildNodes['NomeAdquirente'].Text;
end;

procedure TXMLRetificarRVS.Set_NomeAdquirente(Value: WideString);
begin
  ChildNodes['NomeAdquirente'].NodeValue := Value;
end;

function TXMLRetificarRVS.Get_EnderecoAdquirente: WideString;
begin
  Result := ChildNodes['EnderecoAdquirente'].Text;
end;

procedure TXMLRetificarRVS.Set_EnderecoAdquirente(Value: WideString);
begin
  ChildNodes['EnderecoAdquirente'].NodeValue := Value;
end;

function TXMLRetificarRVS.Get_CodigoPaisAdquirente: Integer;
begin
  Result := ChildNodes['CodigoPaisAdquirente'].NodeValue;
end;

procedure TXMLRetificarRVS.Set_CodigoPaisAdquirente(Value: Integer);
begin
  ChildNodes['CodigoPaisAdquirente'].NodeValue := Value;
end;

function TXMLRetificarRVS.Get_Nif: WideString;
begin
  Result := ChildNodes['Nif'].Text;
end;

procedure TXMLRetificarRVS.Set_Nif(Value: WideString);
begin
  ChildNodes['Nif'].NodeValue := Value;
end;

function TXMLRetificarRVS.Get_Operacao: IXMLTcOperacaoList;
begin
  Result := FOperacao;
end;

function TXMLRetificarRVS.Get_VincExportacaoBens: IXMLTcVincExportacaoBensList;
begin
  Result := FVincExportacaoBens;
end;

function TXMLRetificarRVS.Get_InfoComplementar: WideString;
begin
  Result := ChildNodes['InfoComplementar'].Text;
end;

procedure TXMLRetificarRVS.Set_InfoComplementar(Value: WideString);
begin
  ChildNodes['InfoComplementar'].NodeValue := Value;
end;

function TXMLRetificarRVS.Get_CodigoMoeda: Integer;
begin
  Result := ChildNodes['CodigoMoeda'].NodeValue;
end;

procedure TXMLRetificarRVS.Set_CodigoMoeda(Value: Integer);
begin
  ChildNodes['CodigoMoeda'].NodeValue := Value;
end;


end.
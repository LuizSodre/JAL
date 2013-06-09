unit ContatoMVP;

interface

uses
  CustomMVP;

type
  TContatoEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  TContatoQueryPresenter = class(TCustomQueryPresenter)
  protected
    procedure InitPresenter; override;
    function InternalQueryItemsDisplayNames: string; override;
  end;

  TContatoFoneEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  TCidadeEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  TCidadeQueryPresenter = class(TCustomQueryPresenter)
  protected
    procedure InitPresenter; override;
    function InternalQueryItemsDisplayNames: string; override;
  end;

implementation

uses
  ContatoBO;

{ TContatoEditPresenter }

procedure TContatoEditPresenter.InitPresenter;
begin
  inherited;
  CreateSubPresenter('Nome', 'edtNome');
  CreateSubPresenter('Endereco', 'edtEndereco');
  CreateSubPresenter('Fones', 'grdFones', 'TipoFone;Numero');
  CreateSubPresenter('Cidade', 'cbCidade', 'Nome');
end;

{ TContatoQueryPresenter }

procedure TContatoQueryPresenter.InitPresenter;
begin
  inherited;
  CreateSubPresenter('Nome', 'edtNome');
  CreateSubPresenter('Cidade', 'cbCidade', 'Nome');
end;

function TContatoQueryPresenter.InternalQueryItemsDisplayNames: string;
begin
  Result := 'Nome;Cidade.Nome';
end;

{ TContatoFoneEditPresenter }

procedure TContatoFoneEditPresenter.InitPresenter;
begin
  inherited;
  CreateSubPresenter('TipoFone', 'cbTipoFone');
  CreateSubPresenter('Numero', 'edtNumero');
end;

{ TCidadeEditPresenter }

procedure TCidadeEditPresenter.InitPresenter;
begin
  inherited;
  CreateSubPresenter('Nome', 'edtNome');
  CreateSubPresenter('UF', 'cbUF');
end;

{ TCidadeQueryPresenter }

procedure TCidadeQueryPresenter.InitPresenter;
begin
  inherited;
  CreateSubPresenter('Nome', 'edtNome');
end;

function TCidadeQueryPresenter.InternalQueryItemsDisplayNames: string;
begin
  Result := 'Nome;UF';
end;

initialization
  TContatoEditPresenter.RegisterBO(TContato);
  TContatoQueryPresenter.RegisterBO(TContatoQuery);
  TContatoFoneEditPresenter.RegisterBO(TContatoFone);
  TCidadeEditPresenter.RegisterBO(TCidade);
  TCidadeQueryPresenter.RegisterBO(TCidadeQuery);

end.

unit Delphiscal.Ipi50AdValorem;

interface

uses Delphiscal.Ipi.Base, Delphiscal.Ipi50AdValorem.Intf;

type
  TIpi50AdValorem = class(TInterfacedObject, IIpi50AdValorem)
  private
    FBaseIpi: TBaseIpi;
    FAliquotaIpi: Currency;
  public
    constructor Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AAliquotaIpi: Currency);
    function BaseIpi: Currency;
    function ValorIpi: Currency;
    destructor Destroy; override;
  end;

implementation

uses acbrutil.math;

constructor TIpi50AdValorem.Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AAliquotaIpi: Currency);
begin
  FBaseIpi := TBaseIpi.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias);
  FAliquotaIpi := AAliquotaIpi;
end;

function TIpi50AdValorem.BaseIpi: Currency;
begin
  Result := FBaseIpi.CalcularBaseIpi;
end;

destructor TIpi50AdValorem.Destroy;
begin
  FBaseIpi.Free;
  inherited;
end;

function TIpi50AdValorem.ValorIpi: Currency;
begin
  Result := RoundABNT(BaseIpi * (FAliquotaIpi / 100), 2);
end;

end.

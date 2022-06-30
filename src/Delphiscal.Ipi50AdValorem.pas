unit Delphiscal.Ipi50AdValorem;

interface

uses Delphiscal.Ipi.Base, Delphiscal.Ipi50AdValorem.Intf;

type
  TIpi50AdValorem = class(TInterfacedObject, IIpi50AdValorem)
  private
    FBaseIpi: TBaseIpi;
    FAliquotaIpi: Double;
    function BaseIpi: Double;
    function ValorIpi: Double;
  public
    constructor Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AAliquotaIpi: Double);
    class function New(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AAliquotaIpi: Double): IIpi50AdValorem;
    destructor Destroy; override;
  end;

implementation

uses Delphiscal.Utils;

constructor TIpi50AdValorem.Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AAliquotaIpi: Double);
begin
  FBaseIpi := TBaseIpi.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias);
  FAliquotaIpi := AAliquotaIpi;
end;

function TIpi50AdValorem.BaseIpi: Double;
begin
  Result := FBaseIpi.CalcularBaseIpi;
end;

destructor TIpi50AdValorem.Destroy;
begin
  FBaseIpi.Free;
  inherited;
end;

class function TIpi50AdValorem.New(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AAliquotaIpi: Double): IIpi50AdValorem;
begin
  Result := TIpi50AdValorem.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AAliquotaIpi);
end;

function TIpi50AdValorem.ValorIpi: Double;
begin
  Result := RoundABNT(BaseIpi * (FAliquotaIpi / 100), 2);
end;

end.

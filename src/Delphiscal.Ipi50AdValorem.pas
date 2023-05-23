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
    class function New(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AAliquotaIpi: Double): IIpi50AdValorem;
    constructor Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AAliquotaIpi: Double);
    destructor Destroy; override;
  end;

implementation

uses Delphiscal.Utils;

class function TIpi50AdValorem.New(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AAliquotaIpi: Double): IIpi50AdValorem;
begin
  Result := TIpi50AdValorem.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AAliquotaIpi);
end;

constructor TIpi50AdValorem.Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AAliquotaIpi: Double);
begin
  FBaseIpi := TBaseIpi.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias);
  FAliquotaIpi := AAliquotaIpi;
end;

destructor TIpi50AdValorem.Destroy;
begin
  FBaseIpi.Free;
  inherited;
end;

function TIpi50AdValorem.BaseIpi: Double;
begin
  Result := FBaseIpi.CalcularBaseIpi;
end;

function TIpi50AdValorem.ValorIpi: Double;
begin
  Result := RoundABNT(BaseIpi * (FAliquotaIpi / 100), 2);
end;

end.

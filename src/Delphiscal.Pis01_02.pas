unit Delphiscal.Pis01_02;

interface

uses Delphiscal.Pis.Base, Delphiscal.Pis01_02.Intf;

type
  TPis01_02 = class(TInterfacedObject, IPis01_02)
  private
    FBasePis: TBasePis;
    FAliquotaPis: Double;
    function BasePis: Double;
    function ValorPis: Double;
  public
    constructor Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaPis: Double);
    class function New(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaPis: Double): IPis01_02;
    destructor Destroy; override;
  end;

implementation

uses Delphiscal.Utils;

function TPis01_02.BasePis: Double;
begin
  Result := FBasePis.CalcularBasePis;
end;

constructor TPis01_02.Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto,
  AAliquotaPis: Double);
begin
  FBasePis := TBasePis.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto);
  FAliquotaPis := AAliquotaPis;
end;

destructor TPis01_02.Destroy;
begin
  FBasePis.Free;
  inherited;
end;

class function TPis01_02.New(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto,
  AAliquotaPis: Double): IPis01_02;
begin
  Result := TPis01_02.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaPis);
end;

function TPis01_02.ValorPis: Double;
begin
  Result := RoundABNT(BasePis * (FAliquotaPis / 100), 2);
end;

end.

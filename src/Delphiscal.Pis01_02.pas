unit Delphiscal.Pis01_02;

interface

uses Delphiscal.Pis.Base, Delphiscal.Pis01_02.Intf;

type
  TPis01_02 = class(TInterfacedObject, IPis01_02)
  private
    FBasePis: TBasePis;
    FAliquotaPis: Currency;
  public
    constructor Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaPis: Currency);
    function BasePis: Currency;
    function ValorPis: Currency;
    destructor Destroy; override;
  end;

implementation

uses acbrutil.math;

function TPis01_02.BasePis: Currency;
begin
  Result := FBasePis.CalcularBasePis;
end;

constructor TPis01_02.Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaPis: Currency);
begin
  FBasePis := TBasePis.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto);
  FAliquotaPis := AAliquotaPis;
end;

destructor TPis01_02.Destroy;
begin
  FBasePis.Free;
  inherited;
end;

function TPis01_02.ValorPis: Currency;
begin
  Result := RoundABNT(BasePis * (FAliquotaPis / 100), 2);
end;

end.

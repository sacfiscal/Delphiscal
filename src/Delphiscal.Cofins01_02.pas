unit Delphiscal.Cofins01_02;

interface

uses Delphiscal.Cofins.Base, Delphiscal.Cofins01_02.Intf;

type
  TCofins01_02 = class(TInterfacedObject, ICofins01_02)
  private
    FBaseCofins: TBaseCofins;
    FAliquotaCofins: Double;
    function BaseCofins: Double;
    function ValorCofins: Double;
  public
    constructor Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto,
      AAliquotaCofins: Double);
    class function New(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto,
      AAliquotaCofins: Double): ICofins01_02;
    destructor Destroy; override;
  end;

implementation

uses Delphiscal.Utils;

function TCofins01_02.BaseCofins: Double;
begin
  Result := FBaseCofins.CalcularBaseCofins;
end;

constructor TCofins01_02.Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto,
  AAliquotaCofins: Double);
begin
  FBaseCofins := TBaseCofins.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto);
  FAliquotaCofins := AAliquotaCofins;
end;

destructor TCofins01_02.Destroy;
begin
  FBaseCofins.Free;
  inherited;
end;

class function TCofins01_02.New(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto,
  AAliquotaCofins: Double): ICofins01_02;
begin
  Result := TCofins01_02.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaCofins);
end;

function TCofins01_02.ValorCofins: Double;
begin
  Result := RoundABNT(BaseCofins * (FAliquotaCofins / 100), 2);
end;

end.

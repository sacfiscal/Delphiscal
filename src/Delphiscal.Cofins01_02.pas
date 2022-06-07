unit Delphiscal.Cofins01_02;

interface

uses Delphiscal.Cofins.Base, Delphiscal.Cofins01_02.Intf;

type
  TCofins01_02 = class(TInterfacedObject, ICofins01_02)
  private
    FBaseCofins: TBaseCofins;
    FAliquotaCofins: Currency;
  public
    constructor Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaCofins: Currency);
    function BaseCofins: Currency;
    function ValorCofins: Currency;
    destructor Destroy; override;
  end;

implementation

uses acbrutil.math;

function TCofins01_02.BaseCofins: Currency;
begin
  Result := FBaseCofins.CalcularBaseCofins;
end;

constructor TCofins01_02.Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaCofins: Currency);
begin
  FBaseCofins := TBaseCofins.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto);
  FAliquotaCofins := AAliquotaCofins;
end;

destructor TCofins01_02.Destroy;
begin
  FBaseCofins.Free;
  inherited;
end;

function TCofins01_02.ValorCofins: Currency;
begin
  Result := RoundABNT(BaseCofins * (FAliquotaCofins / 100), 2);
end;

end.

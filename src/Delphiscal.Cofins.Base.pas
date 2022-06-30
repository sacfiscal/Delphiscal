unit Delphiscal.Cofins.Base;

interface

type
  TBaseCofins = class
  private
    FValorProduto: Currency;
    FValorfrete: Currency;
    FValorSeguro: Currency;
    FDespesasAcessorias: Currency;
    FValorDesconto: Currency;
    FValorIcmsProprio: Currency;
  public
    constructor Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto: Currency; const AValorIcmsProprio: Currency = 0);
    function CalcularBaseCofins: Currency;
  end;

implementation

uses acbrutil.math;

constructor TBaseCofins.Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto: Currency; const AValorIcmsProprio: Currency = 0);
begin
  FValorProduto := AValorProduto;
  FValorfrete := AValorFrete;
  FValorSeguro := AValorSeguro;
  FDespesasAcessorias := ADespesasAcessorias;
  FValorDesconto := AValorDesconto;
  FValorIcmsProprio := AValorIcmsProprio;
end;

function TBaseCofins.CalcularBaseCofins: Currency;
begin
  Result := RoundABNT((FValorProduto + FValorfrete + FValorSeguro + FDespesasAcessorias - FValorDesconto) - FValorIcmsProprio, 2);
end;

end.

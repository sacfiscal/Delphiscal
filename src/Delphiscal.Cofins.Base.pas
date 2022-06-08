unit Delphiscal.Cofins.Base;

interface

type
  TBaseCofins = class
  private
    FValorProduto: Double;
    FValorfrete: Double;
    FValorSeguro: Double;
    FDespesasAcessorias: Double;
    FValorDesconto: Double;
  public
    constructor Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto: Double);
    function CalcularBaseCofins: Double;
  end;

implementation

uses Delphiscal.Utils;

constructor TBaseCofins.Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto: Double);
begin
  FValorProduto := AValorProduto;
  FValorfrete := AValorFrete;
  FValorSeguro := AValorSeguro;
  FDespesasAcessorias := ADespesasAcessorias;
  FValorDesconto := AValorDesconto;
end;

function TBaseCofins.CalcularBaseCofins: Double;
begin
  Result := RoundABNT(FValorProduto + FValorfrete + FValorSeguro + FDespesasAcessorias - FValorDesconto, 2);
end;

end.

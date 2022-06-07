unit Delphiscal.Ipi.Base;

interface

type
  TBaseIpi = class
  private
    FValorProduto: Currency;
    FValorfrete: Currency;
    FValorSeguro: Currency;
    FDespesasAcessorias: Currency;
  public
    constructor Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias: currency);
    function CalcularBaseIpi: Currency;
  end;

implementation

uses acbrutil.math;

constructor TBaseIpi.Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias: currency);
begin
  FValorProduto := AValorProduto;
  FValorfrete := AValorFrete;
  FValorSeguro := AValorSeguro;
  FDespesasAcessorias := ADespesasAcessorias;
end;

function TBaseIpi.CalcularBaseIpi: Currency;
begin
  Result := RoundABNT((FValorProduto + FValorfrete + FValorSeguro + FDespesasAcessorias), 2);
end;

end.

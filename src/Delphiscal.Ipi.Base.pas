unit Delphiscal.Ipi.Base;

interface

type
  TBaseIpi = class
  private
    FValorProduto: Double;
    FValorfrete: Double;
    FValorSeguro: Double;
    FDespesasAcessorias: Double;
  public
    constructor Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias: Double);
    function CalcularBaseIpi: Double;
  end;

implementation

uses Delphiscal.Utils;

constructor TBaseIpi.Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias: Double);
begin
  FValorProduto := AValorProduto;
  FValorfrete := AValorFrete;
  FValorSeguro := AValorSeguro;
  FDespesasAcessorias := ADespesasAcessorias;
end;

function TBaseIpi.CalcularBaseIpi: Double;
begin
  Result := RoundABNT((FValorProduto + FValorfrete + FValorSeguro + FDespesasAcessorias), 2);
end;

end.

unit Delphiscal.Pis.Base;

interface

type
  TBasePis = class
  private
    FValorProduto: Double;
    FValorfrete: Double;
    FValorSeguro: Double;
    FDespesasAcessorias: Double;
    FValorDesconto: Double;
  public
    constructor Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto: Double);
    function CalcularBasePis: Double;
  end;

implementation

uses Delphiscal.Utils;

function TBasePis.CalcularBasePis: Double;
begin
  Result := RoundABNT(FValorProduto + FValorfrete + FValorSeguro + FDespesasAcessorias - FValorDesconto, 2);
end;

constructor TBasePis.Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto: Double);
begin
  FValorProduto := AValorProduto;
  FValorfrete := AValorFrete;
  FValorSeguro := AValorSeguro;
  FDespesasAcessorias := ADespesasAcessorias;
  FValorDesconto := AValorDesconto;
end;

end.

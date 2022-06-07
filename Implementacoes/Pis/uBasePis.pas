unit uBasePis;

interface
type
  TBasePis = class
  private
    FValorProduto: currency;
    FValorfrete: currency;
    FValorSeguro: currency;
    FDespesasAcessorias: currency;
    FValorDesconto: currency;

  public

    Constructor Create(_valorProduto,
                       _valorFrete,
                       _valorSeguro,
                       _despesasAcessorias,
                       _valorDesconto: currency);
    function CalcularBasePis: currency;
  end;
implementation
uses acbrutil.Math;

{ TBasePis }

function TBasePis.CalcularBasePis: currency;
begin
 result := RoundABNT(FValorProduto +
                        FValorFrete +
                        FValorSeguro +
                        FDespesasAcessorias -
                        FValorDesconto, 2);
end;

constructor TBasePis.Create(_valorProduto,
                            _valorFrete,
                            _valorSeguro,
                            _despesasAcessorias,
                            _valorDesconto: currency);
begin
  FValorProduto := _valorProduto;
  FValorfrete := _valorFrete;
  FValorSeguro := _valorSeguro;
  FDespesasAcessorias := _despesasAcessorias;
  FValorDesconto := _valorDesconto;

end;

end.

unit uBaseIpi;

interface

type
  TBaseIpi = class
  private
    FValorProduto: currency;
    FValorfrete: currency;
    FValorSeguro: currency;
    FDespesasAcessorias: currency;

  public
    Constructor Create(_valorProduto,
                       _valorFrete,
                       _valorSeguro,
                       _despesasAcessorias: currency);
    function CalcularBaseIpi: currency;
  end;

implementation

uses acbrutil.math;

{ TBaseIpi }

constructor TBaseIpi.Create(_valorProduto,
                            _valorFrete,
                            _valorSeguro,
                            _despesasAcessorias: currency);
begin

 FValorProduto := _valorProduto;
 FValorfrete := _valorFrete;
 FValorSeguro := _valorSeguro;
 FDespesasAcessorias := _despesasAcessorias;

end;

function TBaseIpi.CalcularBaseIpi: currency;
begin
  result := RoundABNT((FValorProduto +
                        FValorFrete +
                        FValorSeguro +
                        FDespesasAcessorias),2);
end;

end.

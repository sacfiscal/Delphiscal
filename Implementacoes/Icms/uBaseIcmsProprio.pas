unit uBaseIcmsProprio;

interface

type
  TBaseIcmsProprio = class
  private
    FvalorProduto: currency;
    Fvalorfrete: currency;
    FvalorSeguro: currency;
    FdespesasAcessorias: currency;
    FvalorIpi: currency;
    FvalorDesconto: currency;
    FpercentualReducao: currency;

  public

    Constructor Create(_valorProduto,
                       _valorFrete,
                       _valorSeguro,
                       _despesasAcessorias,
                       _valorDesconto: currency;
                       _percentualReducao: currency = 0;
                       _valorIpi: currency = 0);
    function CalcularBaseIcmsProprio: currency;
    function CalcularBaseNormal: currency;
    function CalcularBaseReduzida: currency;
    function ContemReducao: boolean;
  end;

implementation

uses acbrutil.math;

{ TBaseIcmsProprio }

constructor TBaseIcmsProprio.Create(_valorProduto,
                                    _valorFrete,
                                    _valorSeguro,
                                    _despesasAcessorias,
                                    _valorDesconto: currency;
                                    _percentualReducao: currency;
                                    _valorIpi: currency);
begin
  FvalorProduto := _valorProduto;
  Fvalorfrete := _valorFrete;
  FvalorSeguro := _valorSeguro;
  FdespesasAcessorias := _despesasAcessorias;
  FvalorDesconto := _valorDesconto;
  FvalorIpi := _valorIpi;
  FpercentualReducao := _percentualReducao;

end;

function TBaseIcmsProprio.CalcularBaseIcmsProprio: currency;
begin
  if (ContemReducao) then
    result := CalcularBaseReduzida
  else
    result := CalcularBaseNormal;
end;

function TBaseIcmsProprio.CalcularBaseNormal: currency;
begin
   result := RoundABNT(FValorProduto +
                        FValorFrete +
                        FValorSeguro +
                        FDespesasAcessorias +
                        FValorIpi -
                        FValorDesconto, 2);
end;

function TBaseIcmsProprio.CalcularBaseReduzida: currency;
var
  baseIcms: currency;
begin

    baseIcms := CalcularBaseNormal;

    result := RoundABNT((baseIcms -
                        (baseIcms * (FPercentualReducao / 100)) +
                        FValorIpi), 2);

end;

function TBaseIcmsProprio.ContemReducao: boolean;
begin
  result := FpercentualReducao > 0;
end;

end.

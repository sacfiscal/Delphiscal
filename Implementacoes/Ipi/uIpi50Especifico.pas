unit uIpi50Especifico;

interface

uses uIIpi50Especifico;

type
  TIpi50Especifico = class(TInterfacedObject, IIpi50Especifico)
  private
  FQuantidadeTributada: currency;
  FValorUnidadeTributada: currency;
  public
    constructor Create(_quantidadeTributada,
                       _valorPorUnidadeTributada: currency);
    function ValorIpi: currency;

  end;

implementation
uses acbrutil.Math;
{ TIpi50Especifico }

constructor TIpi50Especifico.Create(_quantidadeTributada,
                                    _valorPorUnidadeTributada: currency);
begin
 FQuantidadeTributada := _quantidadeTributada;
 FValorUnidadeTributada := _valorPorUnidadeTributada;

end;

function TIpi50Especifico.ValorIpi: currency;
begin
  result := RoundABNT((FQuantidadeTributada * FValorUnidadeTributada),2);
end;

end.

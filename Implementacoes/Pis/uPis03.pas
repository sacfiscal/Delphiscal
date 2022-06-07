unit uPis03;

interface

uses uIPis03;

type
  TPis03 = class(TInterfacedObject, IPis03)
  private
  FQuantidadeTributada: currency;
  FValorUnidadeTributada: currency;
  public
    constructor Create(_quantidadeTributada,
                       _valorPorUnidadeTributada: currency);
    function ValorPis: currency;

  end;

implementation
uses acbrutil.Math;
{ TIpi50Especifico }

constructor TPis03.Create(_quantidadeTributada,
                          _valorPorUnidadeTributada: currency);
begin
 FQuantidadeTributada := _quantidadeTributada;
 FValorUnidadeTributada := _valorPorUnidadeTributada;

end;

function TPis03.ValorPis: currency;
begin
  result := RoundABNT((FQuantidadeTributada * FValorUnidadeTributada),2);
end;

end.

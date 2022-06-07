unit Delphiscal.Pis03;

interface

uses Delphiscal.Pis03.Intf;

type
  TPis03 = class(TInterfacedObject, IPis03)
  private
    FQuantidadeTributada: Currency;
    FValorUnidadeTributada: Currency;
  public
    constructor Create(const AQuantidadeTributada, AValorPorUnidadeTributada: Currency);
    function ValorPis: Currency;
  end;

implementation

uses acbrutil.math;

constructor TPis03.Create(const AQuantidadeTributada, AValorPorUnidadeTributada: Currency);
begin
  FQuantidadeTributada := AQuantidadeTributada;
  FValorUnidadeTributada := AValorPorUnidadeTributada;
end;

function TPis03.ValorPis: Currency;
begin
  Result := RoundABNT((FQuantidadeTributada * FValorUnidadeTributada), 2);
end;

end.

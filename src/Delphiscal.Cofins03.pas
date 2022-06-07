unit Delphiscal.Cofins03;

interface

uses Delphiscal.Cofins03.Intf;

type
  TCofins03 = class(TInterfacedObject, ICofins03)
  private
    FQuantidadeTributada: Currency;
    FValorUnidadeTributada: Currency;
  public
    constructor Create(const AQuantidadeTributada, AValorPorUnidadeTributada: Currency);
    function ValorCofins: Currency;
  end;

implementation

uses acbrutil.math;

constructor TCofins03.Create(const AQuantidadeTributada, AValorPorUnidadeTributada: Currency);
begin
  FQuantidadeTributada := AQuantidadeTributada;
  FValorUnidadeTributada := AValorPorUnidadeTributada;
end;

function TCofins03.ValorCofins: Currency;
begin
  Result := RoundABNT((FQuantidadeTributada * FValorUnidadeTributada), 2);
end;

end.

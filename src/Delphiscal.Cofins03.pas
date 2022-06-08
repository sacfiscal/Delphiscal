unit Delphiscal.Cofins03;

interface

uses Delphiscal.Cofins03.Intf;

type
  TCofins03 = class(TInterfacedObject, ICofins03)
  private
    FQuantidadeTributada: Double;
    FValorUnidadeTributada: Double;
    function ValorCofins: Double;
  public
    constructor Create(const AQuantidadeTributada, AValorPorUnidadeTributada: Double);
    class function New(const AQuantidadeTributada, AValorPorUnidadeTributada: Double): ICofins03;
  end;

implementation

uses Delphiscal.Utils;

constructor TCofins03.Create(const AQuantidadeTributada, AValorPorUnidadeTributada: Double);
begin
  FQuantidadeTributada := AQuantidadeTributada;
  FValorUnidadeTributada := AValorPorUnidadeTributada;
end;

class function TCofins03.New(const AQuantidadeTributada, AValorPorUnidadeTributada: Double): ICofins03;
begin
  Result := TCofins03.Create(AQuantidadeTributada, AValorPorUnidadeTributada);
end;

function TCofins03.ValorCofins: Double;
begin
  Result := RoundABNT((FQuantidadeTributada * FValorUnidadeTributada), 2);
end;

end.

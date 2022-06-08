unit Delphiscal.Cofins03;

interface

uses
  Delphiscal.Cofins03.Intf;

type
  TCofins03 = class(TInterfacedObject,
                    ICofins03)
  private
    FQuantidadeTributada  : Currency;
    FValorUnidadeTributada: Currency;
    function GetValorCofins: Currency;
  public
    constructor Create(const AQuantidadeTributada, AValorPorUnidadeTributada: Currency);
    property ValorCofins: Currency read GetValorCofins;
  end;

implementation

uses
  ACBrUtil.Math;

constructor TCofins03.Create(const AQuantidadeTributada, AValorPorUnidadeTributada: Currency);
begin
  FQuantidadeTributada   := AQuantidadeTributada;
  FValorUnidadeTributada := AValorPorUnidadeTributada;
end;

function TCofins03.GetValorCofins: Currency;
begin
  Result := RoundABNT((FQuantidadeTributada * FValorUnidadeTributada), 2);
end;

end.

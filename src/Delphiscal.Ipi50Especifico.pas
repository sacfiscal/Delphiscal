unit Delphiscal.Ipi50Especifico;

interface

uses
  Delphiscal.Ipi50Especifico.Intf;

type
  TIpi50Especifico = class(TInterfacedObject,
                           IIpi50Especifico)
  private
    FQuantidadeTributada  : Currency;
    FValorUnidadeTributada: Currency;
    function GetValorIpi: Currency;
  public
    constructor Create(const AQuantidadeTributada, AValorPorUnidadeTributada: Currency);

    property ValorIpi: Currency read GetValorIpi;
  end;

implementation

uses
  ACBrUtil.Math;

constructor TIpi50Especifico.Create(const AQuantidadeTributada, AValorPorUnidadeTributada: Currency);
begin
  FQuantidadeTributada   := AQuantidadeTributada;
  FValorUnidadeTributada := AValorPorUnidadeTributada;
end;

function TIpi50Especifico.GetValorIpi: Currency;
begin
  Result := RoundABNT((FQuantidadeTributada * FValorUnidadeTributada), 2);
end;

end.

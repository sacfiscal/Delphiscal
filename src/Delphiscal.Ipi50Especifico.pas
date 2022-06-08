unit Delphiscal.Ipi50Especifico;

interface

uses Delphiscal.Ipi50Especifico.Intf;

type
  TIpi50Especifico = class(TInterfacedObject, IIpi50Especifico)
  private
    FQuantidadeTributada: Double;
    FValorUnidadeTributada: Double;
    function ValorIpi: Double;
  public
    constructor Create(const AQuantidadeTributada, AValorPorUnidadeTributada: Double);
    class function New(const AQuantidadeTributada, AValorPorUnidadeTributada: Double): IIpi50Especifico;
  end;

implementation

uses Delphiscal.Utils;

constructor TIpi50Especifico.Create(const AQuantidadeTributada, AValorPorUnidadeTributada: Double);
begin
  FQuantidadeTributada := AQuantidadeTributada;
  FValorUnidadeTributada := AValorPorUnidadeTributada;
end;

class function TIpi50Especifico.New(const AQuantidadeTributada, AValorPorUnidadeTributada: Double): IIpi50Especifico;
begin
  Result := TIpi50Especifico.Create(AQuantidadeTributada, AValorPorUnidadeTributada);
end;

function TIpi50Especifico.ValorIpi: Double;
begin
  Result := RoundABNT((FQuantidadeTributada * FValorUnidadeTributada), 2);
end;

end.

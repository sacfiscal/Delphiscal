unit Delphiscal.Pis03;

interface

uses Delphiscal.Pis03.Intf;

type
  TPis03 = class(TInterfacedObject, IPis03)
  private
    FQuantidadeTributada: Double;
    FValorUnidadeTributada: Double;
    function ValorPis: Double;
  public
    constructor Create(const AQuantidadeTributada, AValorPorUnidadeTributada: Double);
    class function New(const AQuantidadeTributada, AValorPorUnidadeTributada: Double): IPis03;
  end;

implementation

uses Delphiscal.Utils;

constructor TPis03.Create(const AQuantidadeTributada, AValorPorUnidadeTributada: Double);
begin
  FQuantidadeTributada := AQuantidadeTributada;
  FValorUnidadeTributada := AValorPorUnidadeTributada;
end;

class function TPis03.New(const AQuantidadeTributada, AValorPorUnidadeTributada: Double): IPis03;
begin
  Result := TPis03.Create(AQuantidadeTributada, AValorPorUnidadeTributada);
end;

function TPis03.ValorPis: Double;
begin
  Result := RoundABNT((FQuantidadeTributada * FValorUnidadeTributada), 2);
end;

end.

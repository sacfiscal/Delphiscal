unit Delphiscal.Pis03;

interface

uses Delphiscal.Pis03.Intf;

type
  TPis03 = class(TInterfacedObject, IPis03)
  private
    FQuantidadeTributada: Double;
    FValorUnidadeTributada: Double;
    function ValorPis: Double;
    function QuantidadeTributada(const AValue: Double): IPis03;
    function ValorPorUnidadeTributada(const AValue: Double): IPis03;
  public
    constructor Create(const AQuantidadeTributada, AValorPorUnidadeTributada: Double); overload;
    class function New(const AQuantidadeTributada, AValorPorUnidadeTributada: Double): IPis03; overload;
    class function New: IPis03; overload;
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

class function TPis03.New: IPis03;
begin
  Result := TPis03.Create;
end;

function TPis03.ValorPis: Double;
begin
  Result := RoundABNT((FQuantidadeTributada * FValorUnidadeTributada), 2);
end;

function TPis03.QuantidadeTributada(const AValue: Double): IPis03;
begin
  FQuantidadeTributada := AValue;
  Result := Self;
end;

function TPis03.ValorPorUnidadeTributada(const AValue: Double): IPis03;
begin
  FValorUnidadeTributada := AValue;
  Result := Self;
end;

end.

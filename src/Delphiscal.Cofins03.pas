unit Delphiscal.Cofins03;

interface

uses Delphiscal.Cofins03.Intf;

type
  TCofins03 = class(TInterfacedObject, ICofins03)
  private
    FQuantidadeTributada: Double;
    FValorUnidadeTributada: Double;
    function ValorCofins: Double;
    function QuantidadeTributada(const AValue: Double): ICofins03;
    function ValorPorUnidadeTributada(const AValue: Double): ICofins03;
  public
    class function New: ICofins03; overload;
    class function New(const AQuantidadeTributada, AValorPorUnidadeTributada: Double): ICofins03; overload;
    constructor Create(const AQuantidadeTributada, AValorPorUnidadeTributada: Double); overload;
  end;

implementation

uses Delphiscal.Utils;

class function TCofins03.New: ICofins03;
begin
  Result := TCofins03.Create;
end;

class function TCofins03.New(const AQuantidadeTributada, AValorPorUnidadeTributada: Double): ICofins03;
begin
  Result := TCofins03.Create(AQuantidadeTributada, AValorPorUnidadeTributada);
end;

constructor TCofins03.Create(const AQuantidadeTributada, AValorPorUnidadeTributada: Double);
begin
  FQuantidadeTributada := AQuantidadeTributada;
  FValorUnidadeTributada := AValorPorUnidadeTributada;
end;

function TCofins03.ValorCofins: Double;
begin
  Result := RoundABNT((FQuantidadeTributada * FValorUnidadeTributada), 2);
end;

function TCofins03.QuantidadeTributada(const AValue: Double): ICofins03;
begin
  FQuantidadeTributada := AValue;
  Result := Self;
end;

function TCofins03.ValorPorUnidadeTributada(const AValue: Double): ICofins03;
begin
  FValorUnidadeTributada := AValue;
  Result := Self;
end;

end.

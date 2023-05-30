unit Delphiscal.Ipi50Especifico;

interface

uses
  Delphiscal.Ipi50Especifico.Intf;

type
  TIpi50Especifico = class(TInterfacedObject,
                           IIpi50Especifico)
  private
    FQuantidadeTributada  : Double;
    FValorUnidadeTributada: Double;
    function ValorIpi: Double;
    function QuantidadeTributada(const AValue: Double): IIpi50Especifico;
    function ValorPorUnidadeTributada(const AValue: Double): IIpi50Especifico;
  public
    class function New: IIpi50Especifico; overload;
    class function New(const AQuantidadeTributada, AValorPorUnidadeTributada: Double): IIpi50Especifico; overload;
    constructor Create(const AQuantidadeTributada, AValorPorUnidadeTributada: Double); overload;
  end;

implementation

uses
  Delphiscal.Utils;

class function TIpi50Especifico.New: IIpi50Especifico;
begin
  Result := TIpi50Especifico.Create;
end;

class function TIpi50Especifico.New(const AQuantidadeTributada, AValorPorUnidadeTributada: Double): IIpi50Especifico;
begin
  Result := TIpi50Especifico.Create(AQuantidadeTributada, AValorPorUnidadeTributada);
end;

constructor TIpi50Especifico.Create(const AQuantidadeTributada, AValorPorUnidadeTributada: Double);
begin
  FQuantidadeTributada   := AQuantidadeTributada;
  FValorUnidadeTributada := AValorPorUnidadeTributada;
end;

function TIpi50Especifico.ValorIpi: Double;
begin
  Result := RoundABNT((FQuantidadeTributada * FValorUnidadeTributada), 2);
end;

function TIpi50Especifico.QuantidadeTributada(const AValue: Double): IIpi50Especifico;
begin
  FQuantidadeTributada := AValue;
  Result               := Self;
end;

function TIpi50Especifico.ValorPorUnidadeTributada(const AValue: Double): IIpi50Especifico;
begin
  FValorUnidadeTributada := AValue;
  Result                 := Self;
end;

end.

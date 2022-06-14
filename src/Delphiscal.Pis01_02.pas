unit Delphiscal.Pis01_02;

interface

uses
  Delphiscal.Pis.Base,
  Delphiscal.Pis01_02.Intf,
  Delphiscal.Pis.Base.Intf,
  Delphiscal.Attributes.Intf;

type
  TPis01_02 = class(TInterfacedObject, IPis01_02)
  private
    FBasePis: IPisBase;
    FAliquotaPis: Double;
    FAttributes : IAttributes<IPis01_02>;
    function BasePis: Double;
    function ValorPis: Double;
    function Attributes : IAttributes<IPis01_02>;
  public
    constructor Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaPis: Double); overload;
    constructor Create; overload;
    class function New(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaPis: Double): IPis01_02; overload;
    class function New : IPis01_02; overload;
    destructor Destroy; override;
  end;

implementation

uses
  Delphiscal.Utils,
  Delphiscal.Attributes;

function TPis01_02.Attributes: IAttributes<IPis01_02>;
begin
  if not Assigned(FAttributes) then
    FAttributes := TAttributes<IPis01_02>.New(Self);
  Result := FAttributes;
end;

function TPis01_02.BasePis: Double;
begin
  if Assigned(FAttributes) then
    Result :=
      FBasePis
        .Attributes
          .ValorProduto(FAttributes.ValorProduto)
          .ValorFrete(FAttributes.ValorFrete)
          .ValorSeguro(FAttributes.ValorSeguro)
          .ValorDespesas(FAttributes.ValorDespesas)
          .ValorDesconto(FAttributes.ValorDesconto)
        .&End.CalcularBasePis
  else
  Result := FBasePis.CalcularBasePis;
end;

constructor TPis01_02.Create;
begin
  FBasePis := TBasePis.New;
end;

constructor TPis01_02.Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto,
  AAliquotaPis: Double);
begin
  FBasePis := TBasePis.New(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto);
  FAliquotaPis := AAliquotaPis;
end;

destructor TPis01_02.Destroy;
begin
  inherited;
end;

class function TPis01_02.New: IPis01_02;
begin
  Result := TPis01_02.Create;
end;

class function TPis01_02.New(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto,
  AAliquotaPis: Double): IPis01_02;
begin
  Result := TPis01_02.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaPis);
end;

function TPis01_02.ValorPis: Double;
begin
  if Assigned(FAttributes) then
    Result := RoundABNT(BasePis * (FAttributes.AliquotaPis / 100), 2)
  else
    Result := RoundABNT(BasePis * (FAliquotaPis / 100), 2);
end;

end.

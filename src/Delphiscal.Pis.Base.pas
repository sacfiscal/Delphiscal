unit Delphiscal.Pis.Base;

interface

uses
  Delphiscal.Pis.Base.Intf,
  Delphiscal.Attributes.Intf;

type
  TBasePis = class(TInterfacedObject, IPisBase)
  private
    FAttributes : IAttributes<IPisBase>;
    FValorProduto: Double;
    FValorfrete: Double;
    FValorSeguro: Double;
    FDespesasAcessorias: Double;
    FValorDesconto: Double;
  public
    constructor Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto: Double); overload;
    function CalcularBasePis: Double;
    class function New(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto: Double) : IPisBase; overload;
    class function New : IPisBase; overload;
    function Attributes : IAttributes<IPisBase>;
  end;

implementation

uses
  Delphiscal.Utils,
  Delphiscal.Attributes;

function TBasePis.Attributes: IAttributes<IPisBase>;
begin
  if not Assigned(FAttributes) then
    FAttributes := TAttributes<IPisBase>.New(Self);
  Result := FAttributes;
end;

function TBasePis.CalcularBasePis: Double;
begin
  if Assigned(FAttributes) then
    Result := RoundABNT(FAttributes.ValorProduto + FAttributes.Valorfrete + FAttributes.ValorSeguro + FAttributes.ValorDespesas - FAttributes.ValorDesconto, 2)
  else
    Result := RoundABNT(FValorProduto + FValorfrete + FValorSeguro + FDespesasAcessorias - FValorDesconto, 2);
end;

constructor TBasePis.Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto: Double);
begin
  FValorProduto := AValorProduto;
  FValorfrete := AValorFrete;
  FValorSeguro := AValorSeguro;
  FDespesasAcessorias := ADespesasAcessorias;
  FValorDesconto := AValorDesconto;
end;

class function TBasePis.New(const AValorProduto, AValorFrete, AValorSeguro,
  ADespesasAcessorias, AValorDesconto: Double): IPisBase;
begin
  Result := TBasePis.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto);
end;

class function TBasePis.New: IPisBase;
begin
  Result := TBasePis.Create;
end;

end.

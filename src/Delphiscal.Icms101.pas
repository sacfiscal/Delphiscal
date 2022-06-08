unit Delphiscal.Icms101;

interface

uses Delphiscal.Icms.BaseProprio, Delphiscal.Icms101.Intf;

type
  TIcms101 = class(TInterfacedObject, IIcms101)
  private
    FBaseCreditoSN: TBaseIcmsProprio;
    FPercentualCreditoSN: Double;
    function BaseCreditoSN: Double;
    function ValorCreditoSN: Double;
  public
    constructor Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto,
      APercentualCreditoSN: Double; const APercentualReducao: Double = 0);
    class function New(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto,
      APercentualCreditoSN: Double; const APercentualReducao: Double = 0): IIcms101;
    destructor Destroy; override;
  end;

implementation

uses Delphiscal.Utils;

function TIcms101.BaseCreditoSN: Double;
begin
  Result := RoundABNT(FBaseCreditoSN.CalcularBaseIcmsProprio, 2);
end;

constructor TIcms101.Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto,
  APercentualCreditoSN: Double; const APercentualReducao: Double = 0);
begin
  FBaseCreditoSN := TBaseIcmsProprio.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto,
    APercentualReducao);
  FPercentualCreditoSN := APercentualCreditoSN;
end;

destructor TIcms101.Destroy;
begin
  FBaseCreditoSN.Free;
  inherited;
end;

class function TIcms101.New(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto,
  APercentualCreditoSN, APercentualReducao: Double): IIcms101;
begin
  Result := TIcms101.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, APercentualCreditoSN,
    APercentualReducao);
end;

function TIcms101.ValorCreditoSN: Double;
begin
  Result := RoundABNT(BaseCreditoSN * (FPercentualCreditoSN / 100), 2);
end;

end.

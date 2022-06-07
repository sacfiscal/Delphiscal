unit Delphiscal.Icms101;

interface

uses Delphiscal.Icms.BaseProprio, Delphiscal.Icms101.Intf;

type
  TIcms101 = class(TInterfacedObject, IIcms101)
  private
    FBaseCreditoSN: TBaseIcmsProprio;
    FPercentualCreditoSN: Currency;
    function BaseCreditoSN: Currency;
    function ValorCreditoSN: Currency;
  public
    constructor Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, APercentualCreditoSN: Currency; const APercentualReducao: Currency = 0);
    destructor Destroy; override;
  end;

implementation

uses acbrutil.math;

function TIcms101.BaseCreditoSN: Currency;
begin
  Result := RoundABNT(FBaseCreditoSN.CalcularBaseIcmsProprio, 2);
end;

constructor TIcms101.Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, APercentualCreditoSN: Currency; const APercentualReducao: Currency = 0);
begin
  FBaseCreditoSN := TBaseIcmsProprio.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, APercentualReducao);
  FPercentualCreditoSN := APercentualCreditoSN;
end;

destructor TIcms101.Destroy;
begin
  FBaseCreditoSN.Free;
  inherited;
end;

function TIcms101.ValorCreditoSN: Currency;
begin
  Result := RoundABNT(BaseCreditoSN * (FPercentualCreditoSN / 100), 2);
end;

end.

unit Delphiscal.Icms201;

interface

uses Delphiscal.Icms.BaseProprio, Delphiscal.Icms.Valor, Delphiscal.Icms.BaseST, Delphiscal.Icms.Valor.ST, Delphiscal.Icms201.Intf;

type
  TIcms201 = class(TInterfacedObject, IIcms201)
  private
    FBaseIcmsProprio: TBaseIcmsProprio;
    FIcmsProprio: TValorIcms;
    FBaseIcmsST: TBaseIcmsST;
    FIcmsST: TValorIcmsST;
    FPercentualCreditoSN: Currency;
  public
    constructor Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaIcms,
      APercentualReducao, APercentualCreditoSN, AAliquotaIcmsST, AMva: Currency; const APercentualReducaoST: Currency = 0);
    function ValorBaseIcmsProprio: Currency;
    function ValorIcmsProprio: Currency;
    function ValorBaseIcmsST: Currency;
    function ValorIcmsST: Currency;
    function ValorCreditoSN: Currency;
    destructor Destroy; override;
  end;

implementation

uses acbrutil.math;

constructor TIcms201.Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaIcms,
  APercentualReducao, APercentualCreditoSN, AAliquotaIcmsST, AMva: Currency; const APercentualReducaoST: Currency = 0);
begin
  FBaseIcmsProprio := TBaseIcmsProprio.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, APercentualReducao);
  FIcmsProprio := TValorIcms.Create(FBaseIcmsProprio, AAliquotaIcms);
  FBaseIcmsST := TBaseIcmsST.Create(FBaseIcmsProprio, AMva, APercentualReducaoST);
  FIcmsST := TValorIcmsST.Create(FBaseIcmsST, AAliquotaIcmsST, FIcmsProprio);
  FPercentualCreditoSN := APercentualCreditoSN;
end;

destructor TIcms201.Destroy;
begin
  FIcmsST.Free;
  FBaseIcmsST.Free;
  FIcmsProprio.Free;
  FBaseIcmsProprio.Free;
  inherited;
end;

function TIcms201.ValorBaseIcmsProprio: Currency;
begin
  Result := FBaseIcmsProprio.CalcularBaseIcmsProprio;
end;

function TIcms201.ValorBaseIcmsST: Currency;
begin
  Result := FBaseIcmsST.CalcularBaseIcmsST;
end;

function TIcms201.ValorCreditoSN: Currency;
begin
  Result := RoundABNT(ValorBaseIcmsProprio * (FPercentualCreditoSN / 100), 2);
end;

function TIcms201.ValorIcmsProprio: Currency;
begin
  Result := RoundABNT(FIcmsProprio.GetValorIcms, 2);
end;

function TIcms201.ValorIcmsST: Currency;
begin
  Result := RoundABNT(FIcmsST.CalcularValorIcmsST, 2);
end;

end.

unit Delphiscal.Icms201;

interface

uses Delphiscal.Icms.BaseProprio, Delphiscal.Icms.Valor, Delphiscal.Icms.BaseST, Delphiscal.Icms.Valor.ST,
  Delphiscal.Icms201.Intf;

type
  TIcms201 = class(TInterfacedObject, IIcms201)
  private
    FBaseIcmsProprio: TBaseIcmsProprio;
    FIcmsProprio: TValorIcms;
    FBaseIcmsST: TBaseIcmsST;
    FIcmsST: TValorIcmsST;
    FPercentualCreditoSN: Double;
    function ValorBaseIcmsProprio: Double;
    function ValorIcmsProprio: Double;
    function ValorBaseIcmsST: Double;
    function ValorIcmsST: Double;
    function ValorCreditoSN: Double;
  public
    constructor Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaIcms,
      APercentualReducao, APercentualCreditoSN, AAliquotaIcmsST, AMva: Double; const APercentualReducaoST: Double = 0);
    class function New(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaIcms,
      APercentualReducao, APercentualCreditoSN, AAliquotaIcmsST, AMva: Double; const APercentualReducaoST: Double = 0): IIcms201;
    destructor Destroy; override;
  end;

implementation

uses Delphiscal.Utils;

constructor TIcms201.Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaIcms,
  APercentualReducao, APercentualCreditoSN, AAliquotaIcmsST, AMva: Double; const APercentualReducaoST: Double = 0);
begin
  FBaseIcmsProprio := TBaseIcmsProprio.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto,
    APercentualReducao);
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

class function TIcms201.New(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaIcms,
  APercentualReducao, APercentualCreditoSN, AAliquotaIcmsST, AMva, APercentualReducaoST: Double): IIcms201;
begin
  Result := TIcms201.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaIcms,
    APercentualReducao, APercentualCreditoSN, AAliquotaIcmsST, AMva, APercentualReducaoST);
end;

function TIcms201.ValorBaseIcmsProprio: Double;
begin
  Result := FBaseIcmsProprio.CalcularBaseIcmsProprio;
end;

function TIcms201.ValorBaseIcmsST: Double;
begin
  Result := FBaseIcmsST.CalcularBaseIcmsST;
end;

function TIcms201.ValorCreditoSN: Double;
begin
  Result := RoundABNT(ValorBaseIcmsProprio * (FPercentualCreditoSN / 100), 2);
end;

function TIcms201.ValorIcmsProprio: Double;
begin
  Result := RoundABNT(FIcmsProprio.GetValorIcms, 2);
end;

function TIcms201.ValorIcmsST: Double;
begin
  Result := RoundABNT(FIcmsST.CalcularValorIcmsST, 2);
end;

end.

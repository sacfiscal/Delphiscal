unit Delphiscal.Icms10_30;

interface

uses Delphiscal.Icms.BaseProprio, Delphiscal.Icms.Valor, Delphiscal.Icms.BaseST, Delphiscal.Icms.Valor.ST, uIIcms10_30;

type
  TIcms10_30 = class(TInterfacedObject, IIcms10_30)
  private
    FBaseIcmsProprio: TBaseIcmsProprio;
    FIcmsProprio: TValorIcms;
    FBaseIcmsST: TBaseIcmsST;
    FIcmsST: TValorIcmsST;
    function ValorBaseIcmsProprio: Currency;
    function ValorIcmsProprio: Currency;
    function ValorBaseIcmsST: Currency;
    function ValorIcmsST: Currency;
    function ValorIcmsSTDesonerado: Currency;
  public
    constructor Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaIcms,
      AAliquotaIcmsST, AMva: Currency; const APercentualReducaoST: Currency = 0; const AValorIpi: Currency = 0);
    destructor Destroy; override;
  end;

implementation

uses acbrutil.math;

constructor TIcms10_30.Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaIcms,
  AAliquotaIcmsST, AMva: Currency; const APercentualReducaoST: Currency = 0; const AValorIpi: Currency = 0);
begin
  FBaseIcmsProprio := TBaseIcmsProprio.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto);
  FIcmsProprio := TValorIcms.Create(FBaseIcmsProprio, AAliquotaIcms);
  FBaseIcmsST := TBaseIcmsST.Create(FBaseIcmsProprio, AMva, APercentualReducaoST);
  FIcmsST := TValorIcmsST.Create(FBaseIcmsST, AAliquotaIcmsST, FIcmsProprio);
end;

destructor TIcms10_30.Destroy;
begin
  FBaseIcmsProprio.Free;
  FIcmsProprio.Free;
  FBaseIcmsST.Free;
  FIcmsST.Free;
  inherited;
end;

function TIcms10_30.ValorBaseIcmsProprio: Currency;
begin
  Result := FBaseIcmsProprio.CalcularBaseIcmsProprio;
end;

function TIcms10_30.ValorIcmsProprio: Currency;
begin
  Result := RoundABNT(FIcmsProprio.GetValorIcms, 2);
end;

function TIcms10_30.ValorBaseIcmsST: Currency;
begin
  Result := FBaseIcmsST.CalcularBaseIcmsST;
end;

function TIcms10_30.ValorIcmsST: Currency;
begin
  Result := RoundABNT(FIcmsST.CalcularValorIcmsST, 2);
end;

function TIcms10_30.ValorIcmsSTDesonerado: Currency;
var
  LValorIcmsStNormal: Currency;
begin
  LValorIcmsStNormal := FIcmsST.CalcularValorNormalIcmsST;
  Result := RoundABNT(LValorIcmsStNormal - FIcmsST.CalcularValorIcmsST, 2);
end;

end.

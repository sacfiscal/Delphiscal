unit Delphiscal.Icms70;

interface

uses
  Delphiscal.Icms.BaseProprio,
  Delphiscal.Icms.Valor,
  Delphiscal.Icms.Valor.ST,
  Delphiscal.Icms70.Intf,
  Delphiscal.Icms.BaseST;

type
  TIcms70 = class(TInterfacedObject,
                  IIcms70)
  private
    FBaseIcmsProprio: TBaseIcmsProprio;
    FIcmsProprio    : TValorIcms;
    FBaseIcmsST     : TBaseIcmsST;
    FIcmsST         : TValorIcmsST;
  public
    constructor Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaIcms, APercentualReducao, AAliquotaIcmsST, AMva: Currency;
      const APercentualReducaoST: Currency = 0; const AValorIpi: Currency = 0);
    function ValorBaseReduzidaIcmsProprio: Currency;
    function ValorIcmsProprio: Currency;
    function ValorBaseIcmsST: Currency;
    function ValorIcmsST: Currency;
    function ValorIcmsDesonerado: Currency;
    function ValorIcmsSTDesonerado(const AValorIcmsStNormal: Currency): Currency;
    destructor Destroy; override;
  end;

implementation

uses
  acbrutil.math;

constructor TIcms70.Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaIcms, APercentualReducao, AAliquotaIcmsST, AMva: Currency;
  const APercentualReducaoST: Currency = 0; const AValorIpi: Currency = 0);
begin
  FBaseIcmsProprio := TBaseIcmsProprio.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, APercentualReducao);
  FIcmsProprio     := TValorIcms.Create(FBaseIcmsProprio, AAliquotaIcms);
  FBaseIcmsST      := TBaseIcmsST.Create(FBaseIcmsProprio, AMva, APercentualReducaoST);
  FIcmsST          := TValorIcmsST.Create(FBaseIcmsST, AAliquotaIcmsST, FIcmsProprio);
end;

destructor TIcms70.Destroy;
begin
  FIcmsST.Free;
  FBaseIcmsST.Free;
  FIcmsProprio.Free;
  FBaseIcmsProprio.Free;
  inherited;
end;

function TIcms70.ValorBaseIcmsST: Currency;
begin
  Result := FBaseIcmsST.CalcularBaseIcmsST;
end;

function TIcms70.ValorBaseReduzidaIcmsProprio: Currency;
begin
  Result := FBaseIcmsProprio.CalcularBaseReduzida;
end;

function TIcms70.ValorIcmsDesonerado: Currency;
var
  LValorIcmsNormal: Currency;
begin
  LValorIcmsNormal := FIcmsProprio.CalcularValorNormalIcms;
  Result           := RoundABNT(LValorIcmsNormal - FIcmsProprio.CalcularValorReduzidoIcms, 2);
end;

function TIcms70.ValorIcmsProprio: Currency;
begin
  Result := RoundABNT(FIcmsProprio.GetValorIcms, 2);
end;

function TIcms70.ValorIcmsST: Currency;
begin
  Result := RoundABNT(FIcmsST.CalcularValorIcmsST, 2);
end;

function TIcms70.ValorIcmsSTDesonerado(const AValorIcmsStNormal: Currency): Currency;
begin
  Result := RoundABNT(AValorIcmsStNormal - FIcmsST.CalcularValorIcmsST, 2);
end;

end.

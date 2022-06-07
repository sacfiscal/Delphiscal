unit Delphiscal.Icms20;

interface

uses Delphiscal.Icms.BaseProprio, Delphiscal.Icms.Valor, Delphiscal.Icms20.Intf;

type
  TIcms20 = class(TInterfacedObject, IIcms20)
  private
    FBaseReduzidaIcmsProprio: TBaseIcmsProprio;
    FValorIcms: TValorIcms;
    function BaseReduzidaIcmsProprio: Currency;
    function ValorIcmsProprio: Currency;
    function ValorIcmsDesonerado: Currency;
  public
    constructor Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaIcms, APercentualReducao: Currency; const AValorIpi: Currency = 0);
    destructor Destroy; override;
  end;

implementation

uses acbrutil.math;

constructor TIcms20.Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaIcms, APercentualReducao: Currency; const AValorIpi: Currency = 0);
begin
  FBaseReduzidaIcmsProprio := TBaseIcmsProprio.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, APercentualReducao, AValorIpi);
  FValorIcms := TValorIcms.Create(FBaseReduzidaIcmsProprio, AAliquotaIcms);
end;

function TIcms20.BaseReduzidaIcmsProprio: Currency;
begin
  Result := FBaseReduzidaIcmsProprio.CalcularBaseReduzida;
end;

function TIcms20.ValorIcmsProprio: Currency;
begin
  Result := RoundABNT(FValorIcms.GetValorIcms, 2);
end;

destructor TIcms20.Destroy;
begin
  FValorIcms.Free;
  FBaseReduzidaIcmsProprio.Free;
  inherited;
end;

function TIcms20.ValorIcmsDesonerado: Currency;
var
  LalorIcmsNormal: Currency;
begin
  LalorIcmsNormal := FValorIcms.CalcularValorNormalIcms;
  Result := RoundABNT(LalorIcmsNormal - FValorIcms.GetValorIcms, 2);
end;

end.

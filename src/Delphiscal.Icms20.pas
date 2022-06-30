unit Delphiscal.Icms20;

interface

uses Delphiscal.Icms.BaseProprio, Delphiscal.Icms.Valor, Delphiscal.Icms20.Intf;

type
  TIcms20 = class(TInterfacedObject, IIcms20)
  private
    FBaseReduzidaIcmsProprio: TBaseIcmsProprio;
    FValorIcms: TValorIcms;
    function BaseReduzidaIcmsProprio: Double;
    function ValorIcmsProprio: Double;
    function ValorIcmsDesonerado: Double;
  public
    constructor Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaIcms,
      APercentualReducao: Double; const AValorIpi: Double = 0);
    class function New(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaIcms,
      APercentualReducao: Double; const AValorIpi: Double = 0): IIcms20;
    destructor Destroy; override;
  end;

implementation

uses Delphiscal.Utils;

constructor TIcms20.Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaIcms,
  APercentualReducao: Double; const AValorIpi: Double = 0);
begin
  FBaseReduzidaIcmsProprio := TBaseIcmsProprio.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias,
    AValorDesconto, APercentualReducao, AValorIpi);
  FValorIcms := TValorIcms.Create(FBaseReduzidaIcmsProprio, AAliquotaIcms);
end;

function TIcms20.BaseReduzidaIcmsProprio: Double;
begin
  Result := FBaseReduzidaIcmsProprio.CalcularBaseReduzida;
end;

function TIcms20.ValorIcmsProprio: Double;
begin
  Result := RoundABNT(FValorIcms.GetValorIcms, 2);
end;

destructor TIcms20.Destroy;
begin
  FValorIcms.Free;
  FBaseReduzidaIcmsProprio.Free;
  inherited;
end;

class function TIcms20.New(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaIcms,
  APercentualReducao, AValorIpi: Double): IIcms20;
begin
  Result := TIcms20.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaIcms,
    APercentualReducao, AValorIpi);
end;

function TIcms20.ValorIcmsDesonerado: Double;
var
  LalorIcmsNormal: Double;
begin
  LalorIcmsNormal := FValorIcms.CalcularValorNormalIcms;
  Result := RoundABNT(LalorIcmsNormal - FValorIcms.GetValorIcms, 2);
end;

end.

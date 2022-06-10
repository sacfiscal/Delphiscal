unit Delphiscal.Icms20.Test;

interface

uses
  DUnitX.TestFramework,
  Delphiscal.Icms20.Intf,
  Delphiscal.Icms20,
  System.SysUtils;

type
  [TestFixture]
  TDelphiscalIcms20Test = class
  private
    FIcms20: IIcms20;
    FValorProduto: Double;
    FValorFrete: Double;
    FValorSeguro: Double;
    FDespesasAcessorias: Double;
    FValorDesconto: Double;
    FValorIpi: Double;
    FAliquotaIcmsProprio: Double;
    FPercentualReducao: Double;
    FValorBC: Double;
    FValorIcms: Double;
    FValorIcmsDeson: Double;

  public
    [Setup]
    procedure Setup;

    [Test]
    procedure Icms20BaseReduzida;
  end;

implementation

{ TDelphiscalIcms20Test }

procedure TDelphiscalIcms20Test.Icms20BaseReduzida;
begin
  FValorProduto := 135;
  FValorFrete := 7.5;
  FValorSeguro := 3;
  FDespesasAcessorias := 1.5;
  FValorDesconto := 13.5;
  FValorIpi := 0;
  FAliquotaIcmsProprio := 18;
  FPercentualReducao := 10;

  FIcms20 := TIcms20.New(FValorProduto, FValorFrete, FValorSeguro, FDespesasAcessorias,
                         FValorDesconto, FAliquotaIcmsProprio, FPercentualReducao,
                         FValorIpi);

  FValorBC := FIcms20.BaseReduzidaIcmsProprio;
  FValorIcms := FIcms20.ValorIcmsProprio;
  FValorIcmsDeson := FIcms20.ValorIcmsDesonerado;

  Assert.AreEqual<Double>(120.15, FValorBC);
  Assert.AreEqual<Double>(21.63, FValorIcms);
  Assert.AreEqual<Double>(2.4, FValorIcmsDeson);
end;

procedure TDelphiscalIcms20Test.Setup;
begin
  FValorProduto := 0;
  FValorFrete := 0;
  FValorSeguro := 0;
  FDespesasAcessorias := 0;
  FValorDesconto := 0;
  FValorIpi := 0;
  FAliquotaIcmsProprio := 0;
  FPercentualReducao := 0;
  FValorBC := 0;
  FValorIcms := 0;
  FValorIcmsDeson := 0;
end;

end.

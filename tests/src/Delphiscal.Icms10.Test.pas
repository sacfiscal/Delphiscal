unit Delphiscal.Icms10.Test;

interface

uses
  DUnitX.TestFramework,
  Delphiscal.Icms10.Intf,
  Delphiscal.Icms10,
  System.SysUtils;

type
  [TestFixture]
  TDelphiscalIcms10Test = class
  private
    FIcms10: IIcms10;
    FValorProduto: Double;
    FValorFrete: Double;
    FValorSeguro: Double;
    FDespesasAcessorias: Double;
    FValorDesconto: Double;
    FValorIpi: Double;
    FAliquotaIcmsProprio: Double;
    FAliquotaIcmsST: Double;
    FMVA: Double;
    FPercentualReducaoST: Double;
    FValorBC: Double;
    FValorIcms: Double;
    FValorBCST: Double;
    FValorIcmsST: Double;
    FValorIcmsSTDeson: Double;

  public
    [Setup]
    procedure Setup;

    [Test]
    procedure Icms10;
  end;

implementation

{ TDelphiscalIcms10Test }

procedure TDelphiscalIcms10Test.Icms10;
begin
  FValorProduto := 135;
  FValorFrete := 7.5;
  FValorSeguro := 3;
  FDespesasAcessorias := 1.5;
  FValorDesconto := 13.5;
  FValorIpi := 15;
  FAliquotaIcmsProprio := 12;
  FAliquotaIcmsST := 18;
  FMVA := 40.65;
  FPercentualReducaoST := 10;

  FIcms10 := TIcms10.New(FValorProduto, FValorFrete, FValorSeguro, FDespesasAcessorias,
                         FValorDesconto, FAliquotaIcmsProprio, FAliquotaIcmsST,
                         FMVA, FPercentualReducaoST, FValorIpi);

  FValorBC := FIcms10.ValorBaseIcmsProprio;
  FValorIcms := FIcms10.ValorIcmsProprio;
  FValorBCST := FIcms10.ValorBaseIcmsST;
  FValorIcmsST := FIcms10.ValorIcmsST;
  FValorIcmsSTDeson := FIcms10.ValorIcmsSTDesonerado;

  Assert.AreEqual<Double>(133.5, FValorBC);
  Assert.AreEqual<Double>(16.02, FValorIcms);
  Assert.AreEqual<Double>(183.99, FValorBCST);
  Assert.AreEqual<Double>(17.1, FValorIcmsST);
  Assert.AreEqual<Double>(4.48, FValorIcmsSTDeson);
end;

procedure TDelphiscalIcms10Test.Setup;
begin
  FValorProduto := 0;
  FValorFrete := 0;
  FValorSeguro := 0;
  FDespesasAcessorias := 0;
  FValorDesconto := 0;
  FValorIpi := 0;
  FAliquotaIcmsProprio := 0;
  FAliquotaIcmsST := 0;
  FMVA := 0;
  FPercentualReducaoST := 0;
  FValorBC := 0;
  FValorIcms := 0;
  FValorBCST := 0;
  FValorIcmsST := 0;
  FValorIcmsSTDeson := 0;
end;

end.

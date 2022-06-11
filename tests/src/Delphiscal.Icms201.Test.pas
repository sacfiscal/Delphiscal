unit Delphiscal.Icms201.Test;

interface

uses
  DUnitX.TestFramework,
  Delphiscal.Icms201.Intf,
  Delphiscal.Icms201,
  System.SysUtils;

type
  [TestFixture]
  TDelphiscalIcms201Test = class
  private
    FIcms201: IIcms201;
    FValorProduto: Double;
    FValorFrete: Double;
    FValorSeguro: Double;
    FDespesasAcessorias: Double;
    FValorDesconto: Double;
    FAliquotaIcmsProprio: Double;
    FAliquotaIcmsST: Double;
    FMVA: Double;
    FPercentualReducao: Double;
    FPercentualCreditoSN: Double;
    FPercentualReducaoST: Double;
    FValorBC: Double;
    FValorIcms: Double;
    FValorCredSN: Double;
    FValorBCST: Double;
    FValorIcmsST: Double;

  public
    [Setup]
    procedure Setup;

    [Test]
    procedure Icms201;
  end;

implementation

{ TDelphiscalIcms201Test }

procedure TDelphiscalIcms201Test.Icms201;
begin
  FValorProduto := 180;
  FValorFrete := 4.96;
  FValorSeguro := 0.5;
  FDespesasAcessorias := 1.49;
  FValorDesconto := 9.92;
  FAliquotaIcmsProprio := 18;
  FAliquotaIcmsST := 18;
  FMVA := 38;
  FPercentualCreditoSN := 1.25;

  FIcms201 := TIcms201.New(FValorProduto, FValorFrete, FValorSeguro, FDespesasAcessorias,
                           FValorDesconto, FAliquotaIcmsProprio, FPercentualReducao,
                           FPercentualCreditoSN, FAliquotaIcmsST, FMVA, FPercentualReducaoST);

  FValorBC := FIcms201.ValorBaseIcmsProprio;
  FValorIcms := FIcms201.ValorIcmsProprio;
  FValorCredSN := FIcms201.ValorCreditoSN;
  FValorBCST := FIcms201.ValorBaseIcmsST;
  FValorIcmsST := FIcms201.ValorIcmsST;

  Assert.AreEqual<Double>(177.03, FValorBC);
  Assert.AreEqual<Double>(31.87, FValorIcms);
  Assert.AreEqual<Double>(2.21, FValorCredSN);
  Assert.AreEqual<Double>(244.3, FValorBCST);
  Assert.AreEqual<Double>(12.1, FValorIcmsST);
end;

procedure TDelphiscalIcms201Test.Setup;
begin
  FValorProduto := 0;
  FValorFrete := 0;
  FValorSeguro := 0;
  FDespesasAcessorias := 0;
  FValorDesconto := 0;
  FAliquotaIcmsProprio := 0;
  FAliquotaIcmsST := 0;
  FMVA := 0;
  FPercentualReducao := 0;
  FPercentualCreditoSN := 0;
  FPercentualReducaoST := 0;
  FValorBC := 0;
  FValorIcms := 0;
  FValorCredSN := 0;
  FValorBCST := 0;
  FValorIcmsST := 0;
end;

end.

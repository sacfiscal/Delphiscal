unit Delphiscal.Icms.BaseST.Test;

interface

uses
  DUnitX.TestFramework,
  Delphiscal.Icms.BaseST,
  Delphiscal.Icms.BaseProprio,
  System.SysUtils;

type
  [TestFixture]
  TDelphiscalIcmsBaseSTTest = class
  private
    FIcmsBaseST: TBaseIcmsST;
    FIcmsBaseProprio: TBaseIcmsProprio;
    FValorProduto: Double;
    FValorFrete: Double;
    FValorSeguro: Double;
    FDespesasAcessorias: Double;
    FValorDesconto: Double;
    FPercentualReducao: Double;
    FValorIpi: Double;
    FMVA: Double;
    FValorBCST: Double;

  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure BaseIcmsST;

    [Test]
    procedure BaseReduzidaIcmsST;
  end;

implementation

{ TDelphiscalIcmsBaseSTTest }

procedure TDelphiscalIcmsBaseSTTest.BaseIcmsST;
begin
  FValorProduto := 135;
  FValorFrete := 7.5;
  FValorSeguro := 3;
  FDespesasAcessorias := 1.5;
  FValorDesconto := 13.5;
  FValorIpi := 0;
  FMVA := 40.65;

  FIcmsBaseProprio := TBaseIcmsProprio.Create(FValorProduto, FValorFrete, FValorSeguro,
                                              FDespesasAcessorias, FValorDesconto, FPercentualReducao,
                                              FValorIpi);

  FIcmsBaseST := TBaseIcmsST.Create(FIcmsBaseProprio, FMVA, FPercentualReducao, FValorIpi);
  FValorBCST := FIcmsBaseST.CalcularBaseIcmsST;

  Assert.AreEqual<Double>(133.50, FIcmsBaseProprio.CalcularBaseIcmsProprio);
  Assert.AreEqual<Double>(187.77, FValorBCST);
end;

procedure TDelphiscalIcmsBaseSTTest.BaseReduzidaIcmsST;
begin
  FValorProduto := 135;
  FValorFrete := 7.5;
  FValorSeguro := 0.75;
  FDespesasAcessorias := 2.25;
  FValorDesconto := 15;
  FValorIpi := 0;
  FPercentualReducao := 10;
  FMVA := 40.65;

  FIcmsBaseProprio := TBaseIcmsProprio.Create(FValorProduto, FValorFrete, FValorSeguro,
                                              FDespesasAcessorias, FValorDesconto);

  FIcmsBaseST := TBaseIcmsST.Create(FIcmsBaseProprio, FMVA, FPercentualReducao, FValorIpi);
  FValorBCST := FIcmsBaseST.CalcularBaseReduzidaST;

  Assert.AreEqual<Double>(130.50, FIcmsBaseProprio.CalcularBaseIcmsProprio);
  Assert.AreEqual<Double>(165.19, FValorBCST);
end;

procedure TDelphiscalIcmsBaseSTTest.Setup;
begin
  FIcmsBaseST := nil;
  FIcmsBaseProprio := nil;
  FValorProduto := 0;
  FValorFrete := 0;
  FValorSeguro := 0;
  FDespesasAcessorias := 0;
  FValorDesconto := 0;
  FValorIpi := 0;
  FPercentualReducao := 0;
  FMVA := 0;
  FValorBCST := 0;
end;

procedure TDelphiscalIcmsBaseSTTest.TearDown;
begin
  FreeAndNil(FIcmsBaseST);
  FreeAndNil(FIcmsBaseProprio);
end;

end.

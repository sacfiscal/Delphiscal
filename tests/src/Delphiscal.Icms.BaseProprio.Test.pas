unit Delphiscal.Icms.BaseProprio.Test;

interface

uses
  DUnitX.TestFramework,
  Delphiscal.Icms.BaseProprio,
  System.SysUtils;

type
  [TestFixture]
  TDelphiscalIcmsBaseProprioTest = class
  private
    FIcmsBaseProprio: TBaseIcmsProprio;
    FValorProduto: Double;
    FValorFrete: Double;
    FValorSeguro: Double;
    FDespesasAcessorias: Double;
    FValorDesconto: Double;
    FValorIpi: Double;
    FValorBC: Double;
    FPercentualReducao: Double;

  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure BaseIcmsProprio;
  end;

implementation

procedure TDelphiscalIcmsBaseProprioTest.BaseIcmsProprio;
begin
  FValorProduto := 135;
  FValorFrete := 7.5;
  FValorSeguro := 3;
  FDespesasAcessorias := 1.5;
  FValorDesconto := 13.5;
  FValorIpi := 15;

  FIcmsBaseProprio := TBaseIcmsProprio.Create(FValorProduto, FValorFrete, FValorSeguro,
                                              FDespesasAcessorias, FValorDesconto, FPercentualReducao,
                                              FValorIpi);
  FValorBC := FIcmsBaseProprio.CalcularBaseIcmsProprio;

  Assert.AreEqual<Double>(148.5, FValorBC);
end;

procedure TDelphiscalIcmsBaseProprioTest.Setup;
begin
  FIcmsBaseProprio := nil;
  FValorProduto := 0;
  FValorFrete := 0;
  FValorSeguro := 0;
  FDespesasAcessorias := 0;
  FValorDesconto := 0;
  FPercentualReducao := 0;
  FValorIpi := 0;
  FValorBC := 0;
end;

procedure TDelphiscalIcmsBaseProprioTest.TearDown;
begin
  FreeAndNil(FIcmsBaseProprio);
end;

end.

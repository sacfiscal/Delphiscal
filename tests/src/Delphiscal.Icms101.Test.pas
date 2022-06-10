unit Delphiscal.Icms101.Test;

interface

uses
  DUnitX.TestFramework,
  Delphiscal.Icms101.Intf,
  Delphiscal.Icms101,
  System.SysUtils;

type
  [TestFixture]
  TDelphiscalIcms101Test = class
  private
    FIcms101: IIcms101;
    FValorProduto: Double;
    FValorFrete: Double;
    FValorSeguro: Double;
    FDespesasAcessorias: Double;
    FValorDesconto: Double;
    FPercentualCreditoSN: Double;
    FValorBCSN: Double;
    FValorCreditoSN: Double;

  public
    [Setup]
    procedure Setup;

    [Test]
    procedure Icms101;
  end;

implementation

{ TDelphiscalIcms101Test }

procedure TDelphiscalIcms101Test.Icms101;
begin
  FValorProduto := 135;
  FValorFrete := 7.5;
  FValorSeguro := 0.75;
  FDespesasAcessorias := 2.25;
  FValorDesconto := 15;
  FPercentualCreditoSN := 1.25;

  FIcms101 := TIcms101.New(FValorProduto, FValorFrete, FValorSeguro, FDespesasAcessorias,
                         FValorDesconto, FPercentualCreditoSN);

  FValorBCSN := FIcms101.BaseCreditoSN;
  FValorCreditoSN := FIcms101.ValorCreditoSN;

  Assert.AreEqual<Double>(130.5, FValorBCSN);
  Assert.AreEqual<Double>(1.63, FValorCreditoSN);
end;

procedure TDelphiscalIcms101Test.Setup;
begin
  FValorProduto := 0;
  FValorFrete := 0;
  FValorSeguro := 0;
  FDespesasAcessorias := 0;
  FValorDesconto := 0;
  FPercentualCreditoSN := 0;
  FValorBCSN := 0;
  FValorCreditoSN := 0;
end;

end.

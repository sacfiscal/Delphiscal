unit Delphiscal.Icms202_203.Test;

interface

uses
  DUnitX.TestFramework,
  Delphiscal.Icms202_203.Intf,
  Delphiscal.Icms202_203,
  System.SysUtils;

type
  [TestFixture]
  TDelphiscalIcms202_203Test = class
  private
    FIcms202_203: IIcms202_203;
    FValorProduto: Double;
    FValorFrete: Double;
    FValorSeguro: Double;
    FDespesasAcessorias: Double;
    FValorDesconto: Double;
    FAliquotaIcmsProprio: Double;
    FAliquotaIcmsST: Double;
    FMVA: Double;
    FPercentualReducao: Double;
    FPercentualReducaoST: Double;
    FValorBC: Double;
    FValorIcms: Double;
    FValorBCST: Double;
    FValorIcmsST: Double;

  public
    [Setup]
    procedure Setup;

    [Test]
    procedure Icms202_203;
  end;

implementation

{ TDelphiscalIcms202_203Test }

procedure TDelphiscalIcms202_203Test.Icms202_203;
begin
  FValorProduto := 180;
  FValorFrete := 4.96;
  FValorSeguro := 0.5;
  FDespesasAcessorias := 1.49;
  FValorDesconto := 9.92;
  FAliquotaIcmsProprio := 18;
  FAliquotaIcmsST := 18;
  FMVA := 38;

  FIcms202_203 := TIcms202_203.New(FValorProduto, FValorFrete, FValorSeguro, FDespesasAcessorias,
                           FValorDesconto, FAliquotaIcmsProprio, FPercentualReducao,
                           FAliquotaIcmsST, FMVA, FPercentualReducaoST);

  FValorBC := FIcms202_203.ValorBaseIcmsProprio;
  FValorIcms := FIcms202_203.ValorIcmsProprio;
  FValorBCST := FIcms202_203.ValorBaseIcmsST;
  FValorIcmsST := FIcms202_203.ValorIcmsST;

  Assert.AreEqual<Double>(177.03, FValorBC);
  Assert.AreEqual<Double>(31.87, FValorIcms);
  Assert.AreEqual<Double>(244.3, FValorBCST);
  Assert.AreEqual<Double>(12.1, FValorIcmsST);
end;

procedure TDelphiscalIcms202_203Test.Setup;
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
  FPercentualReducaoST := 0;
  FValorBC := 0;
  FValorIcms := 0;
  FValorBCST := 0;
  FValorIcmsST := 0;
end;

end.


unit Delphiscal.Icms00.Test;

interface

uses
  DUnitX.TestFramework,
  Delphiscal.Icms00.Intf,
  Delphiscal.Icms00,
  System.SysUtils;

type
  [TestFixture]
  TDelphiscalIcms00Test = class
  private
    FIcms00: IIcms00;
    FValorProduto: Double;
    FValorFrete: Double;
    FValorSeguro: Double;
    FDespesasAcessorias: Double;
    FValorDesconto: Double;
    FValorIpi: Double;
    FAliquota: Double;
    FValorBC: Double;
    FValorIcms: Double;

  public
    [Setup]
    procedure Setup;

    [Test]
    procedure Icms00;
  end;

implementation

{ TDelphiscalIcms00Test }

procedure TDelphiscalIcms00Test.Icms00;
begin
  FValorProduto := 135;
  FValorFrete := 7.5;
  FValorSeguro := 3;
  FDespesasAcessorias := 1.5;
  FValorDesconto := 13.5;
  FValorIpi := 15;
  FAliquota := 18;

  FIcms00 := TIcms00.New(FValorProduto, FValorFrete, FValorSeguro, FDespesasAcessorias,
                         FValorDesconto, FAliquota, FValorIpi);

  FValorBC := FIcms00.BaseIcmsProprio;
  FValorIcms := FIcms00.ValorIcmsProprio;

  Assert.AreEqual<Double>(148.5, FValorBC);
  Assert.AreEqual<Double>(26.73, FValorIcms);
end;

procedure TDelphiscalIcms00Test.Setup;
begin
  FValorProduto := 0;
  FValorFrete := 0;
  FValorSeguro := 0;
  FDespesasAcessorias := 0;
  FValorDesconto := 0;
  FValorIpi := 0;
  FValorBC := 0;
  FValorIcms := 0;
end;

end.

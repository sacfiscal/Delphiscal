unit Delphiscal.Pis01_02.Test;

interface

uses
  DUnitX.TestFramework,
  Delphiscal.Pis01_02.Intf,
  Delphiscal.Pis01_02,
  System.SysUtils;

type
  [TestFixture]
  TDelphiscalPis01_02Test = class
  private
    FPis01_02 : IPis01_02;
    FValorProduto: Double;
    FValorFrete: Double;
    FValorSeguro: Double;
    FDespesasAcessorias: Double;
    FValorDesconto: Double;
    FAliquota: Double;
    FBasePis : Double;
    FValorPis : Double;
  public
    [Setup]
    procedure Setup;

    [Test]
    procedure Pis01_02;

    [Test]
    procedure Pis01_02_Attributes;
  end;

implementation

{ TDelphiscalPis01_02Test }

procedure TDelphiscalPis01_02Test.Pis01_02;
begin
  FValorProduto := 135;
  FValorFrete := 4.74;
  FValorSeguro := 1.89;
  FDespesasAcessorias := 0.95;
  FValorDesconto := 2.37;
  FAliquota := 0.65;

  FPis01_02 := TPis01_02.Create(
                  FValorProduto,
                  FValorFrete,
                  FValorSeguro,
                  FDespesasAcessorias,
                  FValorDesconto,
                  FAliquota);

  FBasePis := FPis01_02.BasePis;
  FValorPis := FPis01_02.ValorPis;

  Assert.AreEqual<Double>(140.21, FBasePis);
  Assert.AreEqual<Double>(0.91, FValorPis);
end;

procedure TDelphiscalPis01_02Test.Pis01_02_Attributes;
begin
  FValorProduto := 135;
  FValorFrete := 4.74;
  FValorSeguro := 1.89;
  FDespesasAcessorias := 0.95;
  FValorDesconto := 2.37;
  FAliquota := 0.65;

  FPis01_02 := TPis01_02.New
                   .Attributes
                     .ValorProduto(FValorProduto)
                     .ValorFrete(FValorFrete)
                     .ValorSeguro(FValorSeguro)
                     .ValorDespesas(FDespesasAcessorias)
                     .ValorDesconto(FValorDesconto)
                     .AliquotaPis(FAliquota)
                   .&End;

  FBasePis := FPis01_02.BasePis;
  FValorPis := FPis01_02.ValorPis;

  Assert.AreEqual<Double>(140.21, FBasePis);
  Assert.AreEqual<Double>(0.91, FValorPis);
end;

procedure TDelphiscalPis01_02Test.Setup;
begin
  FValorProduto := 0;
  FValorFrete := 0;
  FValorSeguro := 0;
  FDespesasAcessorias := 0;
  FValorDesconto := 0;
  FAliquota := 0;
end;

end.

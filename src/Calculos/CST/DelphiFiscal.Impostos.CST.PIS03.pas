unit DelphiFiscal.Impostos.CST.PIS03;

interface

uses
  DelphiFiscal.CST.Interfaces,
  DelphiFiscal.Controller.Interfaces;

type
  TPIS03 = class(TInterfacedObject, iPIS03)
    private
      [weak]
      FParent : iController;
    public
      constructor Create(Parent : iController);
      destructor Destroy; override;
      class function New(Parent : iController) : iPIS03;
      function BasePis: Double;
      function ValorPis: Double;
      function ValorPisEspecifico: Double;
      Function &End : iController;
  end;

implementation

{ TPIS03 }

uses Delphiscal.Utils;

function TPIS03.BasePis: Double;
begin
  result:= RoundABNT(((FParent.Base.ValorProduto +
                       FParent.Base.ValorFrete +
                       FParent.Base.ValorSeguro +
                       FParent.Base.ValorDespesasAcessorias) -
                       FParent.Base.ValorDescontos), 2);
end;

constructor TPIS03.Create(Parent: iController);
begin
  FParent:= Parent;
end;

destructor TPIS03.Destroy;
begin

  inherited;
end;

function TPIS03.&End: iController;
begin
  Result:= FParent;
end;

class function TPIS03.New(Parent: iController): iPIS03;
begin
  Result:= Self.Create(Parent);
end;

function TPIS03.ValorPis: Double;
begin
  Result := RoundABNT(BasePis * (FParent.PIS.AliquotaPIS / 100), 2);
end;

function TPIS03.ValorPisEspecifico: Double;
begin
  Result := RoundABNT((FParent.PIS.QtdePISTributada * FParent.PIS.ValorPISPorUnidade), 2);
end;

end.



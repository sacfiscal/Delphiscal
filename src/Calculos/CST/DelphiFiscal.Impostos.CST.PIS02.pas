unit DelphiFiscal.Impostos.CST.PIS02;

interface

uses
  DelphiFiscal.CST.Interfaces,
  DelphiFiscal.Controller.Interfaces;

type
  TPIS02 = class(TInterfacedObject, iPIS02)
    private
      [weak]
      FParent : iController;
    public
      constructor Create(Parent : iController);
      destructor Destroy; override;
      class function New(Parent : iController) : iPIS02;
      function BasePis: Double;
      function ValorPis: Double;
      function ValorPisEspecifico: Double;
      Function &End : iController;
  end;

implementation

{ TPIS02 }

uses Delphiscal.Utils;

function TPIS02.BasePis: Double;
begin
  result:= RoundABNT(((FParent.Base.ValorProduto +
                       FParent.Base.ValorFrete +
                       FParent.Base.ValorSeguro +
                       FParent.Base.ValorDespesasAcessorias) -
                       FParent.Base.ValorDescontos), 2);
end;

constructor TPIS02.Create(Parent: iController);
begin
  FParent:= Parent;
end;

destructor TPIS02.Destroy;
begin

  inherited;
end;

function TPIS02.&End: iController;
begin
  Result:= FParent;
end;

class function TPIS02.New(Parent: iController): iPIS02;
begin
  Result:= Self.Create(Parent);
end;

function TPIS02.ValorPis: Double;
begin
  Result := RoundABNT(BasePis * (FParent.PIS.AliquotaPIS / 100), 2);
end;

function TPIS02.ValorPisEspecifico: Double;
begin
  Result := RoundABNT((FParent.PIS.QtdePISTributada * FParent.PIS.ValorPISPorUnidade), 2);
end;

end.



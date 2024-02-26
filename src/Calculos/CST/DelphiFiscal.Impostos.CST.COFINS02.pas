unit DelphiFiscal.Impostos.CST.COFINS02;

interface

uses
  DelphiFiscal.Controller.Interfaces,
  DelphiFiscal.CST.Interfaces;

type
  TCOFINS02 = class(TInterfacedObject, iCOFINS02)
    private
      [weak]
      FParent : iController;
    public
      constructor Create(Parent : iController);
      destructor Destroy; override;
      class function New(Parent : iController) : iCOFINS02;
      function BaseCofins: Double;
      function ValorCofins: Double;
      function ValorCofinsEspecifico: Double;
      Function &End : iController;
  end;

implementation

{ TCOFINS02 }

uses Delphiscal.Utils;

function TCOFINS02.BaseCofins: Double;
begin
  result:= RoundABNT(((FParent.Base.ValorProduto +
                       FParent.Base.ValorFrete +
                       FParent.Base.ValorSeguro +
                       FParent.Base.ValorDespesasAcessorias) -
                       FParent.Base.ValorDescontos), 2);
end;

constructor TCOFINS02.Create(Parent: iController);
begin
  FParent:= Parent;
end;

destructor TCOFINS02.Destroy;
begin

  inherited;
end;

function TCOFINS02.&End: iController;
begin
  Result:= FParent;
end;

class function TCOFINS02.New(Parent: iController): iCOFINS02;
begin
  Result:= Self.Create(Parent);
end;

function TCOFINS02.ValorCofins: Double;
begin
  Result := RoundABNT(BaseCofins * (FParent.PIS.AliquotaPIS / 100), 2);
end;

function TCOFINS02.ValorCofinsEspecifico: Double;
begin
  Result := RoundABNT((FParent.PIS.QtdePISTributada * FParent.PIS.ValorPISPorUnidade), 2);
end;

end.


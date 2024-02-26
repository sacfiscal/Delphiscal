unit DelphiFiscal.Impostos.CST.COFINS01;

interface

uses
  DelphiFiscal.CST.Interfaces,
  DelphiFiscal.Controller.Interfaces;

type
  TCOFINS01 = class(TInterfacedObject, iCOFINS01)
    private
      [weak]
      FParent : iController;
    public
      constructor Create(Parent : iController);
      destructor Destroy; override;
      class function New(Parent : iController) : iCOFINS01;
      function BaseCofins: Double;
      function ValorCofins: Double;
      function ValorCofinsEspecifico: Double;
      Function &End : iController;
  end;

implementation

{ TCOFINS01 }

uses Delphiscal.Utils;

function TCOFINS01.BaseCofins: Double;
begin
  result:= RoundABNT(((FParent.Base.ValorProduto +
                       FParent.Base.ValorFrete +
                       FParent.Base.ValorSeguro +
                       FParent.Base.ValorDespesasAcessorias) -
                       FParent.Base.ValorDescontos), 2);
end;

constructor TCOFINS01.Create(Parent: iController);
begin
  FParent:= Parent;
end;

destructor TCOFINS01.Destroy;
begin

  inherited;
end;

function TCOFINS01.&End: iController;
begin
  Result:= FParent;
end;

class function TCOFINS01.New(Parent: iController): iCOFINS01;
begin
  Result:= Self.Create(Parent);
end;

function TCOFINS01.ValorCofins: Double;
begin
  Result := RoundABNT(BaseCofins * (FParent.COFINS.AliquotaCOFINS / 100), 2);
end;

function TCOFINS01.ValorCofinsEspecifico: Double;
begin
  Result := RoundABNT((FParent.COFINS.QtdeCOFINSTributada * FParent.COFINS.ValorCOFINSPorUnidade), 2);
end;

end.


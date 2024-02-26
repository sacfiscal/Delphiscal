unit DelphiFiscal.Impostos.CST.COFINS03;

interface

uses
  DelphiFiscal.Controller.Interfaces,
  DelphiFiscal.CST.Interfaces;

type
  TCOFINS03 = class(TInterfacedObject, iCOFINS03)
    private
      [weak]
      FParent : iController;
    public
      constructor Create(Parent : iController);
      destructor Destroy; override;
      class function New(Parent : iController) : iCOFINS03;
      function BaseCofins: Double;
      function ValorCofins: Double;
      function ValorCofinsEspecifico: Double;
      Function &End : iController;
  end;

implementation

{ TCOFINS03 }

uses Delphiscal.Utils;

function TCOFINS03.BaseCofins: Double;
begin
  result:= RoundABNT(((FParent.Base.ValorProduto +
                       FParent.Base.ValorFrete +
                       FParent.Base.ValorSeguro +
                       FParent.Base.ValorDespesasAcessorias) -
                       FParent.Base.ValorDescontos), 2);
end;

constructor TCOFINS03.Create(Parent: iController);
begin
  FParent:= Parent;
end;

destructor TCOFINS03.Destroy;
begin

  inherited;
end;

function TCOFINS03.&End: iController;
begin
  Result:= FParent;
end;

class function TCOFINS03.New(Parent: iController): iCOFINS03;
begin
  Result:= Self.Create(Parent);
end;

function TCOFINS03.ValorCofins: Double;
begin
  Result := RoundABNT(BaseCofins * (FParent.PIS.AliquotaPIS / 100), 2);
end;

function TCOFINS03.ValorCofinsEspecifico: Double;
begin
  Result := RoundABNT((FParent.PIS.QtdePISTributada * FParent.PIS.ValorPISPorUnidade), 2);
end;

end.



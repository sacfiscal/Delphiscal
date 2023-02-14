unit DelphiFiscal.Impostos.CST.COFINS03;

interface

uses
  DelphiFiscal.Calculos.Interfaces;

type
  TCOFINS03 = class(TInterfacedObject, iCOFINS03)
    private
      [weak]
      FParent : iCST;
    public
      constructor Create(Parent : iCST);
      destructor Destroy; override;
      class function New(Parent : iCST) : iCOFINS03;
      function BaseCofins: Double;
      function ValorCofins: Double;
      function ValorCofinsEspecifico: Double;
      Function &End : iCST;
  end;

implementation

{ TCOFINS03 }

uses Delphiscal.Utils;

function TCOFINS03.BaseCofins: Double;
begin
  result:= RoundABNT(((FParent.&End.ValorProduto + FParent.&End.ValorFrete + FParent.&End.ValorSeguro + FParent.&End.ValorDespesasAcessorias) - FParent.&End.ValorDescontos), 2);
end;

constructor TCOFINS03.Create(Parent: iCST);
begin
  FParent:= Parent;
end;

destructor TCOFINS03.Destroy;
begin

  inherited;
end;

function TCOFINS03.&End: iCST;
begin
  Result:= FParent;
end;

class function TCOFINS03.New(Parent: iCST): iCOFINS03;
begin
  Result:= Self.Create(Parent);
end;

function TCOFINS03.ValorCofins: Double;
begin
  Result := RoundABNT(BaseCofins * (FParent.&End.PIS.AliquotaPIS / 100), 2);
end;

function TCOFINS03.ValorCofinsEspecifico: Double;
begin
  Result := RoundABNT((FParent.&End.PIS.QtdePISTributada * FParent.&End.PIS.ValorPISPorUnidade), 2);
end;

end.



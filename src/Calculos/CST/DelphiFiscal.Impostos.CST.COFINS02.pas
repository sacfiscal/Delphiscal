unit DelphiFiscal.Impostos.CST.COFINS02;

interface

uses
  DelphiFiscal.Calculos.Interfaces;

type
  TCOFINS02 = class(TInterfacedObject, iCOFINS02)
    private
      [weak]
      FParent : iCST;
    public
      constructor Create(Parent : iCST);
      destructor Destroy; override;
      class function New(Parent : iCST) : iCOFINS02;
      function BaseCofins: Double;
      function ValorCofins: Double;
      function ValorCofinsEspecifico: Double;
      Function &End : iCST;
  end;

implementation

{ TCOFINS02 }

uses Delphiscal.Utils;

function TCOFINS02.BaseCofins: Double;
begin
  result:= RoundABNT(((FParent.&End.ValorProduto + FParent.&End.ValorFrete + FParent.&End.ValorSeguro + FParent.&End.ValorDespesasAcessorias) - FParent.&End.ValorDescontos), 2);
end;

constructor TCOFINS02.Create(Parent: iCST);
begin
  FParent:= Parent;
end;

destructor TCOFINS02.Destroy;
begin

  inherited;
end;

function TCOFINS02.&End: iCST;
begin
  Result:= FParent;
end;

class function TCOFINS02.New(Parent: iCST): iCOFINS02;
begin
  Result:= Self.Create(Parent);
end;

function TCOFINS02.ValorCofins: Double;
begin
  Result := RoundABNT(BaseCofins * (FParent.&End.PIS.AliquotaPIS / 100), 2);
end;

function TCOFINS02.ValorCofinsEspecifico: Double;
begin
  Result := RoundABNT((FParent.&End.PIS.QtdePISTributada * FParent.&End.PIS.ValorPISPorUnidade), 2);
end;

end.


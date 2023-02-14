unit DelphiFiscal.Impostos.CST.COFINS01;

interface

uses
  DelphiFiscal.Calculos.Interfaces;

type
  TCOFINS01 = class(TInterfacedObject, iCOFINS01)
    private
      [weak]
      FParent : iCST;
    public
      constructor Create(Parent : iCST);
      destructor Destroy; override;
      class function New(Parent : iCST) : iCOFINS01;
      function BaseCofins: Double;
      function ValorCofins: Double;
      function ValorCofinsEspecifico: Double;
      Function &End : iCST;
  end;

implementation

{ TCOFINS01 }

uses Delphiscal.Utils;

function TCOFINS01.BaseCofins: Double;
begin
  result:= RoundABNT(((FParent.&End.ValorProduto + FParent.&End.ValorFrete + FParent.&End.ValorSeguro + FParent.&End.ValorDespesasAcessorias) - FParent.&End.ValorDescontos), 2);
end;

constructor TCOFINS01.Create(Parent: iCST);
begin
  FParent:= Parent;
end;

destructor TCOFINS01.Destroy;
begin

  inherited;
end;

function TCOFINS01.&End: iCST;
begin
  Result:= FParent;
end;

class function TCOFINS01.New(Parent: iCST): iCOFINS01;
begin
  Result:= Self.Create(Parent);
end;

function TCOFINS01.ValorCofins: Double;
begin
  Result := RoundABNT(BaseCofins * (FParent.&End.COFINS.AliquotaCOFINS / 100), 2);
end;

function TCOFINS01.ValorCofinsEspecifico: Double;
begin
  Result := RoundABNT((FParent.&End.COFINS.QtdeCOFINSTributada * FParent.&End.COFINS.ValorCOFINSPorUnidade), 2);
end;

end.


unit DelphiFiscal.Impostos.CST.PIS02;

interface

uses
  DelphiFiscal.Calculos.Interfaces;

type
  TPIS02 = class(TInterfacedObject, iPIS02)
    private
      [weak]
      FParent : iCST;
    public
      constructor Create(Parent : iCST);
      destructor Destroy; override;
      class function New(Parent : iCST) : iPIS02;
      function BasePis: Double;
      function ValorPis: Double;
      function ValorPisEspecifico: Double;
      Function &End : iCST;
  end;

implementation

{ TPIS02 }

uses Delphiscal.Utils;

function TPIS02.BasePis: Double;
begin
  result:= RoundABNT(((FParent.&End.ValorProduto + FParent.&End.ValorFrete + FParent.&End.ValorSeguro + FParent.&End.ValorDespesasAcessorias) - FParent.&End.ValorDescontos), 2);
end;

constructor TPIS02.Create(Parent: iCST);
begin
  FParent:= Parent;
end;

destructor TPIS02.Destroy;
begin

  inherited;
end;

function TPIS02.&End: iCST;
begin
  Result:= FParent;
end;

class function TPIS02.New(Parent: iCST): iPIS02;
begin
  Result:= Self.Create(Parent);
end;

function TPIS02.ValorPis: Double;
begin
  Result := RoundABNT(BasePis * (FParent.&End.PIS.AliquotaPIS / 100), 2);
end;

function TPIS02.ValorPisEspecifico: Double;
begin
  Result := RoundABNT((FParent.&End.PIS.QtdePISTributada * FParent.&End.PIS.ValorPISPorUnidade), 2);
end;

end.



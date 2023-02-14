unit DelphiFiscal.Impostos.CST.PIS01;

interface

uses
  DelphiFiscal.Calculos.Interfaces;

type
  TPIS01 = class(TInterfacedObject, iPIS01)
    private
      [weak]
      FParent : iCST;
    public
      constructor Create(Parent : iCST);
      destructor Destroy; override;
      class function New(Parent : iCST) : iPIS01;
      function BasePis: Double;
      function ValorPis: Double;
      function ValorPisEspecifico: Double;
      Function &End : iCST;
  end;

implementation

{ TPIS01 }

uses Delphiscal.Utils;

function TPIS01.BasePis: Double;
begin
  result:= RoundABNT(((FParent.&End.ValorProduto + FParent.&End.ValorFrete + FParent.&End.ValorSeguro + FParent.&End.ValorDespesasAcessorias) - FParent.&End.ValorDescontos), 2);
end;

constructor TPIS01.Create(Parent: iCST);
begin
  FParent:= Parent;
end;

destructor TPIS01.Destroy;
begin

  inherited;
end;

function TPIS01.&End: iCST;
begin
  Result:= FParent;
end;

class function TPIS01.New(Parent: iCST): iPIS01;
begin
  Result:= Self.Create(Parent);
end;

function TPIS01.ValorPis: Double;
begin
  Result := RoundABNT(BasePis * (FParent.&End.PIS.AliquotaPIS / 100), 2);
end;

function TPIS01.ValorPisEspecifico: Double;
begin
  Result := RoundABNT((FParent.&End.PIS.QtdePISTributada * FParent.&End.PIS.ValorPISPorUnidade), 2);
end;

end.


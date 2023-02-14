unit DelphiFiscal.Impostos.CST.PIS03;

interface

uses
  DelphiFiscal.Calculos.Interfaces;

type
  TPIS03 = class(TInterfacedObject, iPIS03)
    private
      [weak]
      FParent : iCST;
    public
      constructor Create(Parent : iCST);
      destructor Destroy; override;
      class function New(Parent : iCST) : iPIS03;
      function BasePis: Double;
      function ValorPis: Double;
      function ValorPisEspecifico: Double;
      Function &End : iCST;
  end;

implementation

{ TPIS03 }

uses Delphiscal.Utils;

function TPIS03.BasePis: Double;
begin
  result:= RoundABNT(((FParent.&End.ValorProduto + FParent.&End.ValorFrete + FParent.&End.ValorSeguro + FParent.&End.ValorDespesasAcessorias) - FParent.&End.ValorDescontos), 2);
end;

constructor TPIS03.Create(Parent: iCST);
begin
  FParent:= Parent;
end;

destructor TPIS03.Destroy;
begin

  inherited;
end;

function TPIS03.&End: iCST;
begin
  Result:= FParent;
end;

class function TPIS03.New(Parent: iCST): iPIS03;
begin
  Result:= Self.Create(Parent);
end;

function TPIS03.ValorPis: Double;
begin
  Result := RoundABNT(BasePis * (FParent.&End.PIS.AliquotaPIS / 100), 2);
end;

function TPIS03.ValorPisEspecifico: Double;
begin
  Result := RoundABNT((FParent.&End.PIS.QtdePISTributada * FParent.&End.PIS.ValorPISPorUnidade), 2);
end;

end.



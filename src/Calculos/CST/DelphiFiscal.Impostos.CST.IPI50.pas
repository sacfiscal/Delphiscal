unit DelphiFiscal.Impostos.CST.IPI50;

interface

uses
  DelphiFiscal.Calculos.Interfaces;

type
  TIPI50 = class(TInterfacedObject, iIPI50)
    private
      [weak]
      FParent : iCST;
    public
      constructor Create(Parent : iCST);
      destructor Destroy; override;
      class function New(Parent : iCST) : iIPI50;
      function BaseIpi: Double;
      function ValorIpi: Double;
      function ValorIpiEspecifico: Double;
      Function &End : iCST;
  end;

implementation

{ TIPI50 }

uses Delphiscal.Utils;

function TIPI50.BaseIpi: Double;
begin
  result:= RoundABNT((FParent.&End.ValorProduto + FParent.&End.ValorFrete + FParent.&End.ValorSeguro + FParent.&End.ValorDespesasAcessorias), 2);
end;

constructor TIPI50.Create(Parent: iCST);
begin
  FParent:= Parent;
end;

destructor TIPI50.Destroy;
begin

  inherited;
end;

function TIPI50.&End: iCST;
begin
  Result:= FParent;
end;

class function TIPI50.New(Parent: iCST): iIPI50;
begin
  Result:= Self.Create(Parent);
end;


function TIPI50.ValorIpi: Double;
begin
  Result := RoundABNT(BaseIpi * (FParent.&End.IPI.AliquotaIPI / 100), 2);
end;

function TIPI50.ValorIpiEspecifico: Double;
begin
  Result := RoundABNT((FParent.&End.IPI.QtdeIPITributada * FParent.&End.IPI.ValorIPIPorUnidade), 2);
end;

end.

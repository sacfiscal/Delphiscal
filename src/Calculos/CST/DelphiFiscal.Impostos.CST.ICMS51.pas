unit DelphiFiscal.Impostos.CST.ICMS51;

interface

uses
  DelphiFiscal.Calculos.Interfaces;

type
  TICMS51 = class(TInterfacedObject, iICMS51)
    private
      [weak]
      FParent : iCST;
    public
      constructor Create(Parent : iCST);
      destructor Destroy; override;
      class function New(Parent : iCST) : iICMS51;
      function BaseICMSProprio : double;
      function ValorICMSOperacao : double;
      function ValorICMSDiferido : double;
      function ValorICMSProprio : double;
      Function &End : iCST;
  end;

implementation

{ TICMS51 }

uses Delphiscal.Utils;

function TICMS51.BaseICMSProprio: double;
begin
  Result:= FParent.&End.ICMS.BaseICMSProprio;
end;

constructor TICMS51.Create(Parent: iCST);
begin
  FParent:= Parent;
end;

destructor TICMS51.Destroy;
begin

  inherited;
end;

function TICMS51.&End: iCST;
begin
  Result:= FParent;
end;

class function TICMS51.New(Parent: iCST): iICMS51;
begin
  Result:= Self.Create(Parent);
end;

function TICMS51.ValorICMSDiferido: double;
begin
  result:= RoundABNT(ValorICMSOperacao * (FParent.&End.ICMS.PercentualDiferimento / 100), 2);
end;

function TICMS51.ValorICMSOperacao: double;
begin
  Result:= RoundABNT(FParent.&End.ICMS.BaseICMSProprio * (FParent.&End.ICMS.AliquotaICMS / 100), 2);
end;

function TICMS51.ValorICMSProprio : double;
begin
  Result:= RoundABNT((ValorICMSOperacao - ValorICMSDiferido), 2);
end;

end.

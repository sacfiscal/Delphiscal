unit DelphiFiscal.Impostos.CST.ICMS203;

interface

uses
  DelphiFiscal.Calculos.Interfaces;

type
  TICMS203 = class(TInterfacedObject, iICMS203)
    private
      [weak]
      FParent : iCST;
    public
      constructor Create(Parent : iCST);
      destructor Destroy; override;
      class function New(Parent : iCST) : iICMS203;
      function ValorBaseIcmsProprio: Double;
      function ValorIcmsProprio: Double;
      function ValorBaseIcmsST: Double;
      function ValorIcmsST: Double;
      Function &End : iCST;
  end;

implementation

{ TICMS203 }

uses Delphiscal.Utils;

constructor TICMS203.Create(Parent: iCST);
begin
  FParent:= Parent;
end;

destructor TICMS203.Destroy;
begin

  inherited;
end;

function TICMS203.&End: iCST;
begin
  Result:= FParent;
end;

class function TICMS203.New(Parent: iCST): iICMS203;
begin
  Result:= Self.Create(Parent);
end;

function TICMS203.ValorBaseIcmsProprio: Double;
begin
  Result:= RoundABNT(FParent.&End.ICMS.BaseICMSProprio, 2);
end;

function TICMS203.ValorBaseIcmsST: Double;
begin
  Result:= RoundABNT(FParent.&End.ST.BaseICMSSTCST, 2);
end;

function TICMS203.ValorIcmsProprio: Double;
begin
  Result:= RoundABNT(FParent.&End.ICMS.ValorICMSProprio, 2);
end;

function TICMS203.ValorIcmsST: Double;
var
  lValor : double;
begin
  lValor:= RoundABNT((ValorBaseIcmsST * (FParent.&End.ST.AliquotaICMSST / 100)), 2);
  result:= RoundABNT(lValor - ValorIcmsProprio, 2);
end;

end.

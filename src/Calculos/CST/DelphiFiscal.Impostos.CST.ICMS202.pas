unit DelphiFiscal.Impostos.CST.ICMS202;

interface

uses
  DelphiFiscal.Calculos.Interfaces;

type
  TICMS202 = class(TInterfacedObject, iICMS202)
    private
      [weak]
      FParent : iCST;
    public
      constructor Create(Parent : iCST);
      destructor Destroy; override;
      class function New(Parent : iCST) : iICMS202;
      function ValorBaseIcmsProprio: Double;
      function ValorIcmsProprio: Double;
      function ValorBaseIcmsST: Double;
      function ValorIcmsST: Double;
      Function &End : iCST;
  end;

implementation

{ TICMS202 }

uses Delphiscal.Utils;

constructor TICMS202.Create(Parent: iCST);
begin
  FParent:= Parent;
end;

destructor TICMS202.Destroy;
begin

  inherited;
end;

function TICMS202.&End: iCST;
begin
  Result:= FParent;
end;

class function TICMS202.New(Parent: iCST): iICMS202;
begin
  Result:= Self.Create(Parent);
end;

function TICMS202.ValorBaseIcmsProprio: Double;
begin
  Result:= RoundABNT(FParent.&End.ICMS.BaseICMSProprio, 2);
end;

function TICMS202.ValorBaseIcmsST: Double;
begin
  Result:= RoundABNT(FParent.&End.ST.BaseICMSSTCST, 2);
end;

function TICMS202.ValorIcmsProprio: Double;
begin
  Result:= RoundABNT(FParent.&End.ICMS.ValorICMSProprio, 2);
end;

function TICMS202.ValorIcmsST: Double;
var
  lValor : double;
begin
  lValor:= RoundABNT((ValorBaseIcmsST * (FParent.&End.ST.AliquotaICMSST / 100)), 2);
  result:= RoundABNT(lValor - ValorIcmsProprio, 2);
end;

end.

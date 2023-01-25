unit DelphiFiscal.Impostos.CST.ICMS20;

interface

uses
  DelphiFiscal.Calculos.Interfaces;

type
  TICMS20 = class(TInterfacedObject, iICMS20)
    private
      [weak]
      FParent : iCST;
    public
      constructor Create(Parent : iCST);
      destructor Destroy; override;
      class function New(Parent : iCST) : iICMS20;
      function BaseICMSProprio : double;
      function ValorICMSProprio : double;
      function ValorICMSDesonerado : double;
      function ValorICMSReduzido : double;
      Function &End : iCST;
  end;

implementation

{ TICMS20 }

uses Delphiscal.Utils;

function TICMS20.BaseICMSProprio: double;
begin
  Result:= FParent.&End.ICMS.BaseICMSProprio;
end;

constructor TICMS20.Create(Parent: iCST);
begin
  FParent:= Parent;
end;

destructor TICMS20.Destroy;
begin

  inherited;
end;

function TICMS20.&End: iCST;
begin
  Result:= FParent;
end;

class function TICMS20.New(Parent: iCST): iICMS20;
begin
  Result:= Self.Create(Parent);
end;

function TICMS20.ValorICMSProprio : double;
begin
  Result:= RoundABNT((FParent.&End.ICMS.BaseICMSProprio * (FParent.&End.ICMS.AliquotaICMS / 100)), 2);
end;

function TICMS20.ValorICMSReduzido: double;
begin
  Result:= RoundABNT((FParent.&End.ICMS.BaseICMSReduzido * (FParent.&End.ICMS.AliquotaICMS / 100)), 2);
end;

function TICMS20.ValorICMSDesonerado: double;
begin
  Result:= RoundABNT(FParent.&End.ICMS.ValorICMS - ValorICMSReduzido, 2);
end;

end.

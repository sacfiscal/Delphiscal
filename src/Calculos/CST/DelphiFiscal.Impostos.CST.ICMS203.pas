unit DelphiFiscal.Impostos.CST.ICMS203;

interface

uses
  DelphiFiscal.CST.Interfaces,
  DelphiFiscal.Controller.Interfaces;

type
  TICMS203 = class(TInterfacedObject, iICMS203)
    private
      [weak]
      FParent : iController;
    public
      constructor Create(Parent : iController);
      destructor Destroy; override;
      class function New(Parent : iController) : iICMS203;
      function ValorBaseIcmsProprio: Double;
      function ValorIcmsProprio: Double;
      function ValorBaseIcmsST: Double;
      function ValorIcmsST: Double;
      Function &End : iController;
  end;

implementation

{ TICMS203 }

uses Delphiscal.Utils;

constructor TICMS203.Create(Parent: iController);
begin
  FParent:= Parent;
end;

destructor TICMS203.Destroy;
begin

  inherited;
end;

function TICMS203.&End: iController;
begin
  Result:= FParent;
end;

class function TICMS203.New(Parent: iController): iICMS203;
begin
  Result:= Self.Create(Parent);
end;

function TICMS203.ValorBaseIcmsProprio: Double;
begin
  Result:= RoundABNT(FParent.ICMS.BaseICMSProprio, 2);
end;

function TICMS203.ValorBaseIcmsST: Double;
begin
  Result:= RoundABNT(FParent.ST.BaseICMSSTCST, 2);
end;

function TICMS203.ValorIcmsProprio: Double;
begin
  Result:= RoundABNT(FParent.ICMS.ValorICMSProprio, 2);
end;

function TICMS203.ValorIcmsST: Double;
var
  lValor : double;
begin
  lValor:= RoundABNT((ValorBaseIcmsST * (FParent.ST.AliquotaICMSST / 100)), 2);
  result:= RoundABNT(lValor - ValorIcmsProprio, 2);
end;

end.

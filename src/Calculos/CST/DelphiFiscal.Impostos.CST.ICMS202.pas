unit DelphiFiscal.Impostos.CST.ICMS202;

interface

uses
  DelphiFiscal.CST.Interfaces,
  DelphiFiscal.Controller.Interfaces;

type
  TICMS202 = class(TInterfacedObject, iICMS202)
    private
      [weak]
      FParent : iController;
    public
      constructor Create(Parent : iController);
      destructor Destroy; override;
      class function New(Parent : iController) : iICMS202;
      function ValorBaseIcmsProprio: Double;
      function ValorIcmsProprio: Double;
      function ValorBaseIcmsST: Double;
      function ValorIcmsST: Double;
      Function &End : iController;
  end;

implementation

{ TICMS202 }

uses Delphiscal.Utils;

constructor TICMS202.Create(Parent: iController);
begin
  FParent:= Parent;
end;

destructor TICMS202.Destroy;
begin

  inherited;
end;

function TICMS202.&End: iController;
begin
  Result:= FParent;
end;

class function TICMS202.New(Parent: iController): iICMS202;
begin
  Result:= Self.Create(Parent);
end;

function TICMS202.ValorBaseIcmsProprio: Double;
begin
  Result:= RoundABNT(FParent.ICMS.BaseICMSProprio, 2);
end;

function TICMS202.ValorBaseIcmsST: Double;
begin
  Result:= RoundABNT(FParent.ST.BaseICMSSTCST, 2);
end;

function TICMS202.ValorIcmsProprio: Double;
begin
  Result:= RoundABNT(FParent.ICMS.ValorICMSProprio, 2);
end;

function TICMS202.ValorIcmsST: Double;
var
  lValor : double;
begin
  lValor:= RoundABNT((ValorBaseIcmsST * (FParent.ST.AliquotaICMSST / 100)), 2);
  result:= RoundABNT(lValor - ValorIcmsProprio, 2);
end;

end.

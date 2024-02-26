unit DelphiFiscal.Impostos.CST.ICMS20;

interface

uses
  DelphiFiscal.CST.Interfaces,
  DelphiFiscal.Controller.Interfaces;


type
  TICMS20 = class(TInterfacedObject, iICMS20)
    private
      [weak]
      FParent : iController;
    public
      constructor Create(Parent : iController);
      destructor Destroy; override;
      class function New(Parent : iController) : iICMS20;
      function BaseICMSProprio : double;
      function ValorICMSProprio : double;
      function ValorICMSDesonerado : double;
      function ValorICMSReduzido : double;
      Function &End : iController;
  end;

implementation

{ TICMS20 }

uses Delphiscal.Utils;

function TICMS20.BaseICMSProprio: double;
begin
  Result:= FParent.ICMS.BaseICMSProprio;
end;

constructor TICMS20.Create(Parent: iController);
begin
  FParent:= Parent;
end;

destructor TICMS20.Destroy;
begin

  inherited;
end;

function TICMS20.&End: iController;
begin
  Result:= FParent;
end;

class function TICMS20.New(Parent: iController): iICMS20;
begin
  Result:= Self.Create(Parent);
end;

function TICMS20.ValorICMSProprio : double;
begin
  Result:= RoundABNT((FParent.ICMS.BaseICMSProprio * (FParent.ICMS.AliquotaICMS / 100)), 2);
end;

function TICMS20.ValorICMSReduzido: double;
begin
  Result:= RoundABNT((FParent.ICMS.BaseICMSReduzido * (FParent.ICMS.AliquotaICMS / 100)), 2);
end;

function TICMS20.ValorICMSDesonerado: double;
begin
  Result:= RoundABNT(FParent.ICMS.ValorICMS - ValorICMSReduzido, 2);
end;

end.

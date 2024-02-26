unit DelphiFiscal.Impostos.CST.ICMS70;

interface

uses
  DelphiFiscal.CST.Interfaces,
  DelphiFiscal.Controller.Interfaces;


type
  TICMS70 = class(TInterfacedObject, iICMS70)
    private
      [weak]
      FParent : iController;
    public
      constructor Create(Parent : iController);
      destructor Destroy; override;
      class function New(Parent : iController) : iICMS70;
      function ValorBaseReduzidaIcmsProprio: Double;
      function ValorIcmsProprio: Double;
      function ValorIcmsDesonerado: Double;
      function ValorBaseIcmsST: Double;
      function ValorIcmsST: Double;
      function ValorIcmsSTDesonerado : Double;
      Function &End : iController;
  end;

implementation

{ TICMS70 }

uses Delphiscal.Utils;

constructor TICMS70.Create(Parent: iController);
begin
  FParent:= Parent;
end;

destructor TICMS70.Destroy;
begin

  inherited;
end;

function TICMS70.&End: iController;
begin
  Result:= FParent;
end;

class function TICMS70.New(Parent: iController): iICMS70;
begin
  Result:= Self.Create(Parent);
end;

function TICMS70.ValorBaseIcmsST: Double;
begin
  Result:= RoundABNT(FParent.ST.BaseICMSSTCST, 2);
end;

function TICMS70.ValorBaseReduzidaIcmsProprio: Double;
begin
  result:= RoundABNT(FParent.ICMS.BaseICMSReduzido, 2);
end;

function TICMS70.ValorIcmsDesonerado: Double;
begin
  Result:= RoundABNT(FParent.ICMS.ValorICMS - FParent.ICMS.ValorICMSProprio, 2);
end;

function TICMS70.ValorICMSProprio : double;
begin
  Result:= RoundABNT(FParent.ICMS.ValorICMSProprio, 2);
end;

function TICMS70.ValorIcmsST: Double;
var
  lValor : double;
begin
  lValor:= RoundABNT((ValorBaseIcmsST * (FParent.ST.AliquotaICMSST / 100)), 2);
  result:= RoundABNT(lValor - ValorIcmsProprio, 2);
end;

function TICMS70.ValorIcmsSTDesonerado: Double;
begin
  Result := RoundABNT(FParent.ST.ValorICMSST - ValorIcmsST, 2);
end;

end.


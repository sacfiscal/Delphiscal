unit DelphiFiscal.Impostos.CST.ICMS70;

interface

uses
  DelphiFiscal.Calculos.Interfaces;

type
  TICMS70 = class(TInterfacedObject, iICMS70)
    private
      [weak]
      FParent : iCST;
    public
      constructor Create(Parent : iCST);
      destructor Destroy; override;
      class function New(Parent : iCST) : iICMS70;
      function ValorBaseReduzidaIcmsProprio: Double;
      function ValorIcmsProprio: Double;
      function ValorIcmsDesonerado: Double;
      function ValorBaseIcmsST: Double;
      function ValorIcmsST: Double;
      function ValorIcmsSTDesonerado : Double;
      Function &End : iCST;
  end;

implementation

{ TICMS70 }

uses Delphiscal.Utils;

constructor TICMS70.Create(Parent: iCST);
begin
  FParent:= Parent;
end;

destructor TICMS70.Destroy;
begin

  inherited;
end;

function TICMS70.&End: iCST;
begin
  Result:= FParent;
end;

class function TICMS70.New(Parent: iCST): iICMS70;
begin
  Result:= Self.Create(Parent);
end;

function TICMS70.ValorBaseIcmsST: Double;
begin
  Result:= RoundABNT(FParent.&End.ST.BaseICMSSTCST, 2);
end;

function TICMS70.ValorBaseReduzidaIcmsProprio: Double;
begin
  result:= RoundABNT(FParent.&End.ICMS.BaseICMSReduzido, 2);
end;

function TICMS70.ValorIcmsDesonerado: Double;
begin
  Result:= RoundABNT(FParent.&End.ICMS.ValorICMS - FParent.&End.ICMS.ValorICMSProprio, 2);
end;

function TICMS70.ValorICMSProprio : double;
begin
  Result:= RoundABNT(FParent.&End.ICMS.ValorICMSProprio, 2);
end;

function TICMS70.ValorIcmsST: Double;
var
  lValor : double;
begin
  lValor:= RoundABNT((ValorBaseIcmsST * (FParent.&End.ST.AliquotaICMSST / 100)), 2);
  result:= RoundABNT(lValor - ValorIcmsProprio, 2);
end;

function TICMS70.ValorIcmsSTDesonerado: Double;
begin
  Result := RoundABNT(FParent.&End.ST.ValorICMSST - ValorIcmsST, 2);
end;

end.


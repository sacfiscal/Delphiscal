unit DelphiFiscal.Impostos.CST.ICMS10;

interface

uses
  DelphiFiscal.Calculos.Interfaces;

type
  TICMS10 = class(TInterfacedObject, iICMS10)
    private
      [weak]
      FParent : iCST;
    function BaseICMSProprio: double;
    public
      constructor Create(Parent : iCST);
      destructor Destroy; override;
      class function New(Parent : iCST) : iICMS10;
      function ValorBaseIcmsProprio: Double;
      function ValorIcmsProprio: Double;
      function ValorBaseIcmsST: Double;
      function ValorIcmsST: Double;
      function ValorIcmsSTDesonerado: Double;
      Function &End : iCST;
  end;

implementation

{ TICMS10 }

uses Delphiscal.Utils;

function TICMS10.BaseICMSProprio: double;
begin
  Result:= FParent.&End.ICMS.BaseICMSNormal;
end;

constructor TICMS10.Create(Parent: iCST);
begin
  FParent:= Parent;
end;

destructor TICMS10.Destroy;
begin

  inherited;
end;

function TICMS10.&End: iCST;
begin
  Result:= FParent;
end;

class function TICMS10.New(Parent: iCST): iICMS10;
begin
  Result:= Self.Create(Parent);
end;

function TICMS10.ValorBaseIcmsProprio: Double;
begin
  Result:= RoundABNT(FParent.&End.ICMS.BaseICMSNormal, 2);
end;

function TICMS10.ValorBaseIcmsST: Double;
begin
  Result:= RoundABNT(FParent.&End.ST.BaseICMSST, 2);
end;

function TICMS10.ValorICMSProprio : double;
begin
  Result:= RoundABNT(FParent.&End.ICMS.ValorICMS, 2);
end;

function TICMS10.ValorIcmsST: Double;
begin
  Result:= RoundABNT(FParent.&End.ST.ValorICMSSTProprio, 2);
end;

function TICMS10.ValorIcmsSTDesonerado: Double;
begin
  Result := RoundABNT(FParent.&End.ST.ValorICMSST - FParent.&End.ST.ValorICMSSTProprio, 2);
end;

end.

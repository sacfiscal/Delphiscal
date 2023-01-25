unit DelphiFiscal.Impostos.CST.ICMS30;

interface

uses
  DelphiFiscal.Calculos.Interfaces;

type
  TICMS30 = class(TInterfacedObject, iICMS30)
    private
      [weak]
      FParent : iCST;
    public
      constructor Create(Parent : iCST);
      destructor Destroy; override;
      class function New(Parent : iCST) : iICMS30;
      function ValorBaseIcmsProprio: Double;
      function ValorIcmsProprio: Double;
      function ValorBaseIcmsST: Double;
      function ValorIcmsST: Double;
      function ValorIcmsDesonerado: Double;
      Function &End : iCST;
  end;

implementation

{ TICMS30 }

uses Delphiscal.Utils;

constructor TICMS30.Create(Parent: iCST);
begin
  FParent:= Parent;
end;

destructor TICMS30.Destroy;
begin

  inherited;
end;

function TICMS30.&End: iCST;
begin
  Result:= FParent;
end;

class function TICMS30.New(Parent: iCST): iICMS30;
begin
  Result:= Self.Create(Parent);
end;

function TICMS30.ValorBaseIcmsProprio: Double;
begin
  Result:= RoundABNT(FParent.&End.ICMS.BaseICMSNormal, 2);
end;

function TICMS30.ValorBaseIcmsST: Double;
begin
  Result:= RoundABNT(FParent.&End.ST.BaseICMSST, 2);
end;

function TICMS30.ValorIcmsDesonerado: Double;
begin
  Result:= RoundABNT(FParent.&End.ICMS.ValorICMS, 2);
end;

function TICMS30.ValorICMSProprio : double;
begin
  Result:= RoundABNT(FParent.&End.ICMS.ValorICMS, 2);
end;

function TICMS30.ValorIcmsST: Double;
begin
  Result:= RoundABNT(FParent.&End.ST.ValorICMSSTProprio, 2);
end;


end.


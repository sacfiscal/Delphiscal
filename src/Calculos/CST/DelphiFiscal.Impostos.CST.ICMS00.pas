unit DelphiFiscal.Impostos.CST.ICMS00;

interface

uses
  DelphiFiscal.Calculos.Interfaces;

type
  TICMS00 = class(TInterfacedObject, iICMS00)
    private
      [weak]
      FParent : iCST;
    public
      constructor Create(Parent : iCST);
      destructor Destroy; override;
      class function New(Parent : iCST) : iICMS00;
      function BaseICMSProprio : double;
      function ValorICMSProprio : double;
      Function &End : iCST;
  end;

implementation

{ TICMS00 }

uses Delphiscal.Utils;

function TICMS00.BaseICMSProprio: double;
begin
  Result:= FParent.&End.ICMS.BaseICMSNormal;
end;

constructor TICMS00.Create(Parent: iCST);
begin
  FParent:= Parent;
end;

destructor TICMS00.Destroy;
begin

  inherited;
end;

function TICMS00.&End: iCST;
begin
  Result:= FParent;
end;

class function TICMS00.New(Parent: iCST): iICMS00;
begin
  Result:= Self.Create(Parent);
end;

function TICMS00.ValorICMSProprio : double;
begin
  Result:= RoundABNT(FParent.&End.ICMS.ValorICMS, 2);
end;

end.

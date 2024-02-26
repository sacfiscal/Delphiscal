unit DelphiFiscal.Impostos.CST.ICMS00;

interface

uses
  DelphiFiscal.CST.Interfaces,
  DelphiFiscal.Controller.Interfaces;


type
  TICMS00 = class(TInterfacedObject, iICMS00)
    private
      [weak]
      FParent : iController;
    public
      constructor Create(Parent : iController);
      destructor Destroy; override;
      class function New(Parent : iController) : iICMS00;
      function BaseICMSProprio : double;
      function ValorICMSProprio : double;
      Function &End : iController;
  end;

implementation

{ TICMS00 }

uses Delphiscal.Utils;

function TICMS00.BaseICMSProprio: double;
begin
  Result:=  FParent.ICMS.BaseICMSNormal;
end;

constructor TICMS00.Create(Parent: iController);
begin
  FParent:= Parent;
end;

destructor TICMS00.Destroy;
begin

  inherited;
end;

function TICMS00.&End: iController;
begin
  Result:= FParent;
end;

class function TICMS00.New(Parent: iController): iICMS00;
begin
  Result:= Self.Create(Parent);
end;

function TICMS00.ValorICMSProprio : double;
begin
  Result:= RoundABNT(FParent.ICMS.ValorICMS, 2);
end;

end.

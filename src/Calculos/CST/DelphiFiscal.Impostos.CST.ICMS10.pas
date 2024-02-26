unit DelphiFiscal.Impostos.CST.ICMS10;

interface

uses
  DelphiFiscal.Controller.Interfaces,
  DelphiFiscal.CST.Interfaces;

type
  TICMS10 = class(TInterfacedObject, iICMS10)
    private
      [weak]
      FParent : iController;
      function BaseICMSProprio: double;
    public
      constructor Create(Parent : iController);
      destructor Destroy; override;
      class function New(Parent : iController) : iICMS10;
      function ValorBaseIcmsProprio: Double;
      function ValorIcmsProprio: Double;
      function ValorBaseIcmsST: Double;
      function ValorIcmsST: Double;
      function ValorIcmsSTDesonerado: Double;
      Function &End : iController;
  end;

implementation

{ TICMS10 }

uses Delphiscal.Utils;

function TICMS10.BaseICMSProprio: double;
begin
  Result:= FParent.ICMS.BaseICMSNormal;
end;

constructor TICMS10.Create(Parent: iController);
begin
  FParent:= Parent;
end;

destructor TICMS10.Destroy;
begin

  inherited;
end;

function TICMS10.&End: iController;
begin
  Result:= FParent;
end;

class function TICMS10.New(Parent: iController): iICMS10;
begin
  Result:= Self.Create(Parent);
end;

function TICMS10.ValorBaseIcmsProprio: Double;
begin
  Result:= RoundABNT(FParent.ICMS.BaseICMSNormal, 2);
end;

function TICMS10.ValorBaseIcmsST: Double;
begin
  Result:= RoundABNT(FParent.ST.BaseICMSST, 2);
end;

function TICMS10.ValorICMSProprio : double;
begin
  Result:= RoundABNT(FParent.ICMS.ValorICMS, 2);
end;

function TICMS10.ValorIcmsST: Double;
begin
  Result:= RoundABNT(FParent.ST.ValorICMSSTProprio, 2);
end;

function TICMS10.ValorIcmsSTDesonerado: Double;
begin
  Result := RoundABNT(FParent.ST.ValorICMSST - FParent.ST.ValorICMSSTProprio, 2);
end;

end.

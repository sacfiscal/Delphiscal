unit DelphiFiscal.Impostos.CST.ICMS30;

interface

uses
  DelphiFiscal.CST.Interfaces,
  DelphiFiscal.Controller.Interfaces;

type
  TICMS30 = class(TInterfacedObject, iICMS30)
    private
      [weak]
      FParent : iController;
    public
      constructor Create(Parent : iController);
      destructor Destroy; override;
      class function New(Parent : iController) : iICMS30;
      function ValorBaseIcmsProprio: Double;
      function ValorIcmsProprio: Double;
      function ValorBaseIcmsST: Double;
      function ValorIcmsST: Double;
      function ValorIcmsDesonerado: Double;
      Function &End : iController;
  end;

implementation

{ TICMS30 }

uses Delphiscal.Utils;

constructor TICMS30.Create(Parent: iController);
begin
  FParent:= Parent;
end;

destructor TICMS30.Destroy;
begin

  inherited;
end;

function TICMS30.&End: iController;
begin
  Result:= FParent;
end;

class function TICMS30.New(Parent: iController): iICMS30;
begin
  Result:= Self.Create(Parent);
end;

function TICMS30.ValorBaseIcmsProprio: Double;
begin
  Result:= RoundABNT(FParent.ICMS.BaseICMSNormal, 2);
end;

function TICMS30.ValorBaseIcmsST: Double;
begin
  Result:= RoundABNT(FParent.ST.BaseICMSST, 2);
end;

function TICMS30.ValorIcmsDesonerado: Double;
begin
  Result:= RoundABNT(FParent.ICMS.ValorICMS, 2);
end;

function TICMS30.ValorICMSProprio : double;
begin
  Result:= RoundABNT(FParent.ICMS.ValorICMS, 2);
end;

function TICMS30.ValorIcmsST: Double;
begin
  Result:= RoundABNT(FParent.ST.ValorICMSSTProprio, 2);
end;


end.


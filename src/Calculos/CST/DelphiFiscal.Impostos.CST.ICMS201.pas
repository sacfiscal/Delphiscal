unit DelphiFiscal.Impostos.CST.ICMS201;

interface

uses
  DelphiFiscal.CST.Interfaces,
  DelphiFiscal.Controller.Interfaces;

type
  TICMS201 = class(TInterfacedObject, iICMS201)
    private
      [weak]
      FParent : iController;
    public
      constructor Create(Parent : iController);
      destructor Destroy; override;
      class function New(Parent : iController) : iICMS201;
      function BaseCreditoSN: Double;
      function ValorCreditoSN: Double;
      function ValorBaseIcmsProprio: Double;
      function ValorIcmsProprio: Double;
      function ValorBaseIcmsST: Double;
      function ValorIcmsST: Double;
      Function &End : iController;
  end;

implementation

{ TICMS201 }

uses Delphiscal.Utils;

function TICMS201.BaseCreditoSN: Double;
begin
  Result := RoundABNT(FParent.ICMS.BaseICMSProprio, 2);
end;

constructor TICMS201.Create(Parent: iController);
begin
  FParent:= Parent;
end;

destructor TICMS201.Destroy;
begin

  inherited;
end;

function TICMS201.&End: iController;
begin
  Result:= FParent;
end;

class function TICMS201.New(Parent: iController): iICMS201;
begin
  Result:= Self.Create(Parent);
end;

function TICMS201.ValorBaseIcmsProprio: Double;
begin
  Result:= RoundABNT(FParent.ICMS.BaseICMSProprio, 2);
end;

function TICMS201.ValorBaseIcmsST: Double;
begin
  Result:= RoundABNT(FParent.ST.BaseICMSSTCST, 2);
end;

function TICMS201.ValorCreditoSN: Double;
begin
  Result := RoundABNT(BaseCreditoSN * (FParent.ICMS.PercentualCreditoICMSSN / 100), 2);
end;

function TICMS201.ValorIcmsProprio: Double;
begin
  Result:= RoundABNT(FParent.ICMS.ValorICMSProprio, 2);
end;

function TICMS201.ValorIcmsST: Double;
var
  lValor : double;
begin
  lValor:= RoundABNT((ValorBaseIcmsST * (FParent.ST.AliquotaICMSST / 100)), 2);
  result:= RoundABNT(lValor - ValorIcmsProprio, 2);
end;

end.

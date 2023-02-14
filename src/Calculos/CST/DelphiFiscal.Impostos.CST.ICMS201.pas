unit DelphiFiscal.Impostos.CST.ICMS201;

interface

uses
  DelphiFiscal.Calculos.Interfaces;

type
  TICMS201 = class(TInterfacedObject, iICMS201)
    private
      [weak]
      FParent : iCST;
    public
      constructor Create(Parent : iCST);
      destructor Destroy; override;
      class function New(Parent : iCST) : iICMS201;
      function BaseCreditoSN: Double;
      function ValorCreditoSN: Double;
      function ValorBaseIcmsProprio: Double;
      function ValorIcmsProprio: Double;
      function ValorBaseIcmsST: Double;
      function ValorIcmsST: Double;
      Function &End : iCST;
  end;

implementation

{ TICMS201 }

uses Delphiscal.Utils;

function TICMS201.BaseCreditoSN: Double;
begin
  Result := RoundABNT(FParent.&End.ICMS.BaseICMSProprio, 2);
end;

constructor TICMS201.Create(Parent: iCST);
begin
  FParent:= Parent;
end;

destructor TICMS201.Destroy;
begin

  inherited;
end;

function TICMS201.&End: iCST;
begin
  Result:= FParent;
end;

class function TICMS201.New(Parent: iCST): iICMS201;
begin
  Result:= Self.Create(Parent);
end;

function TICMS201.ValorBaseIcmsProprio: Double;
begin
  Result:= RoundABNT(FParent.&End.ICMS.BaseICMSProprio, 2);
end;

function TICMS201.ValorBaseIcmsST: Double;
begin
  Result:= RoundABNT(FParent.&End.ST.BaseICMSSTCST, 2);
end;

function TICMS201.ValorCreditoSN: Double;
begin
  Result := RoundABNT(BaseCreditoSN * (FParent.&End.ICMS.PercentualCreditoICMSSN / 100), 2);
end;

function TICMS201.ValorIcmsProprio: Double;
begin
  Result:= RoundABNT(FParent.&End.ICMS.ValorICMSProprio, 2);
end;

function TICMS201.ValorIcmsST: Double;
var
  lValor : double;
begin
  lValor:= RoundABNT((ValorBaseIcmsST * (FParent.&End.ST.AliquotaICMSST / 100)), 2);
  result:= RoundABNT(lValor - ValorIcmsProprio, 2);
end;

end.

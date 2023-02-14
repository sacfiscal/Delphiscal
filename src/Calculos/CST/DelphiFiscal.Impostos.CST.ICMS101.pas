unit DelphiFiscal.Impostos.CST.ICMS101;

interface

uses
  DelphiFiscal.Calculos.Interfaces;

type
  TICMS101 = class(TInterfacedObject, iICMS101)
    private
      [weak]
      FParent : iCST;
    public
      constructor Create(Parent : iCST);
      destructor Destroy; override;
      class function New(Parent : iCST) : iICMS101;
      function BaseCreditoSN: Double;
      function ValorCreditoSN: Double;
      Function &End : iCST;
  end;

implementation

{ TICMS101 }

uses Delphiscal.Utils;

function TICMS101.BaseCreditoSN: Double;
begin
  Result := RoundABNT(FParent.&End.ICMS.BaseICMSProprio, 2);
end;

constructor TICMS101.Create(Parent: iCST);
begin
  FParent:= Parent;
end;

destructor TICMS101.Destroy;
begin

  inherited;
end;

function TICMS101.&End: iCST;
begin
  Result:= FParent;
end;

class function TICMS101.New(Parent: iCST): iICMS101;
begin
  Result:= Self.Create(Parent);
end;

function TICMS101.ValorCreditoSN: Double;
begin
  Result := RoundABNT(BaseCreditoSN * (FParent.&End.ICMS.PercentualCreditoICMSSN / 100), 2);
end;

end.

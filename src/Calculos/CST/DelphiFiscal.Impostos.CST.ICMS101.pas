unit DelphiFiscal.Impostos.CST.ICMS101;

interface

uses
  DelphiFiscal.CST.Interfaces,
  DelphiFiscal.Controller.Interfaces;


type
  TICMS101 = class(TInterfacedObject, iICMS101)
    private
      [weak]
      FParent : iController;
    public
      constructor Create(Parent : iController);
      destructor Destroy; override;
      class function New(Parent : iController) : iICMS101;
      function BaseCreditoSN: Double;
      function ValorCreditoSN: Double;
      Function &End : iController;
  end;

implementation

{ TICMS101 }

uses Delphiscal.Utils;

function TICMS101.BaseCreditoSN: Double;
begin
  Result := RoundABNT(FParent.ICMS.BaseICMSProprio, 2);
end;

constructor TICMS101.Create(Parent: iController);
begin
  FParent:= Parent;
end;

destructor TICMS101.Destroy;
begin

  inherited;
end;

function TICMS101.&End: iController;
begin
  Result:= FParent;
end;

class function TICMS101.New(Parent: iController): iICMS101;
begin
  Result:= Self.Create(Parent);
end;

function TICMS101.ValorCreditoSN: Double;
begin
  Result := RoundABNT(BaseCreditoSN * (FParent.ICMS.PercentualCreditoICMSSN / 100), 2);
end;

end.

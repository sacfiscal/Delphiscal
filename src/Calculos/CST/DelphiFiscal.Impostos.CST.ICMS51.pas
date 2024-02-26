unit DelphiFiscal.Impostos.CST.ICMS51;

interface

uses
  DelphiFiscal.CST.Interfaces,
  DelphiFiscal.Controller.Interfaces;


type
  TICMS51 = class(TInterfacedObject, iICMS51)
    private
      [weak]
      FParent : iController;
    public
      constructor Create(Parent : iController);
      destructor Destroy; override;
      class function New(Parent : iController) : iICMS51;
      function BaseICMSProprio : double;
      function ValorICMSOperacao : double;
      function ValorICMSDiferido : double;
      function ValorICMSProprio : double;
      Function &End : iController;
  end;

implementation

{ TICMS51 }

uses Delphiscal.Utils;

function TICMS51.BaseICMSProprio: double;
begin
  Result:= FParent.ICMS.BaseICMSProprio;
end;

constructor TICMS51.Create(Parent: iController);
begin
  FParent:= Parent;
end;

destructor TICMS51.Destroy;
begin

  inherited;
end;

function TICMS51.&End: iController;
begin
  Result:= FParent;
end;

class function TICMS51.New(Parent: iController): iICMS51;
begin
  Result:= Self.Create(Parent);
end;

function TICMS51.ValorICMSDiferido: double;
begin
  result:= RoundABNT(ValorICMSOperacao * (FParent.ICMS.PercentualDiferimento / 100), 2);
end;

function TICMS51.ValorICMSOperacao: double;
begin
  Result:= RoundABNT(FParent.ICMS.BaseICMSProprio * (FParent.ICMS.AliquotaICMS / 100), 2);
end;

function TICMS51.ValorICMSProprio : double;
begin
  Result:= RoundABNT((ValorICMSOperacao - ValorICMSDiferido), 2);
end;

end.

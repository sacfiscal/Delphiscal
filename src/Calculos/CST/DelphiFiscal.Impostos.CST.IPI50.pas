unit DelphiFiscal.Impostos.CST.IPI50;

interface

uses
  DelphiFiscal.CST.Interfaces,
  DelphiFiscal.Controller.Interfaces;

type
  TIPI50 = class(TInterfacedObject, iIPI50)
    private
      [weak]
      FParent : iController;
    public
      constructor Create(Parent : iController);
      destructor Destroy; override;
      class function New(Parent : iController) : iIPI50;
      function BaseIpi: Double;
      function ValorIpi: Double;
      function ValorIpiEspecifico: Double;
      Function &End : iController;
  end;

implementation

{ TIPI50 }

uses Delphiscal.Utils;

function TIPI50.BaseIpi: Double;
begin
  result:= RoundABNT((FParent.Base.ValorProduto +
                      FParent.Base.ValorFrete +
                      FParent.Base.ValorSeguro +
                      FParent.Base.ValorDespesasAcessorias), 2);
end;

constructor TIPI50.Create(Parent: iController);
begin
  FParent:= Parent;
end;

destructor TIPI50.Destroy;
begin

  inherited;
end;

function TIPI50.&End: iController;
begin
  Result:= FParent;
end;

class function TIPI50.New(Parent: iController): iIPI50;
begin
  Result:= Self.Create(Parent);
end;


function TIPI50.ValorIpi: Double;
begin
  Result := RoundABNT(BaseIpi * (FParent.IPI.AliquotaIPI / 100), 2);
end;

function TIPI50.ValorIpiEspecifico: Double;
begin
  Result := RoundABNT((FParent.IPI.QtdeIPITributada * FParent.IPI.ValorIPIPorUnidade), 2);
end;

end.

unit uPis01_02;

interface
uses uBasePis, uIPis01_02;

type
  TPis01_02 = class(TInterfacedObject, IPis01_02)
  private
    FBasePis: TBasePis;
    FAliquotaPis: currency;
  public

    constructor Create(_valorProduto,
                       _valorFrete,
                       _valorSeguro,
                       _despesasAcessorias,
                       _valorDesconto,
                       _aliquotaPis: currency);
    destructor Destroy; override;
    function BasePis: currency;
    function ValorPis: currency;


  end;

implementation
uses acbrutil.Math;

{ TPis01_02 }

function TPis01_02.BasePis: currency;
begin
  result := FBasePis.CalcularBasePis;
end;

constructor TPis01_02.Create(_valorProduto,
                             _valorFrete,
                             _valorSeguro,
                             _despesasAcessorias,
                             _valorDesconto,
                             _aliquotaPis: currency);
begin

 FBasePis := TBasePis.Create(_valorProduto,
                             _valorFrete,
                             _valorSeguro,
                             _despesasAcessorias,
                             _valorDesconto);

 FAliquotaPis := _aliquotaPis;

end;

destructor TPis01_02.Destroy;
begin
  FBasePis.Free;
  inherited;
end;

function TPis01_02.ValorPis: currency;
begin
  result := RoundABNT(BasePis * (FAliquotaPis / 100),2);
end;

end.

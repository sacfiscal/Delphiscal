unit uIpi50AdValorem;

interface

uses uBaseIpi, uIIpi50AdValorem;

type
  TIpi50AdValorem = class(TInterfacedObject, IIpi50AdValorem)
  private
    FBaseIpi: TBaseIpi;
    FAliquotaIpi: currency;
  public

    constructor Create(_valorProduto,
                       _valorFrete,
                       _valorSeguro,
                       _despesasAcessorias,
                       _aliquotaIpi: currency);
    destructor Destroy; override;
    function BaseIpi: currency;
    function ValorIpi: currency;


  end;

implementation
uses acbrutil.Math;

{ TIpi50AdValorem }

constructor TIpi50AdValorem.Create(_valorProduto,
                                   _valorFrete,
                                   _valorSeguro,
                                   _despesasAcessorias,
                                   _aliquotaIpi: currency);
begin

 FBaseIpi := TBaseIpi.Create(_valorProduto,
                             _valorFrete,
                             _valorSeguro,
                             _despesasAcessorias);

 FAliquotaIpi := _aliquotaIpi;

end;


function TIpi50AdValorem.BaseIpi: currency;
begin
  result := FBaseIpi.CalcularBaseIpi;
end;


destructor TIpi50AdValorem.Destroy;
begin
  FBaseIpi.Free;
  inherited;
end;

function TIpi50AdValorem.ValorIpi: currency;
begin
  result := RoundABNT(BaseIpi * (FAliquotaIpi / 100),2);
end;

end.

unit Delphiscal.Ipi50AdValorem;

interface

uses
  Delphiscal.Ipi.Base,
  Delphiscal.Ipi50AdValorem.Intf;

type
  TIpi50AdValorem = class(TInterfacedObject,
                          IIpi50AdValorem)
  private
    FBaseIpi    : TBaseIpi;
    FAliquotaIpi: Currency;
    function GetBaseIpi: Currency;
    function GetValorIpi: Currency;
  public
    constructor Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AAliquotaIpi: Currency);

    property BaseIpi: Currency read GetBaseIpi;
    property ValorIpi: Currency read GetValorIpi;
    destructor Destroy; override;
  end;

implementation

uses
  ACBrUtil.Math;

constructor TIpi50AdValorem.Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AAliquotaIpi: Currency);
begin
  FBaseIpi     := TBaseIpi.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias);
  FAliquotaIpi := AAliquotaIpi;
end;

function TIpi50AdValorem.GetBaseIpi: Currency;
begin
  Result := FBaseIpi.CalcularBaseIpi;
end;

destructor TIpi50AdValorem.Destroy;
begin
  FBaseIpi.Free;
  inherited;
end;

function TIpi50AdValorem.GetValorIpi: Currency;
begin
  Result := RoundABNT(BaseIpi * (FAliquotaIpi / 100), 2);
end;

end.

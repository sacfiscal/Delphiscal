unit Delphiscal.Icms00;

interface

uses Delphiscal.Icms.BaseProprio, Delphiscal.Icms.Valor, Delphiscal.Icms00.Intf;

type
  TIcms00 = class(TInterfacedObject, IIcms00)
  private
    FBaseIcmsProprio: TBaseIcmsProprio;
    FValorIcms: TValorIcms;
  public
    constructor Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AALiquotaICMS: Currency; const AValorIpi: Currency = 0);
    destructor Destroy; override;
    function BaseIcmsProprio: Currency;
    function ValorIcmsProprio: Currency;
  end;

implementation

uses acbrutil.math;

function TIcms00.BaseIcmsProprio: Currency;
begin
  Result := RoundABNT(FBaseIcmsProprio.CalcularBaseIcmsProprio, 2);
end;

constructor TIcms00.Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AALiquotaICMS: Currency; const AValorIpi: Currency = 0);
begin
  FBaseIcmsProprio := TBaseIcmsProprio.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AValorIpi);
  FValorIcms := TValorIcms.Create(FBaseIcmsProprio, AALiquotaICMS);
end;

destructor TIcms00.Destroy;
begin
  FValorIcms.Free;
  FBaseIcmsProprio.Free;
  inherited;
end;

function TIcms00.ValorIcmsProprio: Currency;
begin
  Result := RoundABNT(FValorIcms.GetValorIcms, 2);
end;

end.

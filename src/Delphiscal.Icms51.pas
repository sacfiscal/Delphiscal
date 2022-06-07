unit Delphiscal.Icms51;

interface

uses Delphiscal.Icms.BaseProprio, Delphiscal.Icms.Valor, Delphiscal.Icms51.Intf;

type
  TIcms51 = class(TInterfacedObject, IIcms51)
  private
    FBaseIcmsProprio: TBaseIcmsProprio;
    FValorIcmsOperacao: TValorIcms;
    FPercentualDiferimento: Currency;
    function BaseIcmsProprio: Currency;
    function ValorIcmsOperacao: Currency;
    function ValorIcmsDiferido: Currency;
    function ValorIcmsProprio: Currency;
  public
    constructor Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AALiquotaICMS, APercentualDiferimento: Currency; const APercentualReducao: Currency = 0; const AValorIpi: Currency = 0);
    destructor Destroy; override;
  end;

implementation

uses acbrutil.math;

function TIcms51.BaseIcmsProprio: Currency;
begin
  Result := FBaseIcmsProprio.CalcularBaseIcmsProprio;
end;

constructor TIcms51.Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AALiquotaICMS, APercentualDiferimento: Currency; const APercentualReducao: Currency = 0; const AValorIpi: Currency = 0);
begin
  FBaseIcmsProprio := TBaseIcmsProprio.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, APercentualReducao, AValorIpi);
  FValorIcmsOperacao := TValorIcms.Create(FBaseIcmsProprio, AALiquotaICMS);
  FPercentualDiferimento := APercentualDiferimento;
end;

destructor TIcms51.Destroy;
begin
  FValorIcmsOperacao.Free;
  FBaseIcmsProprio.Free;
  inherited;
end;

function TIcms51.ValorIcmsDiferido: Currency;
begin
  Result := RoundABNT(FValorIcmsOperacao.GetValorIcms * (FPercentualDiferimento / 100), 2);
end;

function TIcms51.ValorIcmsOperacao: Currency;
begin
  Result := RoundABNT(FValorIcmsOperacao.GetValorIcms, 2);
end;

function TIcms51.ValorIcmsProprio: Currency;
begin
  Result := RoundABNT(ValorIcmsOperacao - ValorIcmsDiferido, 2);
end;

end.

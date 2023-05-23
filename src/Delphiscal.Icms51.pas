unit Delphiscal.Icms51;

interface

uses Delphiscal.Icms.BaseProprio, Delphiscal.Icms.Valor, Delphiscal.Icms51.Intf;

type
  TIcms51 = class(TInterfacedObject, IIcms51)
  private
    FBaseIcmsProprio: TBaseIcmsProprio;
    FValorIcmsOperacao: TValorIcms;
    FPercentualDiferimento: Double;
    function BaseIcmsProprio: Double;
    function ValorIcmsOperacao: Double;
    function ValorIcmsDiferido: Double;
    function ValorIcmsProprio: Double;
  public
    class function New(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AALiquotaICMS,
      APercentualDiferimento: Double; const APercentualReducao: Double = 0; const AValorIpi: Double = 0): IIcms51;
    constructor Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AALiquotaICMS,
      APercentualDiferimento: Double; const APercentualReducao: Double = 0; const AValorIpi: Double = 0);
    destructor Destroy; override;
  end;

implementation

uses Delphiscal.Utils;

class function TIcms51.New(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AALiquotaICMS,
  APercentualDiferimento, APercentualReducao, AValorIpi: Double): IIcms51;
begin
  Result := TIcms51.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AALiquotaICMS,
                           APercentualDiferimento, APercentualReducao, AValorIpi);
end;

constructor TIcms51.Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AALiquotaICMS,
  APercentualDiferimento: Double; const APercentualReducao: Double = 0; const AValorIpi: Double = 0);
begin
  FBaseIcmsProprio := TBaseIcmsProprio.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto,
                                              APercentualReducao, AValorIpi);
  FValorIcmsOperacao := TValorIcms.Create(FBaseIcmsProprio, AALiquotaICMS);
  FPercentualDiferimento := APercentualDiferimento;
end;

destructor TIcms51.Destroy;
begin
  FValorIcmsOperacao.Free;
  FBaseIcmsProprio.Free;
  inherited;
end;

function TIcms51.BaseIcmsProprio: Double;
begin
  Result := FBaseIcmsProprio.CalcularBaseIcmsProprio;
end;

function TIcms51.ValorIcmsOperacao: Double;
begin
  Result := RoundABNT(FValorIcmsOperacao.GetValorIcms, 2);
end;

function TIcms51.ValorIcmsDiferido: Double;
begin
  Result := RoundABNT(FValorIcmsOperacao.GetValorIcms * (FPercentualDiferimento / 100), 2);
end;

function TIcms51.ValorIcmsProprio: Double;
begin
  Result := RoundABNT(ValorIcmsOperacao - ValorIcmsDiferido, 2);
end;

end.

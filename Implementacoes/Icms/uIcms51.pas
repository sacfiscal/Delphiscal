unit uIcms51;

interface

uses uBaseIcmsProprio, uValorIcms, uIIcms51;

type
  TIcms51 = class(TInterfacedObject, IIcms51)
  private
    FBaseIcmsProprio: TBaseIcmsProprio;
    FValorIcmsOperacao: TValorIcms;
    FPercentualDiferimento: currency;
    function BaseIcmsProprio: currency;
    function ValorIcmsOperacao: currency;
    function ValorIcmsDiferido: currency;
    function ValorIcmsProprio: currency;

  public
    constructor Create(_valorProduto,
                       _valorFrete,
                       _valorSeguro,
                       _despesasAcessorias,
                       _valorDesconto: currency;
                       _aLiquotaICMS,
                       _percentualDiferimento: currency;
                       _percentualReducao: currency = 0;
                       _valorIpi: currency = 0);
    destructor Destroy; override;

  end;

implementation

uses
  acbrutil.Math;

{ TIcms51 }

function TIcms51.BaseIcmsProprio: currency;
begin
  Result := FBaseIcmsProprio.CalcularBaseIcmsProprio;

end;

constructor TIcms51.Create(_valorProduto,
                           _valorFrete,
                           _valorSeguro,
                           _despesasAcessorias,
                           _valorDesconto,
                           _aLiquotaICMS,
                           _percentualDiferimento,
                           _percentualReducao,
                           _valorIpi: currency);
begin
  FBaseIcmsProprio := TBaseIcmsProprio.Create(_valorProduto,
                                              _valorFrete,
                                              _valorSeguro,
                                              _despesasAcessorias,
                                              _valorDesconto,
                                              _percentualReducao,
                                              _valorIpi);

  FValorIcmsOperacao := TValorIcms.Create(FBaseIcmsProprio, _ALiquotaICMS);

  FPercentualDiferimento := _percentualDiferimento;
end;

destructor TIcms51.Destroy;
begin
  FValorIcmsOperacao.Free;
  FBaseIcmsProprio.Free;
  inherited;
end;

function TIcms51.ValorIcmsDiferido: currency;
begin
  Result := RoundABNT(FValorIcmsOperacao.GetValorIcms *
    (FPercentualDiferimento / 100), 2);

end;

function TIcms51.ValorIcmsOperacao: currency;
begin
  Result := RoundABNT(FValorIcmsOperacao.GetValorIcms,2);
end;

function TIcms51.ValorIcmsProprio: currency;
begin
  Result := RoundABNT(ValorIcmsOperacao - ValorIcmsDiferido,2);

end;

end.

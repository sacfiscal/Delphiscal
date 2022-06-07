unit uIcms101;

interface

uses uBaseIcmsProprio, uIIcms101;

type
  TIcms101 = class(TInterfacedObject, IIcms101)
  private
    FBaseCreditoSN: TBaseIcmsProprio;
    FPercentualCreditoSN: currency;
    function BaseCreditoSN: currency;
    function ValorCreditoSN: currency;
  public
    constructor Create(_valorProduto,
                       _valorFrete,
                       _valorSeguro,
                       _despesasAcessorias,
                       _valorDesconto: currency;
                       _percentualCreditoSN: currency;
                       _percentualReducao: currency= 0);
    destructor Destroy; override;

  end;
implementation
uses acbrutil.Math;

{ TIcms101 }

function TIcms101.BaseCreditoSN: currency;
begin
 result := RoundABNT(FBaseCreditoSN.CalcularBaseIcmsProprio,2);
end;

constructor TIcms101.Create(_valorProduto,
                            _valorFrete,
                            _valorSeguro,
                            _despesasAcessorias,
                            _valorDesconto,
                            _percentualCreditoSN,
                            _percentualReducao: currency);
begin
 FBaseCreditoSN := TBaseIcmsProprio.Create(_valorProduto,
                            _valorFrete,
                            _valorSeguro,
                            _despesasAcessorias,
                            _valorDesconto,
                            _percentualReducao);

 FPercentualCreditoSN := _percentualCreditoSN;
end;

destructor TIcms101.Destroy;
begin
  FBaseCreditoSN.Free;
  inherited;
end;

function TIcms101.ValorCreditoSN: currency;
begin
 result := RoundABNT( BaseCreditoSN * (FPercentualCreditoSN / 100),2);
end;

end.

unit uIcms70;

interface

uses uIIcms70, uBaseIcmsProprio, uValorIcms, uBaseIcmsST, uValorIcmsST, uIIcms10, uIcms10;

type
  TIcms70 = class(TInterfacedObject, IIcms70)
  private
    FBaseIcmsProprio: TBaseIcmsProprio;
    FIcmsProprio: TValorIcms;
    FBaseIcmsST: TBaseIcmsST;
    FIcmsST: TValorIcmsST;
  public
    constructor Create(_valorProduto,
                           _valorFrete,
                           _valorSeguro,
                           _despesasAcessorias,
                           _valorDesconto,
                           _aliquotaIcms,
                           _percentualReducao,
                           _aliquotaIcmsST,
                           _mva: currency;
                           _percentualReducaoST: currency = 0;
                           _valorIpi: currency = 0);
    function ValorBaseReduzidaIcmsProprio: currency;
    function ValorIcmsProprio: currency;
    function ValorBaseIcmsST: currency;
    function ValorIcmsST: currency;
    function ValorIcmsDesonerado: currency;
    function ValorIcmsSTDesonerado(valorIcmsSTNormal: currency): currency;
    destructor Destroy; override;
  end;

implementation
uses
 acbrutil.Math;

{ TIcms70 }

constructor TIcms70.Create(_valorProduto,
                           _valorFrete,
                           _valorSeguro,
                           _despesasAcessorias,
                           _valorDesconto,
                           _aliquotaIcms,
                           _percentualReducao,
                           _aliquotaIcmsST,
                           _mva,
                           _percentualReducaoST,
                           _valorIpi: currency);
begin
 FBaseIcmsProprio := TBaseIcmsProprio.Create(_valorProduto,
                           _valorFrete,
                           _valorSeguro,
                           _despesasAcessorias,
                           _valorDesconto,
                           _percentualReducao);

 FIcmsProprio := TValorIcms.Create(FBaseIcmsProprio, _aliquotaIcms);

 FBaseIcmsST := TBaseIcmsST.Create(FBaseIcmsProprio, _mva, _percentualReducaoST);

 FIcmsST := TValorIcmsST.Create(FBaseIcmsST, _aliquotaIcmsST, FIcmsProprio);

end;

destructor TIcms70.Destroy;
begin
  FIcmsST.Free;
  FBaseIcmsST.Free;
  FIcmsProprio.Free;
  FBaseIcmsProprio.Free;
  inherited;
end;

function TIcms70.ValorBaseIcmsST: currency;
begin
   result := FBaseIcmsST.CalcularBaseIcmsST;
end;

function TIcms70.ValorBaseReduzidaIcmsProprio: currency;
begin
  result := FBaseIcmsProprio.CalcularBaseReduzida;
end;

function TIcms70.ValorIcmsDesonerado: currency;
var
 valorICMSNormal: currency;
begin
  valorICMSNormal :=  FIcmsProprio.CalcularValorNormalIcms;

  result := RoundABNT(valorICMSNormal - FIcmsProprio.CalcularValorReduzidoIcms,2);

end;

function TIcms70.ValorIcmsProprio: currency;
begin
  result := RoundABNT(FIcmsProprio.GetValorIcms, 2);
end;

function TIcms70.ValorIcmsST: currency;
begin
   result := RoundABNT(FIcmsST.CalcularValorIcmsST,2);
end;

function TIcms70.ValorIcmsSTDesonerado(valorIcmsSTNormal: currency): currency;
begin
  result := RoundABNT(valorIcmsSTNormal - FIcmsST.CalcularValorIcmsST,2);

end;

end.

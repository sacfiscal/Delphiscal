unit uIcms10;

interface

uses uBaseIcmsProprio, uValorIcms, uBaseIcmsST, uValorIcmsST,  uIIcms10;

type
  TIcms10 = class(TInterfacedObject, IIcms10)
  private
    FBaseIcmsProprio: TBaseIcmsProprio;
    FIcmsProprio: TValorIcms;
    FBaseIcmsST: TBaseIcmsST;
    FIcmsST: TValorIcmsST;
    function ValorBaseIcmsProprio: currency;
    function ValorIcmsProprio: currency;
    function ValorBaseIcmsST: currency;
    function ValorIcmsST: currency;
    function ValorIcmsSTDesonerado: currency;
  public
    constructor Create(_valorProduto,
                       _valorFrete,
                       _valorSeguro,
                       _despesasAcessorias,
                       _valorDesconto,
                       _aliquotaIcms,
                       _aliquotaIcmsST,
                       _mva: currency;
                       _percentualReducaoST: currency = 0;
                       _valorIpi: currency = 0);
     destructor Destroy; override;

  end;

implementation
uses acbrutil.Math;
{ TIcms10 }

constructor TIcms10.Create(_valorProduto,
                           _valorFrete,
                           _valorSeguro,
                           _despesasAcessorias,
                           _valorDesconto,
                           _aliquotaIcms,
                           _aliquotaIcmsST,
                           _mva,
                           _percentualReducaoST,
                           _valorIpi: currency);
begin
 FBaseIcmsProprio := TBaseIcmsProprio.Create(_valorProduto,
                           _valorFrete,
                           _valorSeguro,
                           _despesasAcessorias,
                           _valorDesconto);

 FIcmsProprio := TValorIcms.Create(FBaseIcmsProprio, _aliquotaIcms);

 FBaseIcmsST := TBaseIcmsST.Create(FBaseIcmsProprio, _mva, _percentualReducaoST);

 FIcmsST := TValorIcmsST.Create(FBaseIcmsST, _aliquotaIcmsST, FIcmsProprio);

end;

destructor TIcms10.Destroy;
begin
  FBaseIcmsProprio.Free;
  FIcmsProprio.Free;
  FBaseIcmsST.Free;
  FIcmsST.Free;
  inherited;
end;

function TIcms10.ValorBaseIcmsProprio: currency;
begin
  result := FBaseIcmsProprio.CalcularBaseIcmsProprio;
end;

function TIcms10.ValorIcmsProprio: currency;
begin

 result := RoundABNT(FIcmsProprio.GetValorIcms, 2);

end;

function TIcms10.ValorBaseIcmsST: currency;
begin
  result := FBaseIcmsST.CalcularBaseIcmsST;
end;


function TIcms10.ValorIcmsST: currency;
begin

 result := RoundABNT(FIcmsST.CalcularValorIcmsST,2);

end;

function TIcms10.ValorIcmsSTDesonerado: currency;
var
 valorICMSSTNormal: currency;
begin
  valorICMSSTNormal :=  FIcmsST.CalcularValorNormalIcmsST;

  result := RoundABNT(valorICMSSTNormal - FIcmsST.CalcularValorIcmsST,2);
end;

end.

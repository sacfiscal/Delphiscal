unit Delphiscal.Icms10;

interface

uses
  Delphiscal.Icms.BaseProprio,
  Delphiscal.Icms.Valor,
  Delphiscal.Icms.BaseST,
  Delphiscal.Icms.Valor.ST,
  Delphiscal.Icms10.Intf;

type
  TIcms10 = class(TInterfacedObject,
                  IIcms10)
  private
    FBaseIcmsProprio: TBaseIcmsProprio;
    FIcmsProprio    : TValorIcms;
    FBaseIcmsST     : TBaseIcmsST;
    FIcmsST         : TValorIcmsST;
    function ValorBaseIcmsProprio: Currency;
    function ValorIcmsProprio: Currency;
    function ValorBaseIcmsST: Currency;
    function ValorIcmsST: Currency;
    function ValorIcmsSTDesonerado: Currency;
  public
    constructor Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaIcms, AAliquotaIcmsST, AMva: Currency;
      const APercentualReducaoST: Currency = 0; const AValorIpi: Currency = 0);
    destructor Destroy; override;
  end;

implementation

uses
  acbrutil.math;

constructor TIcms10.Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaIcms, AAliquotaIcmsST, AMva: Currency;
  const APercentualReducaoST: Currency = 0; const AValorIpi: Currency = 0);
begin
  FBaseIcmsProprio := TBaseIcmsProprio.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto);
  FIcmsProprio     := TValorIcms.Create(FBaseIcmsProprio, AAliquotaIcms);
  FBaseIcmsST      := TBaseIcmsST.Create(FBaseIcmsProprio, AMva, APercentualReducaoST);
  FIcmsST          := TValorIcmsST.Create(FBaseIcmsST, AAliquotaIcmsST, FIcmsProprio);
end;

destructor TIcms10.Destroy;
begin
  FBaseIcmsProprio.Free;
  FIcmsProprio.Free;
  FBaseIcmsST.Free;
  FIcmsST.Free;
  inherited;
end;

function TIcms10.ValorBaseIcmsProprio: Currency;
begin
  Result := FBaseIcmsProprio.CalcularBaseIcmsProprio;
end;

function TIcms10.ValorIcmsProprio: Currency;
begin
  Result := RoundABNT(FIcmsProprio.GetValorIcms, 2);
end;

function TIcms10.ValorBaseIcmsST: Currency;
begin
  Result := FBaseIcmsST.CalcularBaseIcmsST;
end;

function TIcms10.ValorIcmsST: Currency;
begin
  Result := RoundABNT(FIcmsST.CalcularValorIcmsST, 2);
end;

function TIcms10.ValorIcmsSTDesonerado: Currency;
var
  LValorIcmsStNormal: Currency;
begin
  LValorIcmsStNormal := FIcmsST.CalcularValorNormalIcmsST;
  Result             := RoundABNT(LValorIcmsStNormal - FIcmsST.CalcularValorIcmsST, 2);
end;

end.

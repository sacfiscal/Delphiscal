unit Delphiscal.Icms202_203;

interface

uses Delphiscal.Icms.BaseProprio, Delphiscal.Icms.Valor, Delphiscal.Icms.BaseST, Delphiscal.Icms.Valor.ST, Delphiscal.Icms202_203.Intf;

type
  TIcms202_203 = class(TInterfacedObject, IIcms202_203)
  private
    FBaseIcmsProprio: TBaseIcmsProprio;
    FIcmsProprio: TValorIcms;
    FBaseIcmsST: TBaseIcmsST;
    FIcmsST: TValorIcmsST;
  public
    constructor Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaIcms,
      APercentualReducao, AAliquotaIcmsST, AMva: Currency; const APercentualReducaoST: Currency = 0);
    function ValorBaseIcmsProprio: Currency;
    function ValorIcmsProprio: Currency;
    function ValorBaseIcmsST: Currency;
    function ValorIcmsST: Currency;
    destructor Destroy; override;
  end;

implementation

uses acbrutil.math;

constructor TIcms202_203.Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto,
  AAliquotaIcms, APercentualReducao, AAliquotaIcmsST, AMva: Currency; const APercentualReducaoST: Currency = 0);
begin
  FBaseIcmsProprio := TBaseIcmsProprio.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, APercentualReducao);
  FIcmsProprio := TValorIcms.Create(FBaseIcmsProprio, AAliquotaIcms);
  FBaseIcmsST := TBaseIcmsST.Create(FBaseIcmsProprio, AMva, APercentualReducaoST);
  FIcmsST := TValorIcmsST.Create(FBaseIcmsST, AAliquotaIcmsST, FIcmsProprio);
end;

destructor TIcms202_203.Destroy;
begin
  FIcmsST.Free;
  FBaseIcmsST.Free;
  FIcmsProprio.Free;
  FBaseIcmsProprio.Free;
  inherited;
end;

function TIcms202_203.ValorBaseIcmsProprio: Currency;
begin
  Result := FBaseIcmsProprio.CalcularBaseIcmsProprio;
end;

function TIcms202_203.ValorBaseIcmsST: Currency;
begin
  Result := FBaseIcmsST.CalcularBaseIcmsST;
end;

function TIcms202_203.ValorIcmsProprio: Currency;
begin
  Result := RoundABNT(FIcmsProprio.GetValorIcms, 2);
end;

function TIcms202_203.ValorIcmsST: Currency;
begin
  Result := RoundABNT(FIcmsST.CalcularValorIcmsST, 2);
end;

end.

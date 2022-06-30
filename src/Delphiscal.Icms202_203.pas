unit Delphiscal.Icms202_203;

interface

uses Delphiscal.Icms.BaseProprio, Delphiscal.Icms.Valor, Delphiscal.Icms.BaseST, Delphiscal.Icms.Valor.ST,
  Delphiscal.Icms202_203.Intf;

type
  TIcms202_203 = class(TInterfacedObject, IIcms202_203)
  private
    FBaseIcmsProprio: TBaseIcmsProprio;
    FIcmsProprio: TValorIcms;
    FBaseIcmsST: TBaseIcmsST;
    FIcmsST: TValorIcmsST;
    function ValorBaseIcmsProprio: Double;
    function ValorIcmsProprio: Double;
    function ValorBaseIcmsST: Double;
    function ValorIcmsST: Double;
  public
    constructor Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaIcms,
      APercentualReducao, AAliquotaIcmsST, AMva: Double; const APercentualReducaoST: Double = 0);
    class function New(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaIcms,
      APercentualReducao, AAliquotaIcmsST, AMva: Double; const APercentualReducaoST: Double = 0): IIcms202_203;
    destructor Destroy; override;
  end;

implementation

uses Delphiscal.Utils;

constructor TIcms202_203.Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto,
  AAliquotaIcms, APercentualReducao, AAliquotaIcmsST, AMva: Double; const APercentualReducaoST: Double = 0);
begin
  FBaseIcmsProprio := TBaseIcmsProprio.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto,
    APercentualReducao);
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

class function TIcms202_203.New(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto,
  AAliquotaIcms, APercentualReducao, AAliquotaIcmsST, AMva, APercentualReducaoST: Double): IIcms202_203;
begin
  Result := TIcms202_203.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaIcms,
    APercentualReducao, AAliquotaIcmsST, AMva, APercentualReducaoST);
end;

function TIcms202_203.ValorBaseIcmsProprio: Double;
begin
  Result := FBaseIcmsProprio.CalcularBaseIcmsProprio;
end;

function TIcms202_203.ValorBaseIcmsST: Double;
begin
  Result := FBaseIcmsST.CalcularBaseIcmsST;
end;

function TIcms202_203.ValorIcmsProprio: Double;
begin
  Result := RoundABNT(FIcmsProprio.GetValorIcms, 2);
end;

function TIcms202_203.ValorIcmsST: Double;
begin
  Result := RoundABNT(FIcmsST.CalcularValorIcmsST, 2);
end;

end.

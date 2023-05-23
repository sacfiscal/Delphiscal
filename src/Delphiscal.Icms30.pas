unit Delphiscal.Icms30;

interface

uses Delphiscal.Icms.BaseProprio, Delphiscal.Icms.Valor, Delphiscal.Icms.Valor.ST, Delphiscal.Icms30.Intf, Delphiscal.Icms.BaseST;

type
  TIcms30 = class(TInterfacedObject, IIcms30)
  private
    FBaseIcmsProprio: TBaseIcmsProprio;
    FIcmsProprio: TValorIcms;
    FBaseIcmsST: TBaseIcmsST;
    FIcmsST: TValorIcmsST;
    function ValorBaseIcmsProprio: Double;
    function ValorIcmsProprio: Double;
    function ValorBaseIcmsST: Double;
    function ValorIcmsST: Double;
    function ValorIcmsDesonerado: Double;
  public
    class function New(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaIcms,
      AAliquotaIcmsST, AMva: Double; const APercentualReducaoST: Double = 0; const AValorIpi: Double = 0): IIcms30;
    constructor Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaIcms,
      AAliquotaIcmsST, AMva: Double; const APercentualReducaoST: Double = 0; const AValorIpi: Double = 0);
    destructor Destroy; override;
  end;

implementation

uses Delphiscal.Utils;

class function TIcms30.New(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaIcms,
  AAliquotaIcmsST, AMva, APercentualReducaoST, AValorIpi: Double): IIcms30;
begin
  Result := TIcms30.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaIcms,
                           AAliquotaIcmsST, AMva, APercentualReducaoST, AValorIpi);
end;

constructor TIcms30.Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaIcms,
  AAliquotaIcmsST, AMva: Double; const APercentualReducaoST: Double = 0; const AValorIpi: Double = 0);
begin
  FBaseIcmsProprio := TBaseIcmsProprio.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto);
  FIcmsProprio := TValorIcms.Create(FBaseIcmsProprio, AAliquotaIcms);
  FBaseIcmsST := TBaseIcmsST.Create(FBaseIcmsProprio, AMva, APercentualReducaoST);
  FIcmsST := TValorIcmsST.Create(FBaseIcmsST, AAliquotaIcmsST, FIcmsProprio);
end;

destructor TIcms30.Destroy;
begin
  FBaseIcmsProprio.Free;
  FIcmsProprio.Free;
  FBaseIcmsST.Free;
  FIcmsST.Free;
  inherited;
end;

function TIcms30.ValorBaseIcmsProprio: Double;
begin
  Result := FBaseIcmsProprio.CalcularBaseIcmsProprio;
end;

function TIcms30.ValorIcmsProprio: Double;
begin
  Result := RoundABNT(FIcmsProprio.GetValorIcms, 2);
end;

function TIcms30.ValorBaseIcmsST: Double;
begin
  Result := FBaseIcmsST.CalcularBaseIcmsST;
end;

function TIcms30.ValorIcmsST: Double;
begin
  Result := RoundABNT(FIcmsST.CalcularValorIcmsST, 2);
end;

function TIcms30.ValorIcmsDesonerado: Double;
begin
  Result := RoundABNT(FIcmsProprio.CalcularValorNormalIcms, 2);
end;

end.

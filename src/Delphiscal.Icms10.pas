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
    FBaseFCP        : TBaseIcmsProprio;
    FvFCP           : TValorICMS;
    FBaseFCPST      : TBaseICMSST;
    FvFCPST         : TValorICMSST;
    function ValorBaseIcmsProprio: Double;
    function ValorIcmsProprio: Double;
    function ValorBaseIcmsST: Double;
    function ValorIcmsST: Double;
    function ValorIcmsSTDesonerado: Double;
    function ValorBaseFCP : double;
    function ValorFCP : double;
    function ValorBaseFCPST : double;
    function ValorFCPST : double;
  public
    class function New(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaIcms, AAliquotaIcmsST, AMva: Double;
      const APercentualReducaoST: Double = 0; const AValorIpi: Double = 0; const APercentualFCP: double = 0; const APercentualFCPST : double = 0): IIcms10;
    constructor Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaIcms, AAliquotaIcmsST, AMva: Double;
      const APercentualReducaoST: Double = 0; const AValorIpi: Double = 0; const APercentualFCP: double = 0; const APercentualFCPST : double = 0);
    destructor Destroy; override;
  end;

implementation

uses
  Delphiscal.Utils;

class function TIcms10.New(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaIcms, AAliquotaIcmsST, AMva: Double;
      const APercentualReducaoST: Double = 0; const AValorIpi: Double = 0; const APercentualFCP: double = 0; const APercentualFCPST : double = 0): IIcms10;
begin
  Result := TIcms10.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaIcms, AAliquotaIcmsST, AMva, APercentualReducaoST, AValorIpi);
end;

constructor TIcms10.Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AAliquotaIcms, AAliquotaIcmsST, AMva: Double;
      const APercentualReducaoST: Double = 0; const AValorIpi: Double = 0; const APercentualFCP: double = 0; const APercentualFCPST : double = 0);
begin
  FBaseIcmsProprio := TBaseIcmsProprio.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto);
  FIcmsProprio     := TValorIcms.Create(FBaseIcmsProprio, AAliquotaIcms);
  FBaseIcmsST      := TBaseIcmsST.Create(FBaseIcmsProprio, AMva, APercentualReducaoST, AValorIpi);
  FIcmsST          := TValorIcmsST.Create(FBaseIcmsST, AAliquotaIcmsST, FIcmsProprio);

  FBaseFCP         := TBaseIcmsProprio.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto);
  FvFCP            := TValorIcms.Create(FBaseFCP, APercentualFCP);
  FBaseFCPST       := TBaseIcmsST.Create(FBaseFCP, AMva, APercentualReducaoST, AValorIpi);
  FvFCPST          := TValorIcmsST.Create(FBaseFCPST, APercentualFCPST, FvFCP);
end;

destructor TIcms10.Destroy;
begin
  FBaseIcmsProprio.Free;
  FIcmsProprio.Free;
  FBaseIcmsST.Free;
  FIcmsST.Free;

  FBaseFCP.Free;
  FvFCP.Free;
  FBaseFCPST.Free;
  FvFCPST.Free;
  inherited;
end;

function TIcms10.ValorBaseFCP: double;
begin
  Result := FBaseFCP.CalcularBaseIcmsProprio;
end;

function TIcms10.ValorBaseFCPST: double;
begin
  Result := FBaseFCPST.CalcularBaseIcmsST;
end;

function TIcms10.ValorBaseIcmsProprio: Double;
begin
  Result := FBaseIcmsProprio.CalcularBaseIcmsProprio;
end;

function TIcms10.ValorIcmsProprio: Double;
begin
  Result := RoundABNT(FIcmsProprio.GetValorIcms, 2);
end;

function TIcms10.ValorBaseIcmsST: Double;
begin
  Result := FBaseIcmsST.CalcularBaseIcmsST;
end;

function TIcms10.ValorFCP: double;
begin
  Result := RoundABNT(FvFCP.GetValorIcms, 2);
end;

function TIcms10.ValorFCPST: double;
begin
  Result := RoundABNT(FvFCPST.CalcularValorIcmsST, 2);
end;

function TIcms10.ValorIcmsST: Double;
begin
  Result := RoundABNT(FIcmsST.CalcularValorIcmsST, 2);
end;

function TIcms10.ValorIcmsSTDesonerado: Double;
var
  LValorIcmsStNormal: Double;
begin
  LValorIcmsStNormal := FIcmsST.CalcularValorNormalIcmsST;
  Result             := RoundABNT(LValorIcmsStNormal - FIcmsST.CalcularValorIcmsST, 2);
end;

end.

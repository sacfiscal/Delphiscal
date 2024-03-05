unit Delphiscal.Icms00;

interface

uses
  Delphiscal.Icms.BaseProprio,
  Delphiscal.Icms.Valor,
  Delphiscal.Icms00.Intf;

type
  TIcms00 = class(TInterfacedObject,
                  IIcms00)
  private
    FBaseIcmsProprio: TBaseIcmsProprio;
    FValorIcms      : TValorIcms;
    FValorFCP      : TValorIcms;
    function BaseIcmsProprio: Double;
    function ValorIcmsProprio: Double;
    function ValorFCP : Double;
  public
    class function New(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AALiquotaICMS: Double; const AValorIpi: Double = 0; const AAliquotaFCP : Double = 0): IIcms00;
    constructor Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AALiquotaICMS: Double; const AValorIpi: Double = 0; const AAliquotaFCP : Double = 0);
    destructor Destroy; override;
  end;

implementation

uses
  Delphiscal.Utils;

class function TIcms00.New(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AALiquotaICMS, AValorIpi, AAliquotaFCP : Double): IIcms00;
begin
  Result := TIcms00.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AALiquotaICMS, AValorIpi, AAliquotaFCP);
end;

constructor TIcms00.Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AALiquotaICMS, AValorIpi, AAliquotaFCP: double);
begin
  FBaseIcmsProprio := TBaseIcmsProprio.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, 0, AValorIpi);
  FValorIcms       := TValorIcms.Create(FBaseIcmsProprio, AALiquotaICMS);
  FValorFCP        := TValorIcms.Create(FBaseIcmsProprio, AAliquotaFCP);
end;

destructor TIcms00.Destroy;
begin
  FValorIcms.Free;
  FBaseIcmsProprio.Free;
  FValorFCP.Free;
  inherited;
end;

function TIcms00.BaseIcmsProprio: Double;
begin
  Result := RoundABNT(FBaseIcmsProprio.CalcularBaseIcmsProprio, 2);
end;

function TIcms00.ValorFCP: Double;
begin
  Result := RoundABNT(FValorFCP.GetValorIcms, 2);
end;

function TIcms00.ValorIcmsProprio: Double;
begin
  Result := RoundABNT(FValorIcms.GetValorIcms, 2);
end;

end.

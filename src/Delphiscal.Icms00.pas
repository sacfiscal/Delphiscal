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
    function BaseIcmsProprio: Double;
    function ValorIcmsProprio: Double;
  public
    class function New(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AALiquotaICMS: Double; const AValorIpi: Double = 0): IIcms00;
    constructor Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AALiquotaICMS: Double; const AValorIpi: Double = 0);
    destructor Destroy; override;
  end;

implementation

uses
  Delphiscal.Utils;

class function TIcms00.New(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AALiquotaICMS, AValorIpi: Double): IIcms00;
begin
  Result := TIcms00.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AALiquotaICMS, AValorIpi);
end;

constructor TIcms00.Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AALiquotaICMS: Double; const AValorIpi: Double = 0);
begin
  FBaseIcmsProprio := TBaseIcmsProprio.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, 0, AValorIpi);
  FValorIcms       := TValorIcms.Create(FBaseIcmsProprio, AALiquotaICMS);
end;

destructor TIcms00.Destroy;
begin
  FValorIcms.Free;
  FBaseIcmsProprio.Free;
  inherited;
end;

function TIcms00.BaseIcmsProprio: Double;
begin
  Result := RoundABNT(FBaseIcmsProprio.CalcularBaseIcmsProprio, 2);
end;

function TIcms00.ValorIcmsProprio: Double;
begin
  Result := RoundABNT(FValorIcms.GetValorIcms, 2);
end;

end.

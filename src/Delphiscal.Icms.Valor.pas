unit Delphiscal.Icms.Valor;

interface

uses Delphiscal.Icms.BaseProprio;

type
  TValorIcms = class
  private
    FBaseIcms: TBaseIcmsProprio;
    FAliquotaIcms: Currency;
  public
    constructor Create(const ABaseIcmsProprio: TBaseIcmsProprio; const AAliquotaIcmsProprio: Currency);
    property AliquotaIcms: Currency read FAliquotaIcms write FAliquotaIcms;
    function GetValorIcms: Currency;
    function CalcularValorReduzidoIcms: Currency;
    function CalcularValorNormalIcms: Currency;
  end;

implementation

uses acbrutil.math;

constructor TValorIcms.Create(const ABaseIcmsProprio: TBaseIcmsProprio; const AAliquotaIcmsProprio: Currency);
begin
  FBaseIcms := ABaseIcmsProprio;
  AliquotaIcms := AAliquotaIcmsProprio;
end;

function TValorIcms.GetValorIcms: Currency;
begin
  if FBaseIcms.ContemReducao then
    Result := CalcularValorReduzidoIcms
  else
    Result := CalcularValorNormalIcms;
end;

function TValorIcms.CalcularValorNormalIcms: Currency;
begin
  Result := RoundABNT((FBaseIcms.CalcularBaseNormal * (AliquotaIcms / 100)), 2);
end;

function TValorIcms.CalcularValorReduzidoIcms: Currency;
begin
  Result := RoundABNT((FBaseIcms.CalcularBaseReduzida * (AliquotaIcms / 100)), 2);
end;

end.

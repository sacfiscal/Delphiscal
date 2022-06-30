unit Delphiscal.Icms.Valor;

interface

uses Delphiscal.Icms.BaseProprio;

type
  TValorIcms = class
  private
    FBaseIcms: TBaseIcmsProprio;
    FAliquotaIcms: Double;
  public
    constructor Create(const ABaseIcmsProprio: TBaseIcmsProprio; const AAliquotaIcmsProprio: Double);
    property AliquotaIcms: Double read FAliquotaIcms write FAliquotaIcms;
    function GetValorIcms: Double;
    function CalcularValorReduzidoIcms: Double;
    function CalcularValorNormalIcms: Double;
  end;

implementation

uses Delphiscal.Utils;

constructor TValorIcms.Create(const ABaseIcmsProprio: TBaseIcmsProprio; const AAliquotaIcmsProprio: Double);
begin
  FBaseIcms := ABaseIcmsProprio;
  AliquotaIcms := AAliquotaIcmsProprio;
end;

function TValorIcms.GetValorIcms: Double;
begin
  if FBaseIcms.ContemReducao then
    Result := CalcularValorReduzidoIcms
  else
    Result := CalcularValorNormalIcms;
end;

function TValorIcms.CalcularValorNormalIcms: Double;
begin
  Result := RoundABNT((FBaseIcms.CalcularBaseNormal * (AliquotaIcms / 100)), 2);
end;

function TValorIcms.CalcularValorReduzidoIcms: Double;
begin
  Result := RoundABNT((FBaseIcms.CalcularBaseReduzida * (AliquotaIcms / 100)), 2);
end;

end.

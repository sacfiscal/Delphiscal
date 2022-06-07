unit Delphiscal.Icms.BaseST;

interface

uses Delphiscal.Icms.BaseProprio;

type
  TBaseIcmsST = class
  private
    FBaseIcmsProprio: TBaseIcmsProprio;
    FPercentualReducaoST: Currency;
    FMva: Currency;
    FValorIpi: Currency;
  public
    constructor Create(const ABaseIcmsProprio: TBaseIcmsProprio; const AMva: currency; const APercentualReducaoST: Currency = 0;
      const AValorIpi: Currency = 0);
    function CalcularBaseIcmsST: Currency;
    function CalcularBaseNormalST: Currency;
    function CalcularBaseReduzidaST: Currency;
    function ContemReducaoST: Boolean;
  end;

implementation

uses acbrutil.math;

constructor TBaseIcmsST.Create(const ABaseIcmsProprio: TBaseIcmsProprio; const AMva: currency; const APercentualReducaoST: Currency = 0;
  const AValorIpi: Currency = 0);
begin
  FBaseIcmsProprio := ABaseIcmsProprio;
  FMva := AMva;
  FPercentualReducaoST := APercentualReducaoST;
  FValorIpi := AValorIpi;
end;

function TBaseIcmsST.CalcularBaseIcmsST: Currency;
begin
  if FPercentualReducaoST > 0 then
    Result := CalcularBaseReduzidaST
  else
    Result := CalcularBaseNormalST;
end;

function TBaseIcmsST.CalcularBaseNormalST: Currency;
begin
  Result := RoundABNT((FBaseIcmsProprio.CalcularBaseIcmsProprio + FValorIpi) * (1 + (FMva / 100)), 2);
end;

function TBaseIcmsST.CalcularBaseReduzidaST: Currency;
var
  LBaseIcmsST: Currency;
begin
  LBaseIcmsST := RoundABNT((FBaseIcmsProprio.CalcularBaseIcmsProprio) * (1 + (FMva / 100)), 2);
  Result := RoundABNT((LBaseIcmsST - (LBaseIcmsST * (FPercentualReducaoST / 100)) + FValorIpi), 2);
end;

function TBaseIcmsST.ContemReducaoST: Boolean;
begin
  Result := FPercentualReducaoST > 0;
end;

end.

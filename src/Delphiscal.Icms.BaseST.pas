unit Delphiscal.Icms.BaseST;

interface

uses Delphiscal.Icms.BaseProprio;

type
  TBaseIcmsST = class
  private
    FBaseIcmsProprio: TBaseIcmsProprio;
    FPercentualReducaoST: Double;
    FMva: Double;
    FValorIpi: Double;
  public
    constructor Create(const ABaseIcmsProprio: TBaseIcmsProprio; const AMva: Double; const APercentualReducaoST: Double = 0;
      const AValorIpi: Double = 0);
    function CalcularBaseIcmsST: Double;
    function CalcularBaseNormalST: Double;
    function CalcularBaseReduzidaST: Double;
    function ContemReducaoST: Boolean;
  end;

implementation

uses Delphiscal.Utils;

constructor TBaseIcmsST.Create(const ABaseIcmsProprio: TBaseIcmsProprio; const AMva: Double;
  const APercentualReducaoST: Double = 0; const AValorIpi: Double = 0);
begin
  FBaseIcmsProprio := ABaseIcmsProprio;
  FMva := AMva;
  FPercentualReducaoST := APercentualReducaoST;
  FValorIpi := AValorIpi;
end;

function TBaseIcmsST.CalcularBaseIcmsST: Double;
begin
  if FPercentualReducaoST > 0 then
    Result := CalcularBaseReduzidaST
  else
    Result := CalcularBaseNormalST;
end;

function TBaseIcmsST.CalcularBaseNormalST: Double;
begin
  Result := RoundABNT((FBaseIcmsProprio.CalcularBaseIcmsProprio + FValorIpi) * (1 + (FMva / 100)), 2);
end;

function TBaseIcmsST.CalcularBaseReduzidaST: Double;
var
  LBaseIcmsST: Double;
begin
  LBaseIcmsST := RoundABNT((FBaseIcmsProprio.CalcularBaseIcmsProprio) * (1 + (FMva / 100)), 2);
  Result := RoundABNT((LBaseIcmsST - (LBaseIcmsST * (FPercentualReducaoST / 100)) + FValorIpi), 2);
end;

function TBaseIcmsST.ContemReducaoST: Boolean;
begin
  Result := FPercentualReducaoST > 0;
end;

end.

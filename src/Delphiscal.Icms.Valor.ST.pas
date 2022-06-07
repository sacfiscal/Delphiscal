unit Delphiscal.Icms.Valor.ST;

interface

uses Delphiscal.Icms.BaseST, Delphiscal.Icms.Valor;

type
  TValorIcmsST = class
  private
    FBaseIcmsST: TBaseIcmsST;
    FAliquotaST: Currency;
    FValorIcmsProprio: TValorIcms;
  public
    constructor Create(const ABaseIcmsST: TBaseIcmsST; const AAliquotaST: Currency; const AValorIcmsProrpio: TValorIcms);
    function CalcularValorIcmsST: Currency;
    function CalcularValorReduzidoIcmsST: Currency;
    function CalcularValorNormalIcmsST: Currency;
  end;

implementation

uses acbrutil.math;

constructor TValorIcmsST.Create(const ABaseIcmsST: TBaseIcmsST; const AAliquotaST: Currency; const AValorIcmsProrpio: TValorIcms);
begin
  FBaseIcmsST := ABaseIcmsST;
  FAliquotaST := AAliquotaST;
  FValorIcmsProprio := AValorIcmsProrpio;
end;

function TValorIcmsST.CalcularValorIcmsST: Currency;
begin
  if FBaseIcmsST.ContemReducaoST then
    Result := CalcularValorReduzidoIcmsST
  else
    Result := CalcularValorNormalIcmsST;
end;

function TValorIcmsST.CalcularValorNormalIcmsST: Currency;
begin
  Result := RoundABNT((FBaseIcmsST.CalcularBaseNormalST * (FAliquotaST / 100) - FValorIcmsProprio.GetValorIcms), 2);
end;

function TValorIcmsST.CalcularValorReduzidoIcmsST: Currency;
begin
  Result := RoundABNT((FBaseIcmsST.CalcularBaseReduzidaST * (FAliquotaST / 100) - FValorIcmsProprio.GetValorIcms), 2);
end;

end.

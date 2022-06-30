unit Delphiscal.Icms.Valor.ST;

interface

uses Delphiscal.Icms.BaseST, Delphiscal.Icms.Valor;

type
  TValorIcmsST = class
  private
    FBaseIcmsST: TBaseIcmsST;
    FAliquotaST: Double;
    FValorIcmsProprio: TValorIcms;
  public
    constructor Create(const ABaseIcmsST: TBaseIcmsST; const AAliquotaST: Double; const AValorIcmsProrpio: TValorIcms);
    function CalcularValorIcmsST: Double;
    function CalcularValorReduzidoIcmsST: Double;
    function CalcularValorNormalIcmsST: Double;
  end;

implementation

uses Delphiscal.Utils;

constructor TValorIcmsST.Create(const ABaseIcmsST: TBaseIcmsST; const AAliquotaST: Double; const AValorIcmsProrpio: TValorIcms);
begin
  FBaseIcmsST := ABaseIcmsST;
  FAliquotaST := AAliquotaST;
  FValorIcmsProprio := AValorIcmsProrpio;
end;

function TValorIcmsST.CalcularValorIcmsST: Double;
begin
  if FBaseIcmsST.ContemReducaoST then
    Result := CalcularValorReduzidoIcmsST
  else
    Result := CalcularValorNormalIcmsST;
end;

function TValorIcmsST.CalcularValorNormalIcmsST: Double;
begin
  Result := RoundABNT((FBaseIcmsST.CalcularBaseNormalST * (FAliquotaST / 100) - FValorIcmsProprio.GetValorIcms), 2);
end;

function TValorIcmsST.CalcularValorReduzidoIcmsST: Double;
begin
  Result := RoundABNT((FBaseIcmsST.CalcularBaseReduzidaST * (FAliquotaST / 100) - FValorIcmsProprio.GetValorIcms), 2);
end;

end.

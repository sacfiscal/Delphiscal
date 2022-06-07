unit Delphiscal.Icms.BaseProprio;

interface

type
  TBaseIcmsProprio = class
  private
    FvalorProduto: Currency;
    Fvalorfrete: Currency;
    FvalorSeguro: Currency;
    FdespesasAcessorias: Currency;
    FvalorIpi: Currency;
    FvalorDesconto: Currency;
    FpercentualReducao: Currency;
  public
    constructor Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto: Currency;
      const APercentualReducao: Currency = 0; const AValorIpi: Currency = 0);
    function CalcularBaseIcmsProprio: Currency;
    function CalcularBaseNormal: Currency;
    function CalcularBaseReduzida: Currency;
    function ContemReducao: Boolean;
  end;

implementation

uses acbrutil.math;

constructor TBaseIcmsProprio.Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto: Currency;
  const APercentualReducao: Currency = 0; const AValorIpi: Currency = 0);
begin
  FvalorProduto := AValorProduto;
  Fvalorfrete := AValorFrete;
  FvalorSeguro := AValorSeguro;
  FdespesasAcessorias := ADespesasAcessorias;
  FvalorDesconto := AValorDesconto;
  FvalorIpi := AValorIpi;
  FpercentualReducao := APercentualReducao;
end;

function TBaseIcmsProprio.CalcularBaseIcmsProprio: Currency;
begin
  if ContemReducao then
    Result := CalcularBaseReduzida
  else
    Result := CalcularBaseNormal;
end;

function TBaseIcmsProprio.CalcularBaseNormal: Currency;
begin
  Result := RoundABNT(FvalorProduto + Fvalorfrete + FvalorSeguro + FdespesasAcessorias + FvalorIpi - FvalorDesconto, 2);
end;

function TBaseIcmsProprio.CalcularBaseReduzida: Currency;
var
  LBaseIcms: Currency;
begin
  LBaseIcms := CalcularBaseNormal;
  Result := RoundABNT((LBaseIcms - (LBaseIcms * (FpercentualReducao / 100)) + FvalorIpi), 2);
end;

function TBaseIcmsProprio.ContemReducao: Boolean;
begin
  Result := FpercentualReducao > 0;
end;

end.

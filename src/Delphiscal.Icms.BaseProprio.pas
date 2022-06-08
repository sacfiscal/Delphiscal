unit Delphiscal.Icms.BaseProprio;

interface

type
  TBaseIcmsProprio = class
  private
    FvalorProduto: Double;
    Fvalorfrete: Double;
    FvalorSeguro: Double;
    FdespesasAcessorias: Double;
    FvalorIpi: Double;
    FvalorDesconto: Double;
    FpercentualReducao: Double;
  public
    constructor Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto: Double;
      const APercentualReducao: Double = 0; const AValorIpi: Double = 0);
    function CalcularBaseIcmsProprio: Double;
    function CalcularBaseNormal: Double;
    function CalcularBaseReduzida: Double;
    function ContemReducao: Boolean;
  end;

implementation

uses Delphiscal.Utils;

constructor TBaseIcmsProprio.Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto: Double;
  const APercentualReducao: Double = 0; const AValorIpi: Double = 0);
begin
  FvalorProduto := AValorProduto;
  Fvalorfrete := AValorFrete;
  FvalorSeguro := AValorSeguro;
  FdespesasAcessorias := ADespesasAcessorias;
  FvalorDesconto := AValorDesconto;
  FvalorIpi := AValorIpi;
  FpercentualReducao := APercentualReducao;
end;

function TBaseIcmsProprio.CalcularBaseIcmsProprio: Double;
begin
  if ContemReducao then
    Result := CalcularBaseReduzida
  else
    Result := CalcularBaseNormal;
end;

function TBaseIcmsProprio.CalcularBaseNormal: Double;
begin
  Result := RoundABNT(FvalorProduto + Fvalorfrete + FvalorSeguro + FdespesasAcessorias + FvalorIpi - FvalorDesconto, 2);
end;

function TBaseIcmsProprio.CalcularBaseReduzida: Double;
var
  LBaseIcms: Double;
begin
  LBaseIcms := CalcularBaseNormal;
  Result := RoundABNT((LBaseIcms - (LBaseIcms * (FpercentualReducao / 100)) + FvalorIpi), 2);
end;

function TBaseIcmsProprio.ContemReducao: Boolean;
begin
  Result := FpercentualReducao > 0;
end;

end.

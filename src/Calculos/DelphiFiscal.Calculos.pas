unit DelphiFiscal.Calculos;

interface

uses
  DelphiFiscal.Calculos.Interfaces;

type
  TDelphiFiscalCalculos = class(TInterfacedObject, iCalculo)
    private
      FValorProduto : double;
      FValorFrete : double;
      FValorSeguro : double;
      FValorDespesasAcessorias : double;
      FValorDesconto : double;
      FQuantidade : double;
      FICSM : iICMS;
      FST : iST;
      FIPI : iIPI;
      FPIS : iPIS;
      FCOFINS : iCOFINS;
    public
      constructor create;
      destructor destroy; override;
      class function New : iCalculo;
      function ValorProduto(aValue : double) : iCalculo; overload;
      function ValorProduto : double; overload;
      function ValorFrete(aValue : double) : iCalculo; overload;
      function ValorFrete : double; overload;
      function ValorSeguro(aValue : double) : iCalculo; overload;
      function ValorSeguro : double; overload;
      function ValorDespesasAcessorias(aValue : double) : iCalculo; overload;
      function ValorDespesasAcessorias : double; overload;
      function ValorDescontos(aValue : double) : iCalculo; overload;
      function ValorDescontos : double; overload;
      function Quantidade(aValue : double) : iCalculo; overload;
      function Quantidade : double; overload;
      function ST : iST;
      function IPI : iIPI;
      function PIS : iPIS;
      function ICMS : iICMS;
      function COFINS : iCOFINS;
  end;

implementation

uses
  DelphiFiscal.Calculos.ICMS,
  DelphiFiscal.Calculos.ST,
  DelphiFiscal.Calculos.IPI,
  DelphiFiscal.Calculos.PIS, DelphiFiscal.Calculos.COFINS;

{ TDelphiFiscalCalculos }

function TDelphiFiscalCalculos.COFINS: iCOFINS;
begin
  if not Assigned(FCOFINS) then
    FCOFINS:= TDelphiFiscalCOFINS.New(self);

  Result:= FCOFINS;
end;

constructor TDelphiFiscalCalculos.create;
begin

end;

destructor TDelphiFiscalCalculos.destroy;
begin

  inherited;
end;

function TDelphiFiscalCalculos.ICMS: iICMS;
begin
  if not Assigned(FICSM) then
    FICSM:= TDelphiFiscalICMS.New(self);

  Result:= FICSM;
end;

function TDelphiFiscalCalculos.IPI: iIPI;
begin
  if not Assigned(FIPI) then
    FIPI:= TDelphiFiscalIPI.New(self);

  Result:= FIPI;
end;

class function TDelphiFiscalCalculos.New: iCalculo;
begin
  Result:= Self.create
end;

function TDelphiFiscalCalculos.PIS: iPIS;
begin
  if not Assigned(FPIS) then
    FPIS:= TDelphiFiscalPIS.New(self);

  Result:= FPIS;
end;

function TDelphiFiscalCalculos.Quantidade: double;
begin
  Result:= FQuantidade;
end;

function TDelphiFiscalCalculos.Quantidade(aValue: double): iCalculo;
begin
  Result:= Self;
  FQuantidade:= aValue;
end;

function TDelphiFiscalCalculos.ST: iST;
begin
  if not Assigned(FST) then
    FST:= TDelphiFiscalST.New(self);

  Result:= FST;
end;

function TDelphiFiscalCalculos.ValorDescontos: double;
begin
  Result:= FValorDesconto;
end;

function TDelphiFiscalCalculos.ValorDescontos(aValue: double): iCalculo;
begin
  Result:= Self;
  FValorDesconto:= aValue;
end;

function TDelphiFiscalCalculos.ValorDespesasAcessorias: double;
begin
  Result:= FValorDespesasAcessorias;
end;

function TDelphiFiscalCalculos.ValorDespesasAcessorias(
  aValue: double): iCalculo;
begin
  Result:= Self;
  FValorDespesasAcessorias:= aValue;
end;

function TDelphiFiscalCalculos.ValorFrete(aValue: double): iCalculo;
begin
  Result:= Self;
  FValorFrete:= aValue;
end;

function TDelphiFiscalCalculos.ValorFrete: double;
begin
  Result:= FValorFrete;
end;

function TDelphiFiscalCalculos.ValorProduto: double;
begin
  Result:= FValorProduto * FQuantidade;
end;

function TDelphiFiscalCalculos.ValorProduto(aValue: double): iCalculo;
begin
  Result:= Self;
  FValorProduto:= aValue;
end;

function TDelphiFiscalCalculos.ValorSeguro(aValue: double): iCalculo;
begin
  Result:= Self;
  FValorSeguro:= aValue;
end;

function TDelphiFiscalCalculos.ValorSeguro: double;
begin
  Result:= FValorSeguro;
end;

end.

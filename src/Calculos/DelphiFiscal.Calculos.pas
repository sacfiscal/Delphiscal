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
      FICSM : iICMS;
      FST : iST;
      FIPI : iIPI;
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
      function ST : iST;
      function IPI : iIPI;
      function ICMS : iICMS;
  end;

implementation

uses
  DelphiFiscal.Calculos.ICMS,
  DelphiFiscal.Calculos.ST,
  DelphiFiscal.Calculos.IPI;

{ TDelphiFiscalCalculos }

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

function TDelphiFiscalCalculos.ST: iST;
begin
  if not Assigned(FST) then
    FST:= TDelphiFiscalST.New(self);

  Result:= FST;
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
  Result:= FValorProduto;
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

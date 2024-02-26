unit DelphiFiscal.Base;

interface

uses
  DelphiFiscal.Controller.Interfaces,
  DelphiFiscal.Base.Interfaces;

type
  TDelphiFiscalBase = class(TInterfacedObject, iBase)
    private
      [weak]
      FParent : iController;
      FValorProduto : double;
      FValorFrete : double;
      FValorSeguro : double;
      FValorDespesasAcessorias : double;
      FValorDesconto : double;
      FQuantidade : double;
    public
      constructor create(Parent : iController);
      destructor destroy; override;
      class function New(Parent : iController) : iBase;
      function ValorProduto(aValue : double) : iBase; overload;
      function ValorProduto : double; overload;
      function ValorFrete(aValue : double) : iBase; overload;
      function ValorFrete : double; overload;
      function ValorSeguro(aValue : double) : iBase; overload;
      function ValorSeguro : double; overload;
      function ValorDespesasAcessorias(aValue : double) : iBase; overload;
      function ValorDespesasAcessorias : double; overload;
      function ValorDescontos(aValue : double) : iBase; overload;
      function ValorDescontos : double; overload;
      function Quantidade(aValue : double) : iBase; overload;
      function Quantidade : double; overload;
      function &End : iController;
  end;

implementation


{ TDelphiFiscalBase }

function TDelphiFiscalBase.&End: iController;
begin
  Result:= FParent;
end;

constructor TDelphiFiscalBase.create(Parent : iController);
begin
  FParent:= Parent;
end;

destructor TDelphiFiscalBase.destroy;
begin

  inherited;
end;

class function TDelphiFiscalBase.New(Parent : iController) : iBase;
begin
  Result:= Self.create(Parent);
end;

function TDelphiFiscalBase.Quantidade: double;
begin
  Result:= FQuantidade;
end;

function TDelphiFiscalBase.Quantidade(aValue: double): iBase;
begin
  Result:= Self;
  FQuantidade:= aValue;
end;

function TDelphiFiscalBase.ValorDescontos: double;
begin
  Result:= FValorDesconto;
end;

function TDelphiFiscalBase.ValorDescontos(aValue: double): iBase;
begin
  Result:= Self;
  FValorDesconto:= aValue;
end;

function TDelphiFiscalBase.ValorDespesasAcessorias: double;
begin
  Result:= FValorDespesasAcessorias;
end;

function TDelphiFiscalBase.ValorDespesasAcessorias(
  aValue: double): iBase;
begin
  Result:= Self;
  FValorDespesasAcessorias:= aValue;
end;

function TDelphiFiscalBase.ValorFrete(aValue: double): iBase;
begin
  Result:= Self;
  FValorFrete:= aValue;
end;

function TDelphiFiscalBase.ValorFrete: double;
begin
  Result:= FValorFrete;
end;

function TDelphiFiscalBase.ValorProduto: double;
begin
  Result:= FValorProduto * FQuantidade;
end;

function TDelphiFiscalBase.ValorProduto(aValue: double): iBase;
begin
  Result:= Self;
  FValorProduto:= aValue;
end;

function TDelphiFiscalBase.ValorSeguro(aValue: double): iBase;
begin
  Result:= Self;
  FValorSeguro:= aValue;
end;

function TDelphiFiscalBase.ValorSeguro: double;
begin
  Result:= FValorSeguro;
end;

end.

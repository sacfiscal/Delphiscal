unit DelphiFiscal.Calculos.PIS;

interface

uses
  DelphiFiscal.Calculos.Interfaces;

type
  TDelphiFiscalPIS = class(TInterfacedObject, iPIS)
    private
      [weak]
      FParent : iCalculo;
      FAliquotaPIS : double;
      FValorIPIPorUnidade : double;
      FQtdeIPITributada : double;
    public
      constructor create(Parent : iCalculo);
      destructor destroy; override;
      class function New(Parent : iCalculo) : iPIS;
      function AliquotaPIS(aValue : double) : iPIS; overload;
      function AliquotaPIS : double; overload;
      function ValorPISPorUnidade(aValue : double) : iPIS; overload;
      function ValorPISPorUnidade : double; overload;
      function QtdePISTributada(aValue : double) : iPIS; overload;
      function QtdePISTributada : double; overload;
      function &End : iCalculo;
  end;
implementation

{ TDelphiFiscalPIS }

uses Delphiscal.Utils;

function TDelphiFiscalPIS.&End: iCalculo;
begin
  Result:= FParent;
end;

function TDelphiFiscalPIS.AliquotaPIS(aValue: double): iPIS;
begin
  Result:= Self;
  FAliquotaPIS:= aValue;
end;

function TDelphiFiscalPIS.AliquotaPIS: double;
begin
  Result:= FAliquotaPIS;
end;

constructor TDelphiFiscalPIS.create(Parent: iCalculo);
begin
  FParent:= Parent;
end;

destructor TDelphiFiscalPIS.destroy;
begin

  inherited;
end;

class function TDelphiFiscalPIS.New(Parent: iCalculo): iPIS;
begin
  Result:= Self.create(Parent);
end;

function TDelphiFiscalPIS.QtdePISTributada: double;
begin
  Result:= FQtdeIPITributada;
end;

function TDelphiFiscalPIS.QtdePISTributada(aValue: double): iPIS;
begin
  Result:= Self;
  FQtdeIPITributada:= aValue;
end;

function TDelphiFiscalPIS.ValorPISPorUnidade(aValue: double): iPIS;
begin
  Result:= Self;
  FValorIPIPorUnidade:= aValue;
end;

function TDelphiFiscalPIS.ValorPISPorUnidade: double;
begin
  Result:= FValorIPIPorUnidade;
end;

end.

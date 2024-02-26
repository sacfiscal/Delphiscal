unit DelphiFiscal.Calculos.IPI;

interface

uses
  DelphiFiscal.Controller.Interfaces,
  DelphiFiscal.Calculos.IPI.Interfaces;

type
  TDelphiFiscalIPI = class(TInterfacedObject, iIPI)
    private
      [weak]
      FParent : iController;
      FAliquotaIPI : double;
      FValorIPIPorUnidade : double;
      FQtdeIPITributada : double;
    public
      constructor create(Parent : iController);
      destructor destroy; override;
      class function New(Parent : iController) : iIPI;
      function AliquotaIPI(aValue : double) : iIPI; overload;
      function AliquotaIPI : double; overload;
      function ValorIPIPorUnidade(aValue : double) : iIPI; overload;
      function ValorIPIPorUnidade : double; overload;
      function QtdeIPITributada(aValue : double) : iIPI; overload;
      function QtdeIPITributada : double; overload;
      function &End : iController;
  end;
implementation

{ TDelphiFiscalIPI }

uses Delphiscal.Utils;

function TDelphiFiscalIPI.&End: iController;
begin
  Result:= FParent;
end;

function TDelphiFiscalIPI.AliquotaIPI(aValue: double): iIPI;
begin
  Result:= Self;
  FAliquotaIPI:= aValue;
end;

function TDelphiFiscalIPI.AliquotaIPI: double;
begin
  Result:= FAliquotaIPI;
end;

constructor TDelphiFiscalIPI.create(Parent: iController);
begin
  FParent:= Parent;
end;

destructor TDelphiFiscalIPI.destroy;
begin

  inherited;
end;

class function TDelphiFiscalIPI.New(Parent: iController): iIPI;
begin
  Result:= Self.create(Parent);
end;

function TDelphiFiscalIPI.QtdeIPITributada: double;
begin
  Result:= FQtdeIPITributada;
end;

function TDelphiFiscalIPI.QtdeIPITributada(aValue: double): iIPI;
begin
  Result:= Self;
  FQtdeIPITributada:= aValue;
end;

function TDelphiFiscalIPI.ValorIPIPorUnidade(aValue: double): iIPI;
begin
  Result:= Self;
  FValorIPIPorUnidade:= aValue;
end;

function TDelphiFiscalIPI.ValorIPIPorUnidade: double;
begin
  Result:= FValorIPIPorUnidade;
end;

end.

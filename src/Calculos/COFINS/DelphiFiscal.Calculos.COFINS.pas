unit DelphiFiscal.Calculos.COFINS;

interface

uses
  DelphiFiscal.Calculos.Interfaces;

type
  TDelphiFiscalCOFINS = class(TInterfacedObject, iCOFINS)
    private
      [weak]
      FParent : iCalculo;
      FAliquotaCOFIS : double;
      FValorIPIPorUnidade : double;
      FQtdeIPITributada : double;
    public
      constructor create(Parent : iCalculo);
      destructor destroy; override;
      class function New(Parent : iCalculo) : iCOFINS;
      function AliquotaCOFINS(aValue : double) : iCOFINS; overload;
      function AliquotaCOFINS : double; overload;
      function ValorCOFINSPorUnidade(aValue : double) : iCOFINS; overload;
      function ValorCOFINSPorUnidade : double; overload;
      function QtdeCOFINSTributada(aValue : double) : iCOFINS; overload;
      function QtdeCOFINSTributada : double; overload;
      function &End : iCalculo;
  end;
implementation

{ TDelphiFiscalCOFINS }

uses Delphiscal.Utils;

function TDelphiFiscalCOFINS.&End: iCalculo;
begin
  Result:= FParent;
end;

function TDelphiFiscalCOFINS.AliquotaCOFINS(aValue: double): iCOFINS;
begin
  Result:= Self;
  FAliquotaCOFIS:= aValue;
end;

function TDelphiFiscalCOFINS.AliquotaCOFINS: double;
begin
  Result:= FAliquotaCOFIS;
end;

constructor TDelphiFiscalCOFINS.create(Parent: iCalculo);
begin
  FParent:= Parent;
end;

destructor TDelphiFiscalCOFINS.destroy;
begin

  inherited;
end;

class function TDelphiFiscalCOFINS.New(Parent: iCalculo): iCOFINS;
begin
  Result:= Self.create(Parent);
end;

function TDelphiFiscalCOFINS.QtdeCOFINSTributada: double;
begin
  Result:= FQtdeIPITributada;
end;

function TDelphiFiscalCOFINS.QtdeCOFINSTributada(aValue: double): iCOFINS;
begin
  Result:= Self;
  FQtdeIPITributada:= aValue;
end;

function TDelphiFiscalCOFINS.ValorCOFINSPorUnidade(aValue: double): iCOFINS;
begin
  Result:= Self;
  FValorIPIPorUnidade:= aValue;
end;

function TDelphiFiscalCOFINS.ValorCOFINSPorUnidade: double;
begin
  Result:= FValorIPIPorUnidade;
end;

end.

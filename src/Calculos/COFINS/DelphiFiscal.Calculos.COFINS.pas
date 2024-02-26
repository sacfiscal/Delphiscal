unit DelphiFiscal.Calculos.COFINS;

interface

uses
  DelphiFiscal.Calculos.COFINS.Interfaces,
  DelphiFiscal.Controller.Interfaces;

type
  TDelphiFiscalCOFINS = class(TInterfacedObject, iCOFINS)
    private
      [weak]
      FParent : iController;
      FAliquotaCOFIS : double;
      FValorIPIPorUnidade : double;
      FQtdeIPITributada : double;
    public
      constructor create(Parent : iController);
      destructor destroy; override;
      class function New(Parent : iController) : iCOFINS;
      function AliquotaCOFINS(aValue : double) : iCOFINS; overload;
      function AliquotaCOFINS : double; overload;
      function ValorCOFINSPorUnidade(aValue : double) : iCOFINS; overload;
      function ValorCOFINSPorUnidade : double; overload;
      function QtdeCOFINSTributada(aValue : double) : iCOFINS; overload;
      function QtdeCOFINSTributada : double; overload;
      function &End : iController;
  end;
implementation

{ TDelphiFiscalCOFINS }

uses Delphiscal.Utils;

function TDelphiFiscalCOFINS.&End: iController;
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

constructor TDelphiFiscalCOFINS.create(Parent: iController);
begin
  FParent:= Parent;
end;

destructor TDelphiFiscalCOFINS.destroy;
begin

  inherited;
end;

class function TDelphiFiscalCOFINS.New(Parent: iController): iCOFINS;
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

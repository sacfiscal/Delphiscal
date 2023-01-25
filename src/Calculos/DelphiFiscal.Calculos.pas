unit DelphiFiscal.Calculos;

interface

uses
  DelphiFiscal.Calculos.Interfaces;

type
  TDelphiFiscalCalculos = class(TInterfacedObject, iCalculo)
    private
      FICSM : iICMS;
      FST : iST;
    public
      constructor create;
      destructor destroy; override;
      class function New : iCalculo;
      function ST : iST;
      function ICMS : iICMS;
  end;

implementation

uses
  DelphiFiscal.Calculos.ICMS,
  DelphiFiscal.Calculos.ST;

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

end.

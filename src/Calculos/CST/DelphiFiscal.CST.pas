unit DelphiFiscal.CST;

interface

uses
  DelphiFiscal.Calculos.Interfaces;

type
  TDelphiFiscalCST = class(TInterfacedObject, iCST)
    private
      [weak]
      FParent : iCalculo;
      FICMS00 : iICMS00;
      FICMS10 : iICMS10;
      FICMS20 : iICMS20;
      FICMS30 : iICMS30;
      FICMS51 : iICMS51;
      FICMS70 : iICMS70;
    public
      constructor create(Parent : iCalculo);
      destructor destroy; override;
      class function New(Parent : iCalculo) : iCST;
      function &End : iCalculo;
      function ICMS00 : iICMS00;
      function ICMS10 : iICMS10;
      function ICMS20 : iICMS20;
      function ICMS30 : iICMS30;
      function ICMS51 : iICMS51;
      function ICMS70 : iICMS70;
  end;

implementation

uses
  DelphiFiscal.Impostos.CST.ICMS00,
  DelphiFiscal.Impostos.CST.ICMS10,
  DelphiFiscal.Impostos.CST.ICMS20,
  DelphiFiscal.Impostos.CST.ICMS30,
  DelphiFiscal.Impostos.CST.ICMS51,
  DelphiFiscal.Impostos.CST.ICMS70;

{ TDelphiFiscalCST }

function TDelphiFiscalCST.&End: iCalculo;
begin
  Result:= FParent;
end;

function TDelphiFiscalCST.ICMS00: iICMS00;
begin
  if not Assigned(FICMS00) then
    FICMS00:= TICMS00.New(self);

  Result:= FICMS00;
end;

function TDelphiFiscalCST.ICMS10: iICMS10;
begin
  if not Assigned(FICMS10) then
    FICMS10:= TICMS10.New(self);

  Result:= FICMS10;
end;

function TDelphiFiscalCST.ICMS20: iICMS20;
begin
  if not Assigned(FICMS20) then
    FICMS20:= TICMS20.New(self);

  Result:= FICMS20;
end;

function TDelphiFiscalCST.ICMS30: iICMS30;
begin
  if not Assigned(FICMS30) then
    FICMS30:= TICMS30.New(self);

  Result:= FICMS30;
end;

function TDelphiFiscalCST.ICMS51: iICMS51;
begin
  if not Assigned(FICMS51) then
    FICMS51:= TICMS51.New(self);

  Result:= FICMS51;
end;

function TDelphiFiscalCST.ICMS70: iICMS70;
begin
  if not Assigned(FICMS70) then
    FICMS70:= TICMS70.New(self);

  Result:= FICMS70;
end;

constructor TDelphiFiscalCST.create(Parent : iCalculo);
begin
  FParent:= Parent;
end;

destructor TDelphiFiscalCST.destroy;
begin

  inherited;
end;

class function TDelphiFiscalCST.New(Parent : iCalculo) : iCST;
begin
  Result:= Self.create(Parent);
end;

end.

unit DelphiFiscal.CST;

interface

uses
  DelphiFiscal.CST.Interfaces,
  DelphiFiscal.Controller.Interfaces;


type
  TDelphiFiscalCST = class(TInterfacedObject, iCST)
    private
      [weak]
      FParent : iController;
      FICMS00 : iICMS00;
      FICMS10 : iICMS10;
      FICMS20 : iICMS20;
      FICMS30 : iICMS30;
      FICMS51 : iICMS51;
      FICMS70 : iICMS70;
      FICMS101 : iICMS101;
      FICMS201 : iICMS201;
      FICMS202 : iICMS202;
      FICMS203 : iICMS203;
      FIPI50 : iIPI50;
      FPIS01 : iPIS01;
      FPIS02 : iPIS02;
      FPIS03 : iPIS03;
      FCOFINS01 : iCOFINS01;
      FCOFINS02 : iCOFINS02;
      FCOFINS03 : iCOFINS03;
    public
      constructor create(Parent : iController);
      destructor destroy; override;
      class function New(Parent : iController) : iCST;
      function ICMS00 : iICMS00;
      function ICMS10 : iICMS10;
      function ICMS20 : iICMS20;
      function ICMS30 : iICMS30;
      function ICMS51 : iICMS51;
      function ICMS70 : iICMS70;
      function ICMS101 : iICMS101;
      function ICMS201 : iICMS201;
      function ICMS202 : iICMS202;
      function ICMS203 : iICMS203;
      function IPI50: iIPI50;
      function PIS01: iPIS01;
      function PIS02: iPIS02;
      function PIS03: iPIS03;
      function COFINS01: iCOFINS01;
      function COFINS02: iCOFINS02;
      function COFINS03: iCOFINS03;
      function &End : iController;
  end;

implementation

uses
  DelphiFiscal.Impostos.CST.ICMS00,
  DelphiFiscal.Impostos.CST.ICMS10,
  DelphiFiscal.Impostos.CST.ICMS20,
  DelphiFiscal.Impostos.CST.ICMS30,
  DelphiFiscal.Impostos.CST.ICMS51,
  DelphiFiscal.Impostos.CST.ICMS70,
  DelphiFiscal.Impostos.CST.ICMS101,
  DelphiFiscal.Impostos.CST.ICMS201,
  DelphiFiscal.Impostos.CST.ICMS202,
  DelphiFiscal.Impostos.CST.ICMS203,
  DelphiFiscal.Impostos.CST.IPI50,
  DelphiFiscal.Impostos.CST.PIS01,
  DelphiFiscal.Impostos.CST.PIS02,
  DelphiFiscal.Impostos.CST.PIS03,
  DelphiFiscal.Impostos.CST.COFINS01,
  DelphiFiscal.Impostos.CST.COFINS02,
  DelphiFiscal.Impostos.CST.COFINS03;

{ TDelphiFiscalCST }

function TDelphiFiscalCST.&End: iController;
begin
  Result:= FParent;
end;

function TDelphiFiscalCST.ICMS00: iICMS00;
begin
  if not Assigned(FICMS00) then
    FICMS00:= TICMS00.New(FParent);

  Result:= FICMS00;
end;

function TDelphiFiscalCST.ICMS10: iICMS10;
begin
  if not Assigned(FICMS10) then
    FICMS10:= TICMS10.New(FParent);

  Result:= FICMS10;
end;

function TDelphiFiscalCST.ICMS101: iICMS101;
begin
  if not Assigned(FICMS101) then
    FICMS101:= TICMS101.New(FParent);

  Result:= FICMS101;
end;

function TDelphiFiscalCST.ICMS20: iICMS20;
begin
  if not Assigned(FICMS20) then
    FICMS20:= TICMS20.New(FParent);

  Result:= FICMS20;
end;

function TDelphiFiscalCST.ICMS201: iICMS201;
begin
  if not Assigned(FICMS201) then
    FICMS201:= TICMS201.New(FParent);

  Result:= FICMS201;
end;

function TDelphiFiscalCST.ICMS202: iICMS202;
begin
  if not Assigned(FICMS202) then
    FICMS202:= TICMS202.New(FParent);

  Result:= FICMS202;
end;

function TDelphiFiscalCST.ICMS203: iICMS203;
begin
  if not Assigned(FICMS203) then
    FICMS203:= TICMS203.New(FParent);

  Result:= FICMS203;
end;

function TDelphiFiscalCST.ICMS30: iICMS30;
begin
  if not Assigned(FICMS30) then
    FICMS30:= TICMS30.New(FParent);

  Result:= FICMS30;
end;

function TDelphiFiscalCST.ICMS51: iICMS51;
begin
  if not Assigned(FICMS51) then
    FICMS51:= TICMS51.New(FParent);

  Result:= FICMS51;
end;

function TDelphiFiscalCST.ICMS70: iICMS70;
begin
  if not Assigned(FICMS70) then
    FICMS70:= TICMS70.New(FParent);

  Result:= FICMS70;
end;

function TDelphiFiscalCST.PIS01: iPIS01;
begin
  if not Assigned(FPIS01) then
    FPIS01:= TPIS01.New(FParent);

  Result:= FPIS01;
end;

function TDelphiFiscalCST.PIS02: iPIS02;
begin
  if not Assigned(FPIS02) then
    FPIS02:= TPIS02.New(FParent);

  Result:= FPIS02;
end;

function TDelphiFiscalCST.PIS03: iPIS03;
begin
  if not Assigned(FPIS03) then
    FPIS03:= TPIS03.New(FParent);

  Result:= FPIS03;
end;

function TDelphiFiscalCST.IPI50: iIPI50;
begin
  if not Assigned(FIPI50) then
    FIPI50:= TIPI50.New(FParent);

  Result:= FIPI50;
end;

function TDelphiFiscalCST.COFINS02: iCOFINS02;
begin
  if not Assigned(FCOFINS02) then
    FCOFINS02:= TCOFINS02.New(FParent);

  Result:= FCOFINS02;
end;

function TDelphiFiscalCST.COFINS03: iCOFINS03;
begin
  if not Assigned(FCOFINS03) then
    FCOFINS03:= TCOFINS03.New(FParent);

  Result:= FCOFINS03;
end;

function TDelphiFiscalCST.COFINS01: iCOFINS01;
begin
  if not Assigned(FCOFINS01) then
    FCOFINS01:= TCOFINS01.New(FParent);

  Result:= FCOFINS01;
end;

constructor TDelphiFiscalCST.create(Parent : iController);
begin
  FParent:= Parent;
end;

destructor TDelphiFiscalCST.destroy;
begin

  inherited;
end;

class function TDelphiFiscalCST.New(Parent : iController) : iCST;
begin
  Result:= Self.create(Parent);
end;


end.

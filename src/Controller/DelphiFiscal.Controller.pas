unit DelphiFiscal.Controller;

interface

uses
  DelphiFiscal.Calculos.ST.Interfaces,
  DelphiFiscal.Controller.Interfaces,
  DelphiFiscal.Base.Interfaces,
  DelphiFiscal.Calculos.PIS.Intefaces,
  DelphiFiscal.Calculos.COFINS.Interfaces,
  DelphiFiscal.Calculos.IPI.Interfaces,
  DelphiFiscal.CST.Interfaces,
  DelphiFiscal.Calculos.ICMS.interfaces, DelphiFiscal.Base;

type
  TController = class(TInterfacedObject, iController)
   private
     FBase : iBase;
     FST : iST;
     FPIS : iPIS;
     FCofins : iCofins;
     FIPI : iIPI;
     FCST : iCST;
     FICMS : iICMS;
   public
     constructor Create;
     destructor Destroy; override;
     class function New : iController;

     function Base : iBase;
     function ST : iST;
     function PIS : iPIS;
     function Cofins : iCofins;
     function IPI : iIPI;
     function CST : iCST;
     function ICMS : iICMS;
  end;

implementation

uses
  DelphiFiscal.Calculos.ST,
  DelphiFiscal.Calculos.PIS,
  DelphiFiscal.Calculos.COFINS,
  DelphiFiscal.Calculos.IPI,
  DelphiFiscal.Calculos.ICMS,
  DelphiFiscal.CST;

{ TController }

function TController.Base: iBase;
begin
  if not Assigned(FBase) then
    FBase:= TDelphiFiscalBase.New(Self);

  Result:= FBase;
end;

function TController.Cofins: iCofins;
begin
  if not Assigned(FCofins) then
    FCofins:= TDelphiFiscalCOFINS.New(Self);

  Result:= FCofins;
end;

constructor TController.Create;
begin

end;

function TController.CST: iCST;
begin
  if not Assigned(FCST) then
    FCST:= TDelphiFiscalCST.New(Self);

  Result:= FCST;
end;

destructor TController.Destroy;
begin

  inherited;
end;

function TController.ICMS: iICMS;
begin
  if not Assigned(FICMS) then
    FICMS:= TDelphiFiscalICMS.New(self);

  Result:= FICMS;
end;

function TController.IPI: iIPI;
begin
  if not Assigned(FIPI) then
    FIPI:= TDelphiFiscalIPI.New(self);

  Result:= FIPI;
end;

class function TController.New: iController;
begin
  Result:= Self.Create;
end;

function TController.PIS: iPIS;
begin
  if not Assigned(FPIS) then
    FPIS:= TDelphiFiscalPIS.New(Self);

  Result:= FPIS;
end;

function TController.ST: iST;
begin
  if not Assigned(FST) then
    FST:= TDelphiFiscalST.New(Self);

  Result:= FST;
end;

end.

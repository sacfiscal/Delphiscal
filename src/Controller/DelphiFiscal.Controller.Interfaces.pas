unit DelphiFiscal.Controller.Interfaces;

interface

uses
  DelphiFiscal.Base.Interfaces,
  DelphiFiscal.Calculos.ST.Interfaces,
  DelphiFiscal.Calculos.PIS.Intefaces,
  DelphiFiscal.Calculos.COFINS.Interfaces,
  DelphiFiscal.Calculos.IPI.Interfaces,
  DelphiFiscal.CST.Interfaces,
  DelphiFiscal.Calculos.ICMS.interfaces;

type
  iController = interface
   ['{7C19E5B6-36C2-40F5-AD08-05D250A0B3EA}']
   function Base : iBase;
   function ST : iST;
   function PIS : iPIS;
   function Cofins : iCofins;
   function IPI : iIPI;
   function CST : iCST;
   function ICMS : iICMS;
  end;

implementation

end.

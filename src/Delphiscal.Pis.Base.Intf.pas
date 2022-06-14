unit Delphiscal.Pis.Base.Intf;

interface

uses
  Delphiscal.Attributes.Intf;

type
  IPisBase = interface
    ['{93F70043-FB5E-42BC-9A8A-519E2680914C}']
    function Attributes : IAttributes<IPisBase>;
    function CalcularBasePis: Double;
  end;

implementation

end.

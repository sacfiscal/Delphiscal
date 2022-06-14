unit Delphiscal.Pis01_02.Intf;

interface

uses
  Delphiscal.Attributes.Intf;

type
  IPis01_02 = interface
    ['{A5FBE3EC-9083-49A1-A263-529E9967DB0B}']
    function Attributes : IAttributes<IPis01_02>;
    function BasePis: Double;
    function ValorPis: Double;
  end;

implementation

end.

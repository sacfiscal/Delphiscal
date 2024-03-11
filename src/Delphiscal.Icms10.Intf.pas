unit Delphiscal.Icms10.Intf;

interface

type
  IIcms10 = interface
    [ '{DFD62780-2371-458E-A061-6714FBC4E08B}' ]
    function ValorBaseIcmsProprio: Double;
    function ValorIcmsProprio: Double;
    function ValorBaseIcmsST: Double;
    function ValorIcmsST: Double;
    function ValorIcmsSTDesonerado: Double;
    function ValorBaseFCP : double;
    function ValorFCP : double;
    function ValorBaseFCPST : double;
    function ValorFCPST : double;
  end;

implementation

end.

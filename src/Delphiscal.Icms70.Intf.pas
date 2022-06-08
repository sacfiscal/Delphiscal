unit Delphiscal.Icms70.Intf;

interface

type
  IIcms70 = interface
    ['{D06DEF24-9FAD-4962-A059-60E0598E7804}']
    function ValorBaseReduzidaIcmsProprio: Double;
    function ValorIcmsProprio: Double;
    function ValorBaseIcmsST: Double;
    function ValorIcmsST: Double;
    function ValorIcmsDesonerado: Double;
    function ValorIcmsSTDesonerado(const AValorIcmsStNormal: Double): Double;
  end;

implementation

end.

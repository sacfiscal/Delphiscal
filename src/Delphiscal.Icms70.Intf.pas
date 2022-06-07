unit Delphiscal.Icms70.Intf;

interface

type
  IIcms70 = interface
    ['{D06DEF24-9FAD-4962-A059-60E0598E7804}']
    function ValorBaseReduzidaIcmsProprio: Currency;
    function ValorIcmsProprio: Currency;
    function ValorBaseIcmsST: Currency;
    function ValorIcmsST: Currency;
    function ValorIcmsDesonerado: Currency;
    function ValorIcmsSTDesonerado(const AValorIcmsStNormal: Currency): Currency;
  end;

implementation

end.

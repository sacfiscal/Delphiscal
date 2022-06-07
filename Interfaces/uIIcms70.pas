unit uIIcms70;

interface
type
  IIcms70 = interface
  ['{D06DEF24-9FAD-4962-A059-60E0598E7804}']
    function ValorBaseReduzidaIcmsProprio: currency;
    function ValorIcmsProprio: currency;
    function ValorBaseIcmsST: currency;
    function ValorIcmsST: currency;
    function ValorIcmsDesonerado: currency;
    function ValorIcmsSTDesonerado(valorIcmsSTNormal: currency): currency;

  end;

implementation

end.

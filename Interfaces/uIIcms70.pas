unit uIIcms70;

interface
type
  IIcms70 = interface
    function ValorBaseReduzidaIcmsProprio: currency;
    function ValorIcmsProprio: currency;
    function ValorBaseIcmsST: currency;
    function ValorIcmsST: currency;
    function ValorIcmsDesonerado: currency;
    function ValorIcmsSTDesonerado(valorIcmsSTNormal: currency): currency;

  end;

implementation

end.

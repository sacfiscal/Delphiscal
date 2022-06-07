unit Delphiscal.Icms10.Intf;

interface

type
  IIcms10 = interface
    ['{DFD62780-2371-458E-A061-6714FBC4E08B}']
    function ValorBaseIcmsProprio: Currency;
    function ValorIcmsProprio: Currency;
    function ValorBaseIcmsST: Currency;
    function ValorIcmsST: Currency;
    function ValorIcmsSTDesonerado: Currency;
  end;

implementation

end.

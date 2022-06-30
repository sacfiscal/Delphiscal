unit Delphiscal.Icms30.Intf;

interface

type
  IIcms30 = interface
    ['{191D4165-AE68-468A-9015-08F6C0FC8503}']
    function ValorBaseIcmsProprio: Double;
    function ValorIcmsProprio: Double;
    function ValorBaseIcmsST: Double;
    function ValorIcmsST: Double;
    function ValorIcmsDesonerado: Double;
  end;

implementation

end.

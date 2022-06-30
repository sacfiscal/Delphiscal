unit Delphiscal.Icms51.Intf;

interface

type
  IIcms51 = interface
    ['{63EF20FC-96C0-4354-BB43-874B524FF009}']
    function BaseIcmsProprio: Double;
    function ValorIcmsOperacao: Double;
    function ValorIcmsDiferido: Double;
    function ValorIcmsProprio: Double;
  end;

implementation

end.

unit Delphiscal.Icms202_203.Intf;

interface

type
  IIcms202_203 = interface
    ['{5221F36A-B657-4298-ADEA-FC9C358C9319}']
    function ValorBaseIcmsProprio: Currency;
    function ValorIcmsProprio: Currency;
    function ValorBaseIcmsST: Currency;
    function ValorIcmsST: Currency;
  end;

implementation

end.

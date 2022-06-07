unit Delphiscal.Icms201.Intf;

interface

type
  IIcms201 = interface
    ['{0196CBA6-7C59-4217-A22A-0AF2D1D3EACD}']
    function ValorBaseIcmsProprio: Currency;
    function ValorIcmsProprio: Currency;
    function ValorBaseIcmsST: Currency;
    function ValorIcmsST: Currency;
    function ValorCreditoSN: Currency;
  end;

implementation

end.

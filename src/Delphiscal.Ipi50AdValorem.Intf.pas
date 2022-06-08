unit Delphiscal.Ipi50AdValorem.Intf;

interface

type
  IIpi50AdValorem = interface
    [ '{76DDBDAB-3DEF-40D6-BC75-95E2C9A73AC4}' ]
    function GetBaseIpi: Currency;
    function GetValorIpi: Currency;

    property BaseIpi: Currency read GetBaseIpi;
    property ValorIpi: Currency read GetValorIpi;
  end;

implementation

end.

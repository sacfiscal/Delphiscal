unit Delphiscal.Ipi50Especifico.Intf;

interface

type
  IIpi50Especifico = interface
    ['{8303D85A-F87E-41E2-B31A-3AA54870FCB7}']
    function GetValorIpi: Currency;

    property ValorIpi: Currency read GetValorIpi;
  end;

implementation

end.

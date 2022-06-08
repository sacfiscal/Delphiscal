unit Delphiscal.Pis03.Intf;

interface

type
  IPis03 = interface
    [ '{1C5C8D63-9BDF-4813-B1E0-16278E459F57}' ]
    function GetValorPis: Currency;

    property ValorPis: Currency read GetValorPis;
  end;

implementation

end.

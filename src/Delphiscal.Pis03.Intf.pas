unit Delphiscal.Pis03.Intf;

interface

type
  IPis03 = interface
    [ '{1C5C8D63-9BDF-4813-B1E0-16278E459F57}' ]
    function ValorPis: Double;
    function QuantidadeTributada(const AValue: Double): IPis03;
    function ValorPorUnidadeTributada(const AValue: Double): IPis03;
  end;

implementation

end.

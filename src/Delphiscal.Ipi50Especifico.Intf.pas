unit Delphiscal.Ipi50Especifico.Intf;

interface

type
  IIpi50Especifico = interface
    ['{8303D85A-F87E-41E2-B31A-3AA54870FCB7}']
    function ValorIpi: Double;
    function QuantidadeTributada(const AValue: Double): IIpi50Especifico;
    function ValorPorUnidadeTributada(const AValue: Double): IIpi50Especifico;
  end;

implementation

end.

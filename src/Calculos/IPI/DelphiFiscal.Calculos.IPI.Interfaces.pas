unit DelphiFiscal.Calculos.IPI.Interfaces;

interface

type
  iIPI = interface
    ['{CDDA0893-A68C-47D7-B843-07645B56D36D}']
    function AliquotaIPI(aValue : double) : iIPI; overload;
    function AliquotaIPI : double; overload;
    function ValorIPIPorUnidade(aValue : double) : iIPI; overload;
    function ValorIPIPorUnidade : double; overload;
    function QtdeIPITributada(aValue : double) : iIPI; overload;
    function QtdeIPITributada : double; overload;
  end;

implementation

end.

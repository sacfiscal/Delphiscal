unit DelphiFiscal.Calculos.PIS.Intefaces;

interface

type
  iPIS = interface
    ['{8FC6C2EA-4A1D-43AB-A55D-631E05C39145}']
    function AliquotaPIS(aValue : double) : iPIS; overload;
    function AliquotaPIS : double; overload;
    function ValorPISPorUnidade(aValue : double) : iPIS; overload;
    function ValorPISPorUnidade : double; overload;
    function QtdePISTributada(aValue : double) : iPIS; overload;
    function QtdePISTributada : double; overload;
  end;

implementation

end.

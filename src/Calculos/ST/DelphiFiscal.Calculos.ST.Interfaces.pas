unit DelphiFiscal.Calculos.ST.Interfaces;

interface

type
  iST = interface
    ['{CADDC667-BDE5-4197-AA5B-1D892268ED2A}']
    function AliquotaICMSST(aValue : double) : iST; overload;
    function AliquotaICMSST : double; overload;
    function PercentualReducaoBaseICMSST(aValue : double) : iST;
    function PercentualMVA(aValue : double) : iST;
    function BaseICMSST : double;
    function BaseICMSSTCST : double;
    function ValorICMSSTProprio : double;
    function ValorICMSST : double;
  end;

implementation

end.

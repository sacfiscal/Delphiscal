unit DelphiFiscal.Calculos.COFINS.Interfaces;

interface

type
  iCOFINS = interface
    ['{8FC6C2EA-4A1D-43AB-A55D-631E05C39145}']
    function AliquotaCOFINS(aValue : double) : iCOFINS; overload;
    function AliquotaCOFINS : double; overload;
    function ValorCOFINSPorUnidade(aValue : double) : iCOFINS; overload;
    function ValorCOFINSPorUnidade : double; overload;
    function QtdeCOFINSTributada(aValue : double) : iCOFINS; overload;
    function QtdeCOFINSTributada : double; overload;
  end;

implementation

end.

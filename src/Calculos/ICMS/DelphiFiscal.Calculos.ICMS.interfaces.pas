unit DelphiFiscal.Calculos.ICMS.interfaces;

interface

type
  iICMS = interface
    ['{3995FD99-145B-4F99-8E95-2172ED50248A}']
    function ValorIPI(aValue : double) : iICMS; overload;
    function ValorIPI : double; overload;
    function PercentualReducao(aValue : double) : iICMS;
    function PercentualDiferimento(aValue : double) : iICMS; overload;
    function PercentualDiferimento : double; overload;
    function AliquotaICMS(aValue : double) : iICMS; overload;
    function AliquotaICMS : Double; overload;
    function PercentualCreditoICMSSN(aValue : double) : iICMS; overload;
    function PercentualCreditoICMSSN : double; overload;
    function ContemReducao(aValue : boolean) : iICMS; overload;
    function ContemReducao : boolean; overload;
    function BaseICMSProprio : double;
    function BaseICMSNormal : double;
    function BaseICMSReduzido : double;
    function ValorICMS : Double;
    function ValorICMSProprio : double;
  end;

implementation

end.

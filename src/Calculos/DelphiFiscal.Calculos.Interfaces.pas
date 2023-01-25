unit DelphiFiscal.Calculos.Interfaces;

interface

type
  iST = interface;
  iICMS = interface;
  iCST = interface;
  iICMS00 = interface;
  iICMS10 = interface;
  iICMS20 = interface;
  iICMS51 = interface;
  iICMS30 = interface;
  iICMS70 = interface;

  iCalculo = interface
    ['{15AE0E74-C00A-41BC-8D42-ED45CE6D957B}']
    function ST : iST;
    function ICMS : iICMS;
  end;

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
    function &End : iCalculo;
  end;

  iICMS = interface
    ['{3995FD99-145B-4F99-8E95-2172ED50248A}']
    function CST : iCST;
    function ValorProduto(aValue : double) : iICMS;
    function ValorFrete(aValue : double) : iICMS;
    function ValorSeguro(aValue : double) : iICMS;
    function ValorDespesasAcessorias(aValue : double) : iICMS;
    function ValorIPI(aValue : double) : iICMS; overload;
    function ValorIPI : double; overload;
    function ValorDescontos(aValue : double) : iICMS;
    function PercentualReducao(aValue : double) : iICMS;
    function PercentualDiferimento(aValue : double) : iICMS; overload;
    function PercentualDiferimento : double; overload;
    function AliquotaICMS(aValue : double) : iICMS; overload;
    function AliquotaICMS : Double; overload;
    function ContemReducao(aValue : boolean) : iICMS; overload;
    function ContemReducao : boolean; overload;
    function BaseICMSProprio : double;
    function BaseICMSNormal : double;
    function BaseICMSReduzido : double;
    function ValorICMS : Double;
    function ValorICMSProprio : double;
    function &End : iCalculo;
  end;

  iCST = interface
    ['{1C99705A-9279-4E2D-923D-909F46F52C09}']
    function ICMS00 : iICMS00;
    function ICMS10 : iICMS10;
    function ICMS20 : iICMS20;
    function ICMS30 : iICMS30;
    function ICMS51 : iICMS51;
    function ICMS70 : iICMS70;
    function &End : iCalculo;
  end;

  iICMS00 = interface
    ['{D9FBD4DD-D640-4A7F-BFED-E60C921A357F}']
    function BaseICMSProprio : double;
    function ValorICMSProprio : double;
    Function &End : iCST;
  end;

  iICMS10 = interface
    ['{12C3E9A1-48C5-46B8-9422-25C120376564}']
    function ValorBaseIcmsProprio: Double;
    function ValorIcmsProprio: Double;
    function ValorBaseIcmsST: Double;
    function ValorIcmsST: Double;
    function ValorIcmsSTDesonerado: Double;
    Function &End : iCST;
  end;

  iICMS20 = interface
    ['{82A4F07F-0396-49C5-99E0-77765B7EE081}']
    function BaseICMSProprio : double;
    function ValorICMSProprio : double;
    function ValorICMSDesonerado : double;
    function ValorICMSReduzido : double;
    Function &End : iCST;
  end;

  iICMS30 = interface
    ['{27FD32AE-E2DA-4C37-93C7-C6BE65B4C8CB}']
    function ValorBaseIcmsProprio: Double;
    function ValorIcmsProprio: Double;
    function ValorBaseIcmsST: Double;
    function ValorIcmsST: Double;
    function ValorIcmsDesonerado: Double;
    Function &End : iCST;
  end;

  iICMS51 = interface
    ['{75826AA1-CB05-4819-BA39-AEA73886AA90}']
    function BaseICMSProprio : double;
    function ValorICMSOperacao : double;
    function ValorICMSDiferido : double;
    function ValorICMSProprio : double;
    Function &End : iCST;
  end;

  iICMS70 = interface
    ['{A5D9D047-AA83-4C56-9434-901F489A1EEB}']
    function ValorBaseReduzidaIcmsProprio: Double;
    function ValorIcmsProprio: Double;
    function ValorBaseIcmsST: Double;
    function ValorIcmsST: Double;
    function ValorIcmsDesonerado: Double;
    function ValorIcmsSTDesonerado : Double;
    Function &End : iCST;
  end;

implementation

end.

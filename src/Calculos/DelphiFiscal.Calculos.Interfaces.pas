unit DelphiFiscal.Calculos.Interfaces;

interface

type
  iST = interface;
  iICMS = interface;
  iCST = interface;
  iIPI = interface;
  iICMS00 = interface;
  iICMS10 = interface;
  iICMS20 = interface;
  iICMS51 = interface;
  iICMS30 = interface;
  iICMS70 = interface;
  iICMS101 = interface;
  iICMS201 = interface;
  iICMS202 = interface;
  iICMS203 = interface;
  iIPI50 = interface;

  iCalculo = interface
    ['{15AE0E74-C00A-41BC-8D42-ED45CE6D957B}']
    function ValorProduto(aValue : double) : iCalculo; overload;
    function ValorProduto : double; overload;
    function ValorFrete(aValue : double) : iCalculo; overload;
    function ValorFrete : double; overload;
    function ValorSeguro(aValue : double) : iCalculo; overload;
    function ValorSeguro : double; overload;
    function ValorDespesasAcessorias(aValue : double) : iCalculo; overload;
    function ValorDespesasAcessorias : double; overload;
    function ST : iST;
    function ICMS : iICMS;
    function IPI : iIPI;
  end;

  iIPI = interface
    ['{CDDA0893-A68C-47D7-B843-07645B56D36D}']
    function AliquotaIPI(aValue : double) : iIPI; overload;
    function AliquotaIPI : double; overload;
    function ValorIPIPorUnidade(aValue : double) : iIPI; overload;
    function ValorIPIPorUnidade : double; overload;
    function QtdeIPITributada(aValue : double) : iIPI; overload;
    function QtdeIPITributada : double; overload;
    function &End : iCalculo;
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
    function ValorIPI(aValue : double) : iICMS; overload;
    function ValorIPI : double; overload;
    function ValorDescontos(aValue : double) : iICMS;
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
    function ICMS101 : iICMS101;
    function ICMS201 : iICMS201;
    function ICMS202 : iICMS202;
    function ICMS203 : iICMS203;
    function IPI50 : iIPI50;
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

  iICMS101 = interface
    ['{E94DE381-C6C3-4387-AAE8-F0B48B40CB46}']
    function BaseCreditoSN: Double;
    function ValorCreditoSN: Double;
    Function &End : iCST;
  end;

  iICMS201 = interface
    ['{BAD353D6-EF40-489D-B9C0-D95F3C4B701B}']
    function BaseCreditoSN: Double;
    function ValorCreditoSN: Double;
    function ValorBaseIcmsProprio: Double;
    function ValorIcmsProprio: Double;
    function ValorBaseIcmsST: Double;
    function ValorIcmsST: Double;
    Function &End : iCST;
  end;

  iICMS202 = interface
    ['{C54D7F22-F573-4E6E-A80F-71344F49FC29}']
    function ValorBaseIcmsProprio: Double;
    function ValorIcmsProprio: Double;
    function ValorBaseIcmsST: Double;
    function ValorIcmsST: Double;
    Function &End : iCST;
  end;

  iICMS203 = interface
    ['{1D0F2F00-E93D-40CF-A0B9-E45744E65486}']
    function ValorBaseIcmsProprio: Double;
    function ValorIcmsProprio: Double;
    function ValorBaseIcmsST: Double;
    function ValorIcmsST: Double;
    Function &End : iCST;
  end;

  iIPI50 = interface
    ['{24BB6486-20AB-4AE1-B932-C753CEF023FB}']
    function BaseIpi: Double;
    function ValorIpi: Double;
    function ValorIpiEspecifico: Double;
  end;

implementation

end.

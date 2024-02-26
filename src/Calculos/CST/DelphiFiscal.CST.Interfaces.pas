unit DelphiFiscal.CST.Interfaces;

interface

type
  iCST = interface;
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
  iPIS01 = interface;
  iPIS02 = interface;
  iPIS03 = interface;
  iCOFINS01 = interface;
  iCOFINS02 = interface;
  iCOFINS03 = interface;

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
    function PIS01 : iPIS01;
    function PIS02 : iPIS02;
    function PIS03 : iPIS03;
    function COFINS01 : iCOFINS01;
    function COFINS02 : iCOFINS02;
    function COFINS03 : iCOFINS03;
  end;

  iICMS00 = interface
    ['{D9FBD4DD-D640-4A7F-BFED-E60C921A357F}']
    function BaseICMSProprio : double;
    function ValorICMSProprio : double;
  end;

  iICMS10 = interface
    ['{12C3E9A1-48C5-46B8-9422-25C120376564}']
    function ValorBaseIcmsProprio: Double;
    function ValorIcmsProprio: Double;
    function ValorBaseIcmsST: Double;
    function ValorIcmsST: Double;
    function ValorIcmsSTDesonerado: Double;
  end;

  iICMS20 = interface
    ['{82A4F07F-0396-49C5-99E0-77765B7EE081}']
    function BaseICMSProprio : double;
    function ValorICMSProprio : double;
    function ValorICMSDesonerado : double;
    function ValorICMSReduzido : double;
  end;

  iICMS30 = interface
    ['{27FD32AE-E2DA-4C37-93C7-C6BE65B4C8CB}']
    function ValorBaseIcmsProprio: Double;
    function ValorIcmsProprio: Double;
    function ValorBaseIcmsST: Double;
    function ValorIcmsST: Double;
    function ValorIcmsDesonerado: Double;
  end;

  iICMS51 = interface
    ['{75826AA1-CB05-4819-BA39-AEA73886AA90}']
    function BaseICMSProprio : double;
    function ValorICMSOperacao : double;
    function ValorICMSDiferido : double;
    function ValorICMSProprio : double;
  end;

  iICMS70 = interface
    ['{A5D9D047-AA83-4C56-9434-901F489A1EEB}']
    function ValorBaseReduzidaIcmsProprio: Double;
    function ValorIcmsProprio: Double;
    function ValorBaseIcmsST: Double;
    function ValorIcmsST: Double;
    function ValorIcmsDesonerado: Double;
    function ValorIcmsSTDesonerado : Double;
  end;

  iICMS101 = interface
    ['{E94DE381-C6C3-4387-AAE8-F0B48B40CB46}']
    function BaseCreditoSN: Double;
    function ValorCreditoSN: Double;
  end;

  iICMS201 = interface
    ['{BAD353D6-EF40-489D-B9C0-D95F3C4B701B}']
    function BaseCreditoSN: Double;
    function ValorCreditoSN: Double;
    function ValorBaseIcmsProprio: Double;
    function ValorIcmsProprio: Double;
    function ValorBaseIcmsST: Double;
    function ValorIcmsST: Double;
  end;

  iICMS202 = interface
    ['{C54D7F22-F573-4E6E-A80F-71344F49FC29}']
    function ValorBaseIcmsProprio: Double;
    function ValorIcmsProprio: Double;
    function ValorBaseIcmsST: Double;
    function ValorIcmsST: Double;
  end;

  iICMS203 = interface
    ['{1D0F2F00-E93D-40CF-A0B9-E45744E65486}']
    function ValorBaseIcmsProprio: Double;
    function ValorIcmsProprio: Double;
    function ValorBaseIcmsST: Double;
    function ValorIcmsST: Double;
  end;

  iIPI50 = interface
    ['{97A056A1-1778-48C8-85D3-BC5F6205FD3F}']
    function BaseIpi: Double;
    function ValorIpi: Double;
    function ValorIpiEspecifico: Double;
  end;

  iPIS01 = interface
    ['{9214FC95-C7D5-49E2-9218-AA55C237B9F5}']
    function BasePis: Double;
    function ValorPis: Double;
    function ValorPisEspecifico: Double;
  end;

  iPIS02 = interface
    ['{75A2EBF0-EFE9-4070-B6F7-D39617241D88}']
    function BasePis: Double;
    function ValorPis: Double;
    function ValorPisEspecifico: Double;
  end;

  iPIS03 = interface
    ['{3E365284-F553-47ED-817D-E15799CFDC02}']
    function BasePis: Double;
    function ValorPis: Double;
    function ValorPisEspecifico: Double;
  end;

  iCOFINS01 = interface
    ['{1902D2F2-2A8F-442D-9127-8294C96D89CD}']
    function BaseCofins: Double;
    function ValorCofins: Double;
    function ValorCofinsEspecifico: Double;
  end;

  iCOFINS02 = interface
    ['{4A8EF1EA-C2AB-449E-BEFC-F95BDA10DC95}']
    function BaseCofins: Double;
    function ValorCofins: Double;
    function ValorCofinsEspecifico: Double;
  end;

  iCOFINS03 = interface
    ['{C85A50D8-A8D6-4DC4-B120-9A7483AC95ED}']
    function BaseCofins: Double;
    function ValorCofins: Double;
    function ValorCofinsEspecifico: Double;
  end;
implementation

end.

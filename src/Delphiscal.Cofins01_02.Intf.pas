unit Delphiscal.Cofins01_02.Intf;

interface

type
  ICofins01_02 = interface
    [ '{0AA2120A-D209-49CD-90FA-6802F380459C}' ]

    function GetBaseCofins: Currency;
    function GetValorCofins: Currency;

    property BaseCofins: Currency read GetBaseCofins;
    property ValorCofins: Currency read GetValorCofins;
  end;

implementation

end.

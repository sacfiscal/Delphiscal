unit Delphiscal.Cofins03.Intf;

interface

type
  ICofins03 = interface
    ['{20877889-9559-4916-9D7A-1CEB3367ADD3}']

    function GetValorCofins: Currency;

    property ValorCofins: Currency read GetValorCofins;
  end;

implementation

end.

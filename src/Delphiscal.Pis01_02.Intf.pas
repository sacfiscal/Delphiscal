unit Delphiscal.Pis01_02.Intf;

interface

type
  IPis01_02 = interface
    [ '{A5FBE3EC-9083-49A1-A263-529E9967DB0B}' ]

    function GetBasePis: Currency;
    function GetValorPis: Currency;

    property BasePis: Currency read GetBasePis;
    property ValorPis: Currency read GetValorPis;
  end;

implementation

end.

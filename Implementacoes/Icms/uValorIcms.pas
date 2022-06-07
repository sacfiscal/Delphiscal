unit uValorIcms;

interface

uses uBaseIcmsProprio;

type
  TValorIcms = class
  private
    FBaseIcms: TBaseIcmsProprio;
    FAliquotaIcms: currency;


  public

    property AliquotaIcms: currency read FaliquotaIcms write FaliquotaIcms;


    Constructor Create(_baseIcmsProprio: TBaseIcmsProprio;
                       _aliquotaIcmsProprio: currency);
    function GetValorIcms: currency;
    function CalcularValorReduzidoIcms: currency;
    function CalcularValorNormalIcms: currency;


  end;

implementation

uses acbrutil.Math;

{ TValorIcms }

constructor TValorIcms.Create(_baseIcmsProprio: TBaseIcmsProprio;
                              _aliquotaIcmsProprio: currency);
begin
  FBaseIcms := _baseIcmsProprio;
  AliquotaIcms := _aliquotaIcmsProprio;

end;

function TValorIcms.GetValorIcms: currency;
begin
  if (FBaseIcms.ContemReducao) then
    result := CalcularValorReduzidoIcms
else
   result := CalcularValorNormalIcms;
end;

function TValorIcms.CalcularValorNormalIcms: currency;
begin
    result := RoundABNT((FBaseIcms.CalcularBaseNormal * (AliquotaIcms/100) ),2);
end;

function TValorIcms.CalcularValorReduzidoIcms: currency;
begin
    result := RoundABNT((FBaseIcms.CalcularBaseReduzida * (AliquotaIcms/100) ),2);
end;



end.

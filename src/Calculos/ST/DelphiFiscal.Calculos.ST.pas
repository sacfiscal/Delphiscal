unit DelphiFiscal.Calculos.ST;

interface

uses
  DelphiFiscal.Controller.Interfaces,
  DelphiFiscal.Calculos.ST.Interfaces;

type
  TDelphiFiscalST = class(TInterfacedObject, iST)
    private
      [weak]
      FParent : iController;
      FAliquotaICMSST : double;
      FPercentualReducaoBaseICMSST : double;
      FPercentualMVA : double;

      function CalcularBaseNormalST: Double;
      function CalcularBaseReduzidaST: Double;
      function CalcularValorNormalIcmsST: Double;
      function CalcularValorReduzidoIcmsST: Double;
      function CalcularBaseNormalSTCST: Double;
      function CalcularBaseReduzidaSTCST: Double;
    public
      constructor create(Parent : iController);
      destructor destroy; override;
      class function New(Parent : iController) : iST;
      function AliquotaICMSST(aValue : double) : iST; overload;
      function AliquotaICMSST : double; overload;
      function PercentualReducaoBaseICMSST(aValue : double) : iST;
      function PercentualMVA(aValue : double) : iST;
      function BaseICMSST : double;
      function BaseICMSSTCST : double;
      function ValorICMSSTProprio : double;
      function ValorICMSST : double;
      function &End : iController;
  end;

implementation

{ TDelphiFiscalST }

uses Delphiscal.Utils;

function TDelphiFiscalST.&End: iController;
begin
  Result:= FParent;
end;

constructor TDelphiFiscalST.create(Parent : iController);
begin
  FParent:= Parent;
end;

destructor TDelphiFiscalST.destroy;
begin

  inherited;
end;

class function TDelphiFiscalST.New(Parent: iController): iST;
begin
  Result:= Self.create(Parent);
end;

function TDelphiFiscalST.AliquotaICMSST: double;
begin
  Result:= FAliquotaICMSST;
end;

function TDelphiFiscalST.PercentualReducaoBaseICMSST(
  aValue: double): iST;
begin
  Result:= Self;
  FPercentualReducaoBaseICMSST:= aValue;
end;

function TDelphiFiscalST.BaseICMSSTCST: double;
begin
  if FPercentualReducaoBaseICMSST > 0 then
    Result := CalcularBaseReduzidaSTCST
  else
    Result := CalcularBaseNormalSTCST;
end;

function TDelphiFiscalST.CalcularBaseNormalSTCST: Double;
begin
  Result := RoundABNT((FParent.ICMS.BaseICMSProprio + FParent.ICMS.ValorIPI) * (1 + (FPercentualMVA / 100)), 2);
end;

function TDelphiFiscalST.CalcularBaseReduzidaSTCST: Double;
var
  LBaseIcmsST: Double;
begin
  LBaseIcmsST := RoundABNT(FParent.ICMS.BaseICMSProprio * (1 + (FPercentualMVA / 100)), 2);
  Result := RoundABNT((LBaseIcmsST - RoundABNT((LBaseIcmsST * (FPercentualReducaoBaseICMSST / 100)), 2) + FParent.ICMS.ValorIPI), 2);
end;

function TDelphiFiscalST.BaseICMSST: double;
begin
  if FPercentualReducaoBaseICMSST > 0 then
    Result := CalcularBaseReduzidaST
  else
    Result := CalcularBaseNormalST;
end;

function TDelphiFiscalST.CalcularBaseNormalST: Double;
begin
  Result := RoundABNT((FParent.ICMS.BaseICMSNormal + FParent.ICMS.ValorIPI) * (1 + (FPercentualMVA / 100)), 2);
end;

function TDelphiFiscalST.CalcularBaseReduzidaST: Double;
var
  LBaseIcmsST: Double;
begin
  LBaseIcmsST := RoundABNT(FParent.ICMS.BaseICMSNormal * (1 + (FPercentualMVA / 100)), 2);
  Result := RoundABNT((LBaseIcmsST - RoundABNT((LBaseIcmsST * (FPercentualReducaoBaseICMSST / 100)), 2) + FParent.ICMS.ValorIPI), 2);
end;

function TDelphiFiscalST.PercentualMVA(aValue: double): iST;
begin
  Result:= Self;
  FPercentualMVA:= aValue;
end;

function TDelphiFiscalST.AliquotaICMSST(aValue: double): iST;
begin
  Result:= Self;
  FAliquotaICMSST:= aValue;
end;

function TDelphiFiscalST.ValorICMSSTProprio: double;
begin
  if FPercentualReducaoBaseICMSST > 0 then
    Result := CalcularValorReduzidoIcmsST
  else
    Result := CalcularValorNormalIcmsST;
end;

function TDelphiFiscalST.ValorICMSST: double;
begin
  Result := CalcularValorNormalIcmsST;
end;

function TDelphiFiscalST.CalcularValorNormalIcmsST: Double;
begin
  Result := RoundABNT((CalcularBaseNormalST * (FAliquotaICMSST / 100) - FParent.ICMS.ValorICMS), 2);
end;

function TDelphiFiscalST.CalcularValorReduzidoIcmsST: Double;
begin
  Result := RoundABNT((CalcularBaseReduzidaST * (FAliquotaICMSST / 100) - FParent.ICMS.ValorICMS), 2);
end;

end.

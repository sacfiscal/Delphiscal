unit DelphiFiscal.Calculos.ICMS;

interface

uses
  DelphiFiscal.Controller.Interfaces,
  DelphiFiscal.Calculos.ICMS.interfaces;

  type
  TDelphiFiscalICMS = class(TInterfacedObject, iICMS)
    private
      [weak]
      FParent : iController;

      FValorIpi: Double;
      FPercentualReducao: Double;
      FBaseICMSNormal : Double;
      FContemReducao : boolean;
      FAliquotaICMS : Double;
      FPercentualDiferimento : double;

      FAliquotaICMSST : double;
      FPercentualReducaoBaseICMSST : double;
      FPercentualMVA : double;

      FPercentualCreditoICMSSN : double;
    public
      constructor create(Parent : iController);
      destructor destroy; override;
      class function New(Parent : iController) : iICMS;

      function ValorIPI(aValue : double) : iICMS; overload;
      function ValorIPI : double; overload;
      function PercentualReducao(aValue : double) : iICMS;
      function PercentualDiferimento(aValue : double) : iICMS; overload;
      function PercentualDiferimento : double; overload;
      function AliquotaICMS(aValue : double) : iICMS; overload;
      function AliquotaICMS : Double; overload;
      function PercentualCreditoICMSSN(aValue : double) : iICMS; overload;
      function PercentualCreditoICMSSN : double; overload;
      function BaseICMSProprio : double;
      function BaseICMSNormal : double;
      function BaseICMSReduzido : double;
      function ContemReducao(aValue : boolean) : iICMS; overload;
      function ContemReducao : boolean; overload;
      function ValorICMS : Double;
      function ValorICMSProprio : double;
      function &End : iController;
  end;

implementation

{ TDelphiFiscalST }

uses Delphiscal.Utils, DelphiFiscal.CST;

constructor TDelphiFiscalICMS.create(Parent : iController);
begin
  FParent:= Parent;
end;

destructor TDelphiFiscalICMS.destroy;
begin

  inherited;
end;

class function TDelphiFiscalICMS.New(Parent: iController): iICMS;
begin
  Result:= Self.create(Parent);
end;

function TDelphiFiscalICMS.AliquotaICMS(aValue: double): iICMS;
begin
  Result:= Self;
  FAliquotaICMS:= aValue;
end;

function TDelphiFiscalICMS.&End: iController;
begin
  Result:= FParent;
end;

function TDelphiFiscalICMS.AliquotaICMS: Double;
begin
  Result:= FAliquotaICMS;
end;

function TDelphiFiscalICMS.PercentualCreditoICMSSN: double;
begin
  Result:= FPercentualCreditoICMSSN;
end;

function TDelphiFiscalICMS.PercentualCreditoICMSSN(aValue: double): iICMS;
begin
  Result:= Self;
  FPercentualCreditoICMSSN:= aValue;
end;

function TDelphiFiscalICMS.BaseICMSNormal : double;
begin
  Result:= RoundABNT(FParent.Base.ValorProduto +
                     FParent.Base.Valorfrete +
                     FParent.Base.ValorSeguro +
                     FParent.Base.ValorDespesasAcessorias +
                     FValorIpi -
                     FParent.Base.ValorDescontos, 2);
end;

function TDelphiFiscalICMS.BaseICMSProprio : double;
begin
  if FContemReducao then
    Result:= BaseICMSReduzido
  else
    Result:= BaseICMSNormal;
end;

function TDelphiFiscalICMS.BaseICMSReduzido : double;
var
  LBaseIcms: Double;
begin
  LBaseIcms:= BaseICMSNormal;
  Result := RoundABNT((LBaseIcms - (LBaseIcms * (FPercentualReducao / 100))), 2);
end;

function TDelphiFiscalICMS.ContemReducao: boolean;
begin
  Result:= FContemReducao;
end;

function TDelphiFiscalICMS.ContemReducao(aValue: boolean): iICMS;
begin
  Result:= self;
  FContemReducao:= aValue;
end;

function TDelphiFiscalICMS.ValorICMS: Double;
begin
  Result:= RoundABNT((BaseICMSNormal * (AliquotaIcms / 100)), 2);
end;

function TDelphiFiscalICMS.ValorICMSProprio: double;
begin
  Result:= RoundABNT((BaseICMSProprio * (AliquotaIcms / 100)), 2);
end;

function TDelphiFiscalICMS.ValorIPI: double;
begin
  Result:= FValorIpi;
end;

function TDelphiFiscalICMS.ValorIPI(aValue: double): iICMS;
begin
  Result:= self;
  FValorIpi:= aValue;
end;

function TDelphiFiscalICMS.PercentualDiferimento: double;
begin
  Result:= FPercentualDiferimento;
end;

function TDelphiFiscalICMS.PercentualDiferimento(aValue: double): iICMS;
begin
  Result:= self;
  FPercentualDiferimento:= aValue;
end;

function TDelphiFiscalICMS.PercentualReducao(aValue: double): iICMS;
begin
  Result:= self;
  FPercentualReducao:= aValue;
end;


end.


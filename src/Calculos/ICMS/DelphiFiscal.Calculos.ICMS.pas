unit DelphiFiscal.Calculos.ICMS;

interface

uses
  DelphiFiscal.Calculos.Interfaces;

type
  TDelphiFiscalICMS = class(TInterfacedObject, iICMS)
    private
      [weak]
      FParent : iCalculo;
      FCST : iCST;

      FValorIpi: Double;
      FValorDesconto: Double;
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
      constructor create(Parent : iCalculo);
      destructor destroy; override;
      class function New(Parent : iCalculo) : iICMS;
      function &End : iCalculo;

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
      function BaseICMSProprio : double;
      function BaseICMSNormal : double;
      function BaseICMSReduzido : double;
      function ContemReducao(aValue : boolean) : iICMS; overload;
      function ContemReducao : boolean; overload;
      function ValorICMS : Double;
      function ValorICMSProprio : double;
  end;

implementation

{ TDelphiFiscalST }

uses Delphiscal.Utils, DelphiFiscal.CST;

constructor TDelphiFiscalICMS.create(Parent : iCalculo);
begin
  FParent:= Parent;
end;

function TDelphiFiscalICMS.CST: iCST;
begin
  if not Assigned(FCST) then
    FCST:= TDelphiFiscalCST.New(FParent);

  Result:= FCST;
end;

destructor TDelphiFiscalICMS.destroy;
begin

  inherited;
end;

class function TDelphiFiscalICMS.New(Parent: iCalculo): iICMS;
begin
  Result:= Self.create(Parent);
end;

function TDelphiFiscalICMS.AliquotaICMS(aValue: double): iICMS;
begin
  Result:= Self;
  FAliquotaICMS:= aValue;
end;

function TDelphiFiscalICMS.&End: iCalculo;
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
  Result:= RoundABNT(FParent.ValorProduto + FParent.Valorfrete + FParent.ValorSeguro + FParent.ValorDespesasAcessorias + FValorIpi - FValorDesconto, 2);
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

function TDelphiFiscalICMS.ValorDescontos(aValue: double): iICMS;
begin
  Result:= self;
  FValorDesconto:= aValue;
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

//function TDelphiFiscalICMS.ValorProduto(aValue: double): iICMS;
//begin
//  Result:= self;
//  FValorProduto:= aValue;
//end;
//
//function TDelphiFiscalICMS.ValorSeguro(aValue: double): iICMS;
//begin
//  Result:= self;
//  FValorSeguro:= aValue;
//end;

end.


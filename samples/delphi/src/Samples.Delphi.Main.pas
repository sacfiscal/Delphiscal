unit Samples.Delphi.Main;
interface
uses
  Winapi.Windows,
  Winapi.Messages,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.Imaging.pngimage,
  Vcl.ExtCtrls,
  DelphiFiscal.Calculos.Interfaces;
type
  TFrmMain = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Image2: TImage;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label1: TLabel;
    edValorFrete: TEdit;
    edValorSeguro: TEdit;
    edValorDespesas: TEdit;
    edValorDesconto: TEdit;
    edValorIpi: TEdit;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    lbVBC00: TLabel;
    lbVICMS00: TLabel;
    GroupBox2: TGroupBox;
    lbVICMS20: TLabel;
    Label11: TLabel;
    lbVBC20: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    lbVICMSDESON20: TLabel;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    lbVBC51: TLabel;
    Label15: TLabel;
    lbVICMSOP: TLabel;
    Label17: TLabel;
    lbVICMSDIF: TLabel;
    Label19: TLabel;
    lbVICMS51: TLabel;
    btIcms00: TButton;
    btIcms20: TButton;
    btIcms51: TButton;
    edAliqIcms: TEdit;
    edReducao: TEdit;
    edDiferimento: TEdit;
    edValorProduto: TEdit;
    TabSheet2: TTabSheet;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    GroupBox4: TGroupBox;
    lbVBC70: TLabel;
    lbVICMS70: TLabel;
    lbVICMSDeson70: TLabel;
    lbVBCST70: TLabel;
    lbVICMSST70: TLabel;
    lbVICMSSTDeson70: TLabel;
    Label12: TLabel;
    Label18: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Label46: TLabel;
    Label48: TLabel;
    btIcms70: TButton;
    GroupBox5: TGroupBox;
    Label27: TLabel;
    lbVBCST30: TLabel;
    Label29: TLabel;
    lbVICMSST30: TLabel;
    Label31: TLabel;
    lbVICMSSTDeson30: TLabel;
    btIcms30: TButton;
    GroupBox6: TGroupBox;
    Label33: TLabel;
    Label34: TLabel;
    lbVBC10: TLabel;
    lbVICMS10: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    lbVBCST10: TLabel;
    lbVICMSST10: TLabel;
    Label44: TLabel;
    lbVICMSSTDeson10: TLabel;
    btIcms10: TButton;
    edAliqST: TEdit;
    edPercRedST: TEdit;
    edMVA: TEdit;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    Label16: TLabel;
    edPercentualCreditoSN: TEdit;
    GroupBox7: TGroupBox;
    Label20: TLabel;
    lbPCredSN101: TLabel;
    Label26: TLabel;
    lbVcredSN101: TLabel;
    btIcms101: TButton;
    GroupBox8: TGroupBox;
    lbVBCST201: TLabel;
    lbVICMSST201: TLabel;
    Label45: TLabel;
    Label47: TLabel;
    btIcms201: TButton;
    Label24: TLabel;
    lbPCredSN201: TLabel;
    Label30: TLabel;
    lbVCredSN201: TLabel;
    GroupBox9: TGroupBox;
    lbVBCST202: TLabel;
    lbVICMSST202: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    btIcms202_203: TButton;
    Label28: TLabel;
    edAliqIpi: TEdit;
    GroupBox10: TGroupBox;
    Label32: TLabel;
    lbvBCIpi50av: TLabel;
    Label43: TLabel;
    lbVIPI50av: TLabel;
    GroupBox11: TGroupBox;
    Label54: TLabel;
    lbVipi50Especifico: TLabel;
    btIpi50AdValorem: TButton;
    btIpi50AliqEspecifica: TButton;
    Label42: TLabel;
    edValorIpiUn: TEdit;
    Label49: TLabel;
    edQtdeIpiTributada: TEdit;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    edAliqPis: TEdit;
    edValorPisUn: TEdit;
    edQtdePisUn: TEdit;
    GroupBox12: TGroupBox;
    Label53: TLabel;
    lbVBCPIS01_02: TLabel;
    Label56: TLabel;
    lbVPIS01_02: TLabel;
    GroupBox13: TGroupBox;
    Label58: TLabel;
    lbVPIS03: TLabel;
    btPis0102: TButton;
    btPis03: TButton;
    Label55: TLabel;
    edAliqCofins: TEdit;
    Label57: TLabel;
    edValorCofinsUn: TEdit;
    Label59: TLabel;
    edQtdeCofinsUn: TEdit;
    GroupBox14: TGroupBox;
    Label60: TLabel;
    lbVBCCOFINS01_02: TLabel;
    Label62: TLabel;
    lbVCOFINS01_02: TLabel;
    GroupBox15: TGroupBox;
    Label64: TLabel;
    lbVCOFINS03: TLabel;
    btCofins0102: TButton;
    btCofins03: TButton;
    Button1: TButton;
    procedure btIcms00Click(Sender: TObject);
    procedure btIcms20Click(Sender: TObject);
    procedure btIcms51Click(Sender: TObject);
    procedure btIcms10Click(Sender: TObject);
    procedure btIcms30Click(Sender: TObject);
    procedure btIcms70Click(Sender: TObject);
    procedure btIcms101Click(Sender: TObject);
    procedure btIcms201Click(Sender: TObject);
    procedure btIcms202_203Click(Sender: TObject);
    procedure btIpi50AdValoremClick(Sender: TObject);
    procedure btIpi50AliqEspecificaClick(Sender: TObject);
    procedure btPis0102Click(Sender: TObject);
    procedure btCofins0102Click(Sender: TObject);
    procedure btPis03Click(Sender: TObject);
    procedure btCofins03Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FImpostos : iCalculo;
  end;
var
  FrmMain: TFrmMain;
implementation
uses
  Delphiscal.Icms00,
  Delphiscal.Icms00.Intf,
  Delphiscal.Icms20,
  Delphiscal.Icms20.Intf,
  Delphiscal.Icms51,
  Delphiscal.Icms51.Intf,
  Delphiscal.Icms10.Intf,
  Delphiscal.Icms10,
  Delphiscal.Icms30.Intf,
  Delphiscal.Icms30,
  Delphiscal.Icms70,
  Delphiscal.Icms70.Intf,
  Delphiscal.Icms101.Intf,
  Delphiscal.Icms101,
  Delphiscal.Icms201,
  Delphiscal.Icms201.Intf,
  Delphiscal.Icms202_203,
  Delphiscal.Icms202_203.Intf,
  Delphiscal.Ipi50AdValorem,
  Delphiscal.Ipi50AdValorem.Intf,
  Delphiscal.Ipi50Especifico.Intf,
  Delphiscal.Ipi50Especifico,
  Delphiscal.Pis01_02.Intf,
  Delphiscal.Pis01_02,
  Delphiscal.Pis03.Intf,
  Delphiscal.Pis03,
  Delphiscal.Cofins01_02.Intf,
  Delphiscal.Cofins01_02,
  Delphiscal.Cofins03.Intf,
  Delphiscal.Cofins03, System.SysUtils, DelphiFiscal.Calculos;
{$R *.dfm}
procedure TFrmMain.btCofins0102Click(Sender: TObject);
var
  LCofins01_02: ICofins01_02;
begin
  LCofins01_02 := {}
    TCofins01_02.Create({}
    StrToFloatDef(edValorProduto.Text, 0), {}
    StrToFloatDef(edValorFrete.Text, 0), {}
    StrToFloatDef(edValorSeguro.Text, 0), {}
    StrToFloatDef(edValorDespesas.Text, 0), {}
    StrToFloatDef(edValorDesconto.Text, 0), {}
    StrToFloatDef(edAliqCofins.Text, 0));
  lbVBCCOFINS01_02.Caption := LCofins01_02.BaseCofins.ToString;
  lbVCOFINS01_02.Caption   := LCofins01_02.ValorCofins.ToString;
end;
procedure TFrmMain.btCofins03Click(Sender: TObject);
begin
  lbVCOFINS03.Caption := TCofins03.New
    .QuantidadeTributada(StrToFloatDef(edQtdeCofinsUn.Text, 0))
    .ValorPorUnidadeTributada(StrToFloatDef(edValorCofinsUn.Text, 0))
    .ValorCofins.ToString;
end;
procedure TFrmMain.btIcms00Click(Sender: TObject);
var
  LIcms00: IIcms00;
begin
  LIcms00 := TIcms00.Create({}
    StrToFloatDef(edValorProduto.Text, 0), {}
    StrToFloatDef(edValorFrete.Text, 0), {}
    StrToFloatDef(edValorSeguro.Text, 0), {}
    StrToFloatDef(edValorDespesas.Text, 0), {}
    StrToFloatDef(edValorDesconto.Text, 0), {}
    StrToFloatDef(edAliqIcms.Text, 0), {}
    StrToFloatDef(edValorIpi.Text, 0));
  lbVBC00.Caption   := LIcms00.BaseIcmsProprio.ToString;
  lbVICMS00.Caption := LIcms00.ValorIcmsProprio.ToString;
end;
procedure TFrmMain.btIcms10Click(Sender: TObject);
var
  LIcms10: IIcms10;
begin
  LIcms10 := TIcms10.Create({}
    StrToFloatDef(edValorProduto.Text, 0), {}
    StrToFloatDef(edValorFrete.Text, 0), {}
    StrToFloatDef(edValorSeguro.Text, 0), {}
    StrToFloatDef(edValorDespesas.Text, 0), {}
    StrToFloatDef(edValorDesconto.Text, 0), {}
    StrToFloatDef(edAliqIcms.Text, 0), {}
    StrToFloatDef(edAliqST.Text, 0), {}
    StrToFloatDef(edMVA.Text, 0), {}
    StrToFloatDef(edPercRedST.Text, 0), {}
    StrToFloatDef(edValorIpi.Text, 0));
  lbVBC10.Caption          := LIcms10.ValorBaseIcmsProprio.ToString;
  lbVICMS10.Caption        := LIcms10.ValorIcmsProprio.ToString;
  lbVBCST10.Caption        := LIcms10.ValorBaseIcmsST.ToString;
  lbVICMSST10.Caption      := LIcms10.ValorIcmsST.ToString;
  lbVICMSSTDeson10.Caption := LIcms10.ValorIcmsSTDesonerado.ToString;
end;
procedure TFrmMain.btIcms20Click(Sender: TObject);
var
  LIcms20: IIcms20;
begin
  LIcms20 := TIcms20.Create({}
    StrToFloatDef(edValorProduto.Text, 0), {}
    StrToFloatDef(edValorFrete.Text, 0), {}
    StrToFloatDef(edValorSeguro.Text, 0), {}
    StrToFloatDef(edValorDespesas.Text, 0), {}
    StrToFloatDef(edValorDesconto.Text, 0), {}
    StrToFloatDef(edAliqIcms.Text, 0), {}
    StrToFloatDef(edReducao.Text, 0), {}
    StrToFloatDef(edValorIpi.Text, 0));
  lbVBC20.Caption        := LIcms20.BaseReduzidaIcmsProprio.ToString;
  lbVICMS20.Caption      := LIcms20.ValorIcmsProprio.ToString;
  lbVICMSDESON20.Caption := LIcms20.ValorIcmsDesonerado.ToString;
end;
procedure TFrmMain.btIcms30Click(Sender: TObject);
var
  LIcms30: IIcms30;
begin
  LIcms30 := TIcms30.Create({}
    StrToFloatDef(edValorProduto.Text, 0), {}
    StrToFloatDef(edValorFrete.Text, 0), {}
    StrToFloatDef(edValorSeguro.Text, 0), {}
    StrToFloatDef(edValorDespesas.Text, 0), {}
    StrToFloatDef(edValorDesconto.Text, 0), {}
    StrToFloatDef(edAliqIcms.Text, 0), {}
    StrToFloatDef(edAliqST.Text, 0), {}
    StrToFloatDef(edMVA.Text, 0), {}
    StrToFloatDef(edPercRedST.Text, 0), {}
    StrToFloatDef(edValorIpi.Text, 0));
  lbVBCST30.Caption        := LIcms30.ValorBaseIcmsST.ToString;
  lbVICMSST30.Caption      := LIcms30.ValorIcmsST.ToString;
  lbVICMSSTDeson30.Caption := LIcms30.ValorIcmsDesonerado.ToString;
end;
procedure TFrmMain.btIcms70Click(Sender: TObject);
var
  LIcms10: IIcms10;
  LIcms70: IIcms70;
begin
  LIcms70 := TIcms70.Create({}
    StrToFloatDef(edValorProduto.Text, 0), {}
    StrToFloatDef(edValorFrete.Text, 0), {}
    StrToFloatDef(edValorSeguro.Text, 0), {}
    StrToFloatDef(edValorDespesas.Text, 0), {}
    StrToFloatDef(edValorDesconto.Text, 0), {}
    StrToFloatDef(edAliqIcms.Text, 0), {}
    StrToFloatDef(edReducao.Text, 0), {}
    StrToFloatDef(edAliqST.Text, 0), {}
    StrToFloatDef(edMVA.Text, 0), {}
    StrToFloatDef(edPercRedST.Text, 0), {}
    StrToFloatDef(edValorIpi.Text, 0));
  lbVBC70.Caption        := LIcms70.ValorBaseReduzidaIcmsProprio.ToString;
  lbVICMS70.Caption      := LIcms70.ValorIcmsProprio.ToString;
  lbVICMSDeson70.Caption := LIcms70.ValorIcmsDesonerado.ToString;
  lbVBCST70.Caption      := LIcms70.ValorBaseIcmsST.ToString;
  lbVICMSST70.Caption    := LIcms70.ValorIcmsST.ToString;
  LIcms10 := TIcms10.Create({}
    StrToFloatDef(edValorProduto.Text, 0), {}
    StrToFloatDef(edValorFrete.Text, 0), {}
    StrToFloatDef(edValorSeguro.Text, 0), {}
    StrToFloatDef(edValorDespesas.Text, 0), {}
    StrToFloatDef(edValorDesconto.Text, 0), {}
    StrToFloatDef(edAliqIcms.Text, 0), {}
    StrToFloatDef(edAliqST.Text, 0), {}
    StrToFloatDef(edMVA.Text, 0), {}
    StrToFloatDef(edValorIpi.Text, 0));
  lbVICMSSTDeson70.Caption := LIcms70.ValorIcmsSTDesonerado(LIcms10.ValorIcmsST).ToString;
end;
procedure TFrmMain.btIpi50AdValoremClick(Sender: TObject);
var
  LIpi50Av: IIpi50AdValorem;
begin
  LIpi50Av := TIpi50AdValorem.Create({}
    StrToFloatDef(edValorProduto.Text, 0), {}
    StrToFloatDef(edValorFrete.Text, 0), {}
    StrToFloatDef(edValorSeguro.Text, 0), {}
    StrToFloatDef(edValorDespesas.Text, 0), {}
    StrToFloatDef(edAliqIpi.Text, 0));
  lbvBCIpi50av.Caption := LIpi50Av.BaseIpi.ToString;
  lbVIPI50av.Caption   := LIpi50Av.ValorIpi.ToString;
end;
procedure TFrmMain.btIpi50AliqEspecificaClick(Sender: TObject);
begin
  lbVipi50Especifico.Caption := TIpi50Especifico.New
    .QuantidadeTributada(StrToFloatDef(edQtdeIpiTributada.Text, 0))
    .ValorPorUnidadeTributada(StrToFloatDef(edValorIpiUn.Text, 0))
    .ValorIpi.ToString;
end;
procedure TFrmMain.btPis0102Click(Sender: TObject);
var
  LPis01_02: IPIs01_02;
begin
  LPis01_02 := TPis01_02.Create({}
    StrToFloatDef(edValorProduto.Text, 0), {}
    StrToFloatDef(edValorFrete.Text, 0), {}
    StrToFloatDef(edValorSeguro.Text, 0), {}
    StrToFloatDef(edValorDespesas.Text, 0), {}
    StrToFloatDef(edValorDesconto.Text, 0), {}
    StrToFloatDef(edAliqPis.Text, 0));
  lbVBCPIS01_02.Caption := LPis01_02.BasePis.ToString;
  lbVPIS01_02.Caption   := LPis01_02.ValorPis.ToString;
end;
procedure TFrmMain.btPis03Click(Sender: TObject);
begin
  lbVPIS03.Caption := TPis03.New
    .QuantidadeTributada(StrToFloatDef(edQtdePisUn.Text, 0))
    .ValorPorUnidadeTributada(StrToFloatDef(edValorPisUn.Text, 0))
    .ValorPis.ToString;
end;
procedure TFrmMain.Button1Click(Sender: TObject);
begin
  FImpostos
   .ICMS
     .ValorProduto(strtofloatdef(edValorProduto.Text,0))
     .ValorFrete(strtofloatdef(edValorFrete.Text,0))
     .ValorSeguro(strtofloatdef(edValorSeguro.Text,0))
     .ValorDespesasAcessorias(strtofloatdef(edValorDespesas.Text,0))
     .ValorIPI(strtofloatdef(edValorIpi.Text,0))
     .ValorDescontos(strtofloatdef(edValorDesconto.Text,0))
     .PercentualReducao(strtofloatdef(edReducao.Text,0))
     .PercentualDiferimento(strtofloatdef(edDiferimento.Text,0))
     .AliquotaICMS(strtofloatdef(edAliqIcms.Text,0))
     .ContemReducao(strtofloatdef(edReducao.Text,0) > 0)
   .&End
   .ST
     .AliquotaICMSST(strtofloatdef(edAliqST.Text,0))
     .PercentualMVA(strtofloatdef(edMVA.Text,0))
     .PercentualReducaoBaseICMSST(strtofloatdef(edPercRedST.Text,0));

  lbVICMS00.Caption:= FImpostos.ICMS.ValorICMS.ToString;
  lbVBC00.Caption  := FImpostos.ICMS.CST.ICMS00.BaseICMSProprio.ToString;

  lbVICMS20.Caption:= FImpostos.ICMS.CST.ICMS20.ValorICMSProprio.ToString;
  lbVBC20.Caption  := FImpostos.ICMS.CST.ICMS20.BaseICMSProprio.ToString;
  lbVICMSDESON20.Caption:= FImpostos.ICMS.CST.ICMS20.ValorICMSDesonerado.ToString;

  lbVBC51.Caption:= FImpostos.ICMS.CST.ICMS51.BaseICMSProprio.ToString;
  lbVICMS51.Caption:= FImpostos.ICMS.CST.ICMS51.ValorICMSProprio.ToString;
  lbVICMSOP.Caption:= FImpostos.ICMS.CST.ICMS51.ValorICMSOperacao.ToString;
  lbVICMSDIF.Caption:= FImpostos.ICMS.CST.ICMS51.ValorICMSDiferido.ToString;

  lbVBC10.Caption:= FImpostos.ICMS.CST.ICMS10.ValorBaseIcmsProprio.ToString;
  lbVICMS10.Caption:= FImpostos.ICMS.CST.ICMS10.ValorIcmsProprio.ToString;
  lbVBCST10.Caption:= FImpostos.ICMS.CST.ICMS10.ValorBaseIcmsST.ToString;
  lbVICMSST10.Caption:= FImpostos.ICMS.CST.ICMS10.ValorIcmsST.ToString;
  lbVICMSSTDeson10.Caption:= FImpostos.ICMS.CST.ICMS10.ValorIcmsSTDesonerado.ToString;

  lbVBCST30.Caption:= FImpostos.ICMS.CST.ICMS30.ValorBaseIcmsST.ToString;
  lbVICMSST30.Caption:= FImpostos.ICMS.CST.ICMS30.ValorIcmsST.ToString;
  lbVICMSSTDeson30.Caption:= FImpostos.ICMS.CST.ICMS30.ValorIcmsDesonerado.ToString;

  lbVBC70.Caption:= FImpostos.ICMS.CST.ICMS70.ValorBaseReduzidaIcmsProprio.ToString;
  lbVICMS70.Caption:= FImpostos.ICMS.CST.ICMS70.ValorIcmsProprio.ToString;
  lbVICMSDeson70.Caption:= FImpostos.ICMS.CST.ICMS70.ValorIcmsDesonerado.ToString;

  lbVBCST70.Caption:= FImpostos.ICMS.CST.ICMS70.ValorBaseIcmsST.ToString;
  lbVICMSST70.Caption:= FImpostos.ICMS.CST.ICMS70.ValorIcmsST.ToString;
  lbVICMSSTDeson70.Caption:= FImpostos.ICMS.CST.ICMS70.ValorIcmsSTDesonerado.ToString;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  FImpostos:= TDelphiFiscalCalculos.New;
end;

procedure TFrmMain.btIcms101Click(Sender: TObject);
var
  LIcms101: IIcms101;
begin
  LIcms101 := TIcms101.Create({}
    StrToFloatDef(edValorProduto.Text, 0), {}
    StrToFloatDef(edValorFrete.Text, 0), {}
    StrToFloatDef(edValorSeguro.Text, 0), {}
    StrToFloatDef(edValorDespesas.Text, 0), {}
    StrToFloatDef(edValorDesconto.Text, 0), {}
    StrToFloatDef(edPercentualCreditoSN.Text, 0), {}
    StrToFloatDef(edReducao.Text, 0));
  lbPCredSN101.Caption := edPercentualCreditoSN.Text;
  lbVcredSN101.Caption := LIcms101.ValorCreditoSN.ToString;
end;
procedure TFrmMain.btIcms201Click(Sender: TObject);
var
  LIcms201: IIcms201;
begin
  LIcms201 := TIcms201.Create({}
    StrToFloatDef(edValorProduto.Text, 0), {}
    StrToFloatDef(edValorFrete.Text, 0), {}
    StrToFloatDef(edValorSeguro.Text, 0), {}
    StrToFloatDef(edValorDespesas.Text, 0), {}
    StrToFloatDef(edValorDesconto.Text, 0), {}
    StrToFloatDef(edAliqIcms.Text, 0), {}
    StrToFloatDef(edReducao.Text, 0), {}
    StrToFloatDef(edPercentualCreditoSN.Text, 0), {}
    StrToFloatDef(edAliqST.Text, 0), {}
    StrToFloatDef(edMVA.Text, 0), {}
    StrToFloatDef(edPercRedST.Text, 0));
  lbPCredSN201.Caption := edPercentualCreditoSN.Text;
  lbVCredSN201.Caption := LIcms201.ValorCreditoSN.ToString;
  lbVBCST201.Caption   := LIcms201.ValorBaseIcmsST.ToString;
  lbVICMSST201.Caption := LIcms201.ValorIcmsST.ToString;
end;
procedure TFrmMain.btIcms51Click(Sender: TObject);
var
  LIcms51: IIcms51;
begin
  LIcms51 := TIcms51.Create({}
    StrToFloatDef(edValorProduto.Text, 0), {}
    StrToFloatDef(edValorFrete.Text, 0), {}
    StrToFloatDef(edValorSeguro.Text, 0), {}
    StrToFloatDef(edValorDespesas.Text, 0), {}
    StrToFloatDef(edValorDesconto.Text, 0), {}
    StrToFloatDef(edAliqIcms.Text, 0), {}
    StrToFloatDef(edDiferimento.Text, 0), {}
    StrToFloatDef(edReducao.Text, 0), {}
    StrToFloatDef(edValorIpi.Text, 0));
  lbVBC51.Caption    := LIcms51.BaseIcmsProprio.ToString;
  lbVICMSOP.Caption  := LIcms51.ValorIcmsOperacao.ToString;
  lbVICMSDIF.Caption := LIcms51.ValorIcmsDiferido.ToString;
  lbVICMS51.Caption  := LIcms51.ValorIcmsProprio.ToString;
end;
procedure TFrmMain.btIcms202_203Click(Sender: TObject);
var
  LIcms202_203: IIcms202_203;
begin
  LIcms202_203 := TIcms202_203.Create({}
    StrToFloatDef(edValorProduto.Text, 0), {}
    StrToFloatDef(edValorFrete.Text, 0), {}
    StrToFloatDef(edValorSeguro.Text, 0), {}
    StrToFloatDef(edValorDespesas.Text, 0), {}
    StrToFloatDef(edValorDesconto.Text, 0), {}
    StrToFloatDef(edAliqIcms.Text, 0), {}
    StrToFloatDef(edReducao.Text, 0), {}
    StrToFloatDef(edAliqST.Text, 0), {}
    StrToFloatDef(edMVA.Text, 0), {}
    StrToFloatDef(edPercRedST.Text, 0));
  lbVBCST202.Caption   := LIcms202_203.ValorBaseIcmsST.ToString;
  lbVICMSST202.Caption := LIcms202_203.ValorIcmsST.ToString;
end;
end.

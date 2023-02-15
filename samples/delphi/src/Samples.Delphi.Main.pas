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
    GroupBox5: TGroupBox;
    Label27: TLabel;
    lbVBCST30: TLabel;
    Label29: TLabel;
    lbVICMSST30: TLabel;
    Label31: TLabel;
    lbVICMSSTDeson30: TLabel;
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
    GroupBox8: TGroupBox;
    lbVBCST201: TLabel;
    lbVICMSST201: TLabel;
    Label45: TLabel;
    Label47: TLabel;
    Label24: TLabel;
    lbPCredSN201: TLabel;
    Label30: TLabel;
    lbVCredSN201: TLabel;
    GroupBox9: TGroupBox;
    lbVBCST202: TLabel;
    lbVICMSST202: TLabel;
    Label35: TLabel;
    Label36: TLabel;
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
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FImpostos : iCalculo;
  end;
var
  FrmMain: TFrmMain;
implementation

uses
  System.SysUtils,
  DelphiFiscal.Calculos;

{$R *.dfm}
procedure TFrmMain.Button1Click(Sender: TObject);
begin
  FImpostos
   .ValorProduto(strtofloatdef(edValorProduto.Text,0))
   .ValorFrete(strtofloatdef(edValorFrete.Text,0))
   .ValorSeguro(strtofloatdef(edValorSeguro.Text,0))
   .ValorDespesasAcessorias(strtofloatdef(edValorDespesas.Text,0))
   .ValorDescontos(strtofloatdef(edValorDesconto.Text,0))
   .ICMS
     .ValorIPI(strtofloatdef(edValorIpi.Text,0))
     .PercentualReducao(strtofloatdef(edReducao.Text,0))
     .PercentualDiferimento(strtofloatdef(edDiferimento.Text,0))
     .AliquotaICMS(strtofloatdef(edAliqIcms.Text,0))
     .PercentualCreditoICMSSN(strtofloatdef(edPercentualCreditoSN.Text,0))
     .ContemReducao(strtofloatdef(edReducao.Text,0) > 0)
   .&End
   .ST
     .AliquotaICMSST(strtofloatdef(edAliqST.Text,0))
     .PercentualMVA(strtofloatdef(edMVA.Text,0))
     .PercentualReducaoBaseICMSST(strtofloatdef(edPercRedST.Text,0))
   .&End
   .IPI
     .AliquotaIPI(strtofloatdef(edAliqIpi.Text,0))
     .ValorIPIPorUnidade(strtofloatdef(edValorIpiUn.Text,0))
     .QtdeIPITributada(strtofloatdef(edQtdeIpiTributada.Text,0))
   .&End
   .PIS
     .AliquotaPIS(strtofloatdef(edAliqPis.Text,0))
     .ValorPISPorUnidade(strtofloatdef(edValorPisUn.Text,0))
     .QtdePISTributada(strtofloatdef(edQtdePisUn.Text,0))
   .&End
   .COFINS
     .AliquotaCOFINS(strtofloatdef(edAliqCofins.Text,0))
     .ValorCOFINSPorUnidade(strtofloatdef(edValorCofinsUn.Text,0))
     .QtdeCOFINSTributada(strtofloatdef(edQtdeCofinsUn.Text,0))
   .&End;

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

  lbPCredSN101.Caption:= FImpostos.ICMS.PercentualCreditoICMSSN.ToString;
  lbVcredSN101.Caption:= FImpostos.ICMS.CST.ICMS101.ValorCreditoSN.ToString;

  lbPCredSN201.Caption:= FImpostos.ICMS.PercentualCreditoICMSSN.ToString;
  lbVCredSN201.Caption:= FImpostos.ICMS.CST.ICMS201.ValorCreditoSN.ToString;
  lbVBCST201.Caption  := FImpostos.ICMS.CST.ICMS201.ValorBaseIcmsST.ToString;
  lbVICMSST201.Caption:= FImpostos.ICMS.CST.ICMS201.ValorIcmsST.ToString;

  lbVBCST202.Caption  := FImpostos.ICMS.CST.ICMS202.ValorBaseIcmsST.ToString;
  lbVICMSST202.Caption:= FImpostos.ICMS.CST.ICMS202.ValorIcmsST.ToString;

  lbvBCIpi50av.Caption:= FImpostos.ICMS.CST.IPI50.BaseIpi.ToString;
  lbVIPI50av.Caption:= FImpostos.ICMS.CST.IPI50.ValorIpi.ToString;
  lbVipi50Especifico.Caption:= FImpostos.ICMS.CST.IPI50.ValorIpiEspecifico.ToString;

  lbVBCPIS01_02.Caption:= FImpostos.ICMS.CST.PIS01.BasePis.ToString;
  lbVPIS01_02.Caption:= FImpostos.ICMS.CST.PIS01.ValorPis.ToString;
  lbVPIS03.Caption:= FImpostos.ICMS.CST.PIS01.ValorPisEspecifico.ToString;

  lbVBCCOFINS01_02.Caption:= FImpostos.ICMS.CST.COFINS01.BaseCofins.ToString;
  lbVCOFINS01_02.Caption := FImpostos.ICMS.CST.COFINS01.ValorCofins.ToString;
  lbVCOFINS03.Caption:= FImpostos.ICMS.CST.COFINS01.ValorCofinsEspecifico.ToString;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  FImpostos:= TDelphiFiscalCalculos.New;
end;

end.

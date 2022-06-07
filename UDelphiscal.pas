unit UDelphiscal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  uIcms00, uIIcms00, uIcms20, uIIcms20, uIcms51, uIIcms51, uIIcms10, uIcms10,
  uIIcms30, uIcms30, uIcms70, uIIcms70, uIIcms101, uIcms101, uIcms201, uIIcms201,
  uIcms202_203, uIIcms202_203, uIpi50AdValorem, uIIPI50AdValorem, uIIpi50Especifico,
  uIpi50Especifico, uIPis01_02, uPis01_02, uIPis03, uPis03, uICofins01_02,
  uCofins01_02, uICofins03, uCofins03, AcbrUtil.Base;

{$R *.dfm}

procedure TForm1.btCofins0102Click(Sender: TObject);
var
 OCofins01_02: ICofins01_02;
begin
 OCofins01_02 := TCofins01_02.Create(StringToFloatDef(edValorProduto.Text, 0),
                            StringToFloatDef(edValorFrete.Text, 0),
                            StringToFloatDef(edValorSeguro.Text,0),
                            StringToFloatDef(edValorDespesas.Text, 0),
                            StringToFloatDef(edValorDesconto.Text, 0),
                            StringToFloatDef(edAliqCofins.Text, 0));

 lbVBCCOFINS01_02.Caption := OCofins01_02.BaseCofins.ToString;
 lbVCOFINS01_02.Caption := OCofins01_02.ValorCofins.ToString;

end;

procedure TForm1.btCofins03Click(Sender: TObject);
var
 OCofins03: ICofins03;
begin
 OCofins03 := TCofins03.Create(StringToFloatDef(edQtdeCofinsUn.Text, 0),
                                              StringToFloatDef(edValorCofinsUn.Text, 0));

 lbVCofins03.Caption := OCofins03.ValorCofins.ToString;

end;

procedure TForm1.btIcms00Click(Sender: TObject);
var
  OIcms00: IIcms00;
begin
  OIcms00 := TIcms00.Create(StringToFloatDef(edValorProduto.Text, 0),
                            StringToFloatDef(edValorFrete.Text, 0),
                            StringToFloatDef(edValorSeguro.Text,0),
                            StringToFloatDef(edValorDespesas.Text, 0),
                            StringToFloatDef(edValorDesconto.Text, 0),
                            StringToFloatDef(edAliqIcms.Text,0),
                            StringToFloatDef(edValorIpi.Text, 0));

  lbVBC00.Caption := OIcms00.BaseIcmsProprio.ToString;
  lbVICMS00.Caption := OIcms00.ValorIcmsProprio.ToString;

end;

procedure TForm1.btIcms10Click(Sender: TObject);
var
 OIcms10 : IIcms10;
begin
 OIcms10 := TIcms10.Create(StringToFloatDef(edValorProduto.Text, 0),
                            StringToFloatDef(edValorFrete.Text, 0),
                            StringToFloatDef(edValorSeguro.Text,0),
                            StringToFloatDef(edValorDespesas.Text, 0),
                            StringToFloatDef(edValorDesconto.Text, 0),
                            StringToFloatDef(edAliqIcms.Text,0),
                            StringToFloatDef(edAliqST.Text, 0),
                            StringToFloatDef(edMVA.Text, 0),
                            StringToFloatDef(edPercRedST.Text, 0),
                            StringToFloatDef(edValorIpi.Text, 0));

 lbVBC10.Caption := OIcms10.ValorBaseIcmsProprio.ToString;
 lbVICMS10.Caption := OIcms10.ValorIcmsProprio.ToString;
 lbVBCST10.Caption := OIcms10.ValorBaseIcmsST.ToString;
 lbVICMSST10.Caption := OIcms10.ValorIcmsST.ToString;
 lbVICMSSTDeson10.Caption := OIcms10.ValorIcmsSTDesonerado.ToString;
end;

procedure TForm1.btIcms20Click(Sender: TObject);
var
  OIcms20: IIcms20;
begin

  OIcms20 := TIcms20.Create(StringToFloatDef(edValorProduto.Text, 0),
                            StringToFloatDef(edValorFrete.Text, 0),
                            StringToFloatDef(edValorSeguro.Text,0),
                            StringToFloatDef(edValorDespesas.Text, 0),
                            StringToFloatDef(edValorDesconto.Text, 0),
                            StringToFloatDef(edAliqIcms.Text,0),
                            StringToFloatDef(edReducao.Text, 0),
                            StringToFloatDef(edValorIpi.Text, 0));

  lbVBC20.Caption := OIcms20.BaseReduzidaIcmsProprio.ToString;
  lbVICMS20.Caption := OIcms20.ValorIcmsProprio.ToString;
  lbVICMSDESON20.Caption := OIcms20.ValorIcmsDesonerado.ToString;

end;

procedure TForm1.btIcms30Click(Sender: TObject);
var
 OIcms30 : IIcms30;
begin
 OIcms30 := TIcms30.Create(StringToFloatDef(edValorProduto.Text, 0),
                            StringToFloatDef(edValorFrete.Text, 0),
                            StringToFloatDef(edValorSeguro.Text,0),
                            StringToFloatDef(edValorDespesas.Text, 0),
                            StringToFloatDef(edValorDesconto.Text, 0),
                            StringToFloatDef(edAliqIcms.Text,0),
                            StringToFloatDef(edAliqST.Text, 0),
                            StringToFloatDef(edMVA.Text, 0),
                            StringToFloatDef(edPercRedST.Text, 0),
                            StringToFloatDef(edValorIpi.Text, 0));

 lbVBCST30.Caption := OIcms30.ValorBaseIcmsST.ToString;
 lbVICMSST30.Caption := OIcms30.ValorIcmsST.ToString;
 lbVICMSSTDeson30.Caption := OIcms30.ValorIcmsDesonerado.ToString;

end;

procedure TForm1.btIcms70Click(Sender: TObject);
var
 OIcms10 : IIcms10;
 OIcms70 : IIcms70;
begin
 OIcms70 := TIcms70.Create(StringToFloatDef(edValorProduto.Text, 0),
                            StringToFloatDef(edValorFrete.Text, 0),
                            StringToFloatDef(edValorSeguro.Text,0),
                            StringToFloatDef(edValorDespesas.Text, 0),
                            StringToFloatDef(edValorDesconto.Text, 0),
                            StringToFloatDef(edAliqIcms.Text,0),
                            StringToFloatDef(edReducao.Text,0),
                            StringToFloatDef(edAliqST.Text, 0),
                            StringToFloatDef(edMVA.Text, 0),
                            StringToFloatDef(edPercRedST.Text, 0),
                            StringToFloatDef(edValorIpi.Text, 0));

 lbVBC70.Caption := OIcms70.ValorBaseReduzidaIcmsProprio.ToString;
 lbVICMS70.Caption := OIcms70.ValorIcmsProprio.ToString;
 lbVICMSDeson70.Caption := OIcms70.ValorIcmsDesonerado.ToString;
 lbVBCST70.Caption := OIcms70.ValorBaseIcmsST.ToString;
 lbVICMSST70.Caption := OIcms70.ValorIcmsST.ToString;

 OIcms10 := TIcms10.Create(StringToFloatDef(edValorProduto.Text, 0),
                            StringToFloatDef(edValorFrete.Text, 0),
                            StringToFloatDef(edValorSeguro.Text,0),
                            StringToFloatDef(edValorDespesas.Text, 0),
                            StringToFloatDef(edValorDesconto.Text, 0),
                            StringToFloatDef(edAliqIcms.Text,0),
                            StringToFloatDef(edAliqST.Text, 0),
                            StringToFloatDef(edMVA.Text, 0),
                            StringToFloatDef(edValorIpi.Text, 0));

 lbVICMSSTDeson70.Caption := OIcms70.ValorIcmsSTDesonerado(OIcms10.ValorIcmsST).ToString;

end;

procedure TForm1.btIpi50AdValoremClick(Sender: TObject);
var
  OIpi50Av: IIpi50AdValorem;
begin
  OIpi50Av := TIpi50AdValorem.Create(StringToFloatDef(edValorProduto.Text, 0),
                            StringToFloatDef(edValorFrete.Text, 0),
                            StringToFloatDef(edValorSeguro.Text,0),
                            StringToFloatDef(edValorDespesas.Text, 0),
                            StringToFloatDef(edAliqIpi.Text, 0));

  lbvBCIpi50av.Caption := OIpi50Av.BaseIpi.ToString;
  lbVIPI50av.Caption := OIpi50Av.ValorIpi.ToString;

end;

procedure TForm1.btIpi50AliqEspecificaClick(Sender: TObject);
 var
 OIpi50Especifico: IIpi50Especifico;
begin
 OIpi50Especifico := TIpi50Especifico.Create(StringToFloatDef(edQtdeIpiTributada.Text, 0),
                                              StringToFloatDef(edValorIpiUn.Text, 0));

 lbVipi50Especifico.Caption := OIpi50Especifico.ValorIpi.ToString;
end;

procedure TForm1.btPis0102Click(Sender: TObject);
var
 OPis01_02: IPIs01_02;
begin
 OPis01_02 := TPis01_02.Create(StringToFloatDef(edValorProduto.Text, 0),
                            StringToFloatDef(edValorFrete.Text, 0),
                            StringToFloatDef(edValorSeguro.Text,0),
                            StringToFloatDef(edValorDespesas.Text, 0),
                            StringToFloatDef(edValorDesconto.Text, 0),
                            StringToFloatDef(edAliqPis.Text, 0));

 lbVBCPIS01_02.Caption := OPis01_02.BasePis.ToString;
 lbVPIS01_02.Caption := OPis01_02.ValorPis.ToString;
end;

procedure TForm1.btPis03Click(Sender: TObject);
 var
 OPis03: IPis03;
begin
 OPis03 := TPis03.Create(StringToFloatDef(edQtdePisUn.Text, 0),
                                              StringToFloatDef(edValorPisUn.Text, 0));

 lbVPis03.Caption := OPis03.ValorPis.ToString;

end;

procedure TForm1.btIcms101Click(Sender: TObject);
var
  OIcms101: IIcms101;
begin

  OIcms101 := TIcms101.Create(StringToFloatDef(edValorProduto.Text, 0),
                            StringToFloatDef(edValorFrete.Text, 0),
                            StringToFloatDef(edValorSeguro.Text,0),
                            StringToFloatDef(edValorDespesas.Text, 0),
                            StringToFloatDef(edValorDesconto.Text, 0),
                            StringToFloatDef(edPercentualCreditoSN.Text,0),
                            StringToFloatDef(edReducao.Text, 0));

  lbPCredSN101.Caption := edPercentualCreditoSN.Text;
  lbVcredSN101.Caption := OIcms101.ValorCreditoSN.ToString;

end;

procedure TForm1.btIcms201Click(Sender: TObject);
var
 OIcms201 : IIcms201;
begin
 OIcms201 := TIcms201.Create(StringToFloatDef(edValorProduto.Text, 0),
                            StringToFloatDef(edValorFrete.Text, 0),
                            StringToFloatDef(edValorSeguro.Text,0),
                            StringToFloatDef(edValorDespesas.Text, 0),
                            StringToFloatDef(edValorDesconto.Text, 0),
                            StringToFloatDef(edAliqIcms.Text,0),
                            StringToFloatDef(edReducao.Text,0),
                            StringToFloatDef(edPercentualCreditoSN.Text,0),
                            StringToFloatDef(edAliqST.Text, 0),
                            StringToFloatDef(edMVA.Text, 0),
                            StringToFloatDef(edPercRedST.Text, 0));

 lbPCredSN201.Caption := edPercentualCreditoSN.Text;
 lbVcredSN201.Caption := OIcms201.ValorCreditoSN.ToString;
 lbVBCST201.Caption := OIcms201.ValorBaseIcmsST.ToString;
 lbVICMSST201.Caption := OIcms201.ValorIcmsST.ToString;

end;

procedure TForm1.btIcms51Click(Sender: TObject);
var
  OIcms51: IIcms51;
begin
  OIcms51 := TIcms51.Create(StringToFloatDef(edValorProduto.Text, 0),
                            StringToFloatDef(edValorFrete.Text, 0),
                            StringToFloatDef(edValorSeguro.Text,0),
                            StringToFloatDef(edValorDespesas.Text, 0),
                            StringToFloatDef(edValorDesconto.Text, 0),
                            StringToFloatDef(edAliqIcms.Text,0),
                            StringToFloatDef(edDiferimento.Text, 0),
                            StringToFloatDef(edReducao.Text, 0),
                            StringToFloatDef(edValorIpi.Text, 0));

  lbvBC51.Caption := OICMS51.BaseIcmsProprio.ToString;
  lbvICMSOP.Caption := OIcms51.ValorIcmsOperacao.ToString;
  lbVICMSDIF.Caption := OICMS51.ValorIcmsDiferido.ToString;
  lbVICMS51.Caption := OIcms51.ValorIcmsProprio.ToString;
end;

procedure TForm1.btIcms202_203Click(Sender: TObject);
var
 OIcms202_203 : IIcms202_203;
begin
 OIcms202_203 := TIcms202_203.Create(StringToFloatDef(edValorProduto.Text, 0),
                            StringToFloatDef(edValorFrete.Text, 0),
                            StringToFloatDef(edValorSeguro.Text,0),
                            StringToFloatDef(edValorDespesas.Text, 0),
                            StringToFloatDef(edValorDesconto.Text, 0),
                            StringToFloatDef(edAliqIcms.Text,0),
                            StringToFloatDef(edReducao.Text,0),
                            StringToFloatDef(edAliqST.Text, 0),
                            StringToFloatDef(edMVA.Text, 0),
                            StringToFloatDef(edPercRedST.Text, 0));

 lbVBCST202.Caption := OIcms202_203.ValorBaseIcmsST.ToString;
 lbVICMSST202.Caption := OIcms202_203.ValorIcmsST.ToString;

end;

end.

program Delphiscal;
uses
  Vcl.Forms,
  Samples.Delphi.Main in 'src\Samples.Delphi.Main.pas' {FrmMain},
  Delphiscal.Cofins.Base in '..\..\src\Delphiscal.Cofins.Base.pas',
  Delphiscal.Cofins01_02.Intf in '..\..\src\Delphiscal.Cofins01_02.Intf.pas',
  Delphiscal.Cofins01_02 in '..\..\src\Delphiscal.Cofins01_02.pas',
  Delphiscal.Cofins03.Intf in '..\..\src\Delphiscal.Cofins03.Intf.pas',
  Delphiscal.Cofins03 in '..\..\src\Delphiscal.Cofins03.pas',
  Delphiscal.Icms.BaseProprio in '..\..\src\Delphiscal.Icms.BaseProprio.pas',
  Delphiscal.Icms.BaseST in '..\..\src\Delphiscal.Icms.BaseST.pas',
  Delphiscal.Icms.Valor in '..\..\src\Delphiscal.Icms.Valor.pas',
  Delphiscal.Icms.Valor.ST in '..\..\src\Delphiscal.Icms.Valor.ST.pas',
  Delphiscal.Ipi.Base in '..\..\src\Delphiscal.Ipi.Base.pas',
  Delphiscal.Ipi50AdValorem.Intf in '..\..\src\Delphiscal.Ipi50AdValorem.Intf.pas',
  Delphiscal.Ipi50AdValorem in '..\..\src\Delphiscal.Ipi50AdValorem.pas',
  Delphiscal.Ipi50Especifico.Intf in '..\..\src\Delphiscal.Ipi50Especifico.Intf.pas',
  Delphiscal.Ipi50Especifico in '..\..\src\Delphiscal.Ipi50Especifico.pas',
  Delphiscal.Pis.Base in '..\..\src\Delphiscal.Pis.Base.pas',
  Delphiscal.Pis01_02.Intf in '..\..\src\Delphiscal.Pis01_02.Intf.pas',
  Delphiscal.Pis01_02 in '..\..\src\Delphiscal.Pis01_02.pas',
  Delphiscal.Pis03.Intf in '..\..\src\Delphiscal.Pis03.Intf.pas',
  Delphiscal.Pis03 in '..\..\src\Delphiscal.Pis03.pas',
  Delphiscal.Utils in '..\..\src\Delphiscal.Utils.pas',
  DelphiFiscal.Impostos.CST.ICMS00 in '..\..\src\Calculos\CST\DelphiFiscal.Impostos.CST.ICMS00.pas',
  DelphiFiscal.Impostos.CST.ICMS20 in '..\..\src\Calculos\CST\DelphiFiscal.Impostos.CST.ICMS20.pas',
  DelphiFiscal.Impostos.CST.ICMS51 in '..\..\src\Calculos\CST\DelphiFiscal.Impostos.CST.ICMS51.pas',
  DelphiFiscal.Impostos.CST.ICMS10 in '..\..\src\Calculos\CST\DelphiFiscal.Impostos.CST.ICMS10.pas',
  DelphiFiscal.Impostos.CST.ICMS30 in '..\..\src\Calculos\CST\DelphiFiscal.Impostos.CST.ICMS30.pas',
  DelphiFiscal.Impostos.CST.ICMS70 in '..\..\src\Calculos\CST\DelphiFiscal.Impostos.CST.ICMS70.pas',
  DelphiFiscal.Calculos.ST in '..\..\src\Calculos\ST\DelphiFiscal.Calculos.ST.pas',
  DelphiFiscal.Calculos.ICMS in '..\..\src\Calculos\ICMS\DelphiFiscal.Calculos.ICMS.pas',
  DelphiFiscal.Calculos.Interfaces in '..\..\src\Calculos\DelphiFiscal.Calculos.Interfaces.pas',
  DelphiFiscal.CST in '..\..\src\Calculos\CST\DelphiFiscal.CST.pas',
  DelphiFiscal.Calculos in '..\..\src\Calculos\DelphiFiscal.Calculos.pas',
  DelphiFiscal.Impostos.CST.ICMS101 in '..\..\src\Calculos\CST\DelphiFiscal.Impostos.CST.ICMS101.pas',
  DelphiFiscal.Impostos.CST.ICMS201 in '..\..\src\Calculos\CST\DelphiFiscal.Impostos.CST.ICMS201.pas',
  DelphiFiscal.Impostos.CST.ICMS202 in '..\..\src\Calculos\CST\DelphiFiscal.Impostos.CST.ICMS202.pas',
  DelphiFiscal.Impostos.CST.ICMS203 in '..\..\src\Calculos\CST\DelphiFiscal.Impostos.CST.ICMS203.pas',
  DelphiFiscal.Calculos.IPI in '..\..\src\Calculos\IPI\DelphiFiscal.Calculos.IPI.pas',
  DelphiFiscal.Impostos.CST.IPI50 in '..\..\src\Calculos\CST\DelphiFiscal.Impostos.CST.IPI50.pas';

{$R *.res}
begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := true;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.

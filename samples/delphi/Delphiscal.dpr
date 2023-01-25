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
  Delphiscal.Icms101.Intf in '..\..\src\Delphiscal.Icms101.Intf.pas',
  Delphiscal.Icms101 in '..\..\src\Delphiscal.Icms101.pas',
  Delphiscal.Icms201.Intf in '..\..\src\Delphiscal.Icms201.Intf.pas',
  Delphiscal.Icms201 in '..\..\src\Delphiscal.Icms201.pas',
  Delphiscal.Icms202_203.Intf in '..\..\src\Delphiscal.Icms202_203.Intf.pas',
  Delphiscal.Icms202_203 in '..\..\src\Delphiscal.Icms202_203.pas',
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
  DelphiFiscal.Calculos in '..\..\src\Calculos\DelphiFiscal.Calculos.pas';

{$R *.res}
begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := true;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.

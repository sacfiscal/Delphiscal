program Delphiscal;
uses
  Vcl.Forms,
  Samples.Delphi.Main in 'src\Samples.Delphi.Main.pas' {FrmMain},
  Delphiscal.Utils in '..\..\src\Calculos\Util\Delphiscal.Utils.pas',
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
  DelphiFiscal.Impostos.CST.IPI50 in '..\..\src\Calculos\CST\DelphiFiscal.Impostos.CST.IPI50.pas',
  DelphiFiscal.Calculos.PIS in '..\..\src\Calculos\PIS\DelphiFiscal.Calculos.PIS.pas',
  DelphiFiscal.Impostos.CST.PIS01 in '..\..\src\Calculos\CST\DelphiFiscal.Impostos.CST.PIS01.pas',
  DelphiFiscal.Impostos.CST.PIS02 in '..\..\src\Calculos\CST\DelphiFiscal.Impostos.CST.PIS02.pas',
  DelphiFiscal.Impostos.CST.PIS03 in '..\..\src\Calculos\CST\DelphiFiscal.Impostos.CST.PIS03.pas',
  DelphiFiscal.Impostos.CST.COFINS01 in '..\..\src\Calculos\CST\DelphiFiscal.Impostos.CST.COFINS01.pas',
  DelphiFiscal.Calculos.COFINS in '..\..\src\Calculos\COFINS\DelphiFiscal.Calculos.COFINS.pas',
  DelphiFiscal.Impostos.CST.COFINS02 in '..\..\src\Calculos\CST\DelphiFiscal.Impostos.CST.COFINS02.pas',
  DelphiFiscal.Impostos.CST.COFINS03 in '..\..\src\Calculos\CST\DelphiFiscal.Impostos.CST.COFINS03.pas';

{$R *.res}
begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := true;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.

program Delphiscal;
uses
  Vcl.Forms,
  Samples.Delphi.Main in 'src\Samples.Delphi.Main.pas' {FrmMain},
  Delphiscal.Utils in '..\..\src\Util\Delphiscal.Utils.pas',
  DelphiFiscal.Impostos.CST.ICMS00 in '..\..\src\Calculos\CST\DelphiFiscal.Impostos.CST.ICMS00.pas',
  DelphiFiscal.Impostos.CST.ICMS20 in '..\..\src\Calculos\CST\DelphiFiscal.Impostos.CST.ICMS20.pas',
  DelphiFiscal.Impostos.CST.ICMS51 in '..\..\src\Calculos\CST\DelphiFiscal.Impostos.CST.ICMS51.pas',
  DelphiFiscal.Impostos.CST.ICMS10 in '..\..\src\Calculos\CST\DelphiFiscal.Impostos.CST.ICMS10.pas',
  DelphiFiscal.Impostos.CST.ICMS30 in '..\..\src\Calculos\CST\DelphiFiscal.Impostos.CST.ICMS30.pas',
  DelphiFiscal.Impostos.CST.ICMS70 in '..\..\src\Calculos\CST\DelphiFiscal.Impostos.CST.ICMS70.pas',
  DelphiFiscal.Calculos.ST in '..\..\src\Calculos\ST\DelphiFiscal.Calculos.ST.pas',
  DelphiFiscal.Calculos.ICMS in '..\..\src\Calculos\ICMS\DelphiFiscal.Calculos.ICMS.pas',
  DelphiFiscal.Base.Interfaces in '..\..\src\Calculos\DelphiFiscal.Base.Interfaces.pas',
  DelphiFiscal.CST in '..\..\src\Calculos\CST\DelphiFiscal.CST.pas',
  DelphiFiscal.Base in '..\..\src\Calculos\DelphiFiscal.Base.pas',
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
  DelphiFiscal.Impostos.CST.COFINS03 in '..\..\src\Calculos\CST\DelphiFiscal.Impostos.CST.COFINS03.pas',
  DelphiFiscal.Controller.Interfaces in '..\..\src\Controller\DelphiFiscal.Controller.Interfaces.pas',
  DelphiFiscal.Calculos.ST.Interfaces in '..\..\src\Calculos\ST\DelphiFiscal.Calculos.ST.Interfaces.pas',
  DelphiFiscal.Controller in '..\..\src\Controller\DelphiFiscal.Controller.pas',
  DelphiFiscal.Calculos.PIS.Intefaces in '..\..\src\Calculos\PIS\DelphiFiscal.Calculos.PIS.Intefaces.pas',
  DelphiFiscal.Calculos.COFINS.Interfaces in '..\..\src\Calculos\COFINS\DelphiFiscal.Calculos.COFINS.Interfaces.pas',
  DelphiFiscal.Calculos.IPI.Interfaces in '..\..\src\Calculos\IPI\DelphiFiscal.Calculos.IPI.Interfaces.pas',
  DelphiFiscal.Calculos.ICMS.interfaces in '..\..\src\Calculos\ICMS\DelphiFiscal.Calculos.ICMS.interfaces.pas',
  DelphiFiscal.CST.Interfaces in '..\..\src\Calculos\CST\DelphiFiscal.CST.Interfaces.pas';

{$R *.res}
begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := true;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.

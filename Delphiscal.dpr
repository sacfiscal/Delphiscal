program Delphiscal;

uses
  Vcl.Forms,
  UDelphiscal in 'UDelphiscal.pas' {Form1},
  uBaseIcmsProprio in 'Implementacoes\Icms\uBaseIcmsProprio.pas',
  uValorIcms in 'Implementacoes\Icms\uValorIcms.pas',
  uIIcms00 in 'Interfaces\uIIcms00.pas',
  uIcms00 in 'Implementacoes\Icms\uIcms00.pas',
  uIcms20 in 'Implementacoes\Icms\uIcms20.pas',
  uIIcms20 in 'Interfaces\uIIcms20.pas',
  uIIcms51 in 'Interfaces\uIIcms51.pas',
  uIcms51 in 'Implementacoes\Icms\uIcms51.pas',
  uIIcms10 in 'Interfaces\uIIcms10.pas',
  uIcms10 in 'Implementacoes\Icms\uIcms10.pas',
  uBaseIcmsST in 'Implementacoes\Icms\uBaseIcmsST.pas',
  uValorIcmsST in 'Implementacoes\Icms\uValorIcmsST.pas',
  uIIcms70 in 'Interfaces\uIIcms70.pas',
  uIcms70 in 'Implementacoes\Icms\uIcms70.pas',
  uIIcms30 in 'Interfaces\uIIcms30.pas',
  uIcms30 in 'Implementacoes\Icms\uIcms30.pas',
  uIIcms101 in 'Interfaces\uIIcms101.pas',
  uIcms101 in 'Implementacoes\Icms\uIcms101.pas',
  uIIcms201 in 'Interfaces\uIIcms201.pas',
  uIcms201 in 'Implementacoes\Icms\uIcms201.pas',
  uIIcms202_203 in 'Interfaces\uIIcms202_203.pas',
  uIcms202_203 in 'Implementacoes\Icms\uIcms202_203.pas',
  uBaseIpi in 'Implementacoes\Ipi\uBaseIpi.pas',
  uIpi50AdValorem in 'Implementacoes\Ipi\uIpi50AdValorem.pas',
  uIIpi50AdValorem in 'Interfaces\uIIpi50AdValorem.pas',
  uIIpi50Especifico in 'Interfaces\uIIpi50Especifico.pas',
  uIpi50Especifico in 'Implementacoes\Ipi\uIpi50Especifico.pas',
  uIPis01_02 in 'Interfaces\uIPis01_02.pas',
  uIPis03 in 'Interfaces\uIPis03.pas',
  uPis01_02 in 'Implementacoes\Pis\uPis01_02.pas',
  uPis03 in 'Implementacoes\Pis\uPis03.pas',
  uBasePis in 'Implementacoes\Pis\uBasePis.pas',
  uICofins01_02 in 'Interfaces\uICofins01_02.pas',
  uICofins03 in 'Interfaces\uICofins03.pas',
  uCofins01_02 in 'Implementacoes\Cofins\uCofins01_02.pas',
  uCofins03 in 'Implementacoes\Cofins\uCofins03.pas',
  uBaseCofins in 'Implementacoes\Cofins\uBaseCofins.pas';

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := true;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

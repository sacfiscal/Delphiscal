program Delphiscal;

uses
  Vcl.Forms,
  Samples.Delphi.Main in 'src\Samples.Delphi.Main.pas' {FrmMain},
  Delphiscal.Utils in '..\..\src\Delphiscal.Utils.pas';

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := true;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.

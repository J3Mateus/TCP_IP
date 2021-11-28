program Server;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {FrmServer};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmServer, FrmServer);
  Application.Run;
end.

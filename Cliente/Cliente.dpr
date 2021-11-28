program Cliente;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {FrmCliente};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmCliente, FrmCliente);
  Application.Run;
end.

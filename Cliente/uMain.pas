unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin,
  System.Win.ScktComp;

type
  TFrmCliente = class(TForm)
    edt_host: TEdit;
    edt_port: TSpinEdit;
    btn_conectar: TButton;
    btn_parar: TButton;
    mm_log: TMemo;
    edt_msg: TEdit;
    btn_enviar: TButton;
    ClientSocket1: TClientSocket;
    procedure btn_conectarClick(Sender: TObject);
    procedure btn_pararClick(Sender: TObject);
    procedure ClientSocket1Connect(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientSocket1Disconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure btn_enviarClick(Sender: TObject);
    procedure edt_msgKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCliente: TFrmCliente;

implementation

{$R *.dfm}

procedure TFrmCliente.btn_conectarClick(Sender: TObject);
begin
  ClientSocket1.Host := edt_host.Text;
  ClientSocket1.port := edt_port.Value;
  ClientSocket1.Active := True;
end;

procedure TFrmCliente.btn_enviarClick(Sender: TObject);
begin
  ClientSocket1.Socket.SendText(edt_msg.Text);
end;

procedure TFrmCliente.btn_pararClick(Sender: TObject);
begin
  ClientSocket1.Active := False;
end;

procedure TFrmCliente.ClientSocket1Connect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  mm_log.Lines.Add('Conectado')
end;

procedure TFrmCliente.ClientSocket1Disconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  mm_log.Lines.Add('Desconectado')
end;

procedure TFrmCliente.ClientSocket1Read(Sender: TObject;
  Socket: TCustomWinSocket);
begin
    mm_log.Lines.Add(ClientSocket1.Socket.ReceiveText);
end;

procedure TFrmCliente.edt_msgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_RETURN then
      btn_enviarClick(Self)
end;

end.

unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, Vcl.StdCtrls, Vcl.Samples.Spin,
  System.Win.ScktComp;

type
  TFrmServer = class(TForm)
    btn_iniciar: TButton;
    btn_parar: TButton;
    mm_log: TMemo;
    edt_port: TSpinEdit;
    edt_msg: TEdit;
    btn_enviar: TButton;
    ServerSocket1: TServerSocket;
    procedure btn_iniciarClick(Sender: TObject);
    procedure btn_pararClick(Sender: TObject);
    procedure ServerSocket1ClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure btn_enviarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmServer: TFrmServer;

implementation

{$R *.dfm}

procedure TFrmServer.btn_enviarClick(Sender: TObject);
begin
  if ServerSocket1.Socket.ActiveConnections > 0 then
  begin
    ServerSocket1.Socket.Connections[0].SendText(edt_msg.Text);
  end;

end;

procedure TFrmServer.btn_iniciarClick(Sender: TObject);
begin
  ServerSocket1.Port := edt_port.Value;
  ServerSocket1.Active := True;
  mm_log.Lines.Add('Servidor Rodando');
end;

procedure TFrmServer.btn_pararClick(Sender: TObject);
begin
  ServerSocket1.Active := False;
  mm_log.Lines.Add('Servidor Parado');
end;

procedure TFrmServer.ServerSocket1ClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  mm_log.Lines.Add(Socket.RemoteAddress + ':' + IntToStr(Socket.RemotePort));
end;

procedure TFrmServer.ServerSocket1ClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  mm_log.Lines.Add(Socket.RemoteAddress + ':' + IntToStr(Socket.RemotePort));
end;

procedure TFrmServer.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  if ServerSocket1.Socket.ActiveConnections > 0 then
  begin
    ServerSocket1.Socket.Connections[0].SendText('Servidor Mandou : ' +
      ServerSocket1.Socket.Connections[0].ReceiveText);
    mm_log.Lines.Add('O IP ' + Socket.RemoteAddress + ':' +
      IntToStr(Socket.RemotePort));
  end;
end;

end.

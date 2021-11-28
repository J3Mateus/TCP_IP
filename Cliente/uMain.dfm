object FrmCliente: TFrmCliente
  Left = 0
  Top = 0
  Caption = 'Cliente TCP/IP'
  ClientHeight = 279
  ClientWidth = 315
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object edt_host: TEdit
    Left = 8
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '127.0.0.1'
  end
  object edt_port: TSpinEdit
    Left = 8
    Top = 51
    Width = 121
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 1
    Value = 1004
  end
  object btn_conectar: TButton
    Left = 8
    Top = 79
    Width = 75
    Height = 25
    Caption = 'Conectar'
    TabOrder = 2
    OnClick = btn_conectarClick
  end
  object btn_parar: TButton
    Left = 8
    Top = 110
    Width = 75
    Height = 25
    Caption = 'Desconectar'
    TabOrder = 3
    OnClick = btn_pararClick
  end
  object mm_log: TMemo
    Left = 135
    Top = 24
    Width = 169
    Height = 217
    TabOrder = 4
  end
  object edt_msg: TEdit
    Left = 135
    Top = 247
    Width = 169
    Height = 21
    TabOrder = 5
    OnKeyDown = edt_msgKeyDown
  end
  object btn_enviar: TButton
    Left = 8
    Top = 245
    Width = 75
    Height = 25
    Caption = 'Enviar'
    TabOrder = 6
    OnClick = btn_enviarClick
  end
  object ClientSocket1: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnConnect = ClientSocket1Connect
    OnDisconnect = ClientSocket1Disconnect
    OnRead = ClientSocket1Read
    Left = 120
    Top = 176
  end
end

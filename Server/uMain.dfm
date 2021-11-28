object FrmServer: TFrmServer
  Left = 0
  Top = 0
  Caption = 'Server TCP/IP'
  ClientHeight = 401
  ClientWidth = 306
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btn_iniciar: TButton
    Left = 8
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Iniciar'
    TabOrder = 0
    OnClick = btn_iniciarClick
  end
  object btn_parar: TButton
    Left = 8
    Top = 87
    Width = 75
    Height = 25
    Caption = 'Parar'
    TabOrder = 1
    OnClick = btn_pararClick
  end
  object mm_log: TMemo
    Left = 113
    Top = 23
    Width = 185
    Height = 338
    TabOrder = 2
  end
  object edt_port: TSpinEdit
    Left = 8
    Top = 28
    Width = 78
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 3
    Value = 1004
  end
  object edt_msg: TEdit
    Left = 113
    Top = 367
    Width = 183
    Height = 21
    TabOrder = 4
  end
  object btn_enviar: TButton
    Left = 8
    Top = 367
    Width = 99
    Height = 25
    Caption = 'Enviar'
    TabOrder = 5
    OnClick = btn_enviarClick
  end
  object ServerSocket1: TServerSocket
    Active = False
    Port = 0
    ServerType = stNonBlocking
    OnClientConnect = ServerSocket1ClientConnect
    OnClientDisconnect = ServerSocket1ClientDisconnect
    OnClientRead = ServerSocket1ClientRead
    Left = 152
    Top = 144
  end
end

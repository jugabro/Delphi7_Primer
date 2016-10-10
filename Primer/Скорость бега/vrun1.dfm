object Form1: TForm1
  Left = 250
  Top = 217
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1057#1082#1086#1088#1086#1089#1090#1100' '#1073#1077#1075#1072
  ClientHeight = 223
  ClientWidth = 322
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 289
    Height = 41
    AutoSize = False
    Caption = 
      #1055#1088#1086#1075#1088#1072#1084#1084#1072' '#1074#1099#1095#1080#1089#1083#1080#1090' '#1089#1082#1086#1088#1086#1089#1090#1100', '#1089' '#1082#1086#1090#1086#1088#1086#1081' '#1089#1087#1086#1088#1090#1089#1084#1077#1085' '#1087#1088#1086#1073#1077#1078#1072#1083' '#1076#1080#1089#1090#1072#1085 +
      #1094#1080#1102'.'
    WordWrap = True
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 73
    Height = 13
    Caption = #1044#1080#1089#1090#1072#1085#1094#1080#1103' ('#1084')'
  end
  object Label3: TLabel
    Left = 8
    Top = 96
    Width = 83
    Height = 13
    Caption = #1042#1088#1077#1084#1103' ('#1084#1080#1085','#1089#1077#1082')'
  end
  object Label4: TLabel
    Left = 11
    Top = 128
    Width = 189
    Height = 81
    AutoSize = False
    WordWrap = True
  end
  object Edit1: TEdit
    Left = 120
    Top = 56
    Width = 81
    Height = 21
    TabOrder = 0
    OnKeyPress = Edit1KeyPress
  end
  object Edit2: TEdit
    Left = 120
    Top = 88
    Width = 81
    Height = 21
    TabOrder = 1
    OnKeyPress = Edit2KeyPress
  end
  object Button1: TButton
    Left = 224
    Top = 120
    Width = 81
    Height = 25
    Caption = #1042#1099#1095#1080#1089#1083#1080#1090#1100
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 224
    Top = 160
    Width = 81
    Height = 25
    Caption = #1047#1072#1074#1077#1088#1096#1080#1090#1100
    TabOrder = 3
    OnClick = Button2Click
  end
end

object Form1: TForm1
  Left = 243
  Top = 216
  Width = 280
  Height = 190
  Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1087#1086#1082#1091#1087#1082#1080
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
    Left = 8
    Top = 24
    Width = 26
    Height = 13
    Caption = #1062#1077#1085#1072
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 34
    Height = 13
    Caption = #1050#1086#1083'-'#1074#1086
  end
  object Label3: TLabel
    Left = 8
    Top = 88
    Width = 161
    Height = 65
    AutoSize = False
    WordWrap = True
  end
  object Edit1: TEdit
    Left = 48
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
    OnKeyPress = Edit1KeyPress
  end
  object Edit2: TEdit
    Left = 48
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 1
    OnKeyPress = Edit2KeyPress
  end
  object Button1: TButton
    Left = 192
    Top = 48
    Width = 75
    Height = 25
    Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
    TabOrder = 2
    OnClick = Button1Click
  end
end

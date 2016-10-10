object Form1: TForm1
  Left = 313
  Top = 311
  Width = 339
  Height = 283
  Caption = #1047#1072#1087#1080#1089#1100'-'#1076#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1074' '#1092#1072#1081#1083
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 8
    Top = 80
    Width = 313
    Height = 89
    TabOrder = 0
  end
  object Button1: TButton
    Left = 96
    Top = 200
    Width = 75
    Height = 25
    Caption = #1047#1072#1087#1080#1089#1072#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 184
    Top = 200
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 2
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 65
    Top = 32
    Width = 183
    Height = 21
    TabOrder = 3
    Text = 'a:\test.txt'
  end
end

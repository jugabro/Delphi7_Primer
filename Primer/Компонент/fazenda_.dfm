object Form1: TForm1
  Left = 212
  Top = 130
  Width = 304
  Height = 238
  Caption = #1055#1086#1077#1079#1076#1082#1072' '#1085#1072' '#1076#1072#1095#1091
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
    Left = 56
    Top = 16
    Width = 80
    Height = 13
    Caption = #1056#1072#1089#1089#1090#1086#1103#1085#1080#1077', '#1082#1084
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 125
    Height = 13
    Caption = #1062#1077#1085#1072' '#1073#1077#1085#1079#1080#1085#1072' ('#1088#1091#1073'/'#1083#1080#1090#1088')'
  end
  object Label3: TLabel
    Left = 16
    Top = 80
    Width = 115
    Height = 25
    AutoSize = False
    Caption = #1055#1086#1090#1088#1077#1073#1083#1077#1085#1080#1077' '#1073#1077#1085#1079#1080#1085#1072' ('#1083#1080#1090#1088#1086#1074' '#1085#1072' 100 '#1082#1084' )'
    WordWrap = True
  end
  object Label4: TLabel
    Left = 8
    Top = 160
    Width = 209
    Height = 41
    AutoSize = False
    WordWrap = True
  end
  object CheckBox1: TCheckBox
    Left = 16
    Top = 128
    Width = 97
    Height = 17
    Caption = #1090#1091#1076#1072' '#1080' '#1086#1073#1088#1072#1090#1085#1086
    Checked = True
    State = cbChecked
    TabOrder = 0
  end
  object Button1: TButton
    Left = 144
    Top = 120
    Width = 75
    Height = 25
    Caption = #1042#1099#1095#1080#1089#1083#1080#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object NkEdit1: TNkEdit
    Left = 144
    Top = 16
    Width = 73
    Height = 21
    TabOrder = 2
    Text = '0'
    OnKeyPress = NkEdit1KeyPress
  end
  object NkEdit2: TNkEdit
    Left = 144
    Top = 48
    Width = 73
    Height = 21
    TabOrder = 3
    Text = '0'
    OnKeyPress = NkEdit2KeyPress
  end
  object NkEdit3: TNkEdit
    Left = 144
    Top = 80
    Width = 73
    Height = 21
    TabOrder = 4
    Text = '0'
    OnKeyPress = NkEdit3KeyPress
  end
end

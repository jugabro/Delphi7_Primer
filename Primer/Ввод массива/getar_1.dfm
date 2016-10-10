object Form1: TForm1
  Left = 192
  Top = 107
  Width = 397
  Height = 176
  Caption = #1042#1074#1086#1076' '#1080' '#1086#1073#1088#1072#1073#1086#1090#1082#1072' '#1084#1072#1089#1089#1080#1074#1072
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
    Top = 8
    Width = 177
    Height = 17
    AutoSize = False
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1084#1072#1089#1089#1080#1074' '#1076#1088#1086#1073#1085#1099#1093' '#1095#1080#1089#1077#1083
    WordWrap = True
  end
  object Label2: TLabel
    Left = 8
    Top = 96
    Width = 337
    Height = 41
    AutoSize = False
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 32
    Width = 328
    Height = 24
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goTabs]
    TabOrder = 0
    OnKeyPress = StringGrid1KeyPress
  end
  object Button1: TButton
    Left = 8
    Top = 64
    Width = 75
    Height = 25
    Caption = #1042#1099#1095#1080#1089#1083#1080#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
end

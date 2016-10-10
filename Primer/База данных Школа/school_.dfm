object Form1: TForm1
  Left = 192
  Top = 107
  Width = 390
  Height = 275
  Caption = #1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093' '#1064#1082#1086#1083#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 369
    Height = 201
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Fam'
        Title.Caption = #1060#1072#1084#1080#1083#1080#1103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Name'
        Title.Caption = #1048#1084#1103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Class'
        Title.Caption = #1050#1083#1072#1089#1089
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Adr'
        Title.Caption = #1040#1076#1088#1077#1089', '#1090#1077#1083#1077#1092#1086#1085
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 88
    Top = 216
    Width = 240
    Height = 25
    DataSource = DataSource1
    TabOrder = 1
  end
  object Table1: TTable
    DatabaseName = #1064#1082#1086#1083#1072
    TableName = 'school.db'
    Left = 8
    Top = 216
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 48
    Top = 216
  end
  object Query1: TQuery
    SQL.Strings = (
      'SELECT DISTINCT Fam, Name, Class'
      'FROM "DATA:school.db"'
      '(Class = '#39'10a'#39')'
      'ORDER BY Name, Fam')
    Left = 336
    Top = 216
  end
end

object Form4: TForm4
  Left = 0
  Top = 0
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1074#1086#1087#1088#1086#1089#1072
  ClientHeight = 282
  ClientWidth = 465
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 30
    Top = 40
    Width = 35
    Height = 13
    Caption = #1042#1086#1087#1088#1086#1089
  end
  object Label2: TLabel
    Left = 30
    Top = 80
    Width = 41
    Height = 13
    Caption = #1054#1090#1074#1077#1090' 1'
  end
  object Label3: TLabel
    Left = 30
    Top = 107
    Width = 41
    Height = 13
    Caption = #1054#1090#1074#1077#1090' 2'
  end
  object Label4: TLabel
    Left = 30
    Top = 136
    Width = 41
    Height = 13
    Caption = #1054#1090#1074#1077#1090' 3'
  end
  object Label5: TLabel
    Left = 30
    Top = 163
    Width = 41
    Height = 13
    Caption = #1054#1090#1074#1077#1090' 4'
  end
  object Label6: TLabel
    Left = 12
    Top = 190
    Width = 68
    Height = 13
    Caption = #1048#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077
  end
  object Edit1: TEdit
    Left = 88
    Top = 37
    Width = 337
    Height = 21
    AutoSize = False
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 88
    Top = 79
    Width = 337
    Height = 21
    AutoSize = False
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 88
    Top = 106
    Width = 337
    Height = 21
    AutoSize = False
    TabOrder = 2
  end
  object Edit4: TEdit
    Left = 88
    Top = 133
    Width = 337
    Height = 21
    AutoSize = False
    TabOrder = 3
  end
  object Edit5: TEdit
    Left = 88
    Top = 162
    Width = 337
    Height = 21
    AutoSize = False
    TabOrder = 4
  end
  object RadioGroup1: TRadioGroup
    Tag = 1
    Left = 431
    Top = 64
    Width = 26
    Height = 126
    Items.Strings = (
      ''
      ''
      ''
      '')
    TabOrder = 5
  end
  object Button1: TButton
    Left = 192
    Top = 230
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 6
    OnClick = Button1Click
  end
  object Edit6: TEdit
    Left = 86
    Top = 191
    Width = 339
    Height = 21
    TabOrder = 7
    OnClick = Edit6Click
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 376
    Top = 232
  end
end

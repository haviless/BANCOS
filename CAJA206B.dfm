object fBusCli: TfBusCli
  Left = 346
  Top = 177
  BorderStyle = bsDialog
  Caption = 'Busqueda de Cliente'
  ClientHeight = 280
  ClientWidth = 437
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dbgCliente: TwwDBGrid
    Left = 5
    Top = 37
    Width = 428
    Height = 205
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    TabOrder = 0
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
  end
  object searchCliente: TwwIncrementalSearch
    Left = 6
    Top = 9
    Width = 424
    Height = 21
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 7
    Top = 253
    Width = 85
    Height = 25
    Caption = 'Nuevo Cliente'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 359
    Top = 252
    Width = 75
    Height = 25
    Caption = 'Cancela'
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 277
    Top = 253
    Width = 75
    Height = 25
    Caption = 'Acepta'
    TabOrder = 4
    OnClick = BitBtn3Click
  end
end

object FTarjetaCredito: TFTarjetaCredito
  Left = 186
  Top = 123
  Width = 790
  Height = 580
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Tarjetas de Cr'#233'dito'
  Color = clBtnFace
  Constraints.MaxHeight = 580
  Constraints.MaxWidth = 790
  Constraints.MinHeight = 580
  Constraints.MinWidth = 790
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 5
    Width = 769
    Height = 68
    TabOrder = 0
    object bbtnBuscar: TBitBtn
      Left = 684
      Top = 35
      Width = 75
      Height = 25
      Caption = 'Buscar'
      TabOrder = 0
      OnClick = bbtnBuscarClick
    end
  end
  object dbgDetalle: TwwDBGrid
    Left = 7
    Top = 77
    Width = 769
    Height = 419
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    KeyOptions = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
    TabOrder = 1
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = True
    OnTitleButtonClick = dbgDetalleTitleButtonClick
    OnDblClick = dbgDetalleDblClick
    FooterHeight = 25
    object wwDBGrid1IButton: TwwIButton
      Left = 0
      Top = 0
      Width = 30
      Height = 30
      AllowAllUp = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
        07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
        0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
      OnClick = wwDBGrid1IButtonClick
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 501
    Width = 769
    Height = 43
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 15
      Top = 9
      Width = 202
      Height = 25
      Caption = 'Importar Datos de Bancos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
  end
  object sdGraba: TSaveDialog
    DefaultExt = '*.txt'
    FileName = 'c:\oaEjecuta\*.txt'
    Filter = '*.txt  ( Archivo txt )|*.txt|*.*   ( Todos )|*.*'
    Title = 'Cabecera de Contabilidad'
    Left = 238
    Top = 509
  end
  object scData: TStrContainer
    Left = 277
    Top = 509
  end
end

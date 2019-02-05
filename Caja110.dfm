object FTipoCambio: TFTipoCambio
  Left = 349
  Top = 324
  Width = 640
  Height = 440
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Tipo de Cambio'
  Color = clBtnFace
  Constraints.MaxHeight = 440
  Constraints.MaxWidth = 640
  Constraints.MinHeight = 440
  Constraints.MinWidth = 640
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object lblTCambio: TLabel
    Left = 205
    Top = 1
    Width = 215
    Height = 40
    Caption = 'Tipo de Cambio'
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -29
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object dbgData: TwwDBGrid
    Left = 10
    Top = 43
    Width = 610
    Height = 287
    DisableThemesInTitle = False
    Selected.Strings = (
      'FECHA'#9'15'#9'Fecha'#9'F'
      'TMONID'#9'8'#9'Moneda'#9'F'
      'TCAMVBC'#9'15'#9'Tipo Cambio~Compra'#9'F'
      'TCAMVBV'#9'15'#9'Tipo cambio~Venta'#9'F')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = DMTE.dsTransBCO
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    KeyOptions = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    ParentFont = False
    TabOrder = 0
    TitleAlignment = taCenter
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clNavy
    TitleFont.Height = -13
    TitleFont.Name = 'Comic Sans MS'
    TitleFont.Style = [fsBold]
    TitleLines = 3
    TitleButtons = False
    OnDblClick = dbgDataDblClick
    object wwDBGrid1IButton: TwwIButton
      Left = 0
      Top = 0
      Width = 40
      Height = 50
      AllowAllUp = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
        0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
        33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
      OnClick = wwDBGrid1IButtonClick
    end
  end
  object pnlMant: TPanel
    Left = 10
    Top = 334
    Width = 610
    Height = 68
    Color = clGray
    TabOrder = 1
    Visible = False
    object Label2: TLabel
      Left = 229
      Top = 5
      Width = 109
      Height = 23
      Caption = 'Precio Compra'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 380
      Top = 5
      Width = 98
      Height = 23
      Caption = 'Precio Venta'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbeMontoPC: TwwDBEdit
      Left = 223
      Top = 29
      Width = 120
      Height = 26
      DataField = 'TCAMVBC'
      DataSource = DMTE.dsTransBCO
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeMontoPV: TwwDBEdit
      Left = 371
      Top = 29
      Width = 120
      Height = 26
      DataField = 'TCAMVBV'
      DataSource = DMTE.dsTransBCO
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object bbtnGrabar: TBitBtn
      Left = 523
      Top = 5
      Width = 75
      Height = 29
      Caption = 'Grabar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = bbtnGrabarClick
    end
    object pnlFec: TPanel
      Left = 9
      Top = 3
      Width = 204
      Height = 60
      BevelOuter = bvNone
      Color = clGray
      TabOrder = 0
      object Label1: TLabel
        Left = 75
        Top = 4
        Width = 45
        Height = 23
        Caption = 'Fecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dtpFecha: TwwDBDateTimePicker
        Left = 34
        Top = 27
        Width = 138
        Height = 26
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        DataField = 'FECHA'
        DataSource = DMTE.dsTransBCO
        Epoch = 1950
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        ShowButton = True
        TabOrder = 0
      end
    end
    object bbtnCerrar: TBitBtn
      Left = 523
      Top = 37
      Width = 75
      Height = 29
      Caption = 'Cerrar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = bbtnCerrarClick
    end
  end
end

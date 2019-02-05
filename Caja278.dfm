object FPromotorBusca: TFPromotorBusca
  Left = 290
  Top = 176
  Width = 600
  Height = 464
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Copiar Orden de pago'
  Color = 12904163
  Constraints.MaxHeight = 464
  Constraints.MaxWidth = 600
  Constraints.MinHeight = 464
  Constraints.MinWidth = 600
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
  object dbgCab: TwwDBGrid
    Left = 7
    Top = 5
    Width = 169
    Height = 420
    DisableThemesInTitle = False
    Selected.Strings = (
      'NUMERO'#9'8'#9'N'#186' Orden~Pago'
      'FECHA'#9'12'#9'Fecha')
    IniAttributes.Delimiter = ';;'
    TitleColor = 10207162
    OnRowChanged = dbgCabRowChanged
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = DMTE.dsQry6
    KeyOptions = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    TabOrder = 0
    TitleAlignment = taCenter
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = False
    OnDblClick = dbgCabDblClick
  end
  object dbgDet: TwwDBGrid
    Left = 186
    Top = 75
    Width = 399
    Height = 323
    DisableThemesInTitle = False
    Selected.Strings = (
      'ITEM'#9'4'#9'N'#186'~Item'
      'AUXID'#9'7'#9'C'#243'digo'
      'AUXOBS'#9'38'#9'Nombre'
      'MONTO'#9'08'#9'Asignado')
    IniAttributes.Delimiter = ';;'
    TitleColor = 10207162
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = DMTE.dsQry7
    KeyOptions = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    TabOrder = 1
    TitleAlignment = taCenter
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = False
  end
  object Panel1: TPanel
    Left = 186
    Top = 5
    Width = 399
    Height = 64
    Color = 10207162
    Enabled = False
    TabOrder = 2
    object Label1: TLabel
      Left = 20
      Top = 7
      Width = 50
      Height = 16
      Caption = 'Concepto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 110
      Top = 7
      Width = 70
      Height = 16
      Caption = 'Observaci'#243'n'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 319
      Top = 7
      Width = 43
      Height = 16
      Caption = 'Usuario'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbeCpto: TwwDBEdit
      Left = 20
      Top = 26
      Width = 57
      Height = 21
      DataField = 'CPTOID'
      DataSource = DMTE.dsQry6
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeObserva: TwwDBEdit
      Left = 91
      Top = 26
      Width = 198
      Height = 21
      DataField = 'OBSERVA'
      DataSource = DMTE.dsQry6
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit1: TwwDBEdit
      Left = 300
      Top = 26
      Width = 87
      Height = 21
      DataField = 'USUARIO'
      DataSource = DMTE.dsQry6
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  object BitBtn1: TBitBtn
    Left = 394
    Top = 404
    Width = 100
    Height = 25
    Caption = 'Seleccionar'
    TabOrder = 3
    OnClick = BitBtn1Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
      300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
      330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
      333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
      339977FF777777773377000BFB03333333337773FF733333333F333000333333
      3300333777333333337733333333333333003333333333333377333333333333
      333333333333333333FF33333333333330003333333333333777333333333333
      3000333333333333377733333333333333333333333333333333}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 510
    Top = 404
    Width = 75
    Height = 25
    Caption = '&Close'
    TabOrder = 4
    OnClick = BitBtn2Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
      F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
      000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
      338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
      45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
      3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
      F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
      000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
      338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
      4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
      8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
      333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
      0000}
    NumGlyphs = 2
  end
end

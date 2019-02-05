object FMntBco: TFMntBco
  Left = 227
  Top = 129
  BorderStyle = bsDialog
  Caption = 'Mantenimiento Plantilla de Bancos'
  ClientHeight = 477
  ClientWidth = 638
  Color = 12904163
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
  object gbHEADER: TGroupBox
    Left = 3
    Top = 3
    Width = 631
    Height = 107
    Caption = 'Selecci'#243'n de Bancos'
    Color = 10207162
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object Label9: TLabel
      Left = 13
      Top = 21
      Width = 31
      Height = 15
      Caption = 'Banco'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 6
      Top = 64
      Width = 619
      Height = 8
      Shape = bsTopLine
    end
    object dblcBanco: TwwDBLookupCombo
      Left = 13
      Top = 38
      Width = 59
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'BANCOID'#9'3'#9'C'#243'digo'#9'F'
        'BANCONOM'#9'40'#9'Descripci'#243'n'#9'F'
        'BANCOABR'#9'15'#9'Abreviatura'#9'F')
      LookupTable = DMTE.cdsBanco
      LookupField = 'BANCOID'
      Options = [loColLines, loTitles]
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnChange = dblcBancoChange
      OnExit = dblcExist
      OnNotInList = dblcNotInList
    end
    object dbeBanco: TwwDBEdit
      Left = 75
      Top = 38
      Width = 542
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object Z2bbtnPrint: TBitBtn
      Left = 586
      Top = 70
      Width = 32
      Height = 32
      Hint = 'Aceptar...'
      Default = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = Z2bbtnPrintClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object pnlFOOT: TPanel
    Left = 0
    Top = 428
    Width = 638
    Height = 49
    Align = alBottom
    BevelOuter = bvNone
    Color = 10207162
    TabOrder = 1
    object Bevel3: TBevel
      Left = 2
      Top = 3
      Width = 350
      Height = 44
      Shape = bsFrame
    end
    object Label7: TLabel
      Left = 55
      Top = 12
      Width = 245
      Height = 26
      Caption = 
        'Presione el Bot'#243'n "Nueva Plantilla" para crear una  plantilla. S' +
        'e crea una plantilla por Banco'
      WordWrap = True
    end
    object pnlPie: TPanel
      Left = 377
      Top = 3
      Width = 257
      Height = 44
      Color = 10207162
      Enabled = False
      TabOrder = 0
      object BitBtn2: TBitBtn
        Left = 220
        Top = 7
        Width = 32
        Height = 32
        Hint = 'Imprimir'
        Default = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
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
      object z2bbtnNuevo: TBitBtn
        Left = 184
        Top = 7
        Width = 32
        Height = 32
        Hint = 'Nueva Plantilla'
        Cancel = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = z2bbtnNuevoClick
        Glyph.Data = {
          96010000424D9601000000000000760000002800000017000000180000000100
          04000000000020010000CE0E0000D80E00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00BBBBBBBBBBBB
          BBBBBBBBBBB08887777777777777777778B08800000000000000000078B0880F
          FFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF0
          78B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFF
          FFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880F
          FFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF0
          78B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFF
          FF00000078B0880FFFFFFFFFFF0FF88088B0880FFFFFFFFFFF0F880888B0880F
          FFFFFFFFFF08808888B0880FFFFFFFFFFF08088888B088000000000000008888
          88B08888888888888888888888B08888888888888888888888B0}
      end
      object z2bbtnCacelUp: TBitBtn
        Left = 146
        Top = 7
        Width = 32
        Height = 32
        Hint = 'Cancela Actualizaciones'
        Cancel = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = z2bbtnCacelUpClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333000033338833333333333333333F333333333333
          0000333911833333983333333388F333333F3333000033391118333911833333
          38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
          911118111118333338F3338F833338F3000033333911111111833333338F3338
          3333F8330000333333911111183333333338F333333F83330000333333311111
          8333333333338F3333383333000033333339111183333333333338F333833333
          00003333339111118333333333333833338F3333000033333911181118333333
          33338333338F333300003333911183911183333333383338F338F33300003333
          9118333911183333338F33838F338F33000033333913333391113333338FF833
          38F338F300003333333333333919333333388333338FFF830000333333333333
          3333333333333333333888330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
      object Z2bbtnGraba: TBitBtn
        Left = 109
        Top = 7
        Width = 32
        Height = 32
        Hint = 'Grabar Cambios'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = Z2bbtnGrabaClick
        Glyph.Data = {
          8A010000424D8A01000000000000760000002800000017000000170000000100
          0400000000001401000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333303000077777777777770003300000078888888888880000300000
          0780088888888800003000000780088888888800003000000780088888888800
          0030000007888888888888000030000000000000000000000030000000000000
          0000000000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000
          FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF00
          00300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFF
          FFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000
          FFFFFFFFFFFFFF07703000009999999999999907703000009999999999999900
          0030300099999999999999000330}
      end
      object Z2bbtnImp: TBitBtn
        Left = 71
        Top = 7
        Width = 32
        Height = 32
        Hint = 'Imprimir'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = Z2bbtnImpClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          0003377777777777777308888888888888807F33333333333337088888888888
          88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
          8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
          8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
      end
    end
  end
  object dbgPBCO: TwwDBGrid
    Left = 0
    Top = 114
    Width = 638
    Height = 314
    DisableThemesInTitle = False
    Selected.Strings = (
      'BANCOID'#9'2'#9'Banco'
      'ESID'#9'3'#9'Item'
      'ESDES'#9'30'#9'Descripci'#243'n'
      'ESINI'#9'10'#9'Col.~Inicio'#9'F'
      'ESFIN'#9'10'#9'Col.~Fin')
    IniAttributes.Delimiter = ';;'
    TitleColor = 10207162
    FixedCols = 0
    ShowHorzScrollBar = True
    Align = alBottom
    Color = 14811135
    Ctl3D = True
    DataSource = DMTE.dsTransBCO
    Enabled = False
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    ParentCtl3D = False
    TabOrder = 2
    TitleAlignment = taCenter
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = False
    OnDblClick = dbgPBCODblClick
    object dbgPBCOBTN: TwwIButton
      Left = 0
      Top = 0
      Width = 26
      Height = 30
      AllowAllUp = True
      Glyph.Data = {
        96010000424D9601000000000000760000002800000017000000180000000100
        04000000000020010000CE0E0000D80E00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00BBBBBBBBBBBB
        BBBBBBBBBBB08887777777777777777778B08800000000000000000078B0880F
        FFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF0
        78B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFF
        FFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880F
        FFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF0
        78B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFF
        FF00000078B0880FFFFFFFFFFF0FF88088B0880FFFFFFFFFFF0F880888B0880F
        FFFFFFFFFF08808888B0880FFFFFFFFFFF08088888B088000000000000008888
        88B08888888888888888888888B08888888888888888888888B0}
      OnClick = dbgPBCOBTNClick
    end
  end
  object pnlActItm: TPanel
    Left = 162
    Top = 165
    Width = 339
    Height = 236
    Color = 10207162
    TabOrder = 3
    Visible = False
    object Bevel4: TBevel
      Left = 3
      Top = 20
      Width = 331
      Height = 168
      Shape = bsFrame
    end
    object Bevel2: TBevel
      Left = 12
      Top = 86
      Width = 309
      Height = 7
      Shape = bsTopLine
    end
    object Label1: TLabel
      Left = 15
      Top = 32
      Width = 35
      Height = 13
      Caption = 'N'#186' Item'
    end
    object Label2: TLabel
      Left = 75
      Top = 33
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object Label3: TLabel
      Left = 17
      Top = 98
      Width = 46
      Height = 13
      Caption = 'Col. Inicio'
    end
    object Label4: TLabel
      Left = 73
      Top = 98
      Width = 43
      Height = 13
      Caption = 'Col. Final'
    end
    object Label5: TLabel
      Left = 137
      Top = 98
      Width = 56
      Height = 13
      Caption = 'Equivalente'
    end
    object Label6: TLabel
      Left = 24
      Top = 80
      Width = 46
      Height = 13
      Caption = 'Columnas'
    end
    object Label8: TLabel
      Left = 15
      Top = 146
      Width = 75
      Height = 13
      Caption = 'Formato Recibo'
    end
    object Panel4: TPanel
      Left = 3
      Top = 3
      Width = 332
      Height = 21
      BevelOuter = bvLowered
      Caption = 'Actualizaci'#243'n  de Items'
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Locked = True
      ParentFont = False
      TabOrder = 0
    end
    object z2bbtnOkCono: TBitBtn
      Left = 264
      Top = 194
      Width = 32
      Height = 31
      Hint = 'Insertar'
      Default = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = z2bbtnOkConoClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object z2bbtnCancelCono: TBitBtn
      Left = 301
      Top = 194
      Width = 32
      Height = 31
      Hint = 'Cancela Actualizaciones'
      Cancel = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = z2bbtnCancelConoClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object dbITEM: TwwDBEdit
      Left = 15
      Top = 48
      Width = 57
      Height = 21
      CharCase = ecUpperCase
      Color = clInfoBk
      Ctl3D = True
      Enabled = False
      ParentCtl3D = False
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeDESC: TwwDBEdit
      Left = 75
      Top = 48
      Width = 249
      Height = 21
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbseINI: TwwDBSpinEdit
      Left = 15
      Top = 115
      Width = 57
      Height = 21
      Increment = 1.000000000000000000
      MaxValue = 255.000000000000000000
      Ctl3D = True
      ParentCtl3D = False
      Picture.PictureMask = '#*#'
      TabOrder = 3
      UnboundDataType = wwDefault
    end
    object dbseFIN: TwwDBSpinEdit
      Left = 75
      Top = 115
      Width = 57
      Height = 21
      Increment = 1.000000000000000000
      MaxValue = 255.000000000000000000
      Picture.PictureMask = '#*#'
      TabOrder = 4
      UnboundDataType = wwDefault
      OnExit = dbseFINExit
    end
    object dblcdEquiv: TwwDBLookupComboDlg
      Left = 138
      Top = 115
      Width = 188
      Height = 21
      AutoSize = False
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'DESCRIPCION'#9'30'#9'DESCRIPCION'#9'F')
      LookupTable = DMTE.cdsQry3
      LookupField = 'DESCRIPCION'
      AutoSelect = False
      TabOrder = 5
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnExit = dblcdEquivExit
    end
    object dbeFormat: TwwDBEdit
      Left = 15
      Top = 160
      Width = 146
      Height = 21
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 8
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  object ppdbpPlantilla: TppDBPipeline
    DataSource = DMTE.dsTransBCO
    UserName = 'dbpPlantilla'
    Left = 218
    Top = 349
  end
  object pprptPlantilla: TppReport
    AutoStop = False
    DataPipeline = ppdbpPlantilla
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\SOLCaja\SolFormatos\Plantilla.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 314
    Top = 349
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbpPlantilla'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 20638
      mmPrintPosition = 0
      object pplblBanco: TppLabel
        UserName = 'lblBanco'
        Caption = 'Banco :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1588
        mmTop = 7938
        mmWidth = 11906
        BandType = 0
      end
      object pplblTitulo: TppLabel
        UserName = 'lblTitulo'
        Caption = 'Plantilla de Bancos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 85725
        mmTop = 1058
        mmWidth = 32544
        BandType = 0
      end
      object pplblFecha: TppLabel
        UserName = 'lblFecha'
        Caption = 'Fecha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 168540
        mmTop = 7938
        mmWidth = 9525
        BandType = 0
      end
      object ppsvFecha: TppSystemVariable
        UserName = 'svFecha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 180975
        mmTop = 7673
        mmWidth = 16933
        BandType = 0
      end
      object ppsvPag: TppSystemVariable
        UserName = 'svPag'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 180975
        mmTop = 1058
        mmWidth = 1852
        BandType = 0
      end
      object pplblPag: TppLabel
        UserName = 'lblPag'
        Caption = 'Pag.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 168540
        mmTop = 1058
        mmWidth = 7144
        BandType = 0
      end
      object pplblItem: TppLabel
        UserName = 'lblItem'
        Caption = 'Item'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 13494
        mmTop = 14288
        mmWidth = 6615
        BandType = 0
      end
      object pplblDescripcion: TppLabel
        UserName = 'lblDescripcion'
        Caption = 'Descripci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 26723
        mmTop = 14288
        mmWidth = 17992
        BandType = 0
      end
      object pplblInicio: TppLabel
        UserName = 'lblInicio'
        AutoSize = False
        Caption = 'C.I.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 142611
        mmTop = 14288
        mmWidth = 7938
        BandType = 0
      end
      object pplblFin: TppLabel
        UserName = 'lblFin'
        AutoSize = False
        Caption = 'C.F.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 153459
        mmTop = 14288
        mmWidth = 7938
        BandType = 0
      end
      object pplblFormato: TppLabel
        UserName = 'lblFormato'
        Caption = 'Formato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 164042
        mmTop = 14288
        mmWidth = 12700
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 1000
        mmLeft = 11113
        mmTop = 19579
        mmWidth = 188913
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppdbtItem: TppDBText
        UserName = 'dbtItem'
        DataField = 'ESID'
        DataPipeline = ppdbpPlantilla
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbpPlantilla'
        mmHeight = 4233
        mmLeft = 13494
        mmTop = 794
        mmWidth = 10583
        BandType = 4
      end
      object ppdbtDescripcion: TppDBText
        UserName = 'dbtDescripcion'
        DataField = 'ESDES'
        DataPipeline = ppdbpPlantilla
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbpPlantilla'
        mmHeight = 4233
        mmLeft = 26723
        mmTop = 794
        mmWidth = 114565
        BandType = 4
      end
      object ppdbtInicio: TppDBText
        UserName = 'dbtInicio'
        DataField = 'ESINI'
        DataPipeline = ppdbpPlantilla
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbpPlantilla'
        mmHeight = 4233
        mmLeft = 142875
        mmTop = 794
        mmWidth = 7938
        BandType = 4
      end
      object ppdbtFin: TppDBText
        UserName = 'dbtFin'
        DataField = 'ESFIN'
        DataPipeline = ppdbpPlantilla
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbpPlantilla'
        mmHeight = 4233
        mmLeft = 153723
        mmTop = 794
        mmWidth = 7938
        BandType = 4
      end
      object ppdbtFormato: TppDBText
        UserName = 'dbtFormato'
        DataField = 'ESFORMAT'
        DataPipeline = ppdbpPlantilla
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbpPlantilla'
        mmHeight = 4233
        mmLeft = 164042
        mmTop = 794
        mmWidth = 35454
        BandType = 4
      end
    end
  end
end

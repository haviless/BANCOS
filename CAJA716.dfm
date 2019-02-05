object FConsCheques: TFConsCheques
  Left = 373
  Top = 235
  Width = 306
  Height = 397
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Consulta de Cheques'
  Color = clBtnFace
  Constraints.MaxHeight = 397
  Constraints.MaxWidth = 306
  Constraints.MinHeight = 390
  Constraints.MinWidth = 306
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
  object pnl: TPanel
    Left = 0
    Top = 0
    Width = 298
    Height = 363
    Align = alClient
    Color = 14869218
    Constraints.MaxHeight = 363
    Constraints.MaxWidth = 298
    Constraints.MinHeight = 363
    Constraints.MinWidth = 298
    TabOrder = 0
    object sbDisenoRep: TSpeedButton
      Left = 2
      Top = 328
      Width = 9
      Height = 22
      Flat = True
      OnClick = sbDisenoRepClick
    end
    object Z2bbtnPrint: TBitBtn
      Left = 14
      Top = 318
      Width = 36
      Height = 36
      Hint = 'Imprimir Cheques Emitidos'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      Visible = False
      OnClick = Z2bbtnPrintClick
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
    object grbBCO: TGroupBox
      Left = 12
      Top = 188
      Width = 272
      Height = 117
      Caption = 'Banco'
      Color = 14869218
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 2
      object Label3: TLabel
        Left = 19
        Top = 65
        Width = 48
        Height = 14
        Caption = 'Cta.Cte'
      end
      object dblcBanco: TwwDBLookupCombo
        Left = 17
        Top = 31
        Width = 50
        Height = 21
        Hint = 'Banco'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'BANCOID'#9'3'#9'C'#243'digo'#9'F'
          'BANCONOM'#9'40'#9'Descripci'#243'n'#9'F'
          'BANCOABR'#9'15'#9'Abreviatura'#9'F')
        LookupTable = DMTE.cdsBanco
        LookupField = 'BANCOID'
        Options = [loColLines, loTitles]
        ParentFont = False
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcBancoExit
      end
      object edtBanco: TwwDBEdit
        Left = 68
        Top = 31
        Width = 183
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dblcCCBco: TwwDBLookupCombo
        Left = 17
        Top = 80
        Width = 208
        Height = 21
        Hint = 'Cuenta Corriente'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CCBCOID'#9'30'#9'C'#243'digo'#9'F'
          'CCBCODES'#9'40'#9'Descripci'#243'n'#9'F')
        LookupTable = DMTE.cdsCCBco
        LookupField = 'CCBCOID'
        Options = [loColLines, loTitles]
        ParentFont = False
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
      end
    end
    object gbCia: TGroupBox
      Left = 12
      Top = 7
      Width = 272
      Height = 63
      Caption = 'Compa'#241'ia'
      Color = 14869218
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      object dblcCIA: TwwDBLookupCombo
        Left = 17
        Top = 28
        Width = 48
        Height = 21
        Hint = 'Compa'#241#237'a'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CIAID'#9'2'#9'C'#243'digo'#9'F'
          'CIADES'#9'40'#9'Descripci'#243'n'#9'F'
          'CIAABR'#9'15'#9'Abreviatura'#9'F')
        LookupTable = DMTE.cdsCia
        LookupField = 'CIAID'
        Options = [loColLines, loTitles]
        ParentFont = False
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcCIAExit
        OnNotInList = dblcCIANotInList
      end
      object dbeCIA: TwwDBEdit
        Left = 66
        Top = 28
        Width = 186
        Height = 21
        CharCase = ecUpperCase
        Color = clBtnFace
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object bbtnChqAnu: TBitBtn
      Left = 153
      Top = 318
      Width = 130
      Height = 36
      Hint = 'Imprimir Cheques Anulados'
      Caption = 'Cheques Anulado'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = bbtnChqAnuClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
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
    object gbFecha: TGroupBox
      Left = 12
      Top = 88
      Width = 272
      Height = 76
      Caption = 'Fecha'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Label1: TLabel
        Left = 37
        Top = 26
        Width = 41
        Height = 14
        Caption = 'Inicial'
      end
      object Label2: TLabel
        Left = 179
        Top = 26
        Width = 32
        Height = 14
        Caption = 'Final'
      end
      object dtpDesde: TwwDBDateTimePicker
        Left = 17
        Top = 42
        Width = 100
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Epoch = 1950
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 0
      end
      object dtpHasta: TwwDBDateTimePicker
        Left = 154
        Top = 42
        Width = 100
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Epoch = 1950
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 1
      end
    end
    object bbtnCheques: TBitBtn
      Left = 29
      Top = 318
      Width = 81
      Height = 36
      Hint = 'Imprimir Cheques Anulados'
      Caption = 'Cheques'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      Visible = False
      OnClick = bbtnChequesClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
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
    object bbtnExcel: TBitBtn
      Left = 111
      Top = 318
      Width = 35
      Height = 36
      TabOrder = 6
      Visible = False
      OnClick = bbtnExcelClick
      Glyph.Data = {
        16080000424D160800000000000036000000280000001B000000180000000100
        180000000000E0070000C40E0000C40E00000000000000000000B0A7BCB0A7BC
        B0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7
        BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0
        A7BCB0A7BCB0A7BCB0A7BC000000B0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BC
        B0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7
        BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BC000000B0A7BCB0A7BCB0A7BCB0A7BC00
        0000B0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BC
        B0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7
        BC000000000000B0A7BCB0A7BCB0A7BCB0A7BC000000B0A7BCB0A7BCB0A7BCB0
        A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BC
        B0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BC0000000000000000000000000000
        00B0A7BCB0A7BC000000B0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0
        A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BC
        B0A7BCB0A7BCB0A7BC000000000000B0A7BCB0A7BC000000B0A7BC000000B0A7
        BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0
        A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BC000000B0A7BCB0A7BC
        000000B0A7BCB0A7BCB0A7BC000000000000B0A7BC0080008080800080008080
        8000800080808000800080808000800080808000800080808000800080808000
        8000808080B0A7BC000000B0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BC
        000000000000B0A7BC8080800080008080800080008080800080008080800080
        00808080008000808080008000808080008000808080008000B0A7BC000000B0
        A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BC000000000000B0A7BC008000
        808080B0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7
        BCB0A7BCB0A7BC008000808080B0A7BC000000B0A7BCB0A7BCB0A7BCB0A7BCB0
        A7BCB0A7BCB0A7BC000000000000B0A7BC808080008000B0A7BCB0A7BCB0A7BC
        B0A7BCB0A7BCB0A7BCB0A7BC8080800080008080800080008080808080800080
        00B0A7BC000000B0A7BCB0A7BCB0A7BC000000B0A7BCB0A7BC000000B0A7BC00
        0000B0A7BC008000808080B0A7BC008000808080008000808080008000808080
        008000B0A7BC008000808080008000008000808080B0A7BCB0A7BC000000B0A7
        BCB0A7BC000000000000B0A7BCB0A7BCB0A7BC000000B0A7BC808080008000B0
        A7BC808080008000808080008000808080008000B0A7BC008000808080008000
        B0A7BC808080008000B0A7BCB0A7BCB0A7BC0000000000000000000000000000
        00B0A7BCB0A7BC000000B0A7BC008000808080B0A7BC00800080808000800080
        8080008000B0A7BC008000808080008000808080B0A7BC008000808080B0A7BC
        B0A7BCB0A7BCB0A7BCB0A7BC000000000000B0A7BCB0A7BCB0A7BC000000B0A7
        BC808080008000B0A7BCB0A7BC008000808080008000B0A7BC00800080808000
        8000808080008000B0A7BC808080008000B0A7BCB0A7BCB0A7BCB0A7BCB0A7BC
        000000B0A7BCB0A7BCB0A7BCB0A7BC000000B0A7BC008000808080B0A7BCB0A7
        BCB0A7BC008000B0A7BC008000808080008000808080B0A7BCB0A7BCB0A7BC00
        8000808080B0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BC
        B0A7BC000000B0A7BC808080008000B0A7BCB0A7BC008000B0A7BC0080008080
        80008000808080008000808080B0A7BCB0A7BC808080008000B0A7BCB0A7BCB0
        A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BC000000B0A7BC008000
        808080B0A7BC008000B0A7BC0080008080800080008080800080008080800080
        00808080B0A7BC008000808080B0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0
        A7BCB0A7BCB0A7BCB0A7BC000000B0A7BC808080008000B0A7BC808080008000
        808080008000808080B0A7BC808080008000808080008000B0A7BC8080800080
        00B0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BC00
        0000B0A7BC008000808080B0A7BC008000808080008000808080B0A7BCB0A7BC
        B0A7BC808080008000808080B0A7BC008000808080B0A7BCB0A7BCB0A7BCB0A7
        BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BC000000B0A7BC808080008000B0
        A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BC
        B0A7BC808080008000B0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7
        BCB0A7BCB0A7BC000000B0A7BC00800080808000800080808000800080808000
        8000808080008000808080008000808080008000808080008000808080B0A7BC
        B0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BC000000B0A7
        BC80808000800080808000800080808000800080808000800080808000800080
        8080008000808080008000808080008000B0A7BCB0A7BCB0A7BCB0A7BCB0A7BC
        B0A7BCB0A7BCB0A7BCB0A7BCB0A7BC000000B0A7BCB0A7BCB0A7BCB0A7BCB0A7
        BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0
        A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BC
        B0A7BC000000B0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7
        BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0
        A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BC000000}
      Margin = 2
    end
    object cbDisenoRep: TCheckBox
      Left = 154
      Top = 304
      Width = 97
      Height = 17
      Caption = 'cbDisenoRep'
      Enabled = False
      TabOrder = 7
      Visible = False
    end
  end
  object ppdbPagoProv: TppDBPipeline
    UserName = 'dbPagoProv'
    Left = 144
    Top = 216
  end
  object pprPagoProv: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'rChqEmitidos'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 225000
    PrinterSetup.PaperSize = 256
    Template.FileName = 'C:\oaEjecuta\RTMS\CAJA\Dema\ConsultaCheques.rtm'
    Units = utMillimeters
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 176
    Top = 216
    Version = '7.02'
    mmColumnWidth = 0
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 16140
      mmPrintPosition = 0
      object pplblCiaC: TppLabel
        UserName = 'lblCiaDes1'
        Caption = 'Nombre de la compa'#241'ia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 529
        mmWidth = 32279
        BandType = 1
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'CHEQUES EMITIDOS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 86519
        mmTop = 1058
        mmWidth = 29898
        BandType = 1
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageNoDesc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 175419
        mmTop = 794
        mmWidth = 11906
        BandType = 1
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 175155
        mmTop = 5556
        mmWidth = 14288
        BandType = 1
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable4'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 173302
        mmTop = 10319
        mmWidth = 17198
        BandType = 1
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 794
        mmTop = 14817
        mmWidth = 197380
        BandType = 1
      end
      object pplblDel: TppLabel
        UserName = 'lblDel'
        Caption = 'Del'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 72231
        mmTop = 6085
        mmWidth = 4763
        BandType = 1
      end
      object pplblAl: TppLabel
        UserName = 'lblAl'
        Caption = 'al'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 105569
        mmTop = 6085
        mmWidth = 2646
        BandType = 1
      end
      object pplblFechaIni: TppLabel
        UserName = 'lblFechaIni'
        Caption = 'lblFechaIni'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 79904
        mmTop = 6085
        mmWidth = 15610
        BandType = 1
      end
      object pplblFechaFin: TppLabel
        UserName = 'lblFechaFin'
        Caption = 'lblFechaFin'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 110861
        mmTop = 6085
        mmWidth = 16140
        BandType = 1
      end
    end
    object ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 14288
      mmPrintPosition = 0
      object ppdbtFechaS: TppDBText
        UserName = 'dbtFechaS'
        DataField = 'ECFEMICH'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 32015
        mmTop = 2381
        mmWidth = 15081
        BandType = 4
      end
      object ppdbtGiradoS: TppDBText
        UserName = 'dbtGiradoS'
        DataField = 'ECGIRA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 47890
        mmTop = 2381
        mmWidth = 46302
        BandType = 4
      end
      object ppdbtGlosaS: TppDBText
        UserName = 'dbtGlosaS'
        DataField = 'ECGLOSA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 95250
        mmTop = 2381
        mmWidth = 60061
        BandType = 4
      end
      object ppdbtChequeS: TppDBText
        UserName = 'dbtChequeS'
        DataField = 'ECNOCHQ'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 156369
        mmTop = 2381
        mmWidth = 19050
        BandType = 4
      end
      object ppdbtMonedaS: TppDBText
        UserName = 'dbtMonedaS'
        DataField = 'TMONABR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 176477
        mmTop = 2381
        mmWidth = 5292
        BandType = 4
      end
      object ppdbtMontoS: TppDBText
        UserName = 'dbtMontoS'
        DataField = 'ECMTOORI'
        DisplayFormat = '#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 182827
        mmTop = 2381
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'dbtCorreD1'
        DataField = 'ITEM'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 2381
        mmWidth = 6879
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText1'
        DataField = 'ECNOCOMP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 14552
        mmTop = 2381
        mmWidth = 16669
        BandType = 4
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 794
        mmTop = 529
        mmWidth = 197380
        BandType = 7
      end
      object pplblTotalS: TppLabel
        UserName = 'lblTotalS'
        Caption = 'Total  en '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 124354
        mmTop = 2117
        mmWidth = 12171
        BandType = 7
      end
      object pplblTotalD: TppLabel
        UserName = 'lblTotalD'
        Caption = 'Total  en '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 124354
        mmTop = 7144
        mmWidth = 12171
        BandType = 7
      end
      object pplblTMontoS: TppLabel
        UserName = 'lblTMontoS'
        Caption = 'lblTMontoS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 179652
        mmTop = 2117
        mmWidth = 15875
        BandType = 7
      end
      object pplblTMontoD: TppLabel
        UserName = 'lblTMontoD'
        Caption = 'lblTMontoD'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 179652
        mmTop = 7144
        mmWidth = 16140
        BandType = 7
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppd1: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = pprPagoProv
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 209
    Top = 216
  end
end

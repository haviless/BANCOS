object FArqueoCajaP: TFArqueoCajaP
  Left = 288
  Top = 174
  BorderStyle = bsDialog
  Caption = 'SOL Caja'
  ClientHeight = 151
  ClientWidth = 301
  Color = 12904163
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlRegComp: TPanel
    Left = 6
    Top = 4
    Width = 289
    Height = 141
    BevelInner = bvRaised
    BorderWidth = 1
    Color = 10207162
    TabOrder = 0
    object lblReporte: TLabel
      Left = 12
      Top = 5
      Width = 88
      Height = 23
      Caption = 'Cuadre Caja'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 8
      Top = 28
      Width = 272
      Height = 77
      Style = bsRaised
    end
    object lblCia: TLabel
      Left = 16
      Top = 39
      Width = 23
      Height = 15
      Caption = 'Cia :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 85
      Width = 21
      Height = 15
      Caption = 'del :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 16
      Top = 61
      Width = 29
      Height = 15
      Caption = 'Caja :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object z2bbtnOk: TBitBtn
      Left = 217
      Top = 110
      Width = 30
      Height = 25
      Hint = 'Imprimir'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = z2bbtnOkClick
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
    object z2bbtnSalir: TBitBtn
      Left = 249
      Top = 110
      Width = 30
      Height = 25
      Hint = 'Cerrar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      TabStop = False
      OnClick = z2bbtnSalirClick
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
    object dblcCia: TwwDBLookupCombo
      Left = 49
      Top = 36
      Width = 42
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'Cia'#9'F'
        'CIADES'#9'40'#9'Raz'#243'n Social'#9'F')
      LookupTable = DMTE.cdsCia
      LookupField = 'CIAID'
      Options = [loColLines, loRowLines, loTitles]
      MaxLength = 2
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnChange = dblcCiaChange
      OnExit = dblcCiaExit
    end
    object edtCia: TEdit
      Left = 93
      Top = 36
      Width = 174
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 2
    end
    object dbdtpInicio: TwwDBDateTimePicker
      Left = 49
      Top = 80
      Width = 121
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 3
      OnExit = dbdtpInicioExit
    end
    object dbdtpFin: TwwDBDateTimePicker
      Left = 49
      Top = 112
      Width = 121
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 6
      Visible = False
    end
    object dblcCaja: TwwDBLookupCombo
      Left = 49
      Top = 59
      Width = 42
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'BANCOID'#9'3'#9'C'#243'digo'#9'F'
        'BANCONOM'#9'40'#9'Banco'#9'F')
      LookupTable = DMTE.cdsBancoEgr
      LookupField = 'BANCOID'
      Options = [loColLines, loRowLines, loTitles]
      MaxLength = 2
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcCajaExit
    end
    object edtCaja: TEdit
      Left = 93
      Top = 59
      Width = 174
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 7
    end
  end
  object ppRCuadre: TppReport
    AutoStop = False
    DataPipeline = ppDBIE
    OnStartPage = ppRCuadreStartPage
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report4'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 276000
    PrinterSetup.mmPaperWidth = 350000
    PrinterSetup.PaperSize = 121
    Template.FileName = 'C:\SOLExes\SolFormatos\Caja\Incoresa\ArqueoCajaP.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppRCuadrePreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 248
    Top = 4
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBIE'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 31485
      mmPrintPosition = 0
      object pplblCia: TppLabel
        UserName = 'lblCia'
        Caption = 'DISTRIBUIDORA INCORSA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1852
        mmTop = 1323
        mmWidth = 38894
        BandType = 0
      end
      object pplblTitulo: TppLabel
        UserName = 'lblTitulo'
        Caption = 'Cuadre de Caja'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 189971
        mmTop = 1588
        mmWidth = 25929
        BandType = 0
      end
      object pplblFecha: TppLabel
        UserName = 'lblFecha'
        Caption = 'Fecha :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 292101
        mmTop = 9790
        mmWidth = 12965
        BandType = 0
      end
      object pplblHora: TppLabel
        UserName = 'lblHora'
        AutoSize = False
        Caption = 'Hora   :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 292101
        mmTop = 5821
        mmWidth = 11642
        BandType = 0
      end
      object pplblPg: TppLabel
        UserName = 'lblPg'
        Caption = 'P'#225'gina:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 292101
        mmTop = 1588
        mmWidth = 12965
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 254
        mmLeft = 2117
        mmTop = 26723
        mmWidth = 333640
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 254
        mmLeft = 2910
        mmTop = 16933
        mmWidth = 333640
        BandType = 0
      end
      object pplblDocu: TppLabel
        UserName = 'lblDocu'
        Caption = 'Documento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1588
        mmTop = 22225
        mmWidth = 16669
        BandType = 0
      end
      object pplblFech: TppLabel
        UserName = 'lblFech'
        Caption = 'Fecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 24871
        mmTop = 22225
        mmWidth = 9260
        BandType = 0
      end
      object pplblMone: TppLabel
        UserName = 'lblMone'
        Caption = 'Mda.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 47625
        mmTop = 22225
        mmWidth = 7408
        BandType = 0
      end
      object pplblConcep: TppLabel
        UserName = 'lblConcep'
        Caption = 'Concepto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 57150
        mmTop = 22225
        mmWidth = 14817
        BandType = 0
      end
      object pplblIngLoc: TppLabel
        UserName = 'lblIngLoc'
        AutoSize = False
        Caption = 'Ingresos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 111654
        mmTop = 22225
        mmWidth = 20638
        BandType = 0
      end
      object pplblIngExt: TppLabel
        UserName = 'Label101'
        AutoSize = False
        Caption = 'Ingresos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 184415
        mmTop = 22225
        mmWidth = 20638
        BandType = 0
      end
      object pplblTC: TppLabel
        UserName = 'lblTC'
        Caption = 'T/C'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 254001
        mmTop = 22225
        mmWidth = 5556
        BandType = 0
      end
      object pplblAux: TppLabel
        UserName = 'lblAux'
        Caption = 'Auxiliar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 284163
        mmTop = 22225
        mmWidth = 14817
        BandType = 0
      end
      object pplblClase: TppLabel
        UserName = 'lblClase'
        Caption = 'Clase'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 270669
        mmTop = 22225
        mmWidth = 9260
        BandType = 0
      end
      object svPag: TppSystemVariable
        UserName = 'svPag'
        AutoSize = False
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 307711
        mmTop = 1852
        mmWidth = 1852
        BandType = 0
      end
      object ppsvHora: TppSystemVariable
        UserName = 'svHora'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 307711
        mmTop = 6085
        mmWidth = 14817
        BandType = 0
      end
      object ppsvFecha: TppSystemVariable
        UserName = 'svFecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 307976
        mmTop = 10054
        mmWidth = 18521
        BandType = 0
      end
      object pplblDescri: TppLabel
        UserName = 'lblDescri'
        Caption = 'Descripci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 303478
        mmTop = 22225
        mmWidth = 20373
        BandType = 0
      end
      object pplblImpLoc: TppLabel
        UserName = 'lblImpLoc'
        AutoSize = False
        Caption = 'Importe Soles'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 111654
        mmTop = 18521
        mmWidth = 66411
        BandType = 0
      end
      object pplblImpExt: TppLabel
        UserName = 'lblImpExt'
        AutoSize = False
        Caption = 'Importe Dolares'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 184415
        mmTop = 18521
        mmWidth = 66411
        BandType = 0
      end
      object pplblEgrExt: TppLabel
        UserName = 'lblEgrExt'
        AutoSize = False
        Caption = 'Egresos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 206375
        mmTop = 22225
        mmWidth = 20638
        BandType = 0
      end
      object pplblEgrLoc: TppLabel
        UserName = 'lblEgrLoc'
        AutoSize = False
        Caption = 'Egresos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 134409
        mmTop = 22225
        mmWidth = 20638
        BandType = 0
      end
      object pplblAcuLoc: TppLabel
        UserName = 'lblAcuLoc'
        AutoSize = False
        Caption = 'Acumulado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 157163
        mmTop = 22225
        mmWidth = 20638
        BandType = 0
      end
      object pplblAcuExt: TppLabel
        UserName = 'lblAcuExt'
        AutoSize = False
        Caption = 'Acumulado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 229659
        mmTop = 22225
        mmWidth = 20638
        BandType = 0
      end
      object pplblDel: TppLabel
        UserName = 'lblTitulo1'
        Caption = 'Del :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 185738
        mmTop = 6085
        mmWidth = 9260
        BandType = 0
      end
      object pplblSaldoIng: TppLabel
        UserName = 'lblSaldoIng'
        AutoSize = False
        Caption = 'Saldo Inicial ----------->'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 74613
        mmTop = 27781
        mmWidth = 32544
        BandType = 0
      end
      object ppvSaldoASol: TppVariable
        UserName = 'vSaldoASol'
        AutoSize = False
        CalcOrder = 0
        DataType = dtCurrency
        DisplayFormat = '########0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 124354
        mmTop = 27781
        mmWidth = 20638
        BandType = 0
      end
      object ppvSaldoADol: TppVariable
        UserName = 'vSaldoADol'
        AutoSize = False
        CalcOrder = 1
        DataType = dtCurrency
        DisplayFormat = '########0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 193146
        mmTop = 27781
        mmWidth = 20638
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppdbDocu: TppDBText
        UserName = 'dbDocu'
        DataField = 'DOCABR'
        DataPipeline = ppDBIE
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBIE'
        mmHeight = 3704
        mmLeft = 1852
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
      object ppdbFecha: TppDBText
        UserName = 'dbFecha'
        DataField = 'ECFCOMP'
        DataPipeline = ppDBIE
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBIE'
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 0
        mmWidth = 20108
        BandType = 4
      end
      object ppdbMone: TppDBText
        UserName = 'dbMone'
        DataField = 'TMONABR'
        DataPipeline = ppDBIE
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBIE'
        mmHeight = 3704
        mmLeft = 46831
        mmTop = 0
        mmWidth = 9525
        BandType = 4
      end
      object ppdbGlosa: TppDBText
        UserName = 'dbGlosa'
        DataField = 'ECGLOSA'
        DataPipeline = ppDBIE
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBIE'
        mmHeight = 3704
        mmLeft = 58473
        mmTop = 0
        mmWidth = 48683
        BandType = 4
      end
      object ppdbMonIngLoc: TppDBText
        UserName = 'dbMonIngLoc'
        DataField = 'ECMTOLOCI'
        DataPipeline = ppDBIE
        DisplayFormat = '########0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIE'
        mmHeight = 3704
        mmLeft = 111919
        mmTop = 0
        mmWidth = 20638
        BandType = 4
      end
      object ppdbMonEgrLoc: TppDBText
        UserName = 'dbMonEgrLoc'
        DataField = 'ECMTOLOC'
        DataPipeline = ppDBIE
        DisplayFormat = '########0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIE'
        mmHeight = 3704
        mmLeft = 134409
        mmTop = 0
        mmWidth = 20638
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'ECTCAMB'
        DataPipeline = ppDBIE
        DisplayFormat = '#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIE'
        mmHeight = 3704
        mmLeft = 253471
        mmTop = 0
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'AUXNOMB'
        DataPipeline = ppDBIE
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBIE'
        mmHeight = 3704
        mmLeft = 305594
        mmTop = 0
        mmWidth = 29898
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'PROV'
        DataPipeline = ppDBIE
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBIE'
        mmHeight = 3704
        mmLeft = 285751
        mmTop = 0
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText201'
        DataField = 'CLAUXID'
        DataPipeline = ppDBIE
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBIE'
        mmHeight = 3704
        mmLeft = 269611
        mmTop = 0
        mmWidth = 14817
        BandType = 4
      end
      object ppdbMonIngExt: TppDBText
        UserName = 'dbMonIngExt'
        DataField = 'ECMTOEXTI'
        DataPipeline = ppDBIE
        DisplayFormat = '########0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIE'
        mmHeight = 3704
        mmLeft = 184415
        mmTop = 0
        mmWidth = 20638
        BandType = 4
      end
      object ppdbMonEgrExt: TppDBText
        UserName = 'dbMonEgrExt'
        DataField = 'ECMTOEXT'
        DataPipeline = ppDBIE
        DisplayFormat = '########0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIE'
        mmHeight = 3704
        mmLeft = 206375
        mmTop = 0
        mmWidth = 20638
        BandType = 4
      end
      object ppdbSumaIng: TppVariable
        UserName = 'dbSumaIng'
        AutoSize = False
        CalcOrder = 0
        DataType = dtDouble
        DisplayFormat = '########0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        OnCalc = ppdbSumaIngCalc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 157163
        mmTop = 0
        mmWidth = 20638
        BandType = 4
      end
      object ppdbSumaEgr: TppVariable
        UserName = 'dbSumaIng1'
        AutoSize = False
        CalcOrder = 1
        DataType = dtDouble
        DisplayFormat = '########0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        OnCalc = ppdbSumaEgrCalc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 229659
        mmTop = 0
        mmWidth = 20638
        BandType = 4
      end
    end
    object ppSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 12435
      mmPrintPosition = 0
      object pplblTotal: TppLabel
        UserName = 'lblTotal'
        Caption = 'Total General Mon. Nacional'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 52917
        mmTop = 1323
        mmWidth = 50006
        BandType = 7
      end
      object ppdbcIngLoc: TppDBCalc
        UserName = 'dbcIngLoc'
        DataField = 'ECMTOLOCI'
        DataPipeline = ppDBIE
        DisplayFormat = '########0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIE'
        mmHeight = 3704
        mmLeft = 111654
        mmTop = 1323
        mmWidth = 20638
        BandType = 7
      end
      object ppdbcIngExt: TppDBCalc
        UserName = 'dbcIngExt'
        DataField = 'ECMTOLOC'
        DataPipeline = ppDBIE
        DisplayFormat = '########0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIE'
        mmHeight = 3704
        mmLeft = 134409
        mmTop = 1323
        mmWidth = 20638
        BandType = 7
      end
      object ppdbcEgrLoc: TppDBCalc
        UserName = 'dbcEgrLoc'
        DataField = 'ECMTOEXTI'
        DataPipeline = ppDBIE
        DisplayFormat = '########0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIE'
        mmHeight = 3704
        mmLeft = 184415
        mmTop = 1323
        mmWidth = 20638
        BandType = 7
      end
      object ppdbcEgrExt: TppDBCalc
        UserName = 'dbcEgrExt'
        DataField = 'ECMTOEXT'
        DataPipeline = ppDBIE
        DisplayFormat = '########0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIE'
        mmHeight = 3704
        mmLeft = 206375
        mmTop = 1323
        mmWidth = 20638
        BandType = 7
      end
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = True
        OutlineSettings.CreateNode = True
        PrintBehavior = pbSection
        TraverseAllData = False
        DataPipelineName = 'ppDBIE1'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 7408
        mmWidth = 337300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppDBIE1
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report4'
          PrinterSetup.PaperName = 'Custom'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 276000
          PrinterSetup.mmPaperWidth = 350000
          PrinterSetup.PaperSize = 121
          Template.FileName = 'C:\SOLCaja\SolFormatos\ArqueoCajaP.rtm'
          Units = utMillimeters
          Left = 144
          Top = 64
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppDBIE1'
          object ppTitleBand1: TppTitleBand
            BeforePrint = ppTitleBand1BeforePrint
            mmBottomOffset = 0
            mmHeight = 25929
            mmPrintPosition = 0
            object pplblTitulo2: TppLabel
              UserName = 'lblTitulo2'
              Caption = 'Resumen de Cuadre de Caja'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Roman 12cpi'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 150019
              mmTop = 1852
              mmWidth = 39423
              BandType = 1
            end
            object pplblDel2: TppLabel
              UserName = 'lblDel2'
              Caption = 'Del :'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Roman 12cpi'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 162190
              mmTop = 5821
              mmWidth = 6615
              BandType = 1
            end
            object ppLabel3: TppLabel
              UserName = 'Label3'
              Caption = 'Documento'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Roman 12cpi'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 32279
              mmTop = 16669
              mmWidth = 15610
              BandType = 1
            end
            object pplblImporS: TppLabel
              UserName = 'lblImporS'
              AutoSize = False
              Caption = ' Importe Soles'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Roman 12cpi'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 126207
              mmTop = 12435
              mmWidth = 19844
              BandType = 1
            end
            object pplblIngS: TppLabel
              UserName = 'lblIngS'
              AutoSize = False
              Caption = 'Ingreso'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Roman 12cpi'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 111654
              mmTop = 16669
              mmWidth = 22225
              BandType = 1
            end
            object pplblEgrS: TppLabel
              UserName = 'lblEgrS'
              AutoSize = False
              Caption = 'Egreso'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Roman 12cpi'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 137319
              mmTop = 16669
              mmWidth = 22225
              BandType = 1
            end
            object pplblImporD: TppLabel
              UserName = 'lblImporD'
              AutoSize = False
              Caption = 'Importe Dolares'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Roman 12cpi'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 226219
              mmTop = 12435
              mmWidth = 22225
              BandType = 1
            end
            object pplblIngD: TppLabel
              UserName = 'lblIngD'
              AutoSize = False
              Caption = 'Ingreso'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Roman 12cpi'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 212725
              mmTop = 16669
              mmWidth = 22225
              BandType = 1
            end
            object pplblEgrD: TppLabel
              UserName = 'lblEgrD'
              AutoSize = False
              Caption = 'Egreso'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Roman 12cpi'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 238125
              mmTop = 16669
              mmWidth = 22225
              BandType = 1
            end
            object pplblAcumuS: TppLabel
              UserName = 'lblAcumuS'
              AutoSize = False
              Caption = 'Acumulado'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Roman 12cpi'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 163248
              mmTop = 16669
              mmWidth = 22225
              BandType = 1
            end
            object pplblAcumuD: TppLabel
              UserName = 'Label102'
              AutoSize = False
              Caption = 'Acumulado'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Roman 12cpi'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 263790
              mmTop = 16669
              mmWidth = 22225
              BandType = 1
            end
            object pplblSaldoAS: TppLabel
              UserName = 'lblSaldoIng1'
              AutoSize = False
              Caption = 'Saldo Anterior'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Roman 12cpi'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 86784
              mmTop = 16669
              mmWidth = 22225
              BandType = 1
            end
            object ppl1: TppLine
              UserName = 'l1'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 29369
              mmTop = 10319
              mmWidth = 260615
              BandType = 1
            end
            object ppl2: TppLine
              UserName = 'l2'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 29369
              mmTop = 20902
              mmWidth = 260615
              BandType = 1
            end
            object pplblSaldoAD: TppLabel
              UserName = 'lblSaldoAD'
              AutoSize = False
              Caption = 'Saldo Anterior'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Roman 12cpi'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 188913
              mmTop = 16669
              mmWidth = 22225
              BandType = 1
            end
            object ppvSaldoAS: TppVariable
              UserName = 'vSaldoAS'
              AutoSize = False
              CalcOrder = 0
              DataType = dtCurrency
              DisplayFormat = '########0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Roman 12cpi'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 86784
              mmTop = 22225
              mmWidth = 22225
              BandType = 1
            end
            object ppvSaldoAD: TppVariable
              UserName = 'vSaldoAD'
              AutoSize = False
              CalcOrder = 1
              DataType = dtCurrency
              DisplayFormat = '########0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Roman 12cpi'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 188913
              mmTop = 22225
              mmWidth = 22225
              BandType = 1
            end
            object ppLine1: TppLine
              UserName = 'Line1'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 29369
              mmTop = 794
              mmWidth = 260615
              BandType = 1
            end
          end
          object ppDetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object ppdbtDocu: TppDBText
              UserName = 'dbtDocu'
              DataField = 'FPAGODES'
              DataPipeline = ppDBIE1
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Roman 12cpi'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppDBIE1'
              mmHeight = 3704
              mmLeft = 31221
              mmTop = 794
              mmWidth = 40746
              BandType = 4
            end
            object ppdbtMtoingloci: TppDBText
              UserName = 'dbtMtoingloci'
              DataField = 'MTOLOCI'
              DataPipeline = ppDBIE1
              DisplayFormat = '########0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Roman 12cpi'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBIE1'
              mmHeight = 3704
              mmLeft = 111654
              mmTop = 794
              mmWidth = 22225
              BandType = 4
            end
            object ppdbtMtoingloce: TppDBText
              UserName = 'dbtMtoingloce'
              DataField = 'MTOLOCE'
              DataPipeline = ppDBIE1
              DisplayFormat = '########0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Roman 12cpi'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBIE1'
              mmHeight = 3704
              mmLeft = 137319
              mmTop = 794
              mmWidth = 22225
              BandType = 4
            end
            object ppdbtMtoegrloci: TppDBText
              UserName = 'dbtMtoegrloci'
              DataField = 'MTOEXTI'
              DataPipeline = ppDBIE1
              DisplayFormat = '########0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Roman 12cpi'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBIE1'
              mmHeight = 3704
              mmLeft = 212725
              mmTop = 529
              mmWidth = 22225
              BandType = 4
            end
            object ppdbtMtoegrloce: TppDBText
              UserName = 'dbtMtoegrloce'
              DataField = 'MTOEXTE'
              DataPipeline = ppDBIE1
              DisplayFormat = '########0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Roman 12cpi'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBIE1'
              mmHeight = 3704
              mmLeft = 238125
              mmTop = 794
              mmWidth = 22225
              BandType = 4
            end
          end
          object ppSummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object ppdbcingS: TppDBCalc
              UserName = 'dbcingS'
              DataField = 'MTOLOCI'
              DataPipeline = ppDBIE1
              DisplayFormat = '########0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Roman 12cpi'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBIE1'
              mmHeight = 3704
              mmLeft = 111654
              mmTop = 265
              mmWidth = 22225
              BandType = 7
            end
            object ppdbcingD: TppDBCalc
              UserName = 'dbcingD'
              DataField = 'MTOLOCE'
              DataPipeline = ppDBIE1
              DisplayFormat = '########0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Roman 12cpi'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBIE1'
              mmHeight = 3704
              mmLeft = 137319
              mmTop = 265
              mmWidth = 22225
              BandType = 7
            end
            object ppdbcegrS: TppDBCalc
              UserName = 'dbcegrS'
              DataField = 'MTOEXTI'
              DataPipeline = ppDBIE1
              DisplayFormat = '########0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Roman 12cpi'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBIE1'
              mmHeight = 3704
              mmLeft = 212725
              mmTop = 0
              mmWidth = 22225
              BandType = 7
            end
            object ppdbcegrD: TppDBCalc
              UserName = 'dbcegrD'
              DataField = 'MTOEXTE'
              DataPipeline = ppDBIE1
              DisplayFormat = '########0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Roman 12cpi'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBIE1'
              mmHeight = 3704
              mmLeft = 238125
              mmTop = 265
              mmWidth = 22225
              BandType = 7
            end
            object ppvIng: TppVariable
              UserName = 'vIng'
              AutoSize = False
              CalcOrder = 0
              DataType = dtCurrency
              DisplayFormat = '########0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Roman 12cpi'
              Font.Size = 8
              Font.Style = [fsBold]
              OnCalc = ppvIngCalc
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 163248
              mmTop = 265
              mmWidth = 22225
              BandType = 7
            end
            object ppvegr: TppVariable
              UserName = 'vegr'
              AutoSize = False
              CalcOrder = 1
              DataType = dtCurrency
              DisplayFormat = '########0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Roman 12cpi'
              Font.Size = 8
              Font.Style = [fsBold]
              OnCalc = ppvegrCalc
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 263790
              mmTop = 265
              mmWidth = 22225
              BandType = 7
            end
            object ppvSaldoAS1: TppVariable
              UserName = 'vSaldoAS1'
              AutoSize = False
              CalcOrder = 2
              DataType = dtCurrency
              DisplayFormat = '########0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Roman 12cpi'
              Font.Size = 8
              Font.Style = [fsBold]
              OnCalc = ppvSaldoAS1Calc
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 86784
              mmTop = 265
              mmWidth = 22225
              BandType = 7
            end
            object ppvSaldoAD1: TppVariable
              UserName = 'vSaldoAD1'
              AutoSize = False
              CalcOrder = 3
              DataType = dtCurrency
              DisplayFormat = '########0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Roman 12cpi'
              Font.Size = 8
              Font.Style = [fsBold]
              OnCalc = ppvSaldoAD1Calc
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 188913
              mmTop = 265
              mmWidth = 22225
              BandType = 7
            end
          end
        end
      end
    end
  end
  object ppDBIE: TppDBPipeline
    UserName = 'DBIE'
    Left = 176
    Top = 12
  end
  object ppDBIE1: TppDBPipeline
    UserName = 'DBIE1'
    Left = 190
    Top = 60
  end
  object ppDesigner1: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppRCuadre
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 246
    Top = 76
  end
end

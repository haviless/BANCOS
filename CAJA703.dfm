object FToolMovCaja: TFToolMovCaja
  Left = 203
  Top = 112
  Width = 800
  Height = 121
  Caption = 'Movimientos de Caja'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object PnlComprobante: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 94
    Align = alClient
    Color = 14869218
    TabOrder = 0
    object Bevel1: TBevel
      Left = 526
      Top = 40
      Width = 262
      Height = 36
    end
    object fcLabel1: TfcLabel
      Left = 656
      Top = 52
      Width = 49
      Height = 13
      Caption = 'A'#241'o-Mes :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TextOptions.Alignment = taLeftJustify
      TextOptions.VAlignment = vaTop
    end
    object GroupBox1: TGroupBox
      Left = 517
      Top = 9
      Width = 204
      Height = 72
      Caption = 'Reportes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
      object RbIngreso: TRadioButton
        Left = 16
        Top = 16
        Width = 73
        Height = 17
        Caption = 'Ingresos'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object RbEgreso: TRadioButton
        Left = 16
        Top = 32
        Width = 69
        Height = 17
        Caption = 'Egresos'
        TabOrder = 1
      end
      object RbTodos: TRadioButton
        Left = 16
        Top = 48
        Width = 63
        Height = 17
        Caption = 'Todos'
        TabOrder = 2
        Visible = False
      end
      object bbtnOK: TBitBtn
        Left = 3
        Top = 11
        Width = 163
        Height = 23
        Caption = 'Movimiento Diario Detallado'
        TabOrder = 3
        Visible = False
        OnClick = bbtnOKClick
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
    object GroupBox2: TGroupBox
      Left = 10
      Top = 1
      Width = 317
      Height = 89
      TabOrder = 0
      object Label2: TLabel
        Left = 7
        Top = 40
        Width = 29
        Height = 15
        Caption = 'Caja :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 43
        Top = 64
        Width = 21
        Height = 15
        Caption = 'del :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 182
        Top = 64
        Width = 15
        Height = 15
        Caption = 'al :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 7
        Top = 15
        Width = 49
        Height = 15
        Caption = 'Compa'#241#237'a'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object dblcCaja: TwwDBLookupCombo
        Left = 65
        Top = 36
        Width = 43
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'BANCOID'#9'3'#9'C'#243'digo'#9'F'
          'BANCONOM'#9'40'#9'Descripci'#243'n'#9'F')
        LookupTable = DMTE.cdsBanco
        LookupField = 'BANCOID'
        Options = [loColLines, loRowLines, loTitles]
        MaxLength = 2
        ParentFont = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        PreciseEditRegion = False
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblcCajaExit
        OnNotInList = dblcCiaNotInList
      end
      object edtCajades: TEdit
        Left = 112
        Top = 36
        Width = 188
        Height = 23
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object dbdtpInicio: TwwDBDateTimePicker
        Left = 68
        Top = 62
        Width = 95
        Height = 23
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'Draf 17cpi'
        CalendarAttributes.Font.Style = []
        Epoch = 1950
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 4
        DisplayFormat = 'dd/mm/yyyy'
      end
      object dbdtpFin: TwwDBDateTimePicker
        Left = 206
        Top = 62
        Width = 95
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'Draf 17cpi'
        CalendarAttributes.Font.Style = []
        Epoch = 1950
        ShowButton = True
        TabOrder = 5
        DisplayFormat = 'dd/mm/yyyy'
      end
      object dblcCia: TwwDBLookupCombo
        Left = 65
        Top = 12
        Width = 43
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CIAID'#9'2'#9'Id'#9'F'
          'CIADES'#9'40'#9'Compa'#241'ia'#9'F')
        LookupTable = DMTE.cdsCia
        LookupField = 'CIAID'
        Options = [loColLines, loRowLines, loTitles]
        MaxLength = 2
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        PreciseEditRegion = False
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblcCiaExit
        OnNotInList = dblcCiaNotInList
      end
      object edtCia: TEdit
        Left = 112
        Top = 12
        Width = 189
        Height = 23
        Color = clBtnFace
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
    object bbtnCuadreCaja: TBitBtn
      Left = 533
      Top = 12
      Width = 107
      Height = 25
      Caption = 'Cuadre de Caja'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = bbtnCuadreCajaClick
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
    object bbtnLibCaja: TBitBtn
      Left = 534
      Top = 46
      Width = 107
      Height = 25
      Caption = 'Libro Caja'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = bbtnLibCajaClick
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
    object bbtnEgrCaja: TBitBtn
      Left = 347
      Top = 35
      Width = 163
      Height = 25
      Caption = 'Egresos Caja'
      TabOrder = 3
      OnClick = bbtnEgrCajaClick
    end
    object bbtnMovDia: TBitBtn
      Left = 347
      Top = 7
      Width = 163
      Height = 25
      Caption = 'Ingresos a Caja'
      TabOrder = 2
      OnClick = bbtnMovDiaClick
      NumGlyphs = 2
    end
    object dblcdAnoMes: TwwDBLookupComboDlg
      Left = 709
      Top = 49
      Width = 74
      Height = 21
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'ANOMES'#9'7'#9'A'#241'o-Mes'#9'F')
      LookupTable = DMTE.cdsQry4
      LookupField = 'ANOMES'
      Enabled = False
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnExit = dblcdAnoMesExit
      OnKeyPress = dblcdAnoMesKeyPress
    end
    object BitBtn1: TBitBtn
      Left = 347
      Top = 63
      Width = 163
      Height = 25
      Caption = 'Ingresos Caja Detallado'
      TabOrder = 7
      OnClick = BitBtn1Click
      NumGlyphs = 2
    end
  end
  object pprIngresoCaja: TppReport
    AutoStop = False
    DataPipeline = ppDBIngresoCaja
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 215900
    PrinterSetup.mmPaperWidth = 279401
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\SolExes\SOLFormatos\Caja\DEMA\MovDiarioDetallado.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 40
    Top = 96
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBIngresoCaja'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 47096
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'MOVIMIENTO DIARIO DE CAJA  DETALLADO '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 89959
        mmTop = 11377
        mmWidth = 65881
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'CIADES'
        DataPipeline = ppDBIngresoCaja
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3440
        mmLeft = 8202
        mmTop = 8467
        mmWidth = 59796
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'DOCUMENTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 5027
        mmTop = 33602
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'TIPO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 2381
        mmTop = 38629
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 27781
        mmWidth = 245534
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'NUMERO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 14552
        mmTop = 38629
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'DESCRIPCION'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 32544
        mmTop = 33602
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'AUXILIAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 34660
        mmTop = 38629
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'EFECTIVO '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 123296
        mmTop = 33602
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'S/.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 120121
        mmTop = 38629
        mmWidth = 2910
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = '$'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 137054
        mmTop = 38629
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'CHEQUE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 159279
        mmTop = 33602
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'S/.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 155575
        mmTop = 38629
        mmWidth = 2910
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label101'
        Caption = '$'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 172509
        mmTop = 38629
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel38: TppLabel
        UserName = 'Label14'
        Caption = 'TARJETA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 191559
        mmTop = 33602
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel39: TppLabel
        UserName = 'Label13'
        Caption = 'S/.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 188384
        mmTop = 38629
        mmWidth = 2910
        BandType = 0
      end
      object ppLabel40: TppLabel
        UserName = 'Label103'
        Caption = '$'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 205317
        mmTop = 32279
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel41: TppLabel
        UserName = 'Label38'
        Caption = 'P'#225'gina : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 205317
        mmTop = 3175
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'Label39'
        Caption = 'Hora : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 205582
        mmTop = 7408
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel43: TppLabel
        UserName = 'Label40'
        Caption = 'Fecha : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 205582
        mmTop = 11377
        mmWidth = 9525
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageSet
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 218017
        mmTop = 3175
        mmWidth = 7408
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 218282
        mmTop = 7408
        mmWidth = 16404
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 218017
        mmTop = 11377
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel44: TppLabel
        UserName = 'Label41'
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 42863
        mmWidth = 263261
        BandType = 0
      end
      object ppLabel64: TppLabel
        UserName = 'Label42'
        Caption = 'CONCEPTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 74613
        mmTop = 35719
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel65: TppLabel
        UserName = 'Label43'
        Caption = 'T/C'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 247650
        mmTop = 34131
        mmWidth = 4763
        BandType = 0
      end
      object ppLabel66: TppLabel
        UserName = 'Label44'
        Caption = 'CLASE '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 254530
        mmTop = 34131
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel67: TppLabel
        UserName = 'Label67'
        Caption = 'TOTAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 224103
        mmTop = 33073
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel68: TppLabel
        UserName = 'Label46'
        Caption = 'S/.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 220928
        mmTop = 31750
        mmWidth = 2910
        BandType = 0
      end
      object ppLabel69: TppLabel
        UserName = 'Label69'
        Caption = '$'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 237861
        mmTop = 31750
        mmWidth = 1588
        BandType = 0
      end
      object ppDBText32: TppDBText
        UserName = 'DBText32'
        DataField = 'TIPO'
        DataPipeline = ppDBIngresoCaja
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3440
        mmLeft = 156369
        mmTop = 11377
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText31: TppDBText
        UserName = 'DBText31'
        AutoSize = True
        DataField = 'BANCOID'
        DataPipeline = ppDBIngresoCaja
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 115359
        mmTop = 16404
        mmWidth = 12700
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'BANCONOM'
        DataPipeline = ppDBIngresoCaja
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 128588
        mmTop = 16404
        mmWidth = 16669
        BandType = 0
      end
      object pplblfecIni: TppLabel
        UserName = 'lblfecIni'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 116152
        mmTop = 22225
        mmWidth = 1852
        BandType = 0
      end
      object pplblFecFin: TppLabel
        UserName = 'lblFecFin'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 140494
        mmTop = 22225
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel70: TppLabel
        UserName = 'Label70'
        Caption = 'DEL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 109009
        mmTop = 22225
        mmWidth = 5556
        BandType = 0
      end
      object ppLabel71: TppLabel
        UserName = 'Label53'
        Caption = 'AL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 22225
        mmWidth = 3969
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText3: TppDBText
        UserName = 'DBText2'
        DataField = 'DOCID'
        DataPipeline = ppDBIngresoCaja
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 3440
        mmTop = 1058
        mmWidth = 4763
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText3'
        DataField = 'NODOC'
        DataPipeline = ppDBIngresoCaja
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 8731
        mmTop = 1058
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText4'
        DataField = 'CCNOMB'
        DataPipeline = ppDBIngresoCaja
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 26194
        mmTop = 1058
        mmWidth = 48154
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'PAGEFECTMN'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 111654
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText9'
        DataField = 'PAGEFECTME'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 129646
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText10'
        DataField = 'PAGNOTDMN'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 183621
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText102'
        DataField = 'PAGNOTDME'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 201348
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'DBText11'
        DataField = 'CPTODES'
        DataPipeline = ppDBIngresoCaja
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 74613
        mmTop = 1058
        mmWidth = 36777
        BandType = 4
      end
      object ppDBText41: TppDBText
        UserName = 'DBText27'
        DataField = 'TCAMBIO'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 245534
        mmTop = 1058
        mmWidth = 8996
        BandType = 4
      end
      object ppDBText42: TppDBText
        UserName = 'DBText28'
        DataField = 'CLAUXID'
        DataPipeline = ppDBIngresoCaja
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 258498
        mmTop = 1058
        mmWidth = 3704
        BandType = 4
      end
      object ppDBText43: TppDBText
        UserName = 'DBText43'
        DataField = 'TOTALLOC'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 219075
        mmTop = 1058
        mmWidth = 11642
        BandType = 4
      end
      object ppDBText44: TppDBText
        UserName = 'DBText301'
        DataField = 'TOTALEXT'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 230982
        mmTop = 1058
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText45: TppDBText
        UserName = 'DBText5'
        DataField = 'PAGCHEQUMN'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 147902
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText46: TppDBText
        UserName = 'DBText6'
        DataField = 'PAGCHEQUME'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 165894
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel72: TppLabel
        UserName = 'Label501'
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 265
        mmWidth = 245534
        BandType = 7
      end
      object ppLabel73: TppLabel
        UserName = 'Label73'
        Caption = 'TOTALES : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 75671
        mmTop = 5027
        mmWidth = 15875
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'PAGEFECTMN'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3440
        mmLeft = 111654
        mmTop = 4498
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'PAGEFECTME'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3440
        mmLeft = 129646
        mmTop = 4498
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'PAGCHEQUMN'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3440
        mmLeft = 147902
        mmTop = 4498
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'PAGCHEQUME'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3440
        mmLeft = 165894
        mmTop = 4498
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc9: TppDBCalc
        UserName = 'DBCalc7'
        DataField = 'PAGNOTDMN'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3440
        mmLeft = 183621
        mmTop = 4498
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc10: TppDBCalc
        UserName = 'DBCalc8'
        DataField = 'PAGNOTDME'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3440
        mmLeft = 201348
        mmTop = 4498
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc11: TppDBCalc
        UserName = 'DBCalc9'
        DataField = 'TOTALLOC'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3440
        mmLeft = 219075
        mmTop = 4498
        mmWidth = 12965
        BandType = 7
      end
      object ppDBCalc12: TppDBCalc
        UserName = 'DBCalc10'
        DataField = 'TOTALEXT'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3440
        mmLeft = 230982
        mmTop = 4498
        mmWidth = 17198
        BandType = 7
      end
    end
  end
  object ppDBIngresoCaja: TppDBPipeline
    UserName = 'DBIngresoCaja'
    Left = 8
    Top = 96
  end
  object pprCompRet: TppReport
    AutoStop = False
    DataPipeline = ppdbCompRet
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6000
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 140000
    PrinterSetup.mmPaperWidth = 215000
    PrinterSetup.PaperSize = 119
    Template.FileName = 'C:\SOLExes\SOLFormatos\Cnt\DEMA\RetencionesC.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 72
    Top = 96
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbCompRet'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 10319
      mmPrintPosition = 0
    end
    object ppDetailBand3: TppDetailBand
      PrintCount = 5
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText12: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'SERIE'
        DataPipeline = ppdbCompRet
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbCompRet'
        mmHeight = 3969
        mmLeft = 22490
        mmTop = 1058
        mmWidth = 9525
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'NODOC'
        DataPipeline = ppdbCompRet
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCompRet'
        mmHeight = 3969
        mmLeft = 50536
        mmTop = 1058
        mmWidth = 11906
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText3'
        DataField = 'FECEMI'
        DataPipeline = ppdbCompRet
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbCompRet'
        mmHeight = 3969
        mmLeft = 88371
        mmTop = 1058
        mmWidth = 21960
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'MTORETLOC'
        DataPipeline = ppdbCompRet
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCompRet'
        mmHeight = 3969
        mmLeft = 159544
        mmTop = 1058
        mmWidth = 19579
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        AutoSize = True
        DataField = 'MTOLOC'
        DataPipeline = ppdbCompRet
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCompRet'
        mmHeight = 3969
        mmLeft = 129911
        mmTop = 1058
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'DOCABR'
        DataPipeline = ppdbCompRet
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbCompRet'
        mmHeight = 3969
        mmLeft = 3175
        mmTop = 1058
        mmWidth = 15610
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 42069
      mmPrintPosition = 0
      object ppShape6: TppShape
        UserName = 'Shape6'
        mmHeight = 7144
        mmLeft = 149225
        mmTop = 0
        mmWidth = 35454
        BandType = 8
      end
      object ppShape5: TppShape
        UserName = 'Shape5'
        mmHeight = 7144
        mmLeft = 114036
        mmTop = 0
        mmWidth = 35454
        BandType = 8
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        AutoSize = True
        DataField = 'RETTOTDES'
        DataPipeline = ppdbCompRet
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbCompRet'
        mmHeight = 3704
        mmLeft = 10583
        mmTop = 9525
        mmWidth = 15610
        BandType = 8
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        AutoSize = True
        DataField = 'MTOLOC'
        DataPipeline = ppdbCompRet
        DisplayFormat = #39'S/. '#39' #,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        ResetGroup = ppGroup1
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCompRet'
        mmHeight = 3969
        mmLeft = 119063
        mmTop = 794
        mmWidth = 24077
        BandType = 8
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        AutoSize = True
        DataField = 'MTORETLOC'
        DataPipeline = ppdbCompRet
        DisplayFormat = #39'S/. '#39' #,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        ResetGroup = ppGroup1
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCompRet'
        mmHeight = 3969
        mmLeft = 148696
        mmTop = 794
        mmWidth = 30427
        BandType = 8
      end
      object ppLabel16: TppLabel
        UserName = 'Label1'
        Caption = 'SON : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 2117
        mmTop = 9525
        mmWidth = 7938
        BandType = 8
      end
      object ppLabel17: TppLabel
        UserName = 'Label2'
        Caption = '--------------------------------------------'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 28840
        mmTop = 24606
        mmWidth = 42333
        BandType = 8
      end
      object ppLabel18: TppLabel
        UserName = 'Label3'
        Caption = '-----------------------------------------------'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 93134
        mmTop = 24606
        mmWidth = 49742
        BandType = 8
      end
      object ppLabel19: TppLabel
        UserName = 'Label102'
        Caption = 'p.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 34131
        mmTop = 28840
        mmWidth = 2646
        BandType = 8
      end
      object ppDBText19: TppDBText
        UserName = 'DBText14'
        DataField = 'CIAABR'
        DataPipeline = ppdbCompRet
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbCompRet'
        mmHeight = 3969
        mmLeft = 37306
        mmTop = 29104
        mmWidth = 34396
        BandType = 8
      end
      object ppLabel20: TppLabel
        UserName = 'Label201'
        Caption = 'RECIBI CONFORME (PROVEEDOR)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 94456
        mmTop = 29633
        mmWidth = 46831
        BandType = 8
      end
      object ppLabel21: TppLabel
        UserName = 'Label4'
        Caption = 'D.N.I. :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 94456
        mmTop = 34131
        mmWidth = 9260
        BandType = 8
      end
      object ppLabel22: TppLabel
        UserName = 'Label21'
        Caption = 'TOTALES '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 97631
        mmTop = 265
        mmWidth = 15610
        BandType = 8
      end
      object ppLabel23: TppLabel
        UserName = 'Label16'
        Caption = 'COPIA PARA CONTROL ADMINISTRATIVO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 2117
        mmTop = 38100
        mmWidth = 59002
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'RETNUMERO'
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 43392
        mmPrintPosition = 0
        object ppShape4: TppShape
          UserName = 'Shape4'
          mmHeight = 11377
          mmLeft = 149225
          mmTop = 31750
          mmWidth = 35454
          BandType = 3
          GroupNo = 0
        end
        object ppShape3: TppShape
          UserName = 'Shape3'
          mmHeight = 11377
          mmLeft = 114036
          mmTop = 31750
          mmWidth = 35454
          BandType = 3
          GroupNo = 0
        end
        object ppShape2: TppShape
          UserName = 'Shape2'
          mmHeight = 5821
          mmLeft = 0
          mmTop = 37306
          mmWidth = 114300
          BandType = 3
          GroupNo = 0
        end
        object ppShape1: TppShape
          UserName = 'Shape1'
          mmHeight = 5821
          mmLeft = 0
          mmTop = 31750
          mmWidth = 114300
          BandType = 3
          GroupNo = 0
        end
        object ppDBText20: TppDBText
          UserName = 'DBText20'
          DataField = 'AUXRUC'
          DataPipeline = ppdbCompRet
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbCompRet'
          mmHeight = 3969
          mmLeft = 24077
          mmTop = 19315
          mmWidth = 50271
          BandType = 3
          GroupNo = 0
        end
        object ppDBText21: TppDBText
          UserName = 'DBText21'
          DataField = 'FECPAGO'
          DataPipeline = ppdbCompRet
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbCompRet'
          mmHeight = 3969
          mmLeft = 35454
          mmTop = 23548
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppDBText22: TppDBText
          UserName = 'DBText22'
          DataField = 'AUXNOMB'
          DataPipeline = ppdbCompRet
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbCompRet'
          mmHeight = 3969
          mmLeft = 24077
          mmTop = 15081
          mmWidth = 68527
          BandType = 3
          GroupNo = 0
        end
        object ppDBText23: TppDBText
          UserName = 'DBText101'
          DataField = 'RETNUMERO'
          DataPipeline = ppdbCompRet
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbCompRet'
          mmHeight = 3969
          mmLeft = 158750
          mmTop = 21431
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object ppLabel24: TppLabel
          UserName = 'Label24'
          Caption = 'SE'#209'OR(ES) : '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 2381
          mmTop = 15081
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
        end
        object ppLabel25: TppLabel
          UserName = 'Label25'
          Caption = 'R.U.C. : '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 2381
          mmTop = 19315
          mmWidth = 11377
          BandType = 3
          GroupNo = 0
        end
        object ppLabel26: TppLabel
          UserName = 'Label26'
          Caption = 'FECHA DE EMISION :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 2381
          mmTop = 23548
          mmWidth = 31485
          BandType = 3
          GroupNo = 0
        end
        object ppLabel27: TppLabel
          UserName = 'Label27'
          Caption = 'COMPROBANTE DE RETENCION'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 5027
          mmLeft = 109273
          mmTop = 14817
          mmWidth = 66411
          BandType = 3
          GroupNo = 0
        end
        object ppLabel28: TppLabel
          UserName = 'Label28'
          Caption = 'N'#176
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 155311
          mmTop = 21431
          mmWidth = 3704
          BandType = 3
          GroupNo = 0
        end
        object ppLabel29: TppLabel
          UserName = 'Label29'
          Caption = 'R.U.C  '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 144727
          mmTop = 8467
          mmWidth = 8731
          BandType = 3
          GroupNo = 0
        end
        object ppDBText24: TppDBText
          UserName = 'DBText12'
          DataField = 'CIARUC'
          DataPipeline = ppdbCompRet
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbCompRet'
          mmHeight = 3969
          mmLeft = 154517
          mmTop = 8467
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
        object ppDBText25: TppDBText
          UserName = 'DBText13'
          DataField = 'RETSERIE'
          DataPipeline = ppdbCompRet
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppdbCompRet'
          mmHeight = 3969
          mmLeft = 149225
          mmTop = 21431
          mmWidth = 5556
          BandType = 3
          GroupNo = 0
        end
        object ppLabel30: TppLabel
          UserName = 'Label30'
          Caption = 'COMPROBANTES DE PAGO QUE DAN ORIGEN A LA RETENCION'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 11906
          mmTop = 33073
          mmWidth = 92604
          BandType = 3
          GroupNo = 0
        end
        object ppLabel31: TppLabel
          UserName = 'Label31'
          Caption = 'TIPO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 5556
          mmTop = 38629
          mmWidth = 7144
          BandType = 3
          GroupNo = 0
        end
        object ppLabel32: TppLabel
          UserName = 'Label15'
          Caption = 'SERIE'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 21431
          mmTop = 39688
          mmWidth = 8202
          BandType = 3
          GroupNo = 0
        end
        object ppLabel33: TppLabel
          UserName = 'Label17'
          Caption = 'NUMERO CORRELATIVO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 40217
          mmTop = 39158
          mmWidth = 36248
          BandType = 3
          GroupNo = 0
        end
        object ppLabel34: TppLabel
          UserName = 'Label18'
          Caption = 'FECHA DE EMISION'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 83079
          mmTop = 39158
          mmWidth = 28310
          BandType = 3
          GroupNo = 0
        end
        object ppLabel35: TppLabel
          UserName = 'Label19'
          Caption = 'MONTO DEL PAGO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 119856
          mmTop = 35719
          mmWidth = 27781
          BandType = 3
          GroupNo = 0
        end
        object ppLabel36: TppLabel
          UserName = 'Label20'
          Caption = 'IMPORTE RETENIDO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 151607
          mmTop = 35719
          mmWidth = 29104
          BandType = 3
          GroupNo = 0
        end
        object ppDBText26: TppDBText
          UserName = 'DBText15'
          DataField = 'CIADES'
          DataPipeline = ppdbCompRet
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 12
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbCompRet'
          mmHeight = 5027
          mmLeft = 1852
          mmTop = 529
          mmWidth = 79111
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object ppdbCompRet: TppDBPipeline
    DataSource = DMTE.dsReporte
    UserName = 'dbCompRet'
    Left = 105
    Top = 98
    object ppField34: TppField
      FieldAlias = 'CIAID'
      FieldName = 'CIAID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 0
    end
    object ppField35: TppField
      FieldAlias = 'TDIARID'
      FieldName = 'TDIARID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 1
    end
    object ppField36: TppField
      FieldAlias = 'ANOMM'
      FieldName = 'ANOMM'
      FieldLength = 6
      DisplayWidth = 6
      Position = 2
    end
    object ppField37: TppField
      FieldAlias = 'ECNOCOMP'
      FieldName = 'ECNOCOMP'
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
    object ppField38: TppField
      FieldAlias = 'FECPAGO'
      FieldName = 'FECPAGO'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 4
    end
    object ppField39: TppField
      FieldAlias = 'CLAUXID'
      FieldName = 'CLAUXID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 5
    end
    object ppField40: TppField
      FieldAlias = 'AUXID'
      FieldName = 'AUXID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 6
    end
    object ppField41: TppField
      FieldAlias = 'AUXRUC'
      FieldName = 'AUXRUC'
      FieldLength = 15
      DisplayWidth = 15
      Position = 7
    end
    object ppField42: TppField
      FieldAlias = 'DOCID'
      FieldName = 'DOCID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 8
    end
    object ppField43: TppField
      FieldAlias = 'DOCDES'
      FieldName = 'DOCDES'
      FieldLength = 15
      DisplayWidth = 15
      Position = 9
    end
    object ppField44: TppField
      FieldAlias = 'SERIE'
      FieldName = 'SERIE'
      FieldLength = 5
      DisplayWidth = 5
      Position = 10
    end
    object ppField45: TppField
      FieldAlias = 'NODOC'
      FieldName = 'NODOC'
      FieldLength = 20
      DisplayWidth = 20
      Position = 11
    end
    object ppField46: TppField
      FieldAlias = 'TRANID'
      FieldName = 'TRANID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 12
    end
    object ppField47: TppField
      FieldAlias = 'TRANDES'
      FieldName = 'TRANDES'
      FieldLength = 15
      DisplayWidth = 15
      Position = 13
    end
    object ppField48: TppField
      FieldAlias = 'DH'
      FieldName = 'DH'
      FieldLength = 1
      DisplayWidth = 1
      Position = 14
    end
    object ppField49: TppField
      Alignment = taRightJustify
      FieldAlias = 'MTOORI'
      FieldName = 'MTOORI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppField50: TppField
      Alignment = taRightJustify
      FieldAlias = 'MTOLOC'
      FieldName = 'MTOLOC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppField51: TppField
      Alignment = taRightJustify
      FieldAlias = 'MTOEXT'
      FieldName = 'MTOEXT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object ppField52: TppField
      FieldAlias = 'USUARIO'
      FieldName = 'USUARIO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 18
    end
    object ppField53: TppField
      FieldAlias = 'FREG'
      FieldName = 'FREG'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 19
    end
    object ppField54: TppField
      FieldAlias = 'HREG'
      FieldName = 'HREG'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 20
    end
    object ppField55: TppField
      Alignment = taRightJustify
      FieldAlias = 'MTORETORI'
      FieldName = 'MTORETORI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object ppField56: TppField
      Alignment = taRightJustify
      FieldAlias = 'MTORETLOC'
      FieldName = 'MTORETLOC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object ppField57: TppField
      Alignment = taRightJustify
      FieldAlias = 'MTORETEXT'
      FieldName = 'MTORETEXT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object ppField58: TppField
      FieldAlias = 'FECEMI'
      FieldName = 'FECEMI'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 24
    end
    object ppField59: TppField
      FieldAlias = 'RETSERIE'
      FieldName = 'RETSERIE'
      FieldLength = 5
      DisplayWidth = 5
      Position = 25
    end
    object ppField60: TppField
      FieldAlias = 'RETNUMERO'
      FieldName = 'RETNUMERO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 26
    end
    object ppField61: TppField
      FieldAlias = 'RETTOTDES'
      FieldName = 'RETTOTDES'
      FieldLength = 200
      DisplayWidth = 200
      Position = 27
    end
    object ppField62: TppField
      FieldAlias = 'DOCDESC'
      FieldName = 'DOCDESC'
      FieldLength = 30
      DisplayWidth = 30
      Position = 28
    end
    object ppField63: TppField
      FieldAlias = 'AUXNOMB'
      FieldName = 'AUXNOMB'
      FieldLength = 40
      DisplayWidth = 40
      Position = 29
    end
    object ppField64: TppField
      FieldAlias = 'AUXDIR'
      FieldName = 'AUXDIR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 30
    end
    object ppField65: TppField
      FieldAlias = 'CIADES'
      FieldName = 'CIADES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 31
    end
    object ppField66: TppField
      FieldAlias = 'CIARUC'
      FieldName = 'CIARUC'
      FieldLength = 15
      DisplayWidth = 15
      Position = 32
    end
  end
  object pprMovDiario: TppReport
    AutoStop = False
    DataPipeline = ppDBIngresoCaja
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 215900
    PrinterSetup.mmPaperWidth = 279401
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\SOLExes\SOLFormatos\Caja\Dema\MovDiarioCajaIng.rtm'
    DeviceType = 'Screen'
    OnPreviewFormCreate = pprMovDiarioPreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 168
    Top = 98
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBIngresoCaja'
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 46038
      mmPrintPosition = 0
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'INGRESO DE CAJA DETALLADO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 83873
        mmTop = 12435
        mmWidth = 43127
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'CIADES'
        DataPipeline = ppDBIngresoCaja
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3440
        mmLeft = 8202
        mmTop = 8467
        mmWidth = 59796
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'DOCUMENTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 5027
        mmTop = 34660
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'Label37'
        Caption = 'TIPO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 2381
        mmTop = 39688
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel46: TppLabel
        UserName = 'Label202'
        Caption = 'NUMERO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 12171
        mmTop = 39688
        mmWidth = 11377
        BandType = 0
      end
      object ppLabel47: TppLabel
        UserName = 'Label47'
        Caption = 'DESCRIPCION'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 35983
        mmTop = 34660
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel48: TppLabel
        UserName = 'Label22'
        Caption = 'AUXILIAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 37571
        mmTop = 39688
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel49: TppLabel
        UserName = 'Label23'
        Caption = 'IMPORTE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 117740
        mmTop = 34925
        mmWidth = 11377
        BandType = 0
      end
      object ppLabel50: TppLabel
        UserName = 'Label50'
        Caption = 'IMPORTE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 138907
        mmTop = 34925
        mmWidth = 11377
        BandType = 0
      end
      object ppLabel51: TppLabel
        UserName = 'Label51'
        Caption = 'P'#225'gina'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 166952
        mmTop = 4233
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel52: TppLabel
        UserName = 'Label52'
        Caption = 'Hora'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 167217
        mmTop = 8467
        mmWidth = 6085
        BandType = 0
      end
      object ppLabel53: TppLabel
        UserName = 'Label401'
        Caption = 'Fecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 167217
        mmTop = 12435
        mmWidth = 7938
        BandType = 0
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable4'
        VarType = vtPageSet
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 179652
        mmTop = 4233
        mmWidth = 7408
        BandType = 0
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'SystemVariable5'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 179917
        mmTop = 8467
        mmWidth = 16404
        BandType = 0
      end
      object ppSystemVariable6: TppSystemVariable
        UserName = 'SystemVariable6'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 179652
        mmTop = 12435
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel55: TppLabel
        UserName = 'Label1'
        Caption = 'CONCEPTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 79111
        mmTop = 36777
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel56: TppLabel
        UserName = 'Label301'
        Caption = 'T/C'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 160338
        mmTop = 34925
        mmWidth = 4233
        BandType = 0
      end
      object ppLabel57: TppLabel
        UserName = 'Label57'
        Caption = 'CLASE '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 168011
        mmTop = 34925
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel58: TppLabel
        UserName = 'Label32'
        Caption = 'AUXILIAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 180975
        mmTop = 34925
        mmWidth = 12435
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'BANCOID'
        DataPipeline = ppDBIngresoCaja
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 80169
        mmTop = 18521
        mmWidth = 12700
        BandType = 0
      end
      object ppDBText29: TppDBText
        UserName = 'DBText29'
        AutoSize = True
        DataField = 'BANCONOM'
        DataPipeline = ppDBIngresoCaja
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 93663
        mmTop = 18521
        mmWidth = 16669
        BandType = 0
      end
      object pplblFechaIni: TppLabel
        UserName = 'lblfecIni1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 90752
        mmTop = 23283
        mmWidth = 13229
        BandType = 0
      end
      object pplblFechaFin: TppLabel
        UserName = 'lblFecFin1'
        Caption = 'lblFecFin1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 115094
        mmTop = 23283
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel59: TppLabel
        UserName = 'Label55'
        Caption = 'DEL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 83609
        mmTop = 23283
        mmWidth = 5292
        BandType = 0
      end
      object ppLabel60: TppLabel
        UserName = 'Label56'
        Caption = 'AL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 107421
        mmTop = 23283
        mmWidth = 3969
        BandType = 0
      end
      object ppLabel74: TppLabel
        UserName = 'Label74'
        Caption = '(MON. NAC)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 115623
        mmTop = 38365
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel75: TppLabel
        UserName = 'Label75'
        Caption = '(MON. EXT)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 137054
        mmTop = 38365
        mmWidth = 14817
        BandType = 0
      end
      object ppShape7: TppShape
        UserName = 'Shape7'
        Pen.Style = psDot
        mmHeight = 265
        mmLeft = 0
        mmTop = 33073
        mmWidth = 198967
        BandType = 0
      end
      object ppShape8: TppShape
        UserName = 'Shape8'
        Pen.Style = psDot
        mmHeight = 265
        mmLeft = 0
        mmTop = 44979
        mmWidth = 198967
        BandType = 0
      end
      object ppLabel54: TppLabel
        UserName = 'Label54'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 177007
        mmTop = 4233
        mmWidth = 794
        BandType = 0
      end
      object ppLabel63: TppLabel
        UserName = 'Label63'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 177007
        mmTop = 8467
        mmWidth = 794
        BandType = 0
      end
      object ppLabel90: TppLabel
        UserName = 'Label90'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 177007
        mmTop = 12435
        mmWidth = 794
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText30: TppDBText
        UserName = 'DBText30'
        DataField = 'DOCID'
        DataPipeline = ppDBIngresoCaja
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 3440
        mmTop = 265
        mmWidth = 4763
        BandType = 4
      end
      object ppDBText33: TppDBText
        UserName = 'DBText33'
        AutoSize = True
        DataField = 'NODOC'
        DataPipeline = ppDBIngresoCaja
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 13758
        mmTop = 265
        mmWidth = 9790
        BandType = 4
      end
      object ppDBText34: TppDBText
        UserName = 'DBText34'
        DataField = 'CCNOMB'
        DataPipeline = ppDBIngresoCaja
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 26723
        mmTop = 265
        mmWidth = 50271
        BandType = 4
      end
      object ppDBText35: TppDBText
        UserName = 'DBText19'
        AutoSize = True
        DataField = 'INGRESOLOC'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 116152
        mmTop = 265
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText36: TppDBText
        UserName = 'DBText201'
        AutoSize = True
        DataField = 'INGRESOEXT'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 137054
        mmTop = 265
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText37: TppDBText
        UserName = 'DBText37'
        DataField = 'CPTODES'
        DataPipeline = ppDBIngresoCaja
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 79111
        mmTop = 265
        mmWidth = 36777
        BandType = 4
      end
      object ppDBText38: TppDBText
        UserName = 'DBText38'
        DataField = 'TCAMBIO'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 157427
        mmTop = 265
        mmWidth = 8996
        BandType = 4
      end
      object ppDBText39: TppDBText
        UserName = 'DBText23'
        DataField = 'CLAUXID'
        DataPipeline = ppDBIngresoCaja
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 170392
        mmTop = 265
        mmWidth = 4763
        BandType = 4
      end
      object ppDBText40: TppDBText
        UserName = 'DBText24'
        AutoSize = True
        DataField = 'PROV'
        DataPipeline = ppDBIngresoCaja
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 183357
        mmTop = 265
        mmWidth = 7673
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel61: TppLabel
        UserName = 'Label61'
        Caption = 'Total General Mon. Nacional'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 56886
        mmTop = 2646
        mmWidth = 35454
        BandType = 7
      end
      object ppLabel62: TppLabel
        UserName = 'Label34'
        Caption = 'Total General Mon. Extranjera'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 57150
        mmTop = 7938
        mmWidth = 37571
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        AutoSize = True
        DataField = 'INGRESOLOC'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 102394
        mmTop = 2646
        mmWidth = 26723
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        AutoSize = True
        DataField = 'INGRESOEXT'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 102923
        mmTop = 7938
        mmWidth = 26194
        BandType = 7
      end
      object ppShape11: TppShape
        UserName = 'Shape11'
        Pen.Style = psDot
        mmHeight = 265
        mmLeft = 0
        mmTop = 1323
        mmWidth = 198967
        BandType = 7
      end
      object ppLabel100: TppLabel
        UserName = 'Label100'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 101600
        mmTop = 2646
        mmWidth = 794
        BandType = 7
      end
      object ppLabel160: TppLabel
        UserName = 'Label901'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 101600
        mmTop = 7938
        mmWidth = 794
        BandType = 7
      end
    end
  end
  object pprLibroCaja: TppReport
    AutoStop = False
    DataPipeline = ppDBIngresoCaja
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report2'
    PrinterSetup.PaperName = 'Carta Continuo'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 251090
    PrinterSetup.PaperSize = 119
    Template.FileName = 'C:\SOLExes\SOLFormatos\Caja\Dema\LibroCajaN.rtm'
    DeviceType = 'Screen'
    OnPreviewFormCreate = pprLibroCajaPreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 464
    Top = 97
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBIngresoCaja'
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 48154
      mmPrintPosition = 0
      object ppLabel76: TppLabel
        UserName = 'Label48'
        Caption = 'Libro Caja'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 99219
        mmTop = 12171
        mmWidth = 14552
        BandType = 0
      end
      object ppDBText47: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'CIADES'
        DataPipeline = ppDBIngresoCaja
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 3175
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel77: TppLabel
        UserName = 'Label49'
        Caption = 'Beneficiario'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 31221
        mmTop = 31485
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel78: TppLabel
        UserName = 'Label36'
        Caption = 'Concepto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 74348
        mmTop = 31485
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel79: TppLabel
        UserName = 'Label1'
        Caption = 'Ingreso '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 123031
        mmTop = 35454
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel80: TppLabel
        UserName = 'Label80'
        Caption = 'Egreso'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 142611
        mmTop = 35454
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel81: TppLabel
        UserName = 'Label58'
        Caption = 'Soles'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 133615
        mmTop = 30692
        mmWidth = 8202
        BandType = 0
      end
      object ppLabel82: TppLabel
        UserName = 'Label59'
        Caption = 'Ingreso '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 179917
        mmTop = 35454
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel83: TppLabel
        UserName = 'Label60'
        Caption = 'Egreso'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 200290
        mmTop = 35454
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel84: TppLabel
        UserName = 'Label84'
        Caption = 'D'#243'lares'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 186796
        mmTop = 30692
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel85: TppLabel
        UserName = 'Label62'
        Caption = 'Saldo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 164042
        mmTop = 35454
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel86: TppLabel
        UserName = 'Label63'
        Caption = 'Saldo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 221457
        mmTop = 35454
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel87: TppLabel
        UserName = 'Label64'
        Caption = 'P'#225'gina'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 195263
        mmTop = 1588
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel88: TppLabel
        UserName = 'Label65'
        Caption = 'Hora'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 195263
        mmTop = 5821
        mmWidth = 6085
        BandType = 0
      end
      object ppLabel89: TppLabel
        UserName = 'Label402'
        Caption = 'Fecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 195263
        mmTop = 9790
        mmWidth = 7938
        BandType = 0
      end
      object ppSystemVariable7: TppSystemVariable
        UserName = 'SystemVariable7'
        VarType = vtPageSet
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 219075
        mmTop = 1588
        mmWidth = 7408
        BandType = 0
      end
      object ppSystemVariable8: TppSystemVariable
        UserName = 'SystemVariable8'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 215371
        mmTop = 5821
        mmWidth = 11113
        BandType = 0
      end
      object ppSystemVariable9: TppSystemVariable
        UserName = 'SystemVariable9'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 212196
        mmTop = 9790
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel91: TppLabel
        UserName = 'Label701'
        Caption = 'Fecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 16669
        mmTop = 31485
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel92: TppLabel
        UserName = 'Label92'
        Caption = 'Reg.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 31485
        mmWidth = 6350
        BandType = 0
      end
      object ppLabel93: TppLabel
        UserName = 'Label72'
        Caption = 'Periodo : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 14288
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel94: TppLabel
        UserName = 'Label94'
        Caption = 'Diario : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 9525
        mmWidth = 9525
        BandType = 0
      end
      object pplblPeriodo: TppLabel
        UserName = 'lblPeriodo'
        Caption = 'lblPeriodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 21167
        mmTop = 14288
        mmWidth = 12171
        BandType = 0
      end
      object pplblTDiario: TppLabel
        UserName = 'lblPeriodo1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 19579
        mmTop = 9525
        mmWidth = 14288
        BandType = 0
      end
      object ppDBText48: TppDBText
        UserName = 'DBText48'
        DataField = 'SALDOANTMN'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '##,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 154517
        mmTop = 43656
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel95: TppLabel
        UserName = 'Label95'
        Caption = 'SALDO INICIAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 81756
        mmTop = 43656
        mmWidth = 19315
        BandType = 0
      end
      object ppDBText49: TppDBText
        UserName = 'DBText45'
        DataField = 'SALDOANTME'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '##,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 211932
        mmTop = 43656
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel96: TppLabel
        UserName = 'Label96'
        Caption = 'Caja : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 82286
        mmTop = 17463
        mmWidth = 8467
        BandType = 0
      end
      object ppDBText50: TppDBText
        UserName = 'DBText46'
        DataField = 'BANCOID'
        DataPipeline = ppDBIngresoCaja
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 92340
        mmTop = 17463
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText51: TppDBText
        UserName = 'DBText47'
        AutoSize = True
        DataField = 'BANCONOM'
        DataPipeline = ppDBIngresoCaja
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 101600
        mmTop = 17463
        mmWidth = 16669
        BandType = 0
      end
      object pplblFechIni: TppLabel
        UserName = 'lblfecIni2'
        Caption = 'lblfecIni2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 89429
        mmTop = 21960
        mmWidth = 13229
        BandType = 0
      end
      object pplblFechIFin: TppLabel
        UserName = 'lblFecFin2'
        Caption = 'lblFecFin2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 113771
        mmTop = 21960
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel97: TppLabel
        UserName = 'Label78'
        Caption = 'DEL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 82286
        mmTop = 21960
        mmWidth = 5556
        BandType = 0
      end
      object ppLabel98: TppLabel
        UserName = 'Label79'
        Caption = 'AL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 106098
        mmTop = 21960
        mmWidth = 3969
        BandType = 0
      end
      object ppLabel101: TppLabel
        UserName = 'Label101'
        Caption = '0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 129646
        mmTop = 43656
        mmWidth = 5556
        BandType = 0
      end
      object ppLabel102: TppLabel
        UserName = 'Label102'
        Caption = '0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 147373
        mmTop = 43656
        mmWidth = 5556
        BandType = 0
      end
      object ppLabel103: TppLabel
        UserName = 'Label103'
        Caption = '0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 186532
        mmTop = 43656
        mmWidth = 5556
        BandType = 0
      end
      object ppLabel104: TppLabel
        UserName = 'Label104'
        Caption = '0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 205052
        mmTop = 43656
        mmWidth = 5556
        BandType = 0
      end
      object ppLabel139: TppLabel
        UserName = 'Label139'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 205317
        mmTop = 1588
        mmWidth = 794
        BandType = 0
      end
      object ppLabel140: TppLabel
        UserName = 'Label140'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 205317
        mmTop = 5821
        mmWidth = 794
        BandType = 0
      end
      object ppLabel159: TppLabel
        UserName = 'Label159'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 205317
        mmTop = 9790
        mmWidth = 794
        BandType = 0
      end
      object ppShape9: TppShape
        UserName = 'Shape9'
        Pen.Style = psDot
        mmHeight = 265
        mmLeft = 4498
        mmTop = 41540
        mmWidth = 226219
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText52: TppDBText
        UserName = 'DBText35'
        DataField = 'CCNOMB'
        DataPipeline = ppDBIngresoCaja
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 31221
        mmTop = 265
        mmWidth = 42598
        BandType = 4
      end
      object ppDBText53: TppDBText
        UserName = 'DBText36'
        DataField = 'CPTODES'
        DataPipeline = ppDBIngresoCaja
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 74348
        mmTop = 265
        mmWidth = 45773
        BandType = 4
      end
      object ppDBText54: TppDBText
        UserName = 'DBText54'
        AutoSize = True
        DataField = 'INGRESOLOC'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 117740
        mmTop = 265
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText55: TppDBText
        UserName = 'DBText26'
        AutoSize = True
        DataField = 'EGRESOLOC'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 136261
        mmTop = 265
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText56: TppDBText
        UserName = 'DBText56'
        AutoSize = True
        DataField = 'SALDOMN'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '##,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 158486
        mmTop = 265
        mmWidth = 13494
        BandType = 4
      end
      object ppDBText57: TppDBText
        UserName = 'DBText57'
        AutoSize = True
        DataField = 'INGRESOEXT'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 175155
        mmTop = 265
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText58: TppDBText
        UserName = 'DBText39'
        AutoSize = True
        DataField = 'EGRESOEXT'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 194469
        mmTop = 265
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText59: TppDBText
        UserName = 'DBText40'
        AutoSize = True
        DataField = 'SALDOME'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00; -#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 216165
        mmTop = 265
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText60: TppDBText
        UserName = 'DBText41'
        AutoSize = True
        DataField = 'FECHA'
        DataPipeline = ppDBIngresoCaja
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 16404
        mmTop = 265
        mmWidth = 8996
        BandType = 4
      end
      object ppDBCalc17: TppDBCalc
        UserName = 'DBCalc17'
        DataField = 'CPTODES'
        DataPipeline = ppDBIngresoCaja
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 4763
        mmTop = 265
        mmWidth = 6085
        BandType = 4
      end
    end
    object ppSummaryBand3: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppDBCalc13: TppDBCalc
        UserName = 'DBCalc11'
        AutoSize = True
        DataField = 'INGRESOLOC'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 106627
        mmTop = 3704
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc14: TppDBCalc
        UserName = 'DBCalc12'
        AutoSize = True
        DataField = 'EGRESOLOC'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 125413
        mmTop = 3704
        mmWidth = 27517
        BandType = 7
      end
      object ppDBCalc15: TppDBCalc
        UserName = 'DBCalc14'
        AutoSize = True
        DataField = 'INGRESOEXT'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 164307
        mmTop = 3704
        mmWidth = 27781
        BandType = 7
      end
      object ppDBCalc16: TppDBCalc
        UserName = 'DBCalc15'
        AutoSize = True
        DataField = 'EGRESOEXT'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 183886
        mmTop = 3704
        mmWidth = 26723
        BandType = 7
      end
      object ppLabel99: TppLabel
        UserName = 'Label99'
        Caption = 'TOTALES :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 100542
        mmTop = 3704
        mmWidth = 14817
        BandType = 7
      end
      object ppDBText61: TppDBText
        UserName = 'DBText42'
        AutoSize = True
        DataField = 'SALDOMN'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 157692
        mmTop = 3704
        mmWidth = 14288
        BandType = 7
      end
      object ppDBText62: TppDBText
        UserName = 'DBText401'
        AutoSize = True
        DataField = 'SALDOME'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 215371
        mmTop = 3704
        mmWidth = 14023
        BandType = 7
      end
      object ppShape10: TppShape
        UserName = 'Shape10'
        Pen.Style = psDot
        mmHeight = 265
        mmLeft = 4498
        mmTop = 1588
        mmWidth = 226219
        BandType = 7
      end
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBIngresoCaja
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 215900
    PrinterSetup.mmPaperWidth = 279401
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\SOLExes\SOLFormatos\Caja\Dema\MovDiarioDetallado.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 137
    Top = 97
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBIngresoCaja'
    object ppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 47096
      mmPrintPosition = 0
      object ppLabel105: TppLabel
        UserName = 'Label1'
        Caption = 'MOVIMIENTO DE CAJA  DETALLADO '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 105304
        mmTop = 11377
        mmWidth = 51065
        BandType = 0
      end
      object ppDBText63: TppDBText
        UserName = 'DBText63'
        DataField = 'CIADES'
        DataPipeline = ppDBIngresoCaja
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3440
        mmLeft = 8202
        mmTop = 8467
        mmWidth = 59796
        BandType = 0
      end
      object ppLabel106: TppLabel
        UserName = 'Label106'
        Caption = 'DOCUMENTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 5027
        mmTop = 33602
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel107: TppLabel
        UserName = 'Label107'
        Caption = 'TIPO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 2381
        mmTop = 38629
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel108: TppLabel
        UserName = 'Label108'
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 27781
        mmWidth = 245534
        BandType = 0
      end
      object ppLabel109: TppLabel
        UserName = 'Label109'
        Caption = 'NUMERO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 14552
        mmTop = 38629
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel110: TppLabel
        UserName = 'Label110'
        Caption = 'DESCRIPCION'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 32544
        mmTop = 33602
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel111: TppLabel
        UserName = 'Label111'
        Caption = 'AUXILIAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 34660
        mmTop = 38629
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel112: TppLabel
        UserName = 'Label112'
        Caption = 'EFECTIVO '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 123296
        mmTop = 33602
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel113: TppLabel
        UserName = 'Label113'
        Caption = 'S/.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 120121
        mmTop = 38629
        mmWidth = 2910
        BandType = 0
      end
      object ppLabel114: TppLabel
        UserName = 'Label105'
        Caption = '$'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 137054
        mmTop = 38629
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel115: TppLabel
        UserName = 'Label115'
        Caption = 'CHEQUE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 159279
        mmTop = 33602
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel116: TppLabel
        UserName = 'Label116'
        Caption = 'S/.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 155575
        mmTop = 38629
        mmWidth = 2910
        BandType = 0
      end
      object ppLabel117: TppLabel
        UserName = 'Label117'
        Caption = '$'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 172509
        mmTop = 38629
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel118: TppLabel
        UserName = 'Label118'
        Caption = 'TARJETA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 191559
        mmTop = 33602
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel119: TppLabel
        UserName = 'Label119'
        Caption = 'S/.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 188384
        mmTop = 38629
        mmWidth = 2910
        BandType = 0
      end
      object ppLabel120: TppLabel
        UserName = 'Label120'
        Caption = '$'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 205317
        mmTop = 32279
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel121: TppLabel
        UserName = 'Label121'
        Caption = 'P'#225'gina : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 205317
        mmTop = 3175
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel122: TppLabel
        UserName = 'Label122'
        Caption = 'Hora : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 205582
        mmTop = 7408
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel123: TppLabel
        UserName = 'Label403'
        Caption = 'Fecha : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 205582
        mmTop = 11377
        mmWidth = 9525
        BandType = 0
      end
      object ppSystemVariable10: TppSystemVariable
        UserName = 'SystemVariable10'
        VarType = vtPageSet
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 218017
        mmTop = 3175
        mmWidth = 7408
        BandType = 0
      end
      object ppSystemVariable11: TppSystemVariable
        UserName = 'SystemVariable11'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 218282
        mmTop = 7408
        mmWidth = 16404
        BandType = 0
      end
      object ppSystemVariable12: TppSystemVariable
        UserName = 'SystemVariable12'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 218017
        mmTop = 11377
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel124: TppLabel
        UserName = 'Label124'
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 42863
        mmWidth = 263261
        BandType = 0
      end
      object ppLabel125: TppLabel
        UserName = 'Label125'
        Caption = 'CONCEPTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 74613
        mmTop = 35719
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel126: TppLabel
        UserName = 'Label126'
        Caption = 'T/C'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 247650
        mmTop = 34131
        mmWidth = 4763
        BandType = 0
      end
      object ppLabel127: TppLabel
        UserName = 'Label127'
        Caption = 'CLASE '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 254530
        mmTop = 34131
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel128: TppLabel
        UserName = 'Label128'
        Caption = 'TOTAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 224103
        mmTop = 33073
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel129: TppLabel
        UserName = 'Label129'
        Caption = 'S/.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 220928
        mmTop = 31750
        mmWidth = 2910
        BandType = 0
      end
      object ppLabel130: TppLabel
        UserName = 'Label130'
        Caption = '$'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 237861
        mmTop = 31750
        mmWidth = 1588
        BandType = 0
      end
      object ppDBText65: TppDBText
        UserName = 'DBText65'
        AutoSize = True
        DataField = 'BANCOID'
        DataPipeline = ppDBIngresoCaja
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 112184
        mmTop = 16404
        mmWidth = 12700
        BandType = 0
      end
      object ppDBText66: TppDBText
        UserName = 'DBText66'
        AutoSize = True
        DataField = 'BANCONOM'
        DataPipeline = ppDBIngresoCaja
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 125413
        mmTop = 16404
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel131: TppLabel
        UserName = 'lblfecIni3'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 112977
        mmTop = 22225
        mmWidth = 1852
        BandType = 0
      end
      object ppLabel132: TppLabel
        UserName = 'lblFecFin3'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 137319
        mmTop = 22225
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel133: TppLabel
        UserName = 'Label133'
        Caption = 'DEL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 105834
        mmTop = 22225
        mmWidth = 5556
        BandType = 0
      end
      object ppLabel134: TppLabel
        UserName = 'Label134'
        Caption = 'AL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 129646
        mmTop = 22225
        mmWidth = 3969
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText67: TppDBText
        UserName = 'DBText67'
        DataField = 'DOCID'
        DataPipeline = ppDBIngresoCaja
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 3440
        mmTop = 1058
        mmWidth = 4763
        BandType = 4
      end
      object ppDBText68: TppDBText
        UserName = 'DBText68'
        DataField = 'NODOC'
        DataPipeline = ppDBIngresoCaja
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 8731
        mmTop = 1058
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText69: TppDBText
        UserName = 'DBText69'
        DataField = 'CCNOMB'
        DataPipeline = ppDBIngresoCaja
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 26194
        mmTop = 1058
        mmWidth = 48154
        BandType = 4
      end
      object ppDBText70: TppDBText
        UserName = 'DBText70'
        DataField = 'PAGEFECTMN'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 111654
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText71: TppDBText
        UserName = 'DBText71'
        DataField = 'PAGEFECTME'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 129646
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText72: TppDBText
        UserName = 'DBText72'
        DataField = 'PAGNOTDMN'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 183621
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText73: TppDBText
        UserName = 'DBText103'
        DataField = 'PAGNOTDME'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 201348
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText74: TppDBText
        UserName = 'DBText74'
        DataField = 'CPTODES'
        DataPipeline = ppDBIngresoCaja
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 74613
        mmTop = 1058
        mmWidth = 36777
        BandType = 4
      end
      object ppDBText75: TppDBText
        UserName = 'DBText75'
        DataField = 'TCAMBIO'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 245534
        mmTop = 1058
        mmWidth = 8996
        BandType = 4
      end
      object ppDBText76: TppDBText
        UserName = 'DBText76'
        DataField = 'CLAUXID'
        DataPipeline = ppDBIngresoCaja
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 258498
        mmTop = 1058
        mmWidth = 3704
        BandType = 4
      end
      object ppDBText77: TppDBText
        UserName = 'DBText77'
        DataField = 'TOTALLOC'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 219075
        mmTop = 1058
        mmWidth = 11642
        BandType = 4
      end
      object ppDBText78: TppDBText
        UserName = 'DBText302'
        DataField = 'TOTALEXT'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 230982
        mmTop = 1058
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText79: TppDBText
        UserName = 'DBText79'
        DataField = 'PAGCHEQUMN'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 147902
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText80: TppDBText
        UserName = 'DBText80'
        DataField = 'PAGCHEQUME'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3704
        mmLeft = 165894
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand5: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand4: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel135: TppLabel
        UserName = 'Label502'
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 265
        mmWidth = 245534
        BandType = 7
      end
      object ppLabel136: TppLabel
        UserName = 'Label136'
        Caption = 'TOTALES : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 75671
        mmTop = 5027
        mmWidth = 15875
        BandType = 7
      end
      object ppDBCalc18: TppDBCalc
        UserName = 'DBCalc18'
        DataField = 'PAGEFECTMN'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3440
        mmLeft = 111654
        mmTop = 4498
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc19: TppDBCalc
        UserName = 'DBCalc19'
        DataField = 'PAGEFECTME'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3440
        mmLeft = 129646
        mmTop = 4498
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc20: TppDBCalc
        UserName = 'DBCalc20'
        DataField = 'PAGCHEQUMN'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3440
        mmLeft = 147902
        mmTop = 4498
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc21: TppDBCalc
        UserName = 'DBCalc21'
        DataField = 'PAGCHEQUME'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3440
        mmLeft = 165894
        mmTop = 4498
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc22: TppDBCalc
        UserName = 'DBCalc22'
        DataField = 'PAGNOTDMN'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3440
        mmLeft = 183621
        mmTop = 4498
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc23: TppDBCalc
        UserName = 'DBCalc23'
        DataField = 'PAGNOTDME'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3440
        mmLeft = 201348
        mmTop = 4498
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc24: TppDBCalc
        UserName = 'DBCalc24'
        DataField = 'TOTALLOC'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3440
        mmLeft = 219075
        mmTop = 4498
        mmWidth = 12965
        BandType = 7
      end
      object ppDBCalc25: TppDBCalc
        UserName = 'DBCalc101'
        DataField = 'TOTALEXT'
        DataPipeline = ppDBIngresoCaja
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIngresoCaja'
        mmHeight = 3440
        mmLeft = 230982
        mmTop = 4498
        mmWidth = 17198
        BandType = 7
      end
    end
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
    Report = ppReport2
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 496
    Top = 96
  end
  object ppReport2: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report5'
    PrinterSetup.PaperName = 'Continuo USA 14 7/8'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 378090
    PrinterSetup.PaperSize = 129
    Template.FileName = 'C:\SOLExes\SOLFormatos\Caja\Dema\ECaja.rtm'
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppReport2PreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 528
    Top = 96
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand6: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 34131
      mmPrintPosition = 0
      object pplblCompaniaECaja: TppLabel
        UserName = 'lblCompaniaECaja'
        Caption = 'DISTRIBUIDORA INCORESA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 22225
        mmTop = 794
        mmWidth = 40746
        BandType = 0
      end
      object ppLabel138: TppLabel
        UserName = 'Label1'
        Caption = 'EGRESOS DE CAJA DETALLADO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 168805
        mmTop = 2646
        mmWidth = 46302
        BandType = 0
      end
      object pplblTituloECaja: TppLabel
        UserName = 'Label137'
        Caption = 'CAJA: 41          CAJA GENERAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 164042
        mmTop = 7408
        mmWidth = 55563
        BandType = 0
      end
      object pplblRangoECaja: TppLabel
        UserName = 'Label138'
        Caption = 'RANGO DE FECHAS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 178065
        mmTop = 11906
        mmWidth = 27781
        BandType = 0
      end
      object ppSystemVariable13: TppSystemVariable
        UserName = 'SystemVariable13'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 323321
        mmTop = 0
        mmWidth = 18521
        BandType = 0
      end
      object ppSystemVariable14: TppSystemVariable
        UserName = 'SystemVariable14'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 323321
        mmTop = 3969
        mmWidth = 14817
        BandType = 0
      end
      object ppSystemVariable15: TppSystemVariable
        UserName = 'SystemVariable15'
        VarType = vtPageNoDesc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 323321
        mmTop = 8467
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel141: TppLabel
        UserName = 'Label139'
        Caption = 'DOCUMENTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 62442
        mmTop = 25135
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel142: TppLabel
        UserName = 'Label142'
        Caption = 'DIARIO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10848
        mmTop = 21960
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel143: TppLabel
        UserName = 'Label143'
        Caption = 'N'#176
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 29104
        mmTop = 21960
        mmWidth = 3704
        BandType = 0
      end
      object ppLabel144: TppLabel
        UserName = 'Label144'
        Caption = 'IMPORTE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 282840
        mmTop = 21960
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel145: TppLabel
        UserName = 'Label145'
        Caption = 'M. NAC'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 284428
        mmTop = 26458
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel146: TppLabel
        UserName = 'Label146'
        Caption = 'IMPORTE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 306124
        mmTop = 21960
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel147: TppLabel
        UserName = 'Label147'
        Caption = 'M. EXT'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 307182
        mmTop = 26458
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel148: TppLabel
        UserName = 'Label148'
        Caption = 'CAMBIO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 262732
        mmTop = 26458
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel149: TppLabel
        UserName = 'Label149'
        Caption = 'CLASE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 123031
        mmTop = 21960
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel150: TppLabel
        UserName = 'Label150'
        Caption = 'AUXILIAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 133879
        mmTop = 21960
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel152: TppLabel
        UserName = 'Label152'
        Caption = 'FECHA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 43656
        mmTop = 21960
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel151: TppLabel
        UserName = 'Label2'
        Caption = 'TIPO DE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 261673
        mmTop = 21960
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel153: TppLabel
        UserName = 'Label3'
        Caption = 'CUENTA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 109009
        mmTop = 21960
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel154: TppLabel
        UserName = 'Label153'
        Caption = 'CONTABLE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 106627
        mmTop = 26458
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel156: TppLabel
        UserName = 'Label156'
        Caption = 'CONCEPTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 206905
        mmTop = 21960
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel157: TppLabel
        UserName = 'Label157'
        Caption = 'TODO EN '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 328349
        mmTop = 21960
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel158: TppLabel
        UserName = 'Label158'
        Caption = 'M. NAC'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 330201
        mmTop = 26458
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel137: TppLabel
        UserName = 'Label4'
        Caption = 'MOVIMIENTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 21696
        mmTop = 26458
        mmWidth = 18521
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 8996
        mmTop = 18785
        mmWidth = 346076
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 8996
        mmTop = 32279
        mmWidth = 346076
        BandType = 0
      end
    end
    object ppDetailBand6: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppDBText81: TppDBText
        UserName = 'DBText81'
        DataField = 'DOCDES'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 59796
        mmTop = 0
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText82: TppDBText
        UserName = 'DBText82'
        DataField = 'CPSERIE'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 79375
        mmTop = 0
        mmWidth = 6615
        BandType = 4
      end
      object ppDBText83: TppDBText
        UserName = 'DBText83'
        DataField = 'CPNODOC'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 87313
        mmTop = 0
        mmWidth = 16404
        BandType = 4
      end
      object ppDBText87: TppDBText
        UserName = 'DBText87'
        AutoSize = True
        DataField = 'EGRESOLOC'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 279136
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText88: TppDBText
        UserName = 'DBText88'
        AutoSize = True
        DataField = 'EGRESOEXT'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 302419
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText89: TppDBText
        UserName = 'DBText89'
        AutoSize = True
        DataField = 'DETCPAG'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 260086
        mmTop = 0
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText92: TppDBText
        UserName = 'DBText92'
        AutoSize = True
        DataField = 'ECFCOMP'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 41540
        mmTop = 0
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText93: TppDBText
        UserName = 'DBText93'
        DataField = 'CUENTAID'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 105834
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText94: TppDBText
        UserName = 'DBText94'
        DataField = 'CPTODES'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 203730
        mmTop = 0
        mmWidth = 50536
        BandType = 4
      end
      object ppDBText95: TppDBText
        UserName = 'DBText95'
        AutoSize = True
        DataField = 'EGRESOSOL'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 328613
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText90: TppDBText
        UserName = 'DBText90'
        DataField = 'CLAUXID'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 124090
        mmTop = 0
        mmWidth = 6879
        BandType = 4
      end
      object ppDBText91: TppDBText
        UserName = 'DBText91'
        DataField = 'PROV'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 133879
        mmTop = 0
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText84: TppDBText
        UserName = 'DBText84'
        DataField = 'AUXNOMB'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 151342
        mmTop = 0
        mmWidth = 47361
        BandType = 4
      end
      object ppDBText85: TppDBText
        UserName = 'DBText85'
        DataField = 'TDIARID'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 11377
        mmTop = 0
        mmWidth = 6350
        BandType = 4
      end
      object ppDBText86: TppDBText
        UserName = 'DBText86'
        AutoSize = True
        DataField = 'ECNOCOMP'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 22225
        mmTop = 0
        mmWidth = 14817
        BandType = 4
      end
    end
    object ppSummaryBand5: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel155: TppLabel
        UserName = 'Label151'
        Caption = 'Total General:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 237596
        mmTop = 3175
        mmWidth = 25929
        BandType = 7
      end
      object ppDBCalc26: TppDBCalc
        UserName = 'DBCalc26'
        AutoSize = True
        DataField = 'EGRESOLOC'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 268023
        mmTop = 3175
        mmWidth = 27781
        BandType = 7
      end
      object ppDBCalc27: TppDBCalc
        UserName = 'DBCalc27'
        AutoSize = True
        DataField = 'EGRESOEXT'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 291307
        mmTop = 3175
        mmWidth = 27781
        BandType = 7
      end
      object ppDBCalc28: TppDBCalc
        UserName = 'DBCalc28'
        AutoSize = True
        DataField = 'EGRESOSOL'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 317501
        mmTop = 3175
        mmWidth = 27781
        BandType = 7
      end
    end
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = DMTE.dsQry2
    UserName = 'DBPipeline1'
    Left = 552
    Top = 96
    object ppField1: TppField
      FieldAlias = 'SRV_RUTA'
      FieldName = 'SRV_RUTA'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppField2: TppField
      FieldAlias = 'SRV_DB'
      FieldName = 'SRV_DB'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object ppField3: TppField
      FieldAlias = 'SRV_VERS'
      FieldName = 'SRV_VERS'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object ppField4: TppField
      FieldAlias = 'SRV_EQUIP'
      FieldName = 'SRV_EQUIP'
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
    object ppField5: TppField
      FieldAlias = 'SRV_PRESU'
      FieldName = 'SRV_PRESU'
      FieldLength = 1
      DisplayWidth = 1
      Position = 4
    end
    object ppField6: TppField
      FieldAlias = 'DIFCAMBIO'
      FieldName = 'DIFCAMBIO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 5
    end
    object ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'DECPU_OC'
      FieldName = 'DECPU_OC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'NDIG_ARTIC'
      FieldName = 'NDIG_ARTIC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'NDIG_PROV'
      FieldName = 'NDIG_PROV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppField10: TppField
      FieldAlias = 'NISA_IGV'
      FieldName = 'NISA_IGV'
      FieldLength = 1
      DisplayWidth = 1
      Position = 9
    end
    object ppField11: TppField
      FieldAlias = 'RQSCOMP'
      FieldName = 'RQSCOMP'
      FieldLength = 1
      DisplayWidth = 1
      Position = 10
    end
    object ppField12: TppField
      FieldAlias = 'RPTCIA'
      FieldName = 'RPTCIA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 11
    end
    object ppField13: TppField
      FieldAlias = 'ACFCTAS1'
      FieldName = 'ACFCTAS1'
      FieldLength = 20
      DisplayWidth = 20
      Position = 12
    end
    object ppField14: TppField
      FieldAlias = 'ACFCTAS2'
      FieldName = 'ACFCTAS2'
      FieldLength = 20
      DisplayWidth = 20
      Position = 13
    end
    object ppField15: TppField
      FieldAlias = 'URQCIA'
      FieldName = 'URQCIA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 14
    end
    object ppField16: TppField
      FieldAlias = 'CTRL_PCG'
      FieldName = 'CTRL_PCG'
      FieldLength = 1
      DisplayWidth = 1
      Position = 15
    end
    object ppField17: TppField
      FieldAlias = 'EXOVIS'
      FieldName = 'EXOVIS'
      FieldLength = 1
      DisplayWidth = 1
      Position = 16
    end
    object ppField18: TppField
      FieldAlias = 'NEGCIA'
      FieldName = 'NEGCIA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 17
    end
    object ppField19: TppField
      FieldAlias = 'AMEDIDAOPC'
      FieldName = 'AMEDIDAOPC'
      FieldLength = 15
      DisplayWidth = 15
      Position = 18
    end
    object ppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'RQSCONSUMO'
      FieldName = 'RQSCONSUMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object ppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'NDIGLOTE'
      FieldName = 'NDIGLOTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object ppField22: TppField
      FieldAlias = 'VRN_AUTODDLC'
      FieldName = 'VRN_AUTODDLC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 21
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
    PrinterSetup.mmMarginBottom = 6250
    PrinterSetup.mmMarginLeft = 0
    PrinterSetup.mmMarginRight = 250
    PrinterSetup.mmMarginTop = 6250
    PrinterSetup.mmPaperHeight = 276000
    PrinterSetup.mmPaperWidth = 350000
    PrinterSetup.PaperSize = 119
    Template.FileName = 'C:\SOLExes\SOLFormatos\Caja\Dema\ArqueoCajaP.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppRCuadrePreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 653
    Top = 100
    Version = '7.02'
    mmColumnWidth = 342300
    DataPipelineName = 'ppDBIE'
    object ppHeaderBand7: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 31485
      mmPrintPosition = 0
      object pplblCia: TppLabel
        UserName = 'lblCia'
        Caption = 'DISTRIBUIDORA INCORESA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 16404
        mmTop = 1323
        mmWidth = 40746
        BandType = 0
      end
      object pplblTitulo: TppLabel
        UserName = 'lblTitulo'
        Caption = 'Cuadre de Caja'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 172244
        mmTop = 1588
        mmWidth = 25929
        BandType = 0
      end
      object pplblFecha: TppLabel
        UserName = 'lblFecha'
        Caption = 'Fecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 299509
        mmTop = 9790
        mmWidth = 9260
        BandType = 0
      end
      object pplblHora: TppLabel
        UserName = 'lblHora'
        AutoSize = False
        Caption = 'Hora'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 299509
        mmTop = 5821
        mmWidth = 11642
        BandType = 0
      end
      object pplblPg: TppLabel
        UserName = 'lblPg'
        Caption = 'P'#225'gina'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 299509
        mmTop = 1588
        mmWidth = 11113
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 14288
        mmTop = 26723
        mmWidth = 333640
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 14288
        mmTop = 16933
        mmWidth = 333640
        BandType = 0
      end
      object pplblDocu: TppLabel
        UserName = 'lblDocu'
        AutoSize = False
        Caption = 'Documento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 16404
        mmTop = 22225
        mmWidth = 16669
        BandType = 0
      end
      object pplblFech: TppLabel
        UserName = 'lblFech'
        Caption = 'Fecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 47625
        mmTop = 22225
        mmWidth = 9260
        BandType = 0
      end
      object pplblMone: TppLabel
        UserName = 'lblMone'
        Caption = 'Mda.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 63500
        mmTop = 22225
        mmWidth = 7408
        BandType = 0
      end
      object pplblConcep: TppLabel
        UserName = 'lblConcep'
        Caption = 'Concepto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 72496
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
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 125942
        mmTop = 22225
        mmWidth = 20638
        BandType = 0
      end
      object pplblIngExt: TppLabel
        UserName = 'lblIngExt'
        AutoSize = False
        Caption = 'Ingresos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 189177
        mmTop = 22225
        mmWidth = 20638
        BandType = 0
      end
      object pplblTC: TppLabel
        UserName = 'lblTC'
        Caption = 'T/C'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 255588
        mmTop = 22225
        mmWidth = 5556
        BandType = 0
      end
      object pplblAux: TppLabel
        UserName = 'lblAux'
        Caption = 'Auxiliar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 275696
        mmTop = 22225
        mmWidth = 14817
        BandType = 0
      end
      object pplblClase: TppLabel
        UserName = 'lblClase'
        Caption = 'Clase'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 265113
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
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 315119
        mmTop = 1852
        mmWidth = 1852
        BandType = 0
      end
      object ppsvHora: TppSystemVariable
        UserName = 'svHora'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 315119
        mmTop = 6085
        mmWidth = 24077
        BandType = 0
      end
      object ppsvFecha: TppSystemVariable
        UserName = 'svFecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 315384
        mmTop = 10054
        mmWidth = 18521
        BandType = 0
      end
      object pplblDescri: TppLabel
        UserName = 'lblDescri'
        Caption = 'Descripci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 291836
        mmTop = 22225
        mmWidth = 20373
        BandType = 0
      end
      object pplblImpLoc: TppLabel
        UserName = 'lblImpLoc'
        Caption = 'Importe Soles'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 149225
        mmTop = 18521
        mmWidth = 24077
        BandType = 0
      end
      object pplblImpExt: TppLabel
        UserName = 'lblImpExt'
        Caption = 'Importe D'#243'lares'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 208757
        mmTop = 18521
        mmWidth = 27781
        BandType = 0
      end
      object pplblEgrExt: TppLabel
        UserName = 'lblEgrExt'
        AutoSize = False
        Caption = 'Egresos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 209815
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
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 146579
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
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 168540
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
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 231775
        mmTop = 22225
        mmWidth = 20638
        BandType = 0
      end
      object pplblDel: TppLabel
        UserName = 'lblTitulo1'
        Caption = 'Del :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 170392
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
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 89959
        mmTop = 27781
        mmWidth = 32544
        BandType = 0
      end
      object ppvSaldoASol: TppVariable
        UserName = 'vSaldoASol'
        AutoSize = False
        CalcOrder = 0
        DataType = dtCurrency
        DisplayFormat = '#,0.00; -#0,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 168540
        mmTop = 27781
        mmWidth = 20638
        BandType = 0
      end
      object ppvSaldoADol: TppVariable
        UserName = 'vSaldoADol'
        AutoSize = False
        CalcOrder = 1
        DataType = dtCurrency
        DisplayFormat = '#,0.00; -#0,00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 231775
        mmTop = 27781
        mmWidth = 20638
        BandType = 0
      end
      object ppLabel161: TppLabel
        UserName = 'Label161'
        AutoSize = False
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 311944
        mmTop = 1588
        mmWidth = 1852
        BandType = 0
      end
      object ppLabel162: TppLabel
        UserName = 'Label162'
        AutoSize = False
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 311944
        mmTop = 9790
        mmWidth = 1852
        BandType = 0
      end
      object ppLabel163: TppLabel
        UserName = 'Label163'
        AutoSize = False
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 311944
        mmTop = 5821
        mmWidth = 1852
        BandType = 0
      end
    end
    object ppDetailBand7: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppdbFecha: TppDBText
        UserName = 'dbFecha'
        DataField = 'ECFCOMP'
        DataPipeline = ppDBIE
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBIE'
        mmHeight = 3704
        mmLeft = 16404
        mmTop = 0
        mmWidth = 25665
        BandType = 4
      end
      object ppdbMone: TppDBText
        UserName = 'dbMone'
        DataField = 'TMONABR'
        DataPipeline = ppDBIE
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBIE'
        mmHeight = 3704
        mmLeft = 62442
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
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBIE'
        mmHeight = 3704
        mmLeft = 72496
        mmTop = 0
        mmWidth = 48683
        BandType = 4
      end
      object ppdbMonIngLoc: TppDBText
        UserName = 'dbMonIngLoc'
        DataField = 'ECMTOLOCI'
        DataPipeline = ppDBIE
        DisplayFormat = '#,0.00; -#0,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIE'
        mmHeight = 3704
        mmLeft = 126207
        mmTop = 0
        mmWidth = 20638
        BandType = 4
      end
      object ppdbMonEgrLoc: TppDBText
        UserName = 'dbMonEgrLoc'
        DataField = 'ECMTOLOC'
        DataPipeline = ppDBIE
        DisplayFormat = '#,0.00; -#0,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIE'
        mmHeight = 3704
        mmLeft = 146579
        mmTop = 0
        mmWidth = 20638
        BandType = 4
      end
      object ppDBText96: TppDBText
        UserName = 'DBText96'
        DataField = 'ECTCAMB'
        DataPipeline = ppDBIE
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIE'
        mmHeight = 3704
        mmLeft = 249238
        mmTop = 0
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText97: TppDBText
        UserName = 'DBText97'
        DataField = 'AUXNOMB'
        DataPipeline = ppDBIE
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBIE'
        mmHeight = 3704
        mmLeft = 291836
        mmTop = 0
        mmWidth = 55827
        BandType = 4
      end
      object ppDBText98: TppDBText
        UserName = 'DBText98'
        AutoSize = True
        DataField = 'PROV'
        DataPipeline = ppDBIE
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBIE'
        mmHeight = 3704
        mmLeft = 279401
        mmTop = 0
        mmWidth = 7408
        BandType = 4
      end
      object ppDBText99: TppDBText
        UserName = 'DBText99'
        AutoSize = True
        DataField = 'CLAUXID'
        DataPipeline = ppDBIE
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBIE'
        mmHeight = 3704
        mmLeft = 263261
        mmTop = 0
        mmWidth = 12965
        BandType = 4
      end
      object ppdbMonIngExt: TppDBText
        UserName = 'dbMonIngExt'
        DataField = 'ECMTOEXTI'
        DataPipeline = ppDBIE
        DisplayFormat = '#,0.00; -#0,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIE'
        mmHeight = 3704
        mmLeft = 189177
        mmTop = 0
        mmWidth = 20638
        BandType = 4
      end
      object ppdbMonEgrExt: TppDBText
        UserName = 'dbMonEgrExt'
        DataField = 'ECMTOEXT'
        DataPipeline = ppDBIE
        DisplayFormat = '#,0.00; -#0,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIE'
        mmHeight = 3704
        mmLeft = 209815
        mmTop = 0
        mmWidth = 20638
        BandType = 4
      end
      object ppdbSumaIng: TppVariable
        UserName = 'dbSumaIng'
        AutoSize = False
        CalcOrder = 0
        DataType = dtDouble
        DisplayFormat = '#,0.00; -#0,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        OnCalc = ppdbSumaIngCalc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 168540
        mmTop = 0
        mmWidth = 20638
        BandType = 4
      end
      object ppdbSumaEgr: TppVariable
        UserName = 'dbSumaIng1'
        AutoSize = False
        CalcOrder = 1
        DataType = dtDouble
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        OnCalc = ppdbSumaEgrCalc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 231775
        mmTop = 0
        mmWidth = 20638
        BandType = 4
      end
      object ppDBText100: TppDBText
        UserName = 'DBText100'
        AutoSize = True
        DataField = 'FECHA'
        DataPipeline = ppDBIE
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBIE'
        mmHeight = 3704
        mmLeft = 47625
        mmTop = 0
        mmWidth = 9260
        BandType = 4
      end
    end
    object ppSummaryBand6: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 12435
      mmPrintPosition = 0
      object pplblTotal: TppLabel
        UserName = 'lblTotal'
        Caption = 'Total General Mon. Nacional :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 68263
        mmTop = 1323
        mmWidth = 53711
        BandType = 7
      end
      object ppdbcIngLoc: TppDBCalc
        UserName = 'dbcIngLoc'
        AutoSize = True
        DataField = 'ECMTOLOCI'
        DataPipeline = ppDBIE
        DisplayFormat = '#,0.00; -#0,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIE'
        mmHeight = 3704
        mmLeft = 119063
        mmTop = 1323
        mmWidth = 27781
        BandType = 7
      end
      object ppdbcIngExt: TppDBCalc
        UserName = 'dbcIngExt'
        AutoSize = True
        DataField = 'ECMTOLOC'
        DataPipeline = ppDBIE
        DisplayFormat = '#,0.00; -#0,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIE'
        mmHeight = 3704
        mmLeft = 141288
        mmTop = 1323
        mmWidth = 25929
        BandType = 7
      end
      object ppdbcEgrLoc: TppDBCalc
        UserName = 'dbcEgrLoc'
        AutoSize = True
        DataField = 'ECMTOEXTI'
        DataPipeline = ppDBIE
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIE'
        mmHeight = 3704
        mmLeft = 182034
        mmTop = 1323
        mmWidth = 27781
        BandType = 7
      end
      object ppdbcEgrExt: TppDBCalc
        UserName = 'dbcEgrExt'
        AutoSize = True
        DataField = 'ECMTOEXT'
        DataPipeline = ppDBIE
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Roman 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBIE'
        mmHeight = 3704
        mmLeft = 204523
        mmTop = 1323
        mmWidth = 25929
        BandType = 7
      end
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppDBIE1'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 7408
        mmWidth = 349750
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
          PrinterSetup.mmMarginBottom = 6250
          PrinterSetup.mmMarginLeft = 0
          PrinterSetup.mmMarginRight = 250
          PrinterSetup.mmMarginTop = 6250
          PrinterSetup.mmPaperHeight = 276000
          PrinterSetup.mmPaperWidth = 350000
          PrinterSetup.PaperSize = 119
          Template.FileName = 'C:\SOLExes\SOLFormatos\Caja\Dema\ArqueoCajaP.rtm'
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
              mmHeight = 3704
              mmLeft = 150019
              mmTop = 1852
              mmWidth = 41275
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
            object ppLabel45: TppLabel
              UserName = 'Label45'
              Caption = 'Documento'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Roman 12cpi'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 32279
              mmTop = 16669
              mmWidth = 16669
              BandType = 1
            end
            object pplblImporS: TppLabel
              UserName = 'lblImporS'
              Caption = ' Importe Soles'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Roman 12cpi'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 125413
              mmTop = 12435
              mmWidth = 21431
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
              Caption = 'Importe D'#243'lares'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Roman 12cpi'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 225690
              mmTop = 12435
              mmWidth = 23548
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
              UserName = 'lblAcumuD'
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
              DisplayFormat = '#,0.00; -#,0.00'
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
              DisplayFormat = '#,0.00; -#,0.00'
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
            object ppLine5: TppLine
              UserName = 'Line5'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 29369
              mmTop = 794
              mmWidth = 260615
              BandType = 1
            end
          end
          object ppDetailBand8: TppDetailBand
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
              DisplayFormat = '#,0.00; -#,0.00'
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
              DisplayFormat = '#,0.00; -#,0.00'
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
              DisplayFormat = '#,0.00; -#,0.00'
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
              DisplayFormat = '#,0.00; -#,0.00'
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
          object ppSummaryBand7: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object ppdbcingS: TppDBCalc
              UserName = 'dbcingS'
              DataField = 'MTOLOCI'
              DataPipeline = ppDBIE1
              DisplayFormat = '#,0.00; -#,0.00'
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
              DisplayFormat = '#,0.00; -#,0.00'
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
              DisplayFormat = '#,0.00; -#0,0.00'
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
              mmTop = 265
              mmWidth = 22225
              BandType = 7
            end
            object ppdbcegrD: TppDBCalc
              UserName = 'dbcegrD'
              DataField = 'MTOEXTE'
              DataPipeline = ppDBIE1
              DisplayFormat = '#,0.00; -#,0.00'
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
              DisplayFormat = '#,0.00; -#,0.00'
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
              DisplayFormat = '#,0.00; -#,0.00'
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
              DisplayFormat = '#,0.00; -#,0.00'
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
              DisplayFormat = '#,0.00; -#,0.00'
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
    Left = 621
    Top = 100
  end
  object ppDBIE1: TppDBPipeline
    UserName = 'DBIE1'
    Left = 685
    Top = 100
  end
  object ppDesigner2: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 717
    Top = 100
  end
  object ppdb2: TppDBPipeline
    UserName = 'db2'
    Left = 288
    Top = 104
  end
  object ppdb1: TppDBPipeline
    UserName = 'db1'
    Left = 325
    Top = 105
  end
  object ppr1: TppReport
    AutoStop = False
    DataPipeline = ppdb1
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
    Template.FileName = 'C:\oaEjecuta\RTMS\CAJA\Dema\IngresosConta.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 360
    Top = 104
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdb1'
    object ppHeaderBand8: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDetailBand9: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
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
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 397
    Top = 105
  end
end

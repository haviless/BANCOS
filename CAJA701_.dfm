object FToolRegRet: TFToolRegRet
  Left = 118
  Top = 213
  Width = 780
  Height = 225
  Caption = 'Registro del R'#233'gimen de Retenciones'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object PnlComprobante: TPanel
    Left = 0
    Top = 0
    Width = 772
    Height = 191
    Align = alClient
    Color = 14869218
    TabOrder = 0
    object lblCia: TLabel
      Left = 9
      Top = 8
      Width = 74
      Height = 15
      Caption = 'RUC Compa'#241#237'a'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label1: TLabel
      Left = 277
      Top = 9
      Width = 42
      Height = 13
      Caption = 'A'#241'o Mes'
    end
    object Bevel1: TBevel
      Left = 12
      Top = 112
      Width = 516
      Height = 42
    end
    object Label2: TLabel
      Left = 24
      Top = 128
      Width = 32
      Height = 15
      Caption = 'Inicio'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 180
      Top = 128
      Width = 25
      Height = 15
      Caption = 'Final'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object sbDisenoRep: TSpeedButton
      Left = 3
      Top = 131
      Width = 7
      Height = 22
      Flat = True
      OnClick = sbDisenoRepClick
    end
    object dblcCia: TwwDBLookupCombo
      Left = 6
      Top = 24
      Width = 99
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      LookupTable = DMTE.cdsQry6
      LookupField = 'CIARUC'
      Options = [loColLines, loRowLines, loTitles]
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnEnter = dblcCiaEnter
      OnExit = dblcCiaExit
      OnNotInList = dblcCiaNotInList
    end
    object edtCia: TEdit
      Left = 106
      Top = 24
      Width = 158
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
    object Z2bbtnRegRetenc: TBitBtn
      Left = 558
      Top = 119
      Width = 127
      Height = 27
      Hint = 'Ver Reporte'
      Caption = 'Reg.R'#233'gimen Retenc.'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      Visible = False
      OnClick = Z2bbtnRegRetencClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
    object dblcPeriodo: TwwDBLookupCombo
      Left = 269
      Top = 24
      Width = 70
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      LookupField = 'ANOMES'
      ParentFont = False
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnEnter = dblcPeriodoEnter
      OnExit = dblcPeriodoExit
    end
    object Z2bbtnLibReten: TBitBtn
      Left = 340
      Top = 67
      Width = 149
      Height = 28
      Caption = 'Registro de Retenciones'
      TabOrder = 5
      OnClick = Z2bbtnLibRetenClick
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
      Margin = 6
      NumGlyphs = 2
    end
    object Z2bbtnRevisaRet: TBitBtn
      Left = 558
      Top = 19
      Width = 128
      Height = 28
      Caption = 'Revisa Ret.del Mes'
      TabOrder = 6
      OnClick = Z2bbtnRevisaRetClick
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
      Margin = 6
      NumGlyphs = 2
    end
    object rgOrden: TRadioGroup
      Left = 687
      Top = 4
      Width = 82
      Height = 57
      Caption = 'Ordenado por'
      ItemIndex = 0
      Items.Strings = (
        'Retenci'#243'n'
        'Proveedor')
      TabOrder = 7
    end
    object Z2bbtnImpBloque: TBitBtn
      Left = 558
      Top = 67
      Width = 128
      Height = 28
      Hint = 'Impresi'#243'n en Bloque'
      Caption = 'Impresi'#243'n en Bloque'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = Z2bbtnImpBloqueClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
        000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
        FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
        00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
        00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
        FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
        0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
        05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
        55557F7777777555555500000005555555557777777555555555}
      Margin = 6
      NumGlyphs = 2
    end
    object Z2bbtnTxPDT: TBitBtn
      Left = 340
      Top = 19
      Width = 174
      Height = 28
      Caption = 'Transferencia al PDT'
      TabOrder = 3
      OnClick = Z2bbtnTxPDTClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
        7700333333337777777733333333008088003333333377F73377333333330088
        88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
        000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
        FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
        99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      Margin = 6
      NumGlyphs = 2
    end
    object bbtnRetProv: TBitBtn
      Left = 340
      Top = 120
      Width = 169
      Height = 28
      Caption = 'Retenciones por Proveedor'
      TabOrder = 9
      OnClick = bbtnRetProvClick
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
      Margin = 6
      NumGlyphs = 2
    end
    object dtpDesde: TwwDBDateTimePicker
      Left = 63
      Top = 123
      Width = 100
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ShowButton = True
      TabOrder = 10
    end
    object dtpHasta: TwwDBDateTimePicker
      Left = 214
      Top = 123
      Width = 100
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ShowButton = True
      TabOrder = 11
    end
    object gbFecRep: TGroupBox
      Left = 9
      Top = 57
      Width = 329
      Height = 47
      Enabled = False
      TabOrder = 12
      object dtpFecRep: TwwDBDateTimePicker
        Left = 101
        Top = 17
        Width = 109
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Epoch = 1950
        ShowButton = True
        TabOrder = 0
        UnboundDataType = wwDTEdtDate
      end
    end
    object cbFecRep: TCheckBox
      Left = 9
      Top = 54
      Width = 232
      Height = 17
      Caption = 'Fecha Reporte de Registro de Retenciones'
      TabOrder = 13
      OnClick = cbFecRepClick
    end
    object bbtnRegRetA4: TBitBtn
      Left = 490
      Top = 67
      Width = 22
      Height = 28
      Caption = 'A4'
      TabOrder = 14
      Visible = False
      OnClick = bbtnRegRetA4Click
    end
    object btnExportarExcel: TBitBtn
      Left = 514
      Top = 67
      Width = 32
      Height = 27
      TabOrder = 15
      OnClick = btnExportarExcelClick
      Glyph.Data = {
        F6010000424DF60100000000000076000000280000001C000000180000000100
        04000000000080010000C40E0000C40E00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFF0FFFFFF0000FFFFFFFFFFFF
        FFFFFFFF00FFFFFF0000FFFFFFFFFFFFFFFFFFF00000FFFF0000FFFFFFFFFFFF
        FFFFFFFF00FF0FFF0000FFFFFFFFFFFFFFFFFF0FF0FFF0FF0000272727272727
        2727F0FFFFFFF0FF00007272727272727272F0FFFFFFF0FF000027FFFFFFFFFF
        FF27F0FFFFFFF0FF000072FFFFFFF7272772F0FFF0FF0FFF000027F2727272F2
        7227FF0FF00FFFFF000072F727272F272F72FFF00000FFFF000027F27272F272
        7F27FFFFF00FFFFF000072FF272F27272F72FFFFF0FFFFFF000027FFF2F2727F
        FF27FFFFFFFFFFFF000072FF2F272727FF72FFFFFFFFFFFF000027F2F2727272
        7F27FFFFFFFFFFFF000072F72727F7272F72FFFFFFFFFFFF000027F2727FFF72
        7F27FFFFFFFFFFFF000072FFFFFFFFFFFF72FFFFFFFFFFFF0000272727272727
        2727FFFFFFFFFFFF00007272727272727272FFFFFFFFFFFF0000}
    end
    object dbgRptRetenciones: TwwDBGrid
      Left = 696
      Top = 72
      Width = 56
      Height = 41
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      ExportOptions.Delimiter = ';'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      TabOrder = 16
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
      Visible = False
    end
    object cbDisenoRep: TCheckBox
      Left = 536
      Top = 1
      Width = 97
      Height = 17
      Caption = 'Dise'#241'o Reporte'
      Enabled = False
      TabOrder = 17
      Visible = False
    end
    object bbtnNumLetras: TBitBtn
      Left = 688
      Top = 120
      Width = 75
      Height = 25
      Caption = 'Num a Letras'
      TabOrder = 18
      OnClick = bbtnNumLetrasClick
    end
  end
  object ppDBRegRetencion: TppDBPipeline
    AutoCreateFields = False
    UserName = 'DBRegRetencion'
    Left = 40
    Top = 160
  end
  object pprComprobante: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 11350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\SOLExes\SolFormatos\Caja\Incoresa\LibroComprobanteRetIGV.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 177
    Top = 160
    Version = '7.02'
    mmColumnWidth = 0
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32808
      mmPrintPosition = 0
      object ppLabel39: TppLabel
        UserName = 'Label39'
        Caption = 'Libro Retenciones'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 85990
        mmTop = 5292
        mmWidth = 35983
        BandType = 0
      end
      object ppLabel41: TppLabel
        UserName = 'Label41'
        Caption = 'Comprobante '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 3969
        mmTop = 18785
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'Label42'
        Caption = 'de Pago N'#176' '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 3969
        mmTop = 23019
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel43: TppLabel
        UserName = 'Label43'
        Caption = 'Proveedor '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 50800
        mmTop = 18785
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel44: TppLabel
        UserName = 'Label44'
        Caption = 'Valor de'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 142611
        mmTop = 18785
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel45: TppLabel
        UserName = 'Label45'
        Caption = 'Compra'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 144992
        mmTop = 23019
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel46: TppLabel
        UserName = 'Label46'
        Caption = 'Monto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 167217
        mmTop = 18785
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel47: TppLabel
        UserName = 'Label47'
        Caption = 'Monto '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 185738
        mmTop = 18785
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel48: TppLabel
        UserName = 'Label48'
        Caption = 'Retenido'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 184150
        mmTop = 23019
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel49: TppLabel
        UserName = 'Label49'
        Caption = 'Fecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 109273
        mmTop = 18785
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel51: TppLabel
        UserName = 'Label51'
        Caption = 'Pagado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 165365
        mmTop = 23019
        mmWidth = 11113
        BandType = 0
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = 'CIADES'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 265
        mmWidth = 65088
        BandType = 0
      end
      object pplblPeriodo2: TppLabel
        UserName = 'lblPeriodo2'
        Caption = 'lblPeriodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 92340
        mmTop = 10054
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel50: TppLabel
        UserName = 'Label50'
        Caption = 
          '----------------------------------------------------------------' +
          '---------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 26723
        mmWidth = 179652
        BandType = 0
      end
      object ppLabel52: TppLabel
        UserName = 'Label501'
        Caption = 
          '----------------------------------------------------------------' +
          '---------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 15081
        mmWidth = 179652
        BandType = 0
      end
      object ppLabel56: TppLabel
        UserName = 'Label56'
        Caption = 'R.U.C.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 90223
        mmTop = 18785
        mmWidth = 11113
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        DataField = 'FECEMI'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 109802
        mmTop = 0
        mmWidth = 21960
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        DataField = 'DOCUMENTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 12700
        mmTop = 0
        mmWidth = 29898
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        DataField = 'AUXNOMB'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 44450
        mmTop = 0
        mmWidth = 36777
        BandType = 4
      end
      object ppdbMtoProv: TppDBText
        UserName = 'dbMtoProv'
        DataField = 'MONTOPROV'
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 142082
        mmTop = 0
        mmWidth = 20108
        BandType = 4
      end
      object ppdbMtoPago: TppDBText
        UserName = 'dbMtoPago'
        DataField = 'MONTOPAG'
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 164307
        mmTop = 0
        mmWidth = 20108
        BandType = 4
      end
      object ppdbMtoRet: TppDBText
        UserName = 'dbMtoRet'
        DataField = 'MONTORET'
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 185473
        mmTop = 0
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText33: TppDBText
        UserName = 'DBText102'
        AutoSize = True
        DataField = 'DOCABR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 0
        mmWidth = 11113
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        DataField = 'TMONABR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 133615
        mmTop = 0
        mmWidth = 7408
        BandType = 4
      end
      object ppDBText38: TppDBText
        UserName = 'DBText38'
        DataField = 'AUXRUC'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 83344
        mmTop = 0
        mmWidth = 24342
        BandType = 4
      end
    end
    object ppSummaryBand3: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 10848
      mmPrintPosition = 0
      object ppdbcMtoTRet: TppDBCalc
        UserName = 'dbcMtoTRet'
        AutoSize = True
        DataField = 'MONTORET'
        DataPipeline = ppDBRegRetencion
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBRegRetencion'
        mmHeight = 3048
        mmLeft = 181187
        mmTop = 2646
        mmWidth = 22013
        BandType = 7
      end
      object ppdbcMtoTPago: TppDBCalc
        UserName = 'dbcMtoTPago'
        AutoSize = True
        DataField = 'MONTOPAG'
        DataPipeline = ppDBRegRetencion
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBRegRetencion'
        mmHeight = 3048
        mmLeft = 162402
        mmTop = 2646
        mmWidth = 22013
        BandType = 7
      end
      object ppLabel57: TppLabel
        UserName = 'Label57'
        Caption = 'Totales : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 114829
        mmTop = 2646
        mmWidth = 18521
        BandType = 7
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'RETNUMERO'
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3704
        mmPrintPosition = 0
        object ppDBText36: TppDBText
          UserName = 'DBText36'
          DataField = 'FECPAGO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 62706
          mmTop = 0
          mmWidth = 21960
          BandType = 3
          GroupNo = 0
        end
        object ppDBText34: TppDBText
          UserName = 'DBText34'
          DataField = 'RETNUMERO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 24871
          mmTop = 0
          mmWidth = 25929
          BandType = 3
          GroupNo = 0
        end
        object ppDBText31: TppDBText
          UserName = 'DBText31'
          DataField = 'FPAGOABR'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 88371
          mmTop = 0
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object ppDBText32: TppDBText
          UserName = 'DBText32'
          DataField = 'ECNOCHQ'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 104775
          mmTop = 0
          mmWidth = 27781
          BandType = 3
          GroupNo = 0
        end
        object ppDBText35: TppDBText
          UserName = 'DBText35'
          DataField = 'ESTADO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 197380
          mmTop = 0
          mmWidth = 3440
          BandType = 3
          GroupNo = 0
        end
        object ppLabel53: TppLabel
          UserName = 'Label53'
          Caption = 'Retenci'#243'n'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 3969
          mmTop = 0
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object ppLabel40: TppLabel
          UserName = 'Label40'
          Caption = 'F.P.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 53975
          mmTop = 0
          mmWidth = 7408
          BandType = 3
          GroupNo = 0
        end
        object ppDBText29: TppDBText
          UserName = 'DBText29'
          DataField = 'TCAMBRET'
          DisplayFormat = '#,0.000;-#,0.000'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 145257
          mmTop = 0
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object ppLabel54: TppLabel
          UserName = 'Label401'
          Caption = 'T.C.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 135996
          mmTop = 0
          mmWidth = 7408
          BandType = 3
          GroupNo = 0
        end
        object ppDBText30: TppDBText
          UserName = 'DBText30'
          DataField = 'ECNOCOMP'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 173832
          mmTop = 0
          mmWidth = 21960
          BandType = 3
          GroupNo = 0
        end
        object ppDBText37: TppDBText
          UserName = 'DBText37'
          DataField = 'TDIARID'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 167217
          mmTop = 0
          mmWidth = 5027
          BandType = 3
          GroupNo = 0
        end
        object ppLabel55: TppLabel
          UserName = 'Label402'
          Caption = 'C.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 161661
          mmTop = 0
          mmWidth = 3704
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          AutoSize = True
          DataField = 'MONTOPROV'
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3133
          mmLeft = 138483
          mmTop = 265
          mmWidth = 23707
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          AutoSize = True
          DataField = 'MONTOPAG'
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3133
          mmLeft = 162402
          mmTop = 265
          mmWidth = 22013
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          AutoSize = True
          DataField = 'MONTORET'
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3133
          mmLeft = 181187
          mmTop = 265
          mmWidth = 22013
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object pprRetencion: TppReport
    AutoStop = False
    DataPipeline = ppdbRetencion
    PrinterSetup.BinName = 'Tractor'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 10000
    PrinterSetup.mmMarginLeft = 5000
    PrinterSetup.mmMarginRight = 10000
    PrinterSetup.mmMarginTop = 20000
    PrinterSetup.mmPaperHeight = 207000
    PrinterSetup.mmPaperWidth = 242000
    PrinterSetup.PaperSize = 123
    Template.FileName = 'C:\DemaExes\RTMS\CNT\Dema\RetencionesBloque.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = pprRetencionPreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 216
    Top = 160
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbRetencion'
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 57415
      mmPrintPosition = 0
      object ppDBText39: TppDBText
        UserName = 'DBText39'
        AutoSize = True
        DataField = 'AUXRUC'
        DataPipeline = ppdbRetencion
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRetencion'
        mmHeight = 4233
        mmLeft = 25135
        mmTop = 34131
        mmWidth = 23283
        BandType = 0
      end
      object ppDBText40: TppDBText
        UserName = 'DBText40'
        DataField = 'FECPAGO'
        DataPipeline = ppdbRetencion
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRetencion'
        mmHeight = 4498
        mmLeft = 25135
        mmTop = 39158
        mmWidth = 22225
        BandType = 0
      end
      object ppDBText41: TppDBText
        UserName = 'DBText41'
        AutoSize = True
        DataField = 'AUXNOMB'
        DataPipeline = ppdbRetencion
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRetencion'
        mmHeight = 4233
        mmLeft = 25135
        mmTop = 29104
        mmWidth = 46567
        BandType = 0
      end
      object ppDBText42: TppDBText
        UserName = 'DBText103'
        DataField = 'RETNUMERO'
        DataPipeline = ppdbRetencion
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRetencion'
        mmHeight = 4233
        mmLeft = 139965
        mmTop = 29898
        mmWidth = 24077
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText43: TppDBText
        UserName = 'DBText43'
        AutoSize = True
        DataField = 'SERIE'
        DataPipeline = ppdbRetencion
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRetencion'
        mmHeight = 4233
        mmLeft = 31750
        mmTop = 0
        mmWidth = 6350
        BandType = 4
      end
      object ppDBText44: TppDBText
        UserName = 'DBText44'
        AutoSize = True
        DataField = 'NODOC'
        DataPipeline = ppdbRetencion
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRetencion'
        mmHeight = 4233
        mmLeft = 56621
        mmTop = 0
        mmWidth = 8467
        BandType = 4
      end
      object ppDBText45: TppDBText
        UserName = 'DBText45'
        AutoSize = True
        DataField = 'FECEMI'
        DataPipeline = ppdbRetencion
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRetencion'
        mmHeight = 4233
        mmLeft = 80433
        mmTop = 0
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText46: TppDBText
        UserName = 'DBText46'
        AutoSize = True
        DataField = 'MTORETLOC'
        DataPipeline = ppdbRetencion
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRetencion'
        mmHeight = 4233
        mmLeft = 168275
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText47: TppDBText
        UserName = 'DBText47'
        AutoSize = True
        DataField = 'MTOLOC'
        DataPipeline = ppdbRetencion
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRetencion'
        mmHeight = 4233
        mmLeft = 121973
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText48: TppDBText
        UserName = 'DBText11'
        DataField = 'DOCDESC'
        DataPipeline = ppdbRetencion
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRetencion'
        mmHeight = 4233
        mmLeft = 265
        mmTop = 0
        mmWidth = 24077
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 34925
      mmPrintPosition = 0
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        AutoSize = True
        DataField = 'MTOLOC'
        DataPipeline = ppdbRetencion
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRetencion'
        mmHeight = 4064
        mmLeft = 113929
        mmTop = 5027
        mmWidth = 24977
        BandType = 8
      end
      object ppTotal: TppDBCalc
        UserName = 'Total'
        AutoSize = True
        DataField = 'MTORETLOC'
        DataPipeline = ppdbRetencion
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRetencion'
        mmHeight = 4064
        mmLeft = 148886
        mmTop = 5027
        mmWidth = 32089
        BandType = 8
      end
      object ppDBText49: TppDBText
        UserName = 'DBText49'
        AutoSize = True
        DataField = 'RETTOTDES'
        DataPipeline = ppdbRetencion
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRetencion'
        mmHeight = 4233
        mmLeft = 7408
        mmTop = 14288
        mmWidth = 101600
        BandType = 8
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'RETNUMERO'
      DataPipeline = ppdbRetencion
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdbRetencion'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 265
        mmPrintPosition = 0
        object ppDBCalc10: TppDBCalc
          OnPrint = ppDBCalc10Print
          UserName = 'DBCalc10'
          DataField = 'MTOLOC'
          DataPipeline = ppdbRetencion
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup4
          Transparent = True
          DataPipelineName = 'ppdbRetencion'
          mmHeight = 265
          mmLeft = 119327
          mmTop = 0
          mmWidth = 19315
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'DBCalc11'
          DataField = 'MTORETLOC'
          DataPipeline = ppdbRetencion
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup4
          Transparent = True
          DataPipelineName = 'ppdbRetencion'
          mmHeight = 265
          mmLeft = 160602
          mmTop = 0
          mmWidth = 20638
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppParameterList3: TppParameterList
    end
  end
  object pprCompRet: TppReport
    AutoStop = False
    DataPipeline = ppDBRegRetencion
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 216000
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\SOLExes\SolFormatos\Caja\Incoresa\registroretenciones.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 280
    Top = 160
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBRegRetencion'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 20902
      mmPrintPosition = 0
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'REGISTRO DEL REGIMEN DE RETENCIONES'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 12
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 4763
        mmLeft = 50800
        mmTop = 6350
        mmWidth = 92604
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'A'#209'O MES : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 66675
        mmTop = 14552
        mmWidth = 21167
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText101'
        DataField = 'ANOMM'
        DataPipeline = ppDBRegRetencion
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBRegRetencion'
        mmHeight = 4233
        mmLeft = 89429
        mmTop = 14552
        mmWidth = 17198
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 173567
        mmTop = 6615
        mmWidth = 21167
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 173567
        mmTop = 10583
        mmWidth = 27517
        BandType = 0
      end
      object ppLabel38: TppLabel
        UserName = 'Label38'
        Caption = 'P'#225'g'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 173567
        mmTop = 2646
        mmWidth = 6350
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageSet
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 180711
        mmTop = 2646
        mmWidth = 12700
        BandType = 0
      end
      object pplblCia: TppLabel
        UserName = 'lblCia'
        Caption = 'SYSTEMS - ON LINE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2117
        mmTop = 0
        mmWidth = 52917
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppShape7: TppShape
        UserName = 'Shape7'
        mmHeight = 6615
        mmLeft = 1058
        mmTop = 0
        mmWidth = 201084
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'FECPAGO'
        DataPipeline = ppDBRegRetencion
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBRegRetencion'
        mmHeight = 4233
        mmLeft = 3440
        mmTop = 794
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = 'NUMERO'
        DataPipeline = ppDBRegRetencion
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBRegRetencion'
        mmHeight = 4233
        mmLeft = 32015
        mmTop = 794
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        AutoSize = True
        DataField = 'DOCDES'
        DataPipeline = ppDBRegRetencion
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBRegRetencion'
        mmHeight = 4233
        mmLeft = 63236
        mmTop = 794
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'TIPO'
        DataPipeline = ppDBRegRetencion
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBRegRetencion'
        mmHeight = 4233
        mmLeft = 101336
        mmTop = 794
        mmWidth = 41010
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        AutoSize = True
        DataField = 'DEBE'
        DataPipeline = ppDBRegRetencion
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBRegRetencion'
        mmHeight = 4233
        mmLeft = 145257
        mmTop = 794
        mmWidth = 8467
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        AutoSize = True
        DataField = 'HABE'
        DataPipeline = ppDBRegRetencion
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBRegRetencion'
        mmHeight = 4233
        mmLeft = 169334
        mmTop = 794
        mmWidth = 8467
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        AutoSize = True
        DataField = 'SALDO'
        DataPipeline = ppDBRegRetencion
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBRegRetencion'
        mmHeight = 4233
        mmLeft = 188384
        mmTop = 794
        mmWidth = 10583
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 17992
      mmPrintPosition = 0
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'RESUMEN'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 12
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 4763
        mmLeft = 103981
        mmTop = 2117
        mmWidth = 18521
        BandType = 7
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        Caption = 'BASE IMPONIBLE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 79111
        mmTop = 6879
        mmWidth = 37042
        BandType = 7
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        Caption = 'MONTO RETENIDO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 79111
        mmTop = 11906
        mmWidth = 37042
        BandType = 7
      end
      object pplblTotalBase: TppLabel
        UserName = 'lblTotalBase'
        Caption = '102,937.19'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4763
        mmLeft = 133615
        mmTop = 6879
        mmWidth = 26458
        BandType = 7
      end
      object pplblTotalRetenido: TppLabel
        UserName = 'lblTotalRetenido'
        Caption = '6,176.23'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4763
        mmLeft = 138907
        mmTop = 11906
        mmWidth = 21167
        BandType = 7
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'AUXID'
      DataPipeline = ppDBRegRetencion
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBRegRetencion'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 30692
        mmPrintPosition = 0
        object ppShape2: TppShape
          UserName = 'Shape2'
          mmHeight = 15081
          mmLeft = 1323
          mmTop = 15610
          mmWidth = 200819
          BandType = 3
          GroupNo = 0
        end
        object ppLabel19: TppLabel
          UserName = 'Label19'
          Caption = 'PROVEEDOR : '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 4233
          mmTop = 7144
          mmWidth = 25400
          BandType = 3
          GroupNo = 0
        end
        object ppLabel20: TppLabel
          UserName = 'Label20'
          Caption = 'RUC : '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 109538
          mmTop = 7144
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object ppLabel21: TppLabel
          UserName = 'Label21'
          Caption = 'FECHA DE'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 2646
          mmTop = 18785
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object ppLabel22: TppLabel
          UserName = 'Label22'
          Caption = 'NUMERO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 34396
          mmTop = 18785
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object ppLabel23: TppLabel
          UserName = 'Label23'
          Caption = 'COMPROBANTE'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 34131
          mmTop = 23548
          mmWidth = 23283
          BandType = 3
          GroupNo = 0
        end
        object ppLabel24: TppLabel
          UserName = 'Label24'
          Caption = 'TIPO DE '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 103717
          mmTop = 18521
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object ppLabel25: TppLabel
          UserName = 'Label25'
          Caption = 'TRANSACCION'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 103717
          mmTop = 24342
          mmWidth = 23283
          BandType = 3
          GroupNo = 0
        end
        object ppLabel26: TppLabel
          UserName = 'Label101'
          Caption = 'IMPORTE DE TRANSACCION '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 136790
          mmTop = 18256
          mmWidth = 48683
          BandType = 3
          GroupNo = 0
        end
        object ppLabel27: TppLabel
          UserName = 'Label27'
          Caption = 'SALDO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 186267
          mmTop = 24077
          mmWidth = 10583
          BandType = 3
          GroupNo = 0
        end
        object ppLabel28: TppLabel
          UserName = 'Label28'
          Caption = 'DEBE'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 143140
          mmTop = 24606
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
        end
        object ppLabel29: TppLabel
          UserName = 'Label29'
          Caption = 'HABER'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 162984
          mmTop = 24077
          mmWidth = 10583
          BandType = 3
          GroupNo = 0
        end
        object ppDBText19: TppDBText
          UserName = 'DBText19'
          DataField = 'PROVDES'
          DataPipeline = ppDBRegRetencion
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppDBRegRetencion'
          mmHeight = 4233
          mmLeft = 30692
          mmTop = 7144
          mmWidth = 67998
          BandType = 3
          GroupNo = 0
        end
        object ppDBText20: TppDBText
          UserName = 'DBText20'
          DataField = 'PROVRUC'
          DataPipeline = ppDBRegRetencion
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppDBRegRetencion'
          mmHeight = 4233
          mmLeft = 127529
          mmTop = 7144
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel30: TppLabel
          UserName = 'Label30'
          Caption = 'TRANSACCION'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 2381
          mmTop = 23548
          mmWidth = 23283
          BandType = 3
          GroupNo = 0
        end
        object ppLabel31: TppLabel
          UserName = 'Label31'
          Caption = 'DENOMINACION'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 65088
          mmTop = 19050
          mmWidth = 25400
          BandType = 3
          GroupNo = 0
        end
        object ppLabel32: TppLabel
          UserName = 'Label32'
          Caption = 'COMPROBANTE'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 65617
          mmTop = 24077
          mmWidth = 23283
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 2910
        mmPrintPosition = 0
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'NODOC'
      DataPipeline = ppDBRegRetencion
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBRegRetencion'
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 1588
        mmPrintPosition = 0
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object sc: TStrContainer
    Left = 488
    Top = 164
  end
  object sd: TSaveDialog
    DefaultExt = '*.txt'
    Filter = 'Texto|*.txt'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Transferencia de Retenciones al PDT'
    Left = 460
    Top = 164
  end
  object ppReport: TppReport
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
    Template.FileName = 'C:\SolExes\SolFormatos\Caja\Dema\TxRetencionPDT.rtm'
    DeviceType = 'Screen'
    OnPreviewFormClose = ppReportPreviewFormClose
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 552
    Top = 164
    Version = '7.02'
    mmColumnWidth = 0
    object ppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 18256
      mmPrintPosition = 0
      object ppLabel60: TppLabel
        UserName = 'Label60'
        Caption = 
          'REPORTE DE INCONSISTENCIAS PARA LA TRANSFERENCIA DE RETENCIONES ' +
          'AL PDT'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 34131
        mmTop = 11113
        mmWidth = 148167
        BandType = 0
      end
      object pplblCiaRetPdt: TppLabel
        UserName = 'lblCia1'
        Caption = 'COMPA'#209'IA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 3440
        mmTop = 0
        mmWidth = 21167
        BandType = 0
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable4'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 173302
        mmTop = 0
        mmWidth = 21167
        BandType = 0
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'SystemVariable5'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 177536
        mmTop = 4233
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel62: TppLabel
        UserName = 'Label62'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '-------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 4498
        mmTop = 14023
        mmWidth = 188384
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText53: TppDBText
        UserName = 'DBText53'
        DataField = 'GLOSA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 11642
        mmTop = 0
        mmWidth = 178065
        BandType = 4
      end
      object ppDBCalc9: TppDBCalc
        UserName = 'DBCalc9'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        mmHeight = 4233
        mmLeft = 4233
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 9525
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
    IniStorageName = 'C:\DemaExes\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 8
    Top = 160
  end
  object ppdbRetencion: TppDBPipeline
    AutoCreateFields = False
    UserName = 'dbRetencion'
    Left = 109
    Top = 160
    object ppField26: TppField
      FieldAlias = 'CIAID'
      FieldName = 'CIAID'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppField27: TppField
      FieldAlias = 'TDIARID'
      FieldName = 'TDIARID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 1
    end
    object ppField28: TppField
      FieldAlias = 'ANOMM'
      FieldName = 'ANOMM'
      FieldLength = 6
      DisplayWidth = 6
      Position = 2
    end
    object ppField29: TppField
      FieldAlias = 'ECNOCOMP'
      FieldName = 'ECNOCOMP'
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
    object ppField30: TppField
      FieldAlias = 'FECPAGO'
      FieldName = 'FECPAGO'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 4
    end
    object ppField31: TppField
      FieldAlias = 'CLAUXID'
      FieldName = 'CLAUXID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 5
    end
    object ppField32: TppField
      FieldAlias = 'AUXID'
      FieldName = 'AUXID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 6
    end
    object ppField33: TppField
      FieldAlias = 'AUXRUC'
      FieldName = 'AUXRUC'
      FieldLength = 15
      DisplayWidth = 15
      Position = 7
    end
    object ppField67: TppField
      FieldAlias = 'DOCID'
      FieldName = 'DOCID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 8
    end
    object ppField68: TppField
      FieldAlias = 'DOCDES'
      FieldName = 'DOCDES'
      FieldLength = 15
      DisplayWidth = 15
      Position = 9
    end
    object ppField69: TppField
      FieldAlias = 'SERIE'
      FieldName = 'SERIE'
      FieldLength = 5
      DisplayWidth = 5
      Position = 10
    end
    object ppField70: TppField
      FieldAlias = 'NODOC'
      FieldName = 'NODOC'
      FieldLength = 20
      DisplayWidth = 20
      Position = 11
    end
    object ppField71: TppField
      FieldAlias = 'TRANID'
      FieldName = 'TRANID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 12
    end
    object ppField72: TppField
      FieldAlias = 'TRANDES'
      FieldName = 'TRANDES'
      FieldLength = 15
      DisplayWidth = 15
      Position = 13
    end
    object ppField73: TppField
      FieldAlias = 'DH'
      FieldName = 'DH'
      FieldLength = 1
      DisplayWidth = 1
      Position = 14
    end
    object ppField74: TppField
      Alignment = taRightJustify
      FieldAlias = 'MTOORI'
      FieldName = 'MTOORI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppField75: TppField
      Alignment = taRightJustify
      FieldAlias = 'MTOLOC'
      FieldName = 'MTOLOC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppField76: TppField
      Alignment = taRightJustify
      FieldAlias = 'MTOEXT'
      FieldName = 'MTOEXT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object ppField77: TppField
      FieldAlias = 'USUARIO'
      FieldName = 'USUARIO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 18
    end
    object ppField78: TppField
      FieldAlias = 'FREG'
      FieldName = 'FREG'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 19
    end
    object ppField79: TppField
      FieldAlias = 'HREG'
      FieldName = 'HREG'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 20
    end
    object ppField80: TppField
      Alignment = taRightJustify
      FieldAlias = 'MTORETORI'
      FieldName = 'MTORETORI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object ppField81: TppField
      Alignment = taRightJustify
      FieldAlias = 'MTORETLOC'
      FieldName = 'MTORETLOC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object ppField82: TppField
      Alignment = taRightJustify
      FieldAlias = 'MTORETEXT'
      FieldName = 'MTORETEXT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object ppField83: TppField
      FieldAlias = 'FECEMI'
      FieldName = 'FECEMI'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 24
    end
    object ppField84: TppField
      FieldAlias = 'RETSERIE'
      FieldName = 'RETSERIE'
      FieldLength = 5
      DisplayWidth = 5
      Position = 25
    end
    object ppField85: TppField
      FieldAlias = 'RETNUMERO'
      FieldName = 'RETNUMERO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 26
    end
  end
  object ppdbpLCR: TppDBPipeline
    AutoCreateFields = False
    UserName = 'dbpLCR'
    Left = 144
    Top = 160
  end
  object ppdbCompRet: TppDBPipeline
    AutoCreateFields = False
    UserName = 'dbCompRet'
    Left = 249
    Top = 160
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
  object ppDBReport: TppDBPipeline
    AutoCreateFields = False
    UserName = 'DBReport'
    Left = 520
    Top = 164
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBRegRetencion
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 20000
    PrinterSetup.mmMarginLeft = 20000
    PrinterSetup.mmMarginRight = 10000
    PrinterSetup.mmMarginTop = 10000
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 378000
    PrinterSetup.PaperSize = 123
    Template.FileName = 'C:\oaEjecuta\RTMS\CAJA\Dema\RETENCIONxProv.RTM'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 328
    Top = 160
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBRegRetencion'
    object ppHeaderBand6: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32544
      mmPrintPosition = 0
      object ppLabel71: TppLabel
        UserName = 'Label1'
        Caption = 'REGISTRO DEL REGIMEN DE RETENCIONES'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 139436
        mmTop = 265
        mmWidth = 51858
        BandType = 0
      end
      object ppLabel72: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Fecha de Retenci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 25400
        mmTop = 18785
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel73: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'RUC Proveedor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 8996
        mmLeft = 123825
        mmTop = 18785
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel74: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'N'#250'mero de Documento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 80963
        mmTop = 18785
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel75: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Fecha de Documento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 104246
        mmTop = 18785
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel76: TppLabel
        UserName = 'Label8'
        Caption = 'Codigo Relaci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 144198
        mmTop = 18785
        mmWidth = 11853
        BandType = 0
      end
      object ppLabel77: TppLabel
        UserName = 'Label9'
        Caption = 'Tipo de Transacci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 209286
        mmTop = 18785
        mmWidth = 16298
        BandType = 0
      end
      object ppLabel78: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'Importe Transac.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 233363
        mmTop = 18785
        mmWidth = 35454
        BandType = 0
      end
      object ppLabel79: TppLabel
        UserName = 'Label11'
        Caption = 'Importe'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 4233
        mmLeft = 279930
        mmTop = 18785
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel80: TppLabel
        UserName = 'Label12'
        Caption = 'Retenci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 4233
        mmLeft = 296863
        mmTop = 18785
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel81: TppLabel
        UserName = 'Label13'
        Caption = 'Proveedor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 4233
        mmLeft = 164307
        mmTop = 18785
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel82: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'No.Comprob Retenci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 8996
        mmLeft = 1058
        mmTop = 18785
        mmWidth = 21167
        BandType = 0
      end
      object ppDBText54: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'CIADES'
        DataPipeline = ppDBRegRetencion
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBRegRetencion'
        mmHeight = 3006
        mmLeft = 1058
        mmTop = 265
        mmWidth = 32173
        BandType = 0
      end
      object ppLabel83: TppLabel
        UserName = 'Label33'
        Caption = 'Importe'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 4233
        mmLeft = 320676
        mmTop = 18785
        mmWidth = 10372
        BandType = 0
      end
      object ppLabel84: TppLabel
        UserName = 'Label15'
        Caption = 'Denominaci'#243'n Documento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 56886
        mmTop = 18785
        mmWidth = 19262
        BandType = 0
      end
      object ppLabel85: TppLabel
        UserName = 'Label59'
        Caption = 'C'#243'digo Doc'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 44450
        mmTop = 18785
        mmWidth = 8890
        BandType = 0
      end
      object ppLabel86: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = 'Debe'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 236273
        mmTop = 23283
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel87: TppLabel
        UserName = 'Label34'
        AutoSize = False
        Caption = 'Haber'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 257176
        mmTop = 23283
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel88: TppLabel
        UserName = 'Label4'
        Caption = 'Expresado en Nuevos Soles'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 146844
        mmTop = 4763
        mmWidth = 37042
        BandType = 0
      end
      object ppSystemVariable9: TppSystemVariable
        UserName = 'SystemVariable6'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 310621
        mmTop = 265
        mmWidth = 14817
        BandType = 0
      end
      object ppSystemVariable10: TppSystemVariable
        UserName = 'SystemVariable7'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 310621
        mmTop = 5027
        mmWidth = 19315
        BandType = 0
      end
      object ppSystemVariable11: TppSystemVariable
        UserName = 'SystemVariable8'
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 310621
        mmTop = 9790
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel89: TppLabel
        UserName = 'Label61'
        Caption = 'Fecha :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 296069
        mmTop = 265
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel90: TppLabel
        UserName = 'Label63'
        Caption = 'Hora  :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 296069
        mmTop = 5027
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel91: TppLabel
        UserName = 'Label64'
        Caption = 'Pagina:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 296069
        mmTop = 9790
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel92: TppLabel
        UserName = 'Label65'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 14552
        mmWidth = 329936
        BandType = 0
      end
      object ppLabel93: TppLabel
        UserName = 'Label66'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 27517
        mmWidth = 329936
        BandType = 0
      end
      object ppLabel94: TppLabel
        UserName = 'Label68'
        Caption = '6%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 302419
        mmTop = 23283
        mmWidth = 2910
        BandType = 0
      end
      object ppLabel95: TppLabel
        UserName = 'Label69'
        Caption = 'a Pagar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 279930
        mmTop = 23283
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel96: TppLabel
        UserName = 'Label70'
        Caption = 'Pagado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 4233
        mmLeft = 321999
        mmTop = 23283
        mmWidth = 8996
        BandType = 0
      end
      object ppDBText55: TppDBText
        UserName = 'DBText50'
        AutoSize = True
        DataField = 'RANGO'
        DataPipeline = ppDBRegRetencion
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBRegRetencion'
        mmHeight = 4233
        mmLeft = 161793
        mmTop = 9525
        mmWidth = 7408
        BandType = 0
      end
    end
    object ppDetailBand6: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppDBText56: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'FECEMI'
        DataPipeline = ppDBRegRetencion
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBRegRetencion'
        mmHeight = 3006
        mmLeft = 103981
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText57: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'DOCUMENTO'
        DataPipeline = ppDBRegRetencion
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBRegRetencion'
        mmHeight = 3006
        mmLeft = 80698
        mmTop = 0
        mmWidth = 13547
        BandType = 4
      end
      object ppDBText58: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'MONTOPROV'
        DataPipeline = ppDBRegRetencion
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBRegRetencion'
        mmHeight = 3969
        mmLeft = 241830
        mmTop = 265
        mmWidth = 28840
        BandType = 4
      end
      object ppDBText59: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'MONTOPAG'
        DataPipeline = ppDBRegRetencion
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBRegRetencion'
        mmHeight = 5027
        mmLeft = 274903
        mmTop = 265
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText60: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'MONTORET'
        DataPipeline = ppDBRegRetencion
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBRegRetencion'
        mmHeight = 4233
        mmLeft = 300038
        mmTop = 265
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText61: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'DOCABR'
        DataPipeline = ppDBRegRetencion
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBRegRetencion'
        mmHeight = 3006
        mmLeft = 56621
        mmTop = 0
        mmWidth = 11853
        BandType = 4
      end
      object ppDBText62: TppDBText
        UserName = 'DBText21'
        AutoSize = True
        DataField = 'FECPAGO'
        DataPipeline = ppDBRegRetencion
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBRegRetencion'
        mmHeight = 3006
        mmLeft = 25400
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText63: TppDBText
        UserName = 'DBText201'
        AutoSize = True
        DataField = 'RETNUMERO'
        DataPipeline = ppDBRegRetencion
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBRegRetencion'
        mmHeight = 3006
        mmLeft = 1058
        mmTop = 0
        mmWidth = 23707
        BandType = 4
      end
      object ppDBText64: TppDBText
        UserName = 'DBText51'
        AutoSize = True
        DataField = 'DOCID'
        DataPipeline = ppDBRegRetencion
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBRegRetencion'
        mmHeight = 3006
        mmLeft = 46619
        mmTop = 0
        mmWidth = 3387
        BandType = 4
      end
      object ppDBText65: TppDBText
        UserName = 'DBText4'
        DataField = 'AUXNOMB'
        DataPipeline = ppDBRegRetencion
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBRegRetencion'
        mmHeight = 4233
        mmLeft = 159544
        mmTop = 0
        mmWidth = 44979
        BandType = 4
      end
      object ppDBText66: TppDBText
        UserName = 'DBText8'
        DataField = 'AUXRUC'
        DataPipeline = ppDBRegRetencion
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBRegRetencion'
        mmHeight = 4233
        mmLeft = 123825
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText67: TppDBText
        UserName = 'DBText9'
        DataField = 'AUXID'
        DataPipeline = ppDBRegRetencion
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBRegRetencion'
        mmHeight = 4233
        mmLeft = 143934
        mmTop = 0
        mmWidth = 11906
        BandType = 4
      end
      object ppDBText68: TppDBText
        UserName = 'DBText22'
        DataField = 'TIPOTRANS'
        DataPipeline = ppDBRegRetencion
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBRegRetencion'
        mmHeight = 4233
        mmLeft = 209021
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText69: TppDBText
        UserName = 'DBText52'
        AutoSize = True
        DataField = 'IMPPAGADO'
        DataPipeline = ppDBRegRetencion
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBRegRetencion'
        mmHeight = 5556
        mmLeft = 315649
        mmTop = 265
        mmWidth = 27517
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
      mmHeight = 9525
      mmPrintPosition = 0
      object ppDBCalc12: TppDBCalc
        UserName = 'DBCalc3'
        AutoSize = True
        DataField = 'MONTORET'
        DataPipeline = ppDBRegRetencion
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBRegRetencion'
        mmHeight = 3048
        mmLeft = 288080
        mmTop = 4763
        mmWidth = 22013
        BandType = 7
      end
      object ppDBCalc13: TppDBCalc
        UserName = 'DBCalc4'
        AutoSize = True
        DataField = 'MONTOPAG'
        DataPipeline = ppDBRegRetencion
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBRegRetencion'
        mmHeight = 3048
        mmLeft = 268236
        mmTop = 4763
        mmWidth = 22013
        BandType = 7
      end
      object ppLabel97: TppLabel
        UserName = 'Label37'
        Caption = 'Totales : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 205582
        mmTop = 4763
        mmWidth = 14817
        BandType = 7
      end
      object ppDBCalc14: TppDBCalc
        UserName = 'DBCalc7'
        AutoSize = True
        DataField = 'MONTOPROV'
        DataPipeline = ppDBRegRetencion
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBRegRetencion'
        mmHeight = 3048
        mmLeft = 244052
        mmTop = 4763
        mmWidth = 23707
        BandType = 7
      end
      object ppDBCalc15: TppDBCalc
        UserName = 'DBCalc8'
        AutoSize = True
        DataField = 'IMPPAGADO'
        DataPipeline = ppDBRegRetencion
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBRegRetencion'
        mmHeight = 3048
        mmLeft = 307287
        mmTop = 4763
        mmWidth = 23707
        BandType = 7
      end
      object ppLabel98: TppLabel
        UserName = 'Label67'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 0
        mmWidth = 329936
        BandType = 7
      end
    end
    object ppParameterList2: TppParameterList
    end
  end
  object ppdbRetA4: TppDBPipeline
    UserName = 'dbRetA4'
    Left = 632
    Top = 160
  end
  object pprRetA4: TppReport
    AutoStop = False
    DataPipeline = ppdbRetA4
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 15000
    PrinterSetup.mmMarginLeft = 10000
    PrinterSetup.mmMarginRight = 10000
    PrinterSetup.mmMarginTop = 20000
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\DemaExes\RTMS\CAJA\Dema\LibroRetencion_A4.rtm'
    Units = utMMThousandths
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 664
    Top = 160
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbRetA4'
    object ppHeaderBand7: TppHeaderBand
      BeforePrint = ppHeaderBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 21696
      mmPrintPosition = 0
      object ppLabel67: TppLabel
        UserName = 'Label1'
        Caption = 'REGISTRO DEL REGIMEN DE RETENCIONES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3810
        mmLeft = 104220
        mmTop = 265
        mmWidth = 68580
        BandType = 0
      end
      object ppLabel99: TppLabel
        UserName = 'Label2'
        Caption = 'Fecha de Retenci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 5757
        mmLeft = 33602
        mmTop = 13229
        mmWidth = 11007
        BandType = 0
      end
      object ppLabel100: TppLabel
        UserName = 'Label5'
        Caption = 'RUC Proveedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 5757
        mmLeft = 109538
        mmTop = 13229
        mmWidth = 11261
        BandType = 0
      end
      object ppLabel101: TppLabel
        UserName = 'Label6'
        Caption = 'N'#250'mero de Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 5757
        mmLeft = 75406
        mmTop = 13229
        mmWidth = 12785
        BandType = 0
      end
      object ppLabel102: TppLabel
        UserName = 'Label7'
        Caption = 'Fecha de Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 5757
        mmLeft = 94456
        mmTop = 13229
        mmWidth = 12531
        BandType = 0
      end
      object ppLabel103: TppLabel
        UserName = 'Label8'
        Caption = 'Codigo Relaci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 5757
        mmLeft = 122502
        mmTop = 13229
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel104: TppLabel
        UserName = 'Label9'
        Caption = 'Tipo de Transacci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 5757
        mmLeft = 176213
        mmTop = 13229
        mmWidth = 13335
        BandType = 0
      end
      object ppLabel105: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'Importe Transac.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2879
        mmLeft = 191030
        mmTop = 13229
        mmWidth = 26988
        BandType = 0
      end
      object ppLabel106: TppLabel
        UserName = 'Label11'
        Caption = 'Importe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 2879
        mmLeft = 227013
        mmTop = 13229
        mmWidth = 8255
        BandType = 0
      end
      object ppLabel107: TppLabel
        UserName = 'Label12'
        Caption = 'Retenci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 2879
        mmLeft = 246328
        mmTop = 13229
        mmWidth = 11007
        BandType = 0
      end
      object ppLabel108: TppLabel
        UserName = 'Label13'
        Caption = 'Proveedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 2879
        mmLeft = 143669
        mmTop = 13229
        mmWidth = 11261
        BandType = 0
      end
      object ppLabel109: TppLabel
        UserName = 'Label14'
        Caption = 'No.Comprob Retenci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 5757
        mmLeft = 14023
        mmTop = 13229
        mmWidth = 14563
        BandType = 0
      end
      object ppDBText71: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'CIADES'
        DataPipeline = ppdbRetA4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppdbRetA4'
        mmHeight = 3810
        mmLeft = 1058
        mmTop = 265
        mmWidth = 38820
        BandType = 0
      end
      object ppLabel110: TppLabel
        UserName = 'Label33'
        Caption = 'Importe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 2879
        mmLeft = 267759
        mmTop = 13229
        mmWidth = 8255
        BandType = 0
      end
      object ppDBText72: TppDBText
        UserName = 'DBText50'
        AutoSize = True
        DataField = 'PERIODODES'
        DataPipeline = ppdbRetA4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbRetA4'
        mmHeight = 3260
        mmLeft = 136790
        mmTop = 4498
        mmWidth = 19854
        BandType = 0
      end
      object ppLabel111: TppLabel
        UserName = 'Label15'
        Caption = 'Denominaci'#243'n Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 5757
        mmLeft = 57150
        mmTop = 13229
        mmWidth = 16341
        BandType = 0
      end
      object ppLabel112: TppLabel
        UserName = 'Label59'
        Caption = 'C'#243'digo Doc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 5757
        mmLeft = 47625
        mmTop = 13229
        mmWidth = 7747
        BandType = 0
      end
      object ppLabel113: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = 'Debe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2879
        mmLeft = 192088
        mmTop = 16404
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel114: TppLabel
        UserName = 'Label34'
        AutoSize = False
        Caption = 'Haber'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2879
        mmLeft = 205317
        mmTop = 16404
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel115: TppLabel
        UserName = 'Label3'
        Caption = 'PERIODO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3260
        mmLeft = 120386
        mmTop = 4498
        mmWidth = 13885
        BandType = 0
      end
      object ppLabel116: TppLabel
        UserName = 'Label4'
        Caption = 'Expresado en Nuevos Soles'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2879
        mmLeft = 123100
        mmTop = 8202
        mmWidth = 30819
        BandType = 0
      end
      object ppSystemVariable12: TppSystemVariable
        UserName = 'SystemVariable7'
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 258234
        mmTop = 3969
        mmWidth = 17463
        BandType = 0
      end
      object ppSystemVariable13: TppSystemVariable
        UserName = 'SystemVariable8'
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 258234
        mmTop = 7408
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel117: TppLabel
        UserName = 'Label61'
        Caption = 'Fecha :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 243682
        mmTop = 529
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel118: TppLabel
        UserName = 'Label63'
        Caption = 'Hora  :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 243682
        mmTop = 3969
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel119: TppLabel
        UserName = 'Label64'
        Caption = 'Pagina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 243682
        mmTop = 7408
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel120: TppLabel
        UserName = 'Label68'
        Caption = '6%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2879
        mmLeft = 249238
        mmTop = 16404
        mmWidth = 3556
        BandType = 0
      end
      object ppLabel121: TppLabel
        UserName = 'Label69'
        Caption = 'a Pagar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2879
        mmLeft = 226748
        mmTop = 16404
        mmWidth = 8551
        BandType = 0
      end
      object ppLabel122: TppLabel
        UserName = 'Label70'
        Caption = 'Pagado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 2910
        mmLeft = 267494
        mmTop = 16404
        mmWidth = 8467
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 529
        mmTop = 12435
        mmWidth = 277019
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 529
        mmTop = 19844
        mmWidth = 277019
        BandType = 0
      end
      object ppLabel124: TppLabel
        UserName = 'Label18'
        Caption = 'Compa'#241'ia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 2879
        mmLeft = 1852
        mmTop = 13229
        mmWidth = 11261
        BandType = 0
      end
      object ppDBText88: TppDBText
        UserName = 'DBText88'
        AutoSize = True
        DataField = 'FECHA_REP'
        DataPipeline = ppdbRetA4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRetA4'
        mmHeight = 3260
        mmLeft = 258234
        mmTop = 529
        mmWidth = 14139
        BandType = 0
      end
    end
    object ppDetailBand7: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText73: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'FECEMI'
        DataPipeline = ppdbRetA4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRetA4'
        mmHeight = 2879
        mmLeft = 94192
        mmTop = 0
        mmWidth = 12192
        BandType = 4
      end
      object ppDBText74: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'DOCUMENTO'
        DataPipeline = ppdbRetA4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRetA4'
        mmHeight = 2879
        mmLeft = 75142
        mmTop = 0
        mmWidth = 15706
        BandType = 4
      end
      object ppDBText75: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'MONTOPROV'
        DataPipeline = ppdbRetA4
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRetA4'
        mmHeight = 2879
        mmLeft = 205222
        mmTop = 265
        mmWidth = 10837
        BandType = 4
      end
      object ppDBText76: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'MONTOPAG'
        DataPipeline = ppdbRetA4
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRetA4'
        mmHeight = 2910
        mmLeft = 225690
        mmTop = 265
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText77: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'MONTORET'
        DataPipeline = ppdbRetA4
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRetA4'
        mmHeight = 2879
        mmLeft = 248401
        mmTop = 265
        mmWidth = 7451
        BandType = 4
      end
      object ppDBText78: TppDBText
        UserName = 'DBText10'
        DataField = 'DOCABR'
        DataPipeline = ppdbRetA4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRetA4'
        mmHeight = 2879
        mmLeft = 58208
        mmTop = 0
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText79: TppDBText
        UserName = 'DBText21'
        AutoSize = True
        DataField = 'FECPAGO'
        DataPipeline = ppdbRetA4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRetA4'
        mmHeight = 2879
        mmLeft = 33602
        mmTop = 0
        mmWidth = 12192
        BandType = 4
      end
      object ppDBText80: TppDBText
        UserName = 'DBText201'
        AutoSize = True
        DataField = 'RETNUMERO'
        DataPipeline = ppdbRetA4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRetA4'
        mmHeight = 2879
        mmLeft = 13758
        mmTop = 0
        mmWidth = 18415
        BandType = 4
      end
      object ppDBText81: TppDBText
        UserName = 'DBText51'
        AutoSize = True
        DataField = 'DOCID'
        DataPipeline = ppdbRetA4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbRetA4'
        mmHeight = 2879
        mmLeft = 49477
        mmTop = 0
        mmWidth = 2709
        BandType = 4
      end
      object ppDBText82: TppDBText
        UserName = 'DBText4'
        DataField = 'AUXNOMB'
        DataPipeline = ppdbRetA4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRetA4'
        mmHeight = 2879
        mmLeft = 132821
        mmTop = 0
        mmWidth = 42863
        BandType = 4
      end
      object ppDBText83: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'AUXRUC'
        DataPipeline = ppdbRetA4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRetA4'
        mmHeight = 2879
        mmLeft = 107686
        mmTop = 0
        mmWidth = 14901
        BandType = 4
      end
      object ppDBText84: TppDBText
        UserName = 'DBText9'
        DataField = 'AUXID'
        DataPipeline = ppdbRetA4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbRetA4'
        mmHeight = 2879
        mmLeft = 123031
        mmTop = 0
        mmWidth = 8996
        BandType = 4
      end
      object ppDBText85: TppDBText
        UserName = 'DBText22'
        AutoSize = True
        DataField = 'TIPOTRANS'
        DataPipeline = ppdbRetA4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRetA4'
        mmHeight = 2879
        mmLeft = 175948
        mmTop = 0
        mmWidth = 11853
        BandType = 4
      end
      object ppDBText86: TppDBText
        UserName = 'DBText52'
        AutoSize = True
        DataField = 'IMPPAGADO'
        DataPipeline = ppdbRetA4
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRetA4'
        mmHeight = 2910
        mmLeft = 258234
        mmTop = 265
        mmWidth = 19050
        BandType = 4
      end
      object ppDBText87: TppDBText
        UserName = 'DBText70'
        DataField = 'CIAID'
        DataPipeline = ppdbRetA4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbRetA4'
        mmHeight = 2646
        mmLeft = 3969
        mmTop = 0
        mmWidth = 4498
        BandType = 4
      end
    end
    object ppFooterBand6: TppFooterBand
      PrintOnLastPage = False
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBCalc20: TppDBCalc
        UserName = 'DBCalc16'
        AutoSize = True
        DataField = 'MONTORET'
        DataPipeline = ppdbRetA4
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRetA4'
        mmHeight = 2879
        mmLeft = 233755
        mmTop = 1852
        mmWidth = 22098
        BandType = 8
      end
      object ppDBCalc21: TppDBCalc
        UserName = 'DBCalc17'
        AutoSize = True
        DataField = 'MONTOPAG'
        DataPipeline = ppdbRetA4
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRetA4'
        mmHeight = 2879
        mmLeft = 214186
        mmTop = 1852
        mmWidth = 22352
        BandType = 8
      end
      object ppLabel125: TppLabel
        UserName = 'Label17'
        Caption = 'Van --->'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2879
        mmLeft = 178859
        mmTop = 1852
        mmWidth = 8890
        BandType = 8
      end
      object ppDBCalc22: TppDBCalc
        UserName = 'DBCalc18'
        AutoSize = True
        DataField = 'MONTOPROV'
        DataPipeline = ppdbRetA4
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRetA4'
        mmHeight = 2879
        mmLeft = 192035
        mmTop = 1852
        mmWidth = 24130
        BandType = 8
      end
      object ppDBCalc23: TppDBCalc
        UserName = 'DBCalc19'
        AutoSize = True
        DataField = 'IMPPAGADO'
        DataPipeline = ppdbRetA4
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRetA4'
        mmHeight = 2879
        mmLeft = 254424
        mmTop = 1852
        mmWidth = 22860
        BandType = 8
      end
      object ppLine8: TppLine
        UserName = 'Line5'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 529
        mmTop = 0
        mmWidth = 277019
        BandType = 8
      end
    end
    object ppSummaryBand5: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 19844
      mmPrintPosition = 0
      object ppDBCalc24: TppDBCalc
        UserName = 'DBCalc3'
        AutoSize = True
        DataField = 'MONTORET'
        DataPipeline = ppdbRetA4
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRetA4'
        mmHeight = 2879
        mmLeft = 233755
        mmTop = 3175
        mmWidth = 22098
        BandType = 7
      end
      object ppDBCalc25: TppDBCalc
        UserName = 'DBCalc4'
        AutoSize = True
        DataField = 'MONTOPAG'
        DataPipeline = ppdbRetA4
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRetA4'
        mmHeight = 2879
        mmLeft = 214186
        mmTop = 3175
        mmWidth = 22352
        BandType = 7
      end
      object ppLabel126: TppLabel
        UserName = 'Label37'
        Caption = 'Totales : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2879
        mmLeft = 166952
        mmTop = 3175
        mmWidth = 10075
        BandType = 7
      end
      object ppDBCalc26: TppDBCalc
        UserName = 'DBCalc7'
        AutoSize = True
        DataField = 'MONTOPROV'
        DataPipeline = ppdbRetA4
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRetA4'
        mmHeight = 2879
        mmLeft = 192035
        mmTop = 3175
        mmWidth = 24130
        BandType = 7
      end
      object ppDBCalc27: TppDBCalc
        UserName = 'DBCalc8'
        AutoSize = True
        DataField = 'IMPPAGADO'
        DataPipeline = ppdbRetA4
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRetA4'
        mmHeight = 2879
        mmLeft = 254424
        mmTop = 3175
        mmWidth = 22860
        BandType = 7
      end
      object ppLine9: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 529
        mmTop = 794
        mmWidth = 277019
        BandType = 7
      end
      object ppLine10: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 529
        mmTop = 7673
        mmWidth = 277019
        BandType = 7
      end
      object ppLabel123: TppLabel
        UserName = 'Label123'
        Caption = 'Retenciones 6%  --->'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 163513
        mmTop = 8996
        mmWidth = 29633
        BandType = 7
      end
      object ppLabel127: TppLabel
        UserName = 'Label127'
        Caption = 'Retenciones 3%  --->'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 163513
        mmTop = 14288
        mmWidth = 30163
        BandType = 7
      end
      object ppLabel128: TppLabel
        UserName = 'Label128'
        Caption = 'Base Imponible'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 196057
        mmTop = 8996
        mmWidth = 19600
        BandType = 7
      end
      object ppLabel129: TppLabel
        UserName = 'Label129'
        Caption = 'Base Imponible'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 196057
        mmTop = 14288
        mmWidth = 19579
        BandType = 7
      end
      object ppl_BaseImp6: TppLabel
        UserName = 'l_BaseImp6'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3979
        mmLeft = 218811
        mmTop = 8996
        mmWidth = 18542
        BandType = 7
      end
      object ppl_BaseImp3: TppLabel
        UserName = 'Label1301'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 218811
        mmTop = 14288
        mmWidth = 18785
        BandType = 7
      end
      object ppLabel132: TppLabel
        UserName = 'Label132'
        Caption = 'Retenci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 242623
        mmTop = 8996
        mmWidth = 12742
        BandType = 7
      end
      object ppLabel133: TppLabel
        UserName = 'Label133'
        Caption = 'Retenci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 242623
        mmTop = 14288
        mmWidth = 12700
        BandType = 7
      end
      object ppl_Retencion6: TppLabel
        UserName = 'l_Retencion6'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3979
        mmLeft = 256646
        mmTop = 8996
        mmWidth = 20362
        BandType = 7
      end
      object ppl_Retencion3: TppLabel
        UserName = 'l_Retencion3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3979
        mmLeft = 256646
        mmTop = 14288
        mmWidth = 20362
        BandType = 7
      end
    end
    object ppParameterList4: TppParameterList
    end
  end
  object ppdRetA4: TppDesigner
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
    Left = 696
    Top = 160
  end
  object pprRegRetencion: TppReport
    AutoStop = False
    DataPipeline = ppDBRegRetencion
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
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 72
    Top = 160
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBRegRetencion'
  end
end

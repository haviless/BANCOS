object FToolIngresos: TFToolIngresos
  Left = 308
  Top = 267
  Width = 804
  Height = 145
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnl: TPanel
    Left = 2
    Top = 2
    Width = 790
    Height = 87
    BevelInner = bvRaised
    BevelOuter = bvLowered
    BevelWidth = 2
    Color = 14869218
    TabOrder = 0
    object gbPeriodo: TGroupBox
      Left = 11
      Top = 5
      Width = 768
      Height = 74
      Caption = 'Movimientos de Caja'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label3: TLabel
        Left = 222
        Top = 20
        Width = 30
        Height = 15
        Caption = 'Fecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object lblCIA: TLabel
        Left = 16
        Top = 20
        Width = 49
        Height = 15
        Caption = 'Compa'#241#237'a'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 321
        Top = 20
        Width = 40
        Height = 15
        Caption = 'Usuario'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object SpeedButton1: TSpeedButton
        Left = 288
        Top = 37
        Width = 6
        Height = 22
        Flat = True
        OnClick = SpeedButton1Click
      end
      object bbtnPrevio: TBitBtn
        Left = 508
        Top = 23
        Width = 42
        Height = 36
        Hint = 'Consulta de Ingresos de Caja Preliminar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TabStop = False
        OnClick = bbtnPrevioClick
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
      object dbeCIA: TEdit
        Left = 55
        Top = 37
        Width = 130
        Height = 23
        Color = clInfoBk
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object dbeUsuario: TwwDBEdit
        Left = 295
        Top = 37
        Width = 100
        Height = 23
        Color = clInfoBk
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object bbtnCierre: TBitBtn
        Left = 569
        Top = 23
        Width = 42
        Height = 36
        Hint = 'Cierre de Caja'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        TabStop = False
        OnClick = bbtnCierreClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000FFFFFF767676
          8686868686868686868686868686868686868686868686868D8D8D777777FFFF
          FFFFFFFFFFFFFFFFFFFF1D1D1D9292838E8E7F8E8E7F8A8A8377777777777777
          77777777777F7F7F2626267E7E7EFFFFFFFFFFFFFFFFFFFFFFFF9393845F5FF7
          2020BF2020C6575795FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080767676FFFF
          FFFFFFFFFFFFFFFFFFFF8787787C7CFFFFFFFFFFFFFF0F0FB8FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF787878767676FFFFFFFFFFFFFFFFFFFFFFFF8787788080FF
          FFFFFFFFFFFF0F0FB1FFFFFFFFFFFF6F6F6FD3CFCFFFFFFF807878767676FFFF
          FFFFFFFFFFFFFFFFFFFF8F8F781919FF7B7BFF7373FF4848E1FFFFFFFFFFFF00
          00000000003FD5D53F78788D8282969696FFFFFFFFFFFFFFFFFF7C7C7CFFFFEC
          B1B19ADDDDC6D5D5B8FFFFFFFFFFFF8F707000DDDD00C4C400D2D258878E7689
          89969696FFFFFFFFFFFF8F8F783333FF00002248488F1D1DCAFFFFFFFFFFFFD3
          FFFF00BCBC00C0C600E8EFFF3300F00014679595969696FFFFFF8F8F805050E1
          0000000000003F3F8EFFFFFFFFFFFFFFFFFF26B7BF1DFFC4FF0000FF5800FF50
          00F00014679595A1A1A19797870000709F9F80FFFFF0000000FFFFFFFFFFFFFF
          FFFFBCCBCBFF0000FFC500FF0000FF5800FF5000F000146B99998787789A9AFF
          8E8EFF8E8EFF48482F1D1D1DFFFFFFFFFFFFFFFFFFFF2626FF0000FFC500FF00
          00FF5800FF5000E50F228B8B7C5F5FE82020B12525BB50508E000000141414FF
          FFFFFFFFFFFFFFFFFF3737FF0000FFC500FF0000FF5800FF4C008787787C7CFF
          FFFFFFFFFFFF1D1DC3E9E9DA6F6F6FB5B5B5FFFFFFFFFFFF5C8B8BEF1414FF00
          00FFC500FF0000FF58008787788080FFFFFFFFFFFFFF0F0FB1FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF7878786A9999FF3737FF0000FFC500FF00009797802626FF
          7F7FFF7B7BFF5050E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080666666FFFF
          FFFF2626FF0000FFB50037373796967F8787778787778A8A7B77777777777777
          77777777777F7F7F1D1D1DFFFFFFFFFFFFFFFFFFFF3F3FFF0000}
      end
      object bbtnCuadre: TBitBtn
        Left = 612
        Top = 23
        Width = 42
        Height = 36
        Hint = 'Balancin de Caja'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        TabStop = False
        OnClick = bbtnCuadreClick
        Glyph.Data = {
          CE020000424DCE020000000000007600000028000000220000001E0000000100
          0400000000005802000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFF0078800FFFFFFFFFFFFFFFF000000FFFFFFFFF00777888800
          FFFFFFFFFFFFFF000000FFFFFFF007777800888800FFFFFFFFFFFF000000FFFF
          F0077778878800888800FFFFFFFFFF000000FFF00777788787888800888800FF
          FFFFFF000000FF07777887778788888800888800FFFFFF000000FF8778877777
          87888888880088880FFFFF000000FF888777777787888888888800880FFFFF00
          0000F8878777777787888888888888000FFFFF000000F8F7877777778F888888
          8888888800FFFF000000F8F78777777F8877888888888888800FFF000000F8F7
          87777FF777887788888888888080FF000000F8F7877FF7777777887788888888
          80780F000000F8F78FF77799778877887788888880788F000000F8FF8877AA77
          8877777088778888808FFF000000F88F778877887777700F7088778880FFFF00
          0000FFF88F77888877700FFFF077887780FFFF000000FFFFF88F7788800FFFCC
          F7087788FFFFFF000000FFFFFFF88F7788FFCCFFFF0888FFFFFFFF000000FFFF
          FFFFF88F778FFFFCCF70FFFFFFFFFF000000FFFFFFFFFFF88F8FFCCFFFF70FFF
          FFFFFF000000FFFFFFFFFFFFF888FFFFCCFF70FFFFFFFF000000FFFFFFFFFFFF
          FFF8FFCCFFFFF70FFFFFFF000000FFFFFFFFFFFFFFFF8FFFFFCCFF700FFFFF00
          0000FFFFFFFFFFFFFFFFF8FFCCFFFFF88FFFFF000000FFFFFFFFFFFFFFFFFF8F
          FFFFF88FFFFFFF000000FFFFFFFFFFFFFFFFFFF8FFF88FFFFFFFFF000000FFFF
          FFFFFFFFFFFFFFFF888FFFFFFFFFFF000000}
      end
      object dtpFecha: TwwDBDateTimePicker
        Left = 195
        Top = 37
        Width = 92
        Height = 23
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Date = 38701.000000000000000000
        Epoch = 1950
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 5
      end
      object bbtnApertura: TBitBtn
        Left = 465
        Top = 23
        Width = 42
        Height = 36
        Hint = 'Apertura de Caja'
        ModalResult = 5
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        TabStop = False
        OnClick = bbtnAperturaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000055
          555557777777775F55550FFFFFFFFF0555557F5555555F7FFF5F0FEEEEEE0000
          05007F555555777775770FFFFFF0BFBFB00E7F5F5557FFF557770F0EEEE000FB
          FB0E7F75FF57775555770FF00F0FBFBFBF0E7F57757FFFF555770FE0B00000FB
          FB0E7F575777775555770FFF0FBFBFBFBF0E7F5575FFFFFFF5770FEEE0000000
          FB0E7F555777777755770FFFFF0B00BFB0007F55557577FFF7770FEEEEE0B000
          05557F555557577775550FFFFFFF0B0555557FF5F5F57575F55500F0F0F0F0B0
          555577F7F7F7F7F75F5550707070700B055557F7F7F7F7757FF5507070707050
          9055575757575757775505050505055505557575757575557555}
        NumGlyphs = 2
      end
      object dblcCia: TwwDBLookupCombo
        Left = 12
        Top = 37
        Width = 42
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
        LookupField = 'CIAID'
        Options = [loColLines, loRowLines, loTitles]
        Color = clInfoBk
        MaxLength = 2
        ParentFont = False
        TabOrder = 7
        AutoDropDown = True
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        PreciseEditRegion = False
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblcCiaExit
        OnNotInList = dblcCiaNotInList
      end
      object BitBtn2: TBitBtn
        Left = 404
        Top = 23
        Width = 42
        Height = 36
        Hint = 'Filtrar Recibos'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        OnClick = BitBtn2Click
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
      object Z2bbtnCont: TBitBtn
        Left = 671
        Top = 23
        Width = 42
        Height = 36
        Hint = 'Asientos Autom'#225'ticos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
        OnClick = Z2bbtnContClick
        Glyph.Data = {
          06020000424D060200000000000076000000280000001A000000190000000100
          04000000000090010000CE0E0000D80E00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888888800000080000000000000000000000008000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000BBBBBB
          BBBBBBBBB00000000000000000000000000000000000000000000000BBBBBBBB
          BBBBBBBBBBB00000000000000000000000000000000000000000000000000000
          0000000000000000000000BBBB0BBB0B0B0B0BBB0BBB0000000000B00B0B0B0B
          0B0B0B0B0B0B0000000000B00B0B0B0B0B0B0BBB0B0B0000000000B0000B0B0B
          0B0B000B0B0B0000000000B0000BBB0BBB0B0BBB0BBB0000000000B000000000
          000B00000B000000000000B00B00000000BBB0000B000000000000BBBB000000
          000B000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000080000000000000000000000008000000888888888888
          88888888888888000000}
      end
      object bbtnImprimeConta: TBitBtn
        Left = 715
        Top = 23
        Width = 42
        Height = 36
        Hint = 'Imprime Asientos Contables de Ingresos'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        TabStop = False
        OnClick = bbtnImprimeContaClick
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
      object cbDiseno: TCheckBox
        Left = 408
        Top = 2
        Width = 177
        Height = 17
        Caption = 'Editar Archivo de Reporte'
        Enabled = False
        TabOrder = 11
        Visible = False
      end
    end
  end
  object ppdb1: TppDBPipeline
    UserName = 'db1'
    Left = 245
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
    Left = 280
    Top = 104
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdb1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
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
    Left = 317
    Top = 105
  end
  object ppdb2: TppDBPipeline
    UserName = 'db2'
    Left = 208
    Top = 104
  end
end

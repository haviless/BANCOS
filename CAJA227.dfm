object FCierreMensual: TFCierreMensual
  Left = 428
  Top = 202
  BorderStyle = bsDialog
  Caption = 'Cierre Mensual'
  ClientHeight = 366
  ClientWidth = 322
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Scaled = False
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 7
    Top = 73
    Width = 306
    Height = 57
    Shape = bsFrame
  end
  object Label2: TLabel
    Left = 180
    Top = 84
    Width = 21
    Height = 15
    Caption = 'Mes'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 98
    Top = 84
    Width = 20
    Height = 15
    Caption = 'A'#241'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Bevel2: TBevel
    Left = 7
    Top = 315
    Width = 306
    Height = 40
    Shape = bsFrame
  end
  object z2bbtnOK: TBitBtn
    Left = 229
    Top = 321
    Width = 30
    Height = 30
    Hint = 'Cerrar Mes'
    TabOrder = 4
    OnClick = z2bbtnOKClick
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
  object z2bbtnCancel2: TBitBtn
    Left = 263
    Top = 321
    Width = 30
    Height = 30
    Hint = 'Cerrar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = z2bbtnCancel2Click
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
  object dbseMes: TwwDBSpinEdit
    Left = 180
    Top = 100
    Width = 43
    Height = 21
    Increment = 1.000000000000000000
    MaxValue = 12.000000000000000000
    MinValue = 1.000000000000000000
    TabOrder = 2
    UnboundDataType = wwDefault
    OnExit = dbseMesExit
    OnKeyPress = XKeyPress
  end
  object dbseAno: TwwDBSpinEdit
    Left = 98
    Top = 100
    Width = 75
    Height = 21
    Increment = 1.000000000000000000
    MaxValue = 2500.000000000000000000
    MinValue = 1950.000000000000000000
    TabOrder = 1
    UnboundDataType = wwDefault
    OnExit = dbseAnoExit
    OnKeyPress = XKeyPress
  end
  object StaticText1: TStaticText
    Left = 18
    Top = 65
    Width = 43
    Height = 19
    Caption = 'Periodo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object GroupBox2: TGroupBox
    Left = 7
    Top = 7
    Width = 306
    Height = 51
    Caption = 'Compa'#241#237'a'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object dblcCia: TwwDBLookupCombo
      Left = 16
      Top = 18
      Width = 42
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
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
      Left = 59
      Top = 18
      Width = 232
      Height = 23
      Color = clBtnFace
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 143
    Width = 305
    Height = 161
    Caption = 'Opciones'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object Label1: TLabel
      Left = 13
      Top = 135
      Width = 60
      Height = 15
      Caption = 'Caja/Banco'
    end
    object Label4: TLabel
      Left = 12
      Top = 102
      Width = 87
      Height = 15
      Caption = 'Cuenta Corriente'
    end
    object rgSelec: TRadioGroup
      Left = 23
      Top = 23
      Width = 259
      Height = 59
      Caption = 'Seleccionar'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Todos a la Vez'
        'Una a la Vez')
      TabOrder = 0
      OnClick = rgSelecClick
    end
    object dblcdCCBco: TwwDBLookupComboDlg
      Left = 105
      Top = 99
      Width = 178
      Height = 23
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'CCBCOID'#9'25'#9'Cuenta Corriente'#9'F'
        'BANCOID'#9'5'#9'Banco'#9'F'
        'BANCONOM'#9'20'#9'Nombre Banco'#9'F')
      LookupTable = DMTE.cds1
      LookupField = 'CCBCOID'
      Enabled = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnEnter = dblcdCCBcoEnter
      OnExit = dblcdCCBcoExit
    end
    object dbeBcoDes: TwwDBEdit
      Left = 149
      Top = 131
      Width = 132
      Height = 23
      Enabled = False
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeBanco: TwwDBEdit
      Left = 105
      Top = 131
      Width = 41
      Height = 23
      Enabled = False
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  object ppdbRepMovxDef: TppDBPipeline
    DataSource = DMTE.dsQry5
    UserName = 'dbRepMovxDef'
    Left = 56
    Top = 320
  end
  object ppRepMovxDef: TppReport
    AutoStop = False
    DataPipeline = ppdbRepMovxDef
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
    Template.FileName = 'C:\SOLExes\SOLFormatos\Caja\Dema\MovxDefinir.rtm'
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppRepMovxDefPreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 88
    Top = 320
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbRepMovxDef'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 40481
      mmPrintPosition = 0
      object pplblCia: TppLabel
        UserName = 'lblCia'
        Caption = 'lblCia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 7673
        mmTop = 2646
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Fecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 153194
        mmTop = 2910
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Hora'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 153459
        mmTop = 8731
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 165894
        mmTop = 2910
        mmWidth = 1058
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 165894
        mmTop = 8731
        mmWidth = 1058
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 170392
        mmTop = 2910
        mmWidth = 16933
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 170392
        mmTop = 8731
        mmWidth = 21167
        BandType = 0
      end
      object pplblTitulo: TppLabel
        UserName = 'lblTitulo'
        Caption = 'Movimientos por Definir Antes de Cierre'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 42863
        mmTop = 26194
        mmWidth = 60325
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Fecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 60590
        mmTop = 34925
        mmWidth = 9525
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        Pen.Style = psDot
        mmHeight = 265
        mmLeft = 2646
        mmTop = 39688
        mmWidth = 191559
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Nro. Comprobante'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 79375
        mmTop = 34925
        mmWidth = 27781
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Tipo de Diario'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 114036
        mmTop = 34925
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Operaci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 15081
        mmTop = 34925
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Monto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 155840
        mmTop = 34925
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'P'#225'gina'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 153459
        mmTop = 14817
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 165894
        mmTop = 14817
        mmWidth = 1058
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 170392
        mmTop = 14817
        mmWidth = 1852
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppdbFecha: TppDBText
        UserName = 'dbFecha'
        AutoSize = True
        DataField = 'FECHA'
        DataPipeline = ppdbRepMovxDef
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbRepMovxDef'
        mmHeight = 4233
        mmLeft = 59531
        mmTop = 0
        mmWidth = 11642
        BandType = 4
      end
      object ppdbNroComp: TppDBText
        UserName = 'dbNroComp'
        AutoSize = True
        DataField = 'ECNOCOMP'
        DataPipeline = ppdbRepMovxDef
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRepMovxDef'
        mmHeight = 4233
        mmLeft = 83079
        mmTop = 0
        mmWidth = 20108
        BandType = 4
      end
      object ppdbTDiario: TppDBText
        UserName = 'dbTDiario'
        AutoSize = True
        DataField = 'TDIARID'
        DataPipeline = ppdbRepMovxDef
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbRepMovxDef'
        mmHeight = 4233
        mmLeft = 118004
        mmTop = 0
        mmWidth = 12965
        BandType = 4
      end
      object ppdbOperacion: TppDBText
        UserName = 'dbOperacion'
        AutoSize = True
        DataField = 'EC_PROCDES'
        DataPipeline = ppdbRepMovxDef
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRepMovxDef'
        mmHeight = 4233
        mmLeft = 3440
        mmTop = 0
        mmWidth = 23548
        BandType = 4
      end
      object ppdbMonto: TppDBText
        UserName = 'dbMonto'
        AutoSize = True
        DataField = 'MONTO'
        DataPipeline = ppdbRepMovxDef
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRepMovxDef'
        mmHeight = 4233
        mmLeft = 155840
        mmTop = 0
        mmWidth = 12435
        BandType = 4
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        AutoSize = True
        DataField = 'MONTO'
        DataPipeline = ppdbRepMovxDef
        DisplayFormat = '#,0.00; -#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbRepMovxDef'
        mmHeight = 4233
        mmLeft = 144727
        mmTop = 1323
        mmWidth = 23548
        BandType = 7
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        Pen.Style = psDot
        mmHeight = 265
        mmLeft = 2646
        mmTop = 265
        mmWidth = 191559
        BandType = 7
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Total :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 126207
        mmTop = 1323
        mmWidth = 9525
        BandType = 7
      end
    end
  end
end

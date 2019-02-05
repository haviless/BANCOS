object FArqueoCaja: TFArqueoCaja
  Left = 377
  Top = 174
  BorderStyle = bsDialog
  Caption = 'Movimiento Diario (I/E)'
  ClientHeight = 133
  ClientWidth = 301
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlRegComp: TPanel
    Left = 6
    Top = 4
    Width = 289
    Height = 125
    BevelInner = bvRaised
    BorderWidth = 1
    TabOrder = 0
    object lblReporte: TLabel
      Left = 12
      Top = 8
      Width = 150
      Height = 19
      Caption = 'Movimiento Diario (I/E)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 8
      Top = 28
      Width = 272
      Height = 62
      Style = bsRaised
    end
    object lblCia: TLabel
      Left = 16
      Top = 42
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
      Top = 69
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
    object Label3: TLabel
      Left = 16
      Top = 96
      Width = 15
      Height = 15
      Caption = 'al :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object z2bbtnOk: TBitBtn
      Left = 217
      Top = 94
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
      Top = 94
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
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'Cia'#9'F'
        'CIADES'#9'40'#9'Razón Social'#9'F')
      LookupTable = DM1.cdsCia
      LookupField = 'CIAID'
      Options = [loColLines, loRowLines, loTitles]
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      AllowClearKey = True
      ShowMatchText = True
      OnChange = dblcCiaChange
      OnExit = dblcCiaExit
    end
    object edtCia: TEdit
      Left = 93
      Top = 36
      Width = 174
      Height = 23
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
    object dbdtpFin: TwwDBDateTimePicker
      Left = 49
      Top = 92
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
      Visible = False
      OnExit = dbdtpFinExit
    end
    object dbdtpInicio: TwwDBDateTimePicker
      Left = 49
      Top = 64
      Width = 121
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 2
      OnExit = dbdtpInicioExit
    end
  end
  object ppReport5: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report4'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 296863
    PrinterSetup.mmPaperWidth = 350000
    Template.FileName = 'C:\SolCaja\SolFormatos\ArqueoNew.rtm'
    Units = utMillimeters
    UserName = 'Report4'
    DeviceType = 'Screen'
    Left = 253
    Top = 68
    Version = '4.22 Pro'
    mmColumnWidth = 0
    object ppDetailBand4: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 13758
      mmPrintPosition = 0
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        Caption = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        PrintBehavior = pbSection
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 1588
        mmWidth = 337300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppDBIE
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report4'
          PrinterSetup.PaperName = 'Custom'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 296863
          PrinterSetup.mmPaperWidth = 350000
          Template.FileName = 'C:\SolCaja\SolFormatos\ArqueoNew.rtm'
          UserName = 'ChildReport1'
          Left = 530
          Top = 412
          Version = '4.22 Pro'
          mmColumnWidth = 0
          object ppHeaderBand1: TppHeaderBand
            mmBottomOffset = 0
            mmHeight = 12700
            mmPrintPosition = 0
            object ppLabel2: TppLabel
              UserName = 'Label2'
              Caption = 'Fecha :'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 11
              Font.Style = []
              Transparent = True
              mmHeight = 4498
              mmLeft = 230717
              mmTop = 8731
              mmWidth = 11377
              BandType = 0
            end
            object ppLabel3: TppLabel
              UserName = 'Label3'
              AutoSize = False
              Caption = 'Hora   :'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 11
              Font.Style = []
              Transparent = True
              mmHeight = 4498
              mmLeft = 230717
              mmTop = 4763
              mmWidth = 11642
              BandType = 0
            end
            object ppLabel4: TppLabel
              UserName = 'Label701'
              Caption = 'Página:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 11
              Font.Style = []
              Transparent = True
              mmHeight = 4498
              mmLeft = 230717
              mmTop = 529
              mmWidth = 11377
              BandType = 0
            end
            object svPag: TppSystemVariable
              UserName = 'svPag'
              Alignment = taCenter
              VarType = vtPageNo
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 11
              Font.Style = []
              Transparent = True
              mmHeight = 4498
              mmLeft = 250826
              mmTop = 529
              mmWidth = 1852
              BandType = 0
            end
            object ppSystemVariable5: TppSystemVariable
              UserName = 'SystemVariable5'
              VarType = vtTime
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 11
              Font.Style = []
              Transparent = True
              mmHeight = 4498
              mmLeft = 251090
              mmTop = 4763
              mmWidth = 20638
              BandType = 0
            end
            object ppSystemVariable6: TppSystemVariable
              UserName = 'SystemVariable6'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 11
              Font.Style = []
              Transparent = True
              mmHeight = 4498
              mmLeft = 251355
              mmTop = 8731
              mmWidth = 16933
              BandType = 0
            end
            object ppLabel1: TppLabel
              UserName = 'Label1'
              Caption = 'Movimiento Diario de Caja  (detallado)'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 11
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4498
              mmLeft = 110861
              mmTop = 794
              mmWidth = 67204
              BandType = 0
            end
            object ppFecha1: TppLabel
              UserName = 'Label4'
              Caption = 'Fecha'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 11
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4498
              mmLeft = 127529
              mmTop = 6350
              mmWidth = 10319
              BandType = 0
            end
            object ppLabel5: TppLabel
              UserName = 'Label5'
              Caption = 'Jockey Club del Perú'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 11
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4498
              mmLeft = 794
              mmTop = 1058
              mmWidth = 37306
              BandType = 0
            end
          end
          object ppDetailBand5: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4233
            mmPrintPosition = 0
            object ppDBText13: TppDBText
              UserName = 'DBText13'
              DataField = 'DOCABR'
              DataPipeline = ppDBIE
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 11
              Font.Style = []
              Transparent = True
              mmHeight = 4498
              mmLeft = 1588
              mmTop = 529
              mmWidth = 3969
              BandType = 4
            end
            object ppDBText14: TppDBText
              UserName = 'DBText14'
              DataField = 'ECFCOMP'
              DataPipeline = ppDBIE
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 11
              Font.Style = []
              Transparent = True
              mmHeight = 4498
              mmLeft = 6615
              mmTop = 529
              mmWidth = 24077
              BandType = 4
            end
            object ppDBText16: TppDBText
              UserName = 'DBText16'
              DataField = 'ECGLOSA'
              DataPipeline = ppDBIE
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 11
              Font.Style = []
              Transparent = True
              mmHeight = 4498
              mmLeft = 100013
              mmTop = 529
              mmWidth = 72231
              BandType = 4
            end
            object ppDBText17: TppDBText
              UserName = 'DBText17'
              Alignment = taRightJustify
              DataField = 'ECMTOLOC'
              DataPipeline = ppDBIE
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 11
              Font.Style = []
              Transparent = True
              mmHeight = 4498
              mmLeft = 174625
              mmTop = 529
              mmWidth = 27517
              BandType = 4
            end
            object ppDBText18: TppDBText
              UserName = 'DBText18'
              Alignment = taRightJustify
              DataField = 'ECMTOEXT'
              DataPipeline = ppDBIE
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 11
              Font.Style = []
              Transparent = True
              mmHeight = 4498
              mmLeft = 202936
              mmTop = 529
              mmWidth = 27517
              BandType = 4
            end
            object ppDBText19: TppDBText
              UserName = 'DBText19'
              Alignment = taRightJustify
              DataField = 'ECTCAMB'
              DataPipeline = ppDBIE
              DisplayFormat = '#0.000'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 11
              Font.Style = []
              Transparent = True
              mmHeight = 4498
              mmLeft = 231246
              mmTop = 529
              mmWidth = 15346
              BandType = 4
            end
            object ppDBText20: TppDBText
              UserName = 'DBText20'
              Alignment = taCenter
              DataField = 'CLAUXID'
              DataPipeline = ppDBIE
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 11
              Font.Style = []
              Transparent = True
              mmHeight = 4498
              mmLeft = 247386
              mmTop = 529
              mmWidth = 14817
              BandType = 4
            end
            object ppDBText21: TppDBText
              UserName = 'DBText101'
              DataField = 'PROV'
              DataPipeline = ppDBIE
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 11
              Font.Style = []
              Transparent = True
              mmHeight = 4498
              mmLeft = 263261
              mmTop = 529
              mmWidth = 18785
              BandType = 4
            end
            object ppDBText22: TppDBText
              UserName = 'DBText22'
              DataField = 'AUXNOMB'
              DataPipeline = ppDBIE
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 11
              Font.Style = []
              Transparent = True
              mmHeight = 4498
              mmLeft = 31485
              mmTop = 529
              mmWidth = 66675
              BandType = 4
            end
            object ppLabel6: TppLabel
              UserName = 'Label6'
              Caption = '-'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 11
              Font.Style = []
              Transparent = True
              mmHeight = 4498
              mmLeft = 5556
              mmTop = 529
              mmWidth = 1323
              BandType = 4
            end
          end
          object ppSummaryBand2: TppSummaryBand
            BeforeGenerate = ppSummaryBand2BeforeGenerate
            mmBottomOffset = 0
            mmHeight = 9790
            mmPrintPosition = 0
            object ppLabel42: TppLabel
              UserName = 'Label42'
              Caption = 'Total General Mon. Nacional'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 11
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4498
              mmLeft = 71438
              mmTop = 1058
              mmWidth = 50006
              BandType = 7
            end
            object ppLabel43: TppLabel
              UserName = 'Label43'
              Caption = 'Total General Mon. Extranjera'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 11
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4498
              mmLeft = 71438
              mmTop = 5292
              mmWidth = 53446
              BandType = 7
            end
            object ppMonNac: TppLabel
              UserName = 'MonNac'
              Caption = 'MonNac'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 11
              Font.Style = []
              Transparent = True
              mmHeight = 4498
              mmLeft = 174625
              mmTop = 1058
              mmWidth = 13758
              BandType = 7
            end
            object ppMonExt: TppLabel
              UserName = 'MonExt'
              Caption = 'MonExt'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 11
              Font.Style = []
              Transparent = True
              mmHeight = 4498
              mmLeft = 174625
              mmTop = 5292
              mmWidth = 12435
              BandType = 7
            end
          end
          object ppGroup1: TppGroup
            BreakName = 'ppDBText12'
            BreakType = btCustomField
            KeepTogether = True
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            object ppGroupHeaderBand1: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 20638
              mmPrintPosition = 0
              object ppDBText12: TppDBText
                UserName = 'DBEC_IE1'
                DataField = 'EC_IE'
                DataPipeline = ppDBIE
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 11
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4498
                mmLeft = 1058
                mmTop = 529
                mmWidth = 26988
                BandType = 3
                GroupNo = 0
              end
              object ppLabel7: TppLabel
                UserName = 'Label7'
                Alignment = taCenter
                Caption = 'Documento'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 11
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4498
                mmLeft = 2381
                mmTop = 9525
                mmWidth = 19844
                BandType = 3
                GroupNo = 0
              end
              object ppLabel9: TppLabel
                UserName = 'Label9'
                Alignment = taCenter
                Caption = 'Importe  S/.'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 11
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4498
                mmLeft = 177536
                mmTop = 9525
                mmWidth = 20373
                BandType = 3
                GroupNo = 0
              end
              object ppLabel10: TppLabel
                UserName = 'Label10'
                Alignment = taCenter
                Caption = 'Importe US$'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 11
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4498
                mmLeft = 206640
                mmTop = 9525
                mmWidth = 22225
                BandType = 3
                GroupNo = 0
              end
              object ppLabel11: TppLabel
                UserName = 'Label11'
                Alignment = taCenter
                Caption = 'T/C'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 11
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4498
                mmLeft = 238125
                mmTop = 9525
                mmWidth = 6615
                BandType = 3
                GroupNo = 0
              end
              object ppLabel12: TppLabel
                UserName = 'Label12'
                Alignment = taCenter
                Caption = 'Concepto'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 11
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4498
                mmLeft = 98425
                mmTop = 9525
                mmWidth = 16669
                BandType = 3
                GroupNo = 0
              end
              object ppLabel13: TppLabel
                UserName = 'Label13'
                Alignment = taCenter
                Caption = 'Clase'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 11
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4498
                mmLeft = 250032
                mmTop = 9525
                mmWidth = 9790
                BandType = 3
                GroupNo = 0
              end
              object ppLabel14: TppLabel
                UserName = 'Label14'
                Alignment = taCenter
                Caption = 'Auxiliar'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 11
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4498
                mmLeft = 265907
                mmTop = 9525
                mmWidth = 13758
                BandType = 3
                GroupNo = 0
              end
              object ppLine1: TppLine
                UserName = 'Line1'
                Weight = 0.75
                mmHeight = 5027
                mmLeft = 0
                mmTop = 15610
                mmWidth = 279930
                BandType = 3
                GroupNo = 0
              end
              object ppLabel15: TppLabel
                UserName = 'Label15'
                Alignment = taCenter
                Caption = 'Descripción'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 11
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4498
                mmLeft = 36777
                mmTop = 9525
                mmWidth = 20638
                BandType = 3
                GroupNo = 0
              end
              object ppLine2: TppLine
                UserName = 'Line2'
                Weight = 0.75
                mmHeight = 2540
                mmLeft = 529
                mmTop = 6085
                mmWidth = 279930
                BandType = 3
                GroupNo = 0
              end
            end
            object ppGroupFooterBand1: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 5821
              mmPrintPosition = 0
              object ppLabel41: TppLabel
                UserName = 'Label41'
                Caption = 'Total'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 11
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4498
                mmLeft = 1323
                mmTop = 265
                mmWidth = 8996
                BandType = 5
                GroupNo = 0
              end
              object ppDBCalc4: TppDBCalc
                UserName = 'SumLOC1'
                Alignment = taRightJustify
                DataField = 'ECMTOLOC'
                DataPipeline = ppDBIE
                DisplayFormat = '###,###,##0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 11
                Font.Style = []
                Transparent = True
                ResetGroup = ppGroup1
                OnCalc = ppDBCalc4Calc
                mmHeight = 4498
                mmLeft = 174625
                mmTop = 794
                mmWidth = 27517
                BandType = 5
                GroupNo = 0
              end
              object ppDBCalc3: TppDBCalc
                UserName = 'SumEXT1'
                Alignment = taRightJustify
                DataField = 'ECMTOEXT'
                DataPipeline = ppDBIE
                DisplayFormat = '###,###,##0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 12cpi'
                Font.Size = 11
                Font.Style = []
                Transparent = True
                ResetGroup = ppGroup1
                OnCalc = ppDBCalc3Calc
                mmHeight = 4498
                mmLeft = 202936
                mmTop = 794
                mmWidth = 27517
                BandType = 5
                GroupNo = 0
              end
            end
          end
        end
      end
      object ppSubReport2: TppSubReport
        UserName = 'SubReport2'
        Caption = 'SubReport2'
        ExpandAll = False
        NewPrintJob = False
        PrintBehavior = pbSection
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 8202
        mmWidth = 337300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = ppDBResumen
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report4'
          PrinterSetup.PaperName = 'Custom'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 296863
          PrinterSetup.mmPaperWidth = 350000
          Template.FileName = 'C:\SOLCaja\SolFormatos\ArqueoNew.rtm'
          UserName = 'Report3'
          Left = 550
          Top = 432
          Version = '4.22 Pro'
          mmColumnWidth = 0
          object ppHeaderBand5: TppHeaderBand
            mmBottomOffset = 0
            mmHeight = 23019
            mmPrintPosition = 0
            object ppLabel61: TppLabel
              UserName = 'Label61'
              Caption = 'Resumen Adjunto al Movimiento de Caja por Tipo de Documento Al'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 90488
              mmTop = 794
              mmWidth = 96573
              BandType = 0
            end
            object ppLabel18: TppLabel
              UserName = 'Label18'
              AutoSize = False
              Caption = 'Página:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 301096
              mmTop = 794
              mmWidth = 13758
              BandType = 0
            end
            object ppSystemVariable1: TppSystemVariable
              UserName = 'svPag1'
              Alignment = taCenter
              AutoSize = False
              VarType = vtPageNo
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 317501
              mmTop = 794
              mmWidth = 4498
              BandType = 0
            end
            object ppLabel8: TppLabel
              UserName = 'Label8'
              AutoSize = False
              Caption = 'INGRESOS'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 99748
              mmTop = 5556
              mmWidth = 15610
              BandType = 0
            end
            object ppLabel16: TppLabel
              UserName = 'Label16'
              AutoSize = False
              Caption = 'EGRESOS'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 254530
              mmTop = 5556
              mmWidth = 14023
              BandType = 0
            end
            object ppLabel17: TppLabel
              UserName = 'Label17'
              AutoSize = False
              Caption = 'Fecha'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 301096
              mmTop = 5556
              mmWidth = 14023
              BandType = 0
            end
            object ppSystemVariable2: TppSystemVariable
              UserName = 'SystemVariable1'
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 317501
              mmTop = 5556
              mmWidth = 14817
              BandType = 0
            end
            object ppLabel86: TppLabel
              UserName = 'Label86'
              Caption = 'TOTAL'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 309034
              mmTop = 11377
              mmWidth = 11113
              BandType = 0
            end
            object ppLabel84: TppLabel
              UserName = 'Label84'
              Caption = 'CHEQUE'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 262996
              mmTop = 11377
              mmWidth = 12965
              BandType = 0
            end
            object ppLabel83: TppLabel
              UserName = 'Label83'
              Caption = 'EFECTIVO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 218811
              mmTop = 11377
              mmWidth = 15346
              BandType = 0
            end
            object ppLabel82: TppLabel
              UserName = 'Label82'
              Caption = 'TOTAL'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 175948
              mmTop = 11377
              mmWidth = 11113
              BandType = 0
            end
            object ppLabel81: TppLabel
              UserName = 'Label81'
              Caption = 'TARJETA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 131498
              mmTop = 11377
              mmWidth = 14817
              BandType = 0
            end
            object ppLabel80: TppLabel
              UserName = 'Label502'
              Caption = 'CHEQUE'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 88106
              mmTop = 11377
              mmWidth = 12965
              BandType = 0
            end
            object ppLabel79: TppLabel
              UserName = 'Label79'
              Caption = 'EFECTIVO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 44186
              mmTop = 11377
              mmWidth = 15346
              BandType = 0
            end
            object ppLabel62: TppLabel
              UserName = 'Label62'
              Caption = 'DOCUMENTO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 265
              mmTop = 16404
              mmWidth = 21167
              BandType = 0
            end
            object ppLabel63: TppLabel
              UserName = 'Label63'
              AutoSize = False
              Caption = 'S/.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 38629
              mmTop = 16404
              mmWidth = 5292
              BandType = 0
            end
            object ppLabel64: TppLabel
              UserName = 'Label64'
              AutoSize = False
              Caption = '$'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 56092
              mmTop = 16404
              mmWidth = 3175
              BandType = 0
            end
            object ppLabel65: TppLabel
              UserName = 'Label203'
              AutoSize = False
              Caption = 'S/.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 82815
              mmTop = 16404
              mmWidth = 5292
              BandType = 0
            end
            object ppLabel66: TppLabel
              UserName = 'Label66'
              AutoSize = False
              Caption = '$'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 100542
              mmTop = 16404
              mmWidth = 3175
              BandType = 0
            end
            object ppLabel67: TppLabel
              UserName = 'Label67'
              AutoSize = False
              Caption = 'S/.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 127265
              mmTop = 16404
              mmWidth = 5292
              BandType = 0
            end
            object ppLabel68: TppLabel
              UserName = 'Label68'
              AutoSize = False
              Caption = '$'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 145521
              mmTop = 16404
              mmWidth = 3175
              BandType = 0
            end
            object ppLabel69: TppLabel
              UserName = 'Label69'
              AutoSize = False
              Caption = 'S/.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 170392
              mmTop = 16404
              mmWidth = 5292
              BandType = 0
            end
            object ppLabel70: TppLabel
              UserName = 'Label70'
              AutoSize = False
              Caption = '$'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 187325
              mmTop = 16404
              mmWidth = 3175
              BandType = 0
            end
            object ppLabel71: TppLabel
              UserName = 'Label71'
              AutoSize = False
              Caption = 'S/.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 215636
              mmTop = 16404
              mmWidth = 5292
              BandType = 0
            end
            object ppLabel72: TppLabel
              UserName = 'Label72'
              AutoSize = False
              Caption = '$'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 232834
              mmTop = 16404
              mmWidth = 3175
              BandType = 0
            end
            object ppLabel73: TppLabel
              UserName = 'Label73'
              AutoSize = False
              Caption = 'S/.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 257176
              mmTop = 16404
              mmWidth = 5292
              BandType = 0
            end
            object ppLabel74: TppLabel
              UserName = 'Label74'
              AutoSize = False
              Caption = '$'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 277019
              mmTop = 16404
              mmWidth = 3175
              BandType = 0
            end
            object ppLabel77: TppLabel
              UserName = 'Label77'
              AutoSize = False
              Caption = 'S/.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 302155
              mmTop = 16404
              mmWidth = 5292
              BandType = 0
            end
            object ppLabel78: TppLabel
              UserName = 'Label78'
              AutoSize = False
              Caption = '$'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 321469
              mmTop = 16404
              mmWidth = 3175
              BandType = 0
            end
            object ppLine4: TppLine
              UserName = 'Line4'
              Weight = 0.75
              mmHeight = 529
              mmLeft = 2117
              mmTop = 21696
              mmWidth = 333640
              BandType = 0
            end
          end
          object ppDetailBand6: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4763
            mmPrintPosition = 0
            object ppDBText39: TppDBText
              UserName = 'DBText39'
              DataField = 'DOCABR'
              DataPipeline = ppDBResumen
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 2117
              mmTop = 794
              mmWidth = 13758
              BandType = 4
            end
            object ppDBText23: TppDBText
              UserName = 'DBText23'
              Alignment = taRightJustify
              DataField = 'EFC_LOC_I'
              DataPipeline = ppDBResumen
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 30692
              mmTop = 794
              mmWidth = 19315
              BandType = 4
            end
            object ppDBText24: TppDBText
              UserName = 'DBText24'
              Alignment = taRightJustify
              DataField = 'EFC_EXT_I'
              DataPipeline = ppDBResumen
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 52652
              mmTop = 794
              mmWidth = 19315
              BandType = 4
            end
            object ppDBText25: TppDBText
              UserName = 'DBText25'
              Alignment = taRightJustify
              DataField = 'CHQ_LOC_I'
              DataPipeline = ppDBResumen
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 74613
              mmTop = 794
              mmWidth = 19315
              BandType = 4
            end
            object ppDBText26: TppDBText
              UserName = 'DBText26'
              Alignment = taRightJustify
              DataField = 'CHQ_EXT_I'
              DataPipeline = ppDBResumen
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 96573
              mmTop = 794
              mmWidth = 19315
              BandType = 4
            end
            object ppDBText27: TppDBText
              UserName = 'DBText27'
              Alignment = taRightJustify
              DataField = 'TJA_LOC_I'
              DataPipeline = ppDBResumen
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 118534
              mmTop = 794
              mmWidth = 19315
              BandType = 4
            end
            object ppDBText28: TppDBText
              UserName = 'DBText28'
              Alignment = taRightJustify
              DataField = 'TJA_EXT_I'
              DataPipeline = ppDBResumen
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 140494
              mmTop = 794
              mmWidth = 19315
              BandType = 4
            end
            object ppDBText36: TppDBText
              UserName = 'DBText36'
              Alignment = taRightJustify
              DataField = 'TOTINGLOC'
              DataPipeline = ppDBResumen
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 162454
              mmTop = 794
              mmWidth = 19315
              BandType = 4
            end
            object ppDBText35: TppDBText
              UserName = 'DBText35'
              Alignment = taRightJustify
              DataField = 'TOTINGEXT'
              DataPipeline = ppDBResumen
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 184415
              mmTop = 794
              mmWidth = 19315
              BandType = 4
            end
            object ppDBText29: TppDBText
              UserName = 'DBText29'
              Alignment = taRightJustify
              DataField = 'EFC_LOC_E'
              DataPipeline = ppDBResumen
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 206375
              mmTop = 794
              mmWidth = 19315
              BandType = 4
            end
            object ppDBText30: TppDBText
              UserName = 'DBText30'
              Alignment = taRightJustify
              DataField = 'EFC_EXT_E'
              DataPipeline = ppDBResumen
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 228336
              mmTop = 794
              mmWidth = 19315
              BandType = 4
            end
            object ppDBText31: TppDBText
              UserName = 'DBText31'
              Alignment = taRightJustify
              DataField = 'CHQ_LOC_E'
              DataPipeline = ppDBResumen
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 250296
              mmTop = 794
              mmWidth = 19315
              BandType = 4
            end
            object ppDBText32: TppDBText
              UserName = 'DBText32'
              Alignment = taRightJustify
              DataField = 'CHQ_EXT_E'
              DataPipeline = ppDBResumen
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 272257
              mmTop = 794
              mmWidth = 19315
              BandType = 4
            end
            object ppDBText38: TppDBText
              UserName = 'DBText38'
              Alignment = taRightJustify
              DataField = 'TOTEGRLOC'
              DataPipeline = ppDBResumen
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 294217
              mmTop = 794
              mmWidth = 19315
              BandType = 4
            end
            object ppDBText37: TppDBText
              UserName = 'DBText37'
              Alignment = taRightJustify
              DataField = 'TOTEGREXT'
              DataPipeline = ppDBResumen
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 316178
              mmTop = 794
              mmWidth = 19315
              BandType = 4
            end
          end
          object ppSummaryBand3: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 7673
            mmPrintPosition = 0
            object ppDBCalc10: TppDBCalc
              UserName = 'DBCalc10'
              Alignment = taRightJustify
              DataField = 'TJA_EXT_I'
              DataPipeline = ppDBResumen
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 138377
              mmTop = 2117
              mmWidth = 19315
              BandType = 7
            end
            object ppLine3: TppLine
              UserName = 'Line3'
              Weight = 0.75
              mmHeight = 529
              mmLeft = 0
              mmTop = 529
              mmWidth = 333640
              BandType = 7
            end
            object ppLabel89: TppLabel
              UserName = 'Label89'
              Caption = 'TOTALES :'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 2117
              mmTop = 2646
              mmWidth = 17198
              BandType = 7
            end
            object ppDBCalc5: TppDBCalc
              UserName = 'DBCalc5'
              Alignment = taRightJustify
              DataField = 'EFC_LOC_I'
              DataPipeline = ppDBResumen
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 30692
              mmTop = 2646
              mmWidth = 19315
              BandType = 7
            end
            object ppDBCalc6: TppDBCalc
              UserName = 'DBCalc6'
              Alignment = taRightJustify
              DataField = 'EFC_EXT_I'
              DataPipeline = ppDBResumen
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 52652
              mmTop = 2646
              mmWidth = 19315
              BandType = 7
            end
            object ppDBCalc8: TppDBCalc
              UserName = 'DBCalc8'
              Alignment = taRightJustify
              DataField = 'CHQ_LOC_I'
              DataPipeline = ppDBResumen
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 74613
              mmTop = 2646
              mmWidth = 19315
              BandType = 7
            end
            object ppDBCalc7: TppDBCalc
              UserName = 'DBCalc7'
              Alignment = taRightJustify
              DataField = 'CHQ_EXT_I'
              DataPipeline = ppDBResumen
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 96573
              mmTop = 2646
              mmWidth = 19315
              BandType = 7
            end
            object ppDBCalc9: TppDBCalc
              UserName = 'DBCalc9'
              Alignment = taRightJustify
              DataField = 'TJA_LOC_I'
              DataPipeline = ppDBResumen
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 118534
              mmTop = 2646
              mmWidth = 19315
              BandType = 7
            end
            object ppDBCalc11: TppDBCalc
              UserName = 'DBCalc11'
              Alignment = taRightJustify
              DataField = 'TOTINGLOC'
              DataPipeline = ppDBResumen
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 162454
              mmTop = 2646
              mmWidth = 19315
              BandType = 7
            end
            object ppDBCalc12: TppDBCalc
              UserName = 'DBCalc12'
              Alignment = taRightJustify
              DataField = 'TOTINGEXT'
              DataPipeline = ppDBResumen
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 184415
              mmTop = 2646
              mmWidth = 19315
              BandType = 7
            end
            object ppDBCalc13: TppDBCalc
              UserName = 'DBCalc13'
              Alignment = taRightJustify
              DataField = 'EFC_LOC_E'
              DataPipeline = ppDBResumen
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 206375
              mmTop = 2646
              mmWidth = 19315
              BandType = 7
            end
            object ppDBCalc14: TppDBCalc
              UserName = 'DBCalc14'
              Alignment = taRightJustify
              DataField = 'EFC_EXT_E'
              DataPipeline = ppDBResumen
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 228336
              mmTop = 2646
              mmWidth = 19315
              BandType = 7
            end
            object ppDBCalc15: TppDBCalc
              UserName = 'DBCalc15'
              Alignment = taRightJustify
              DataField = 'CHQ_LOC_E'
              DataPipeline = ppDBResumen
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 250296
              mmTop = 2646
              mmWidth = 19315
              BandType = 7
            end
            object ppDBCalc16: TppDBCalc
              UserName = 'DBCalc16'
              Alignment = taRightJustify
              DataField = 'CHQ_EXT_E'
              DataPipeline = ppDBResumen
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 272257
              mmTop = 2646
              mmWidth = 19315
              BandType = 7
            end
            object ppDBCalc19: TppDBCalc
              UserName = 'DBCalc19'
              Alignment = taRightJustify
              DataField = 'TOTEGRLOC'
              DataPipeline = ppDBResumen
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 294217
              mmTop = 2646
              mmWidth = 19315
              BandType = 7
            end
            object ppDBCalc21: TppDBCalc
              UserName = 'DBCalc21'
              Alignment = taRightJustify
              DataField = 'TOTEGREXT'
              DataPipeline = ppDBResumen
              DisplayFormat = '###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 316178
              mmTop = 2646
              mmWidth = 19315
              BandType = 7
            end
          end
        end
      end
    end
  end
  object ppDBIE: TppDBPipeline
    UserName = 'DBIE'
    Left = 184
    Top = 68
  end
  object ppDBResumen: TppDBPipeline
    UserName = 'DBResumen'
    Left = 220
    Top = 68
  end
end

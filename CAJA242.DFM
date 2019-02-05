object FArqueoCajaN: TFArqueoCajaN
  Left = 170
  Top = 137
  BorderStyle = bsDialog
  Caption = 'Movimiento Diario ( Ingresos )'
  ClientHeight = 132
  ClientWidth = 298
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Draf 17cpi'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
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
      Width = 188
      Height = 16
      Caption = 'Movimiento Diario (Ingresos)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Draf 17cpi'
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
      CalendarAttributes.Font.Name = 'Draf 17cpi'
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
      TabOrder = 2
      OnExit = dbdtpInicioExit
    end
  end
  object ppRptIngreso: TppReport
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
    Template.FileName = 'C:\SolCaja\SolFormatos\ArqIngreso.rtm'
    Units = utMillimeters
    UserName = 'Report4'
    DeviceType = 'Screen'
    Left = 229
    Top = 68
    Version = '4.22 Pro'
    mmColumnWidth = 0
    object ppDetailBand4: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 6615
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
          Template.FileName = 'C:\SOLCaja\SolFormatos\ArqIngreso.rtm'
          Units = utMillimeters
          UserName = 'ChildReport1'
          Left = 530
          Top = 412
          Version = '4.22 Pro'
          mmColumnWidth = 0
          object ppHeaderBand1: TppHeaderBand
            mmBottomOffset = 0
            mmHeight = 25665
            mmPrintPosition = 0
            object ppLabel2: TppLabel
              UserName = 'Label2'
              Caption = 'Fecha :'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 292365
              mmTop = 8467
              mmWidth = 10054
              BandType = 0
            end
            object ppLabel3: TppLabel
              UserName = 'Label3'
              AutoSize = False
              Caption = 'Hora   :'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 292365
              mmTop = 4498
              mmWidth = 11642
              BandType = 0
            end
            object ppLabel4: TppLabel
              UserName = 'Label701'
              Caption = 'Página:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 292365
              mmTop = 265
              mmWidth = 10319
              BandType = 0
            end
            object svPag: TppSystemVariable
              UserName = 'svPag'
              Alignment = taCenter
              VarType = vtPageNo
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 312474
              mmTop = 265
              mmWidth = 1588
              BandType = 0
            end
            object ppSystemVariable5: TppSystemVariable
              UserName = 'SystemVariable5'
              VarType = vtTime
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 312738
              mmTop = 4498
              mmWidth = 17463
              BandType = 0
            end
            object ppSystemVariable6: TppSystemVariable
              UserName = 'SystemVariable6'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 313003
              mmTop = 8467
              mmWidth = 14817
              BandType = 0
            end
            object ppLabel1: TppLabel
              UserName = 'Label1'
              Caption = 'Movimiento Diario de Caja  (detallado)'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 129382
              mmTop = 529
              mmWidth = 54504
              BandType = 0
            end
            object ppFecha1: TppLabel
              UserName = 'Label4'
              Caption = 'Fecha'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 154517
              mmTop = 6085
              mmWidth = 8467
              BandType = 0
            end
            object pplblCia: TppLabel
              UserName = 'lblCia'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 794
              mmTop = 1058
              mmWidth = 30956
              BandType = 0
            end
            object ppLine2: TppLine
              UserName = 'Line2'
              Weight = 0.75
              mmHeight = 529
              mmLeft = 0
              mmTop = 13229
              mmWidth = 334169
              BandType = 0
            end
            object ppLabel7: TppLabel
              UserName = 'Label7'
              Alignment = taCenter
              Caption = 'DOCUMENTO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 3440
              mmTop = 15346
              mmWidth = 21431
              BandType = 0
            end
            object ppLabel14: TppLabel
              UserName = 'Label14'
              Alignment = taCenter
              Caption = 'AUXILIAR'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 27517
              mmTop = 15346
              mmWidth = 15875
              BandType = 0
            end
            object ppLabel15: TppLabel
              UserName = 'Label15'
              Alignment = taCenter
              Caption = 'DESCRIPCION'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 44979
              mmTop = 15346
              mmWidth = 22754
              BandType = 0
            end
            object ppLabel12: TppLabel
              UserName = 'Label12'
              Alignment = taCenter
              Caption = 'CONCEPTO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 111125
              mmTop = 15346
              mmWidth = 18521
              BandType = 0
            end
            object ppLabel9: TppLabel
              UserName = 'Label9'
              Caption = 'EFECTIVO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 177536
              mmTop = 15346
              mmWidth = 16140
              BandType = 0
            end
            object ppLabel20: TppLabel
              UserName = 'Label20'
              Caption = 'CHEQUE'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 220134
              mmTop = 15346
              mmWidth = 13229
              BandType = 0
            end
            object ppLabel23: TppLabel
              UserName = 'Label23'
              Caption = 'TARJETA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 249503
              mmTop = 15346
              mmWidth = 15081
              BandType = 0
            end
            object ppLabel26: TppLabel
              UserName = 'Label26'
              Caption = 'TOTAL'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 285486
              mmTop = 15346
              mmWidth = 11377
              BandType = 0
            end
            object ppLabel11: TppLabel
              UserName = 'Label11'
              Alignment = taCenter
              Caption = 'T/C'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 314855
              mmTop = 15346
              mmWidth = 5556
              BandType = 0
            end
            object ppLabel13: TppLabel
              UserName = 'Label13'
              Alignment = taCenter
              Caption = 'CLASE'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 322528
              mmTop = 15346
              mmWidth = 10848
              BandType = 0
            end
            object ppLine1: TppLine
              UserName = 'Line1'
              Weight = 0.75
              mmHeight = 508
              mmLeft = 0
              mmTop = 24606
              mmWidth = 334169
              BandType = 0
            end
            object ppLabel10: TppLabel
              UserName = 'Label10'
              Caption = 'S/.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 174890
              mmTop = 20108
              mmWidth = 3969
              BandType = 0
            end
            object ppLabel19: TppLabel
              UserName = 'Label19'
              Caption = '$'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 192617
              mmTop = 20108
              mmWidth = 1852
              BandType = 0
            end
            object ppLabel21: TppLabel
              UserName = 'Label21'
              Caption = 'S/.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 214842
              mmTop = 20108
              mmWidth = 3969
              BandType = 0
            end
            object ppLabel22: TppLabel
              UserName = 'Label22'
              Caption = '$'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 234157
              mmTop = 20108
              mmWidth = 1852
              BandType = 0
            end
            object ppLabel24: TppLabel
              UserName = 'Label24'
              Caption = 'S/.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 254001
              mmTop = 20108
              mmWidth = 3969
              BandType = 0
            end
            object ppLabel27: TppLabel
              UserName = 'Label27'
              Caption = 'S/.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 278871
              mmTop = 20108
              mmWidth = 3969
              BandType = 0
            end
            object ppLabel28: TppLabel
              UserName = 'Label702'
              Caption = '$'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 298451
              mmTop = 20108
              mmWidth = 1852
              BandType = 0
            end
            object pplblLiquida: TppLabel
              UserName = 'lblLiquida'
              Caption = 'lblLiquida'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 220663
              mmTop = 529
              mmWidth = 14552
              BandType = 0
            end
          end
          object ppDetailBand5: TppDetailBand
            BeforeGenerate = ppDetailBand5BeforeGenerate
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
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 3175
              mmTop = 265
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
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 8467
              mmTop = 265
              mmWidth = 18521
              BandType = 4
            end
            object ppDBText16: TppDBText
              UserName = 'DBText16'
              DataField = 'CCGLOSA'
              DataPipeline = ppDBIE
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 112448
              mmTop = 265
              mmWidth = 48948
              BandType = 4
            end
            object ppDBText21: TppDBText
              UserName = 'DBText101'
              DataField = 'CLIEID'
              DataPipeline = ppDBIE
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 27517
              mmTop = 265
              mmWidth = 15346
              BandType = 4
            end
            object ppDBText22: TppDBText
              UserName = 'DBText22'
              DataField = 'AUXNOMB'
              DataPipeline = ppDBIE
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 44979
              mmTop = 265
              mmWidth = 66675
              BandType = 4
            end
            object ppLabel6: TppLabel
              UserName = 'Label6'
              Caption = '-'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 7408
              mmTop = 265
              mmWidth = 1058
              BandType = 4
            end
            object ppdbtEFSO: TppDBText
              UserName = 'dbtEFSO'
              Alignment = taRightJustify
              DataField = 'EFECMTOLOC'
              DataPipeline = ppDBIE
              DisplayFormat = '#0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 163513
              mmTop = 529
              mmWidth = 19050
              BandType = 4
            end
            object ppdbtEFDO: TppDBText
              UserName = 'dbtEFDO'
              Alignment = taRightJustify
              DataField = 'EFECMTOEXT'
              DataPipeline = ppDBIE
              DisplayFormat = '#0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 184415
              mmTop = 529
              mmWidth = 19050
              BandType = 4
            end
            object ppdbtCHSO: TppDBText
              UserName = 'dbtCHSO'
              Alignment = taRightJustify
              DataField = 'CHECMTOLOC'
              DataPipeline = ppDBIE
              DisplayFormat = '#0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 205317
              mmTop = 529
              mmWidth = 19050
              BandType = 4
            end
            object ppdbtCHDO: TppDBText
              UserName = 'dbtCHDO'
              Alignment = taRightJustify
              DataField = 'CHECMTOEXT'
              DataPipeline = ppDBIE
              DisplayFormat = '#0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 226219
              mmTop = 529
              mmWidth = 19050
              BandType = 4
            end
            object ppdbtTASO: TppDBText
              UserName = 'dbtTASO'
              Alignment = taRightJustify
              DataField = 'TAECMTOLOC'
              DataPipeline = ppDBIE
              DisplayFormat = '#0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 247121
              mmTop = 529
              mmWidth = 19050
              BandType = 4
            end
            object pplblTotalSo: TppLabel
              UserName = 'lblTotalSo'
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'lblTotalSo'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 268023
              mmTop = 529
              mmWidth = 19050
              BandType = 4
            end
            object pplblTotalDo: TppLabel
              UserName = 'lblTotalDo'
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'lblTotalDo'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 290248
              mmTop = 529
              mmWidth = 19050
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
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 311680
              mmTop = 529
              mmWidth = 10848
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
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 326232
              mmTop = 529
              mmWidth = 6350
              BandType = 4
            end
          end
          object ppSummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 5821
            mmPrintPosition = 0
            object pplblTotales: TppLabel
              UserName = 'lblTotales'
              AutoSize = False
              Caption = 'TOTALES'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 142875
              mmTop = 1852
              mmWidth = 17463
              BandType = 7
            end
            object ppdbcEFTOSO: TppDBCalc
              UserName = 'SumLOC1'
              Alignment = taRightJustify
              DataField = 'EFECMTOLOC'
              DataPipeline = ppDBIE
              DisplayFormat = '#0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 163513
              mmTop = 1852
              mmWidth = 19050
              BandType = 7
            end
            object ppdbcEFTODO: TppDBCalc
              UserName = 'dbcEFTODO'
              Alignment = taRightJustify
              DataField = 'EFECMTOEXT'
              DataPipeline = ppDBIE
              DisplayFormat = '#0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 184415
              mmTop = 1852
              mmWidth = 19050
              BandType = 7
            end
            object ppdbcCHTOSO: TppDBCalc
              UserName = 'dbcCHTOSO'
              Alignment = taRightJustify
              DataField = 'CHECMTOLOC'
              DataPipeline = ppDBIE
              DisplayFormat = '#0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 205317
              mmTop = 1852
              mmWidth = 19050
              BandType = 7
            end
            object ppdbcCHTODO: TppDBCalc
              UserName = 'dbcCHTODO'
              Alignment = taRightJustify
              DataField = 'CHECMTOEXT'
              DataPipeline = ppDBIE
              DisplayFormat = '#0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 226219
              mmTop = 1852
              mmWidth = 19050
              BandType = 7
            end
            object ppdbcTATOSO: TppDBCalc
              UserName = 'dbcTATOSO'
              Alignment = taRightJustify
              DataField = 'TAECMTOLOC'
              DataPipeline = ppDBIE
              DisplayFormat = '#0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 247121
              mmTop = 1852
              mmWidth = 19050
              BandType = 7
            end
            object ppLine3: TppLine
              UserName = 'Line3'
              Weight = 0.75
              mmHeight = 529
              mmLeft = 154252
              mmTop = 529
              mmWidth = 156898
              BandType = 7
            end
            object ppVariable1: TppVariable
              UserName = 'Variable1'
              Alignment = taRightJustify
              AutoSize = False
              CalcOrder = 0
              DataType = dtDouble
              DisplayFormat = '#0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              OnCalc = ppVariable1Calc
              Transparent = True
              mmHeight = 3969
              mmLeft = 268023
              mmTop = 1852
              mmWidth = 19050
              BandType = 7
            end
            object ppVariable2: TppVariable
              UserName = 'Variable2'
              Alignment = taRightJustify
              AutoSize = False
              CalcOrder = 1
              DataType = dtDouble
              DisplayFormat = '#0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 12cpi'
              Font.Size = 10
              Font.Style = []
              OnCalc = ppVariable2Calc
              Transparent = True
              mmHeight = 3969
              mmLeft = 290248
              mmTop = 1852
              mmWidth = 19050
              BandType = 7
            end
          end
        end
      end
    end
  end
  object ppDBIE: TppDBPipeline
    UserName = 'DBIE'
    Left = 192
    Top = 68
  end
end

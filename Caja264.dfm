object FrmPrint: TFrmPrint
  Left = 101
  Top = 159
  Width = 750
  Height = 499
  Caption = 'FrmPrint'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dbere: TwwDBRichEdit
    Left = 0
    Top = 73
    Width = 742
    Height = 399
    ScrollBars = ssBoth
    Align = alClient
    AutoURLDetect = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    PrintJobName = 'Delphi 5'
    ReadOnly = True
    TabOrder = 0
    EditorOptions = [reoShowPrint, reoShowPageSetup, reoShowHints, reoCloseOnEscape, reoFlatButtons, reoShowSpellCheck, reoShowMainMenuIcons]
    EditorCaption = 'Edit Rich Text'
    EditorPosition.Left = 0
    EditorPosition.Top = 0
    EditorPosition.Width = 0
    EditorPosition.Height = 0
    MeasurementUnits = muInches
    PrintMargins.Top = 1
    PrintMargins.Bottom = 1
    PrintMargins.Left = 1
    PrintMargins.Right = 1
    RichEditVersion = 2
    Data = {
      770000007B5C727466315C616E73695C616E7369637067313235325C64656666
      305C6465666C616E67313033337B5C666F6E7474626C7B5C66305C666E696C20
      436F7572696572204E65773B7D7D0D0A5C766965776B696E64345C7563315C70
      6172645C66305C667331362064626572655C7061720D0A7D0D0A00}
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 73
    Align = alTop
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 648
      Top = 9
      Width = 75
      Height = 25
      Caption = 'BitBtn1'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 13
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Texto ( RE )'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object BitBtn4: TBitBtn
      Left = 195
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Setup'
      TabOrder = 2
      OnClick = BitBtn4Click
    end
    object BitBtn6: TBitBtn
      Left = 93
      Top = 11
      Width = 97
      Height = 25
      Caption = 'Texto (RE) Printer'
      TabOrder = 3
      OnClick = BitBtn6Click
    end
    object dbre1: TwwDBRichEdit
      Left = 89
      Top = 42
      Width = 105
      Height = 25
      AutoURLDetect = False
      PrintJobName = 'Delphi 5'
      TabOrder = 4
      Visible = False
      EditorCaption = 'Edit Rich Text'
      EditorPosition.Left = 0
      EditorPosition.Top = 0
      EditorPosition.Width = 0
      EditorPosition.Height = 0
      MeasurementUnits = muInches
      PrintMargins.Top = 1
      PrintMargins.Bottom = 1
      PrintMargins.Left = 1
      PrintMargins.Right = 1
      RichEditVersion = 2
      Data = {
        790000007B5C727466315C616E73695C616E7369637067313235325C64656666
        305C6465666C616E67313033337B5C666F6E7474626C7B5C66305C666E696C20
        4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
        5C706172645C66305C667331362064627265315C7061720D0A7D0D0A00}
    end
    object BitBtn5: TBitBtn
      Left = 448
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Text (ppRE)'
      TabOrder = 5
      OnClick = BitBtn5Click
    end
    object BitBtn7: TBitBtn
      Left = 275
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Dialogo'
      TabOrder = 6
      OnClick = BitBtn7Click
    end
  end
  object dbe1: TwwDBEdit
    Left = 544
    Top = 136
    Width = 121
    Height = 21
    TabOrder = 2
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object od1: TOpenDialog
    Left = 384
    Top = 408
  end
  object scFileN: TStrContainer
    Left = 233
    Top = 406
  end
  object scFile: TStrContainer
    Left = 305
    Top = 407
  end
  object psd1: TPrinterSetupDialog
    Left = 464
    Top = 408
  end
  object ppr1: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'US Std Fanfold'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 9000
    PrinterSetup.mmMarginLeft = 0
    PrinterSetup.mmMarginRight = 0
    PrinterSetup.mmMarginTop = 0
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 378000
    Units = utMillimeters
    UserName = 'Report'
    DeviceType = 'Screen'
    Left = 568
    Top = 408
    Version = '4.22 Pro'
    mmColumnWidth = 0
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object pprt1: TppRichText
        OnPrint = pprt1Print
        UserName = 'rt1'
        Caption = 'rt1'
        Stretch = True
        mmHeight = 6879
        mmLeft = 0
        mmTop = 0
        mmWidth = 365390
        BandType = 4
        mmBottomOffset = 2540
        mmOverFlowOffset = 6086
        mmStopPosition = 0
      end
    end
  end
  object pd1: TPrintDialog
    Left = 464
    Top = 365
  end
end

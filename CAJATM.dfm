object FTool1: TFTool1
  Left = 168
  Top = 149
  Width = 728
  Height = 168
  Caption = 'FTool1'
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object cb1: TControlBar
    Left = 0
    Top = 0
    Width = 587
    Height = 84
    Color = 14869218
    ParentColor = False
    TabOrder = 0
    object Panel1: TPanel
      Left = 11
      Top = 2
      Width = 566
      Height = 74
      Color = 14869218
      TabOrder = 0
      object Bevel1: TBevel
        Left = 246
        Top = 8
        Width = 276
        Height = 55
        Shape = bsFrame
      end
      object Label2: TLabel
        Left = 259
        Top = 20
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
        Left = 393
        Top = 19
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
      object lblCia: TLabel
        Left = 10
        Top = 21
        Width = 59
        Height = 16
        Caption = 'Compa'#241#237'a :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 256
        Top = 3
        Width = 99
        Height = 16
        Caption = 'Rango de Fechas :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbdtpInicio: TwwDBDateTimePicker
        Left = 258
        Top = 35
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Epoch = 1950
        ShowButton = True
        TabOrder = 0
        OnChange = dbdtpInicioChange
        OnEnter = dbdtpInicioEnter
        OnExit = dbdtpInicioExit
      end
      object dbdtpFin: TwwDBDateTimePicker
        Left = 392
        Top = 35
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Epoch = 1950
        ShowButton = True
        TabOrder = 1
        OnChange = dbdtpFinChange
        OnEnter = dbdtpFinEnter
        OnExit = dbdtpFinExit
      end
      object dblcCia: TwwDBLookupCombo
        Left = 9
        Top = 39
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
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        PreciseEditRegion = False
        AllowClearKey = True
        ShowMatchText = True
        OnChange = dblcCiaChange
        OnEnter = dblcCiaEnter
        OnExit = dblcCiaExit
        OnNotInList = dblcCiaNotInList
      end
      object edtCia: TEdit
        Left = 53
        Top = 39
        Width = 174
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 3
      end
      object z2bbtnOK: TBitBtn
        Left = 528
        Top = 33
        Width = 30
        Height = 30
        Hint = 'Pasa a Registrar Detalle'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
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
    end
  end
end

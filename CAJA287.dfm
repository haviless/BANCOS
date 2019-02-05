object FPagoDetCab: TFPagoDetCab
  Left = 407
  Top = 95
  Width = 783
  Height = 582
  Caption = 'Orden de Pago de Detracciones'
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pnlImp: TPanel
    Left = 5
    Top = 128
    Width = 760
    Height = 414
    Color = 14869218
    TabOrder = 4
    object Label8: TLabel
      Left = 20
      Top = 8
      Width = 232
      Height = 16
      Caption = 'CONSTANCIA DE DEPOSITO MASIVO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object mImp: TMemo
      Left = 14
      Top = 29
      Width = 729
      Height = 349
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      Lines.Strings = (
        'Memo2')
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object bbtnConsta: TBitBtn
      Left = 658
      Top = 385
      Width = 40
      Height = 32
      Hint = 'Grabar Constancia'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = bbtnConstaClick
      Glyph.Data = {
        8A010000424D8A01000000000000760000002800000017000000170000000100
        0400000000001401000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333303000077777777777770003300000078888888888880000300000
        0780088888888800003000000780088888888800003000000780088888888800
        0030000007888888888888000030000000000000000000000030000000000000
        0000000000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000
        FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF00
        00300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFF
        FFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000
        FFFFFFFFFFFFFF07703000009999999999999907703000009999999999999900
        0030300099999999999999000330}
    end
    object bbtnCancela: TBitBtn
      Left = 704
      Top = 385
      Width = 40
      Height = 32
      Hint = 'Cancela Actualizaciones'
      Cancel = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = bbtnCancelaClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object dbgDetalle: TwwDBGrid
    Left = 5
    Top = 112
    Width = 760
    Height = 329
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFooter3DCells]
    TabOrder = 0
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = False
    OnDblClick = dbgDetalleDblClick
    OnKeyDown = dbgDetalleKeyDown
    FooterColor = 14869218
    FooterHeight = 28
    object wwDBGrid1IButton: TwwIButton
      Left = 0
      Top = 0
      Width = 30
      Height = 30
      AllowAllUp = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
        07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
        0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
      OnClick = wwDBGrid1IButtonClick
    end
  end
  object pnlCab: TPanel
    Left = 5
    Top = 5
    Width = 759
    Height = 108
    Color = clMoneyGreen
    TabOrder = 1
    object Label2: TLabel
      Left = 627
      Top = 5
      Width = 114
      Height = 19
      Caption = 'Orden de Pago'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 18
      Top = 46
      Width = 75
      Height = 19
      Caption = 'Observaci'#243'n'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbeNumero: TwwDBEdit
      Left = 627
      Top = 25
      Width = 113
      Height = 35
      Color = clInfoBk
      DataField = 'NUMERO'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object DBMemo: TDBMemo
      Left = 17
      Top = 66
      Width = 590
      Height = 31
      DataField = 'OBSERVA'
      TabOrder = 1
    end
    object edtEstado: TEdit
      Left = 627
      Top = 66
      Width = 113
      Height = 35
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object pnlCab1: TPanel
      Left = 9
      Top = 4
      Width = 555
      Height = 45
      BevelOuter = bvNone
      Color = clMoneyGreen
      TabOrder = 0
      object lblCia: TLabel
        Left = 9
        Top = -1
        Width = 57
        Height = 19
        Caption = 'Compa'#241#237'a'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label1: TLabel
        Left = 217
        Top = -1
        Width = 37
        Height = 19
        Caption = 'Fecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblTMon: TLabel
        Left = 322
        Top = -1
        Width = 80
        Height = 19
        Caption = 'Tipo Moneda'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dblcCia: TwwDBLookupCombo
        Left = 9
        Top = 17
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
        DataField = 'CIAID'
        LookupField = 'CIAID'
        Options = [loColLines, loRowLines, loTitles]
        Enabled = False
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
        Left = 52
        Top = 17
        Width = 156
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
      object dtpFecha: TwwDBDateTimePicker
        Left = 215
        Top = 17
        Width = 100
        Height = 23
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        DataField = 'FECHA'
        Epoch = 1950
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 2
        UnboundDataType = wwDTEdtDate
        OnExit = dtpFechaExit
      end
      object dblcTMoneda: TwwDBLookupCombo
        Left = 321
        Top = 17
        Width = 38
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TMONID'#9'3'#9'ID'#9'F'
          'TMONDES'#9'30'#9'Moneda'#9'F'
          'TMONABR'#9'8'#9'Abreviatura'#9'F')
        DataField = 'TMONID'
        LookupField = 'TMONID'
        Options = [loColLines, loRowLines, loTitles]
        Enabled = False
        MaxLength = 1
        ParentFont = False
        TabOrder = 3
        AutoDropDown = False
        ShowButton = True
        SearchDelay = 2
        PreciseEditRegion = False
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblcTMonedaExit
        OnNotInList = dblcTMonedaNotInList
      end
      object edtTMoneda: TEdit
        Left = 360
        Top = 17
        Width = 103
        Height = 23
        Color = clBtnFace
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
    end
    object cbDisenoRep: TCheckBox
      Left = 512
      Top = 49
      Width = 97
      Height = 17
      Caption = 'cbDisenoRep'
      Enabled = False
      TabOrder = 4
      Visible = False
    end
  end
  object Panel2: TPanel
    Left = 5
    Top = 441
    Width = 761
    Height = 102
    Color = clMoneyGreen
    TabOrder = 2
    object sbDisenoRep: TSpeedButton
      Left = 6
      Top = 71
      Width = 7
      Height = 22
      Flat = True
      OnClick = sbDisenoRepClick
    end
    object pnlGraba: TPanel
      Left = 4
      Top = 3
      Width = 235
      Height = 46
      Color = 14869218
      TabOrder = 0
      object Label4: TLabel
        Left = 120
        Top = 4
        Width = 51
        Height = 13
        Caption = 'Hecho Por'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object bbtnGraba: TBitBtn
        Left = 7
        Top = 8
        Width = 36
        Height = 32
        Hint = 'Grabar Registro'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = bbtnGrabaClick
        Glyph.Data = {
          8A010000424D8A01000000000000760000002800000017000000170000000100
          0400000000001401000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333303000077777777777770003300000078888888888880000300000
          0780088888888800003000000780088888888800003000000780088888888800
          0030000007888888888888000030000000000000000000000030000000000000
          0000000000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000
          FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF00
          00300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFF
          FFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000
          FFFFFFFFFFFFFF07703000009999999999999907703000009999999999999900
          0030300099999999999999000330}
      end
      object dbeUsuGraba: TwwDBEdit
        Left = 93
        Top = 18
        Width = 100
        Height = 21
        DataField = 'USUARIO'
        ReadOnly = True
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object pnlVisa: TPanel
      Left = 17
      Top = 52
      Width = 235
      Height = 46
      Color = 14869218
      TabOrder = 1
      object Label5: TLabel
        Left = 120
        Top = 4
        Width = 46
        Height = 13
        Caption = 'Aceptado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object bbtnAcepta: TBitBtn
        Left = 7
        Top = 8
        Width = 36
        Height = 32
        Hint = 'Aceptar Registro'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = bbtnAceptaClick
        Glyph.Data = {
          F2010000424DF201000000000000760000002800000024000000130000000100
          0400000000007C01000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
          3333333333388F3333333333000033334224333333333333338338F333333333
          0000333422224333333333333833338F33333333000033422222243333333333
          83333338F3333333000034222A22224333333338F33F33338F33333300003222
          A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
          38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
          2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
          0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
          333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
          33333A2224A2233333333338F338F83300003333333333A2224A333333333333
          8F338F33000033333333333A222433333333333338F338F30000333333333333
          A224333333333333338F38F300003333333333333A223333333333333338F8F3
          000033333333333333A3333333333333333383330000}
        NumGlyphs = 2
      end
      object dbeUsuAcepta: TwwDBEdit
        Left = 93
        Top = 18
        Width = 100
        Height = 21
        DataField = 'USUACEPTA'
        ReadOnly = True
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object z2bbtnAnula: TBitBtn
        Left = 51
        Top = 8
        Width = 36
        Height = 32
        Hint = 'Anula Registro'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = z2bbtnAnulaClick
        Glyph.Data = {
          96010000424D9601000000000000760000002800000015000000180000000100
          04000000000020010000CE0E0000D80E00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888880009988888888888888888990009990000000000000009990008999
          FFFFFFFFFFFFF999800088999FFFFFFFFFFF99988000880999FFFFFFFFF99908
          8000880F999FFFFFFF999F088000880FF999FFFFF999FF088000880FFF999FFF
          999FFF088000880FFFF999F999FFFF088000880FFFFF99999FFFFF088000880F
          FFFFF999FFFFFF088000880FFFFF99999FFFFF088000880FFFF999F999FFFF08
          8000880FFF999FFF999FFF088000880FF999FFFFF999FF088000880F999FFFFF
          FF999F088000880999FFFFFFFFF99908800088999FFFFFFFFFFF999880008999
          FFFFFFFFFFFFF9998000999FFFFFFFFFFFFFFF99900099000000000000000009
          9000888888888888888888888000888888888888888888888000}
      end
      object bbtnIni: TBitBtn
        Left = 201
        Top = 15
        Width = 27
        Height = 25
        Hint = 'Inicializa Orden de Pago'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = bbtnIniClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
          000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
          00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
          F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
          0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
          FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
          FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
          0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
          00333377737FFFFF773333303300000003333337337777777333}
        NumGlyphs = 2
      end
    end
    object bbtnExporta: TBitBtn
      Left = 596
      Top = 10
      Width = 67
      Height = 30
      Caption = 'Exportar '
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = bbtnExportaClick
      Margin = 5
    end
    object pnlCab2: TPanel
      Left = 279
      Top = 3
      Width = 202
      Height = 45
      Color = 14869218
      TabOrder = 3
      Visible = False
      object lblBanco: TLabel
        Left = 17
        Top = 3
        Width = 31
        Height = 15
        Caption = 'Banco'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object lblCCBco: TLabel
        Left = 215
        Top = 3
        Width = 43
        Height = 15
        Caption = 'Cta. Cte.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object dblcBanco: TwwDBLookupCombo
        Left = 15
        Top = 18
        Width = 47
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        BorderStyle = bsNone
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'BANCOID'#9'3'#9'Id'#9'F'
          'BANCONOM'#9'40'#9'Banco'#9'F')
        DataField = 'BANCOID'
        LookupField = 'BANCOID'
        Options = [loColLines, loRowLines, loTitles]
        Frame.Enabled = True
        ParentFont = False
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        ShowMatchText = True
        OnExit = dblcBancoExit
        OnNotInList = dblcBancoNotInList
      end
      object edtBanco: TEdit
        Left = 66
        Top = 16
        Width = 128
        Height = 23
        BorderStyle = bsNone
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
      object dblcCCBco: TwwDBLookupCombo
        Left = 207
        Top = 18
        Width = 150
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        BorderStyle = bsNone
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CCBCOID'#9'30'#9'Cuenta Corriente del Banco'#9'F'
          'CCBCODES'#9'40'#9'Descripci'#243'n'#9'F')
        DataField = 'CCBCOID'
        LookupField = 'CCBCOID'
        Options = [loColLines, loRowLines, loTitles]
        Frame.Enabled = True
        ParentFont = False
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        ShowMatchText = True
        OnEnter = dblcCCBcoEnter
        OnNotInList = dblcCCBcoNotInList
      end
    end
    object pnlCnt: TPanel
      Left = 279
      Top = 50
      Width = 473
      Height = 48
      Color = 14869218
      TabOrder = 4
      object Label6: TLabel
        Left = 4
        Top = 18
        Width = 85
        Height = 20
        Caption = 'No.Planilla'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 207
        Top = 0
        Width = 71
        Height = 19
        Caption = 'Fecha Pago'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbeNumPla: TwwDBEdit
        Left = 92
        Top = 10
        Width = 102
        Height = 31
        Color = clInfoBk
        DataField = 'NUMPLA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dtpFechaCnt: TwwDBDateTimePicker
        Left = 207
        Top = 19
        Width = 100
        Height = 23
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        DataField = 'FECCONTA'
        Epoch = 1950
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 1
        UnboundDataType = wwDTEdtDate
        OnExit = dtpFechaExit
      end
      object bbtnContabiliza: TBitBtn
        Left = 366
        Top = 11
        Width = 30
        Height = 30
        Hint = 'Contabilizar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = bbtnContabilizaClick
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
      object bbtnPago: TBitBtn
        Left = 322
        Top = 11
        Width = 30
        Height = 30
        Hint = 'Confirmaci'#243'n Pago Planilla'
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = bbtnPagoClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000003
          333333333F777773FF333333008888800333333377333F3773F3333077870787
          7033333733337F33373F3308888707888803337F33337F33337F330777880887
          7703337F33337FF3337F3308888000888803337F333777F3337F330777700077
          7703337F33377733337F33088888888888033373FFFFFFFFFF73333000000000
          00333337777777777733333308033308033333337F7F337F7F33333308033308
          033333337F7F337F7F33333308033308033333337F73FF737F33333377800087
          7333333373F77733733333333088888033333333373FFFF73333333333000003
          3333333333777773333333333333333333333333333333333333}
        NumGlyphs = 2
      end
    end
    object bbtnRet: TBitBtn
      Left = 240
      Top = 5
      Width = 38
      Height = 20
      Caption = 'R-Todo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Visible = False
      OnClick = bbtnRetClick
    end
    object bbtnVerCont: TBitBtn
      Left = 685
      Top = 61
      Width = 30
      Height = 30
      Caption = 'Ver'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      Visible = False
      OnClick = bbtnVerContClick
    end
    object BitBtn1: TBitBtn
      Left = 718
      Top = 61
      Width = 23
      Height = 30
      Caption = 'Cia'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      Visible = False
      OnClick = BitBtn1Click
    end
    object BitBtn3: TBitBtn
      Left = 726
      Top = 61
      Width = 21
      Height = 30
      Caption = 'All'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      Visible = False
      OnClick = BitBtn3Click
    end
    object bbtnRetUno: TBitBtn
      Left = 240
      Top = 27
      Width = 38
      Height = 20
      Caption = 'R-Uno'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      Visible = False
      OnClick = bbtnRetUnoClick
    end
    object bbtnRep: TBitBtn
      Left = 556
      Top = 11
      Width = 31
      Height = 29
      Hint = 'Emisi'#243'n de Cheques'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnClick = bbtnRepClick
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
    object bbtnImporta: TBitBtn
      Left = 667
      Top = 10
      Width = 67
      Height = 30
      Caption = 'Importar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
      OnClick = bbtnImportaClick
      Margin = 5
    end
    object BitBtn2: TBitBtn
      Left = 736
      Top = 24
      Width = 17
      Height = 17
      Caption = '<<'
      TabOrder = 12
      OnClick = BitBtn2Click
    end
    object BitBtn4: TBitBtn
      Left = 736
      Top = 8
      Width = 17
      Height = 17
      Caption = '<<'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 13
      OnClick = BitBtn4Click
    end
  end
  object Memo1: TMemo
    Left = 536
    Top = 304
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
    Visible = False
  end
  object pnlConstancia: TPanel
    Left = 304
    Top = 208
    Width = 185
    Height = 97
    TabOrder = 5
    Visible = False
    object Label9: TLabel
      Left = 1
      Top = 1
      Width = 183
      Height = 15
      Align = alTop
      Alignment = taCenter
      Caption = 'N'#250'mero de Constancia'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object edtConstancia: TwwDBEdit
      Left = 48
      Top = 24
      Width = 97
      Height = 21
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object btnActualizarConstancia: TBitBtn
      Left = 48
      Top = 56
      Width = 33
      Height = 25
      TabOrder = 1
      OnClick = btnActualizarConstanciaClick
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
    object btnCerrarPanelConstancia: TBitBtn
      Left = 112
      Top = 56
      Width = 33
      Height = 25
      TabOrder = 2
      OnClick = btnCerrarPanelConstanciaClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object sdGraba: TSaveDialog
    DefaultExt = 'TXT'
    Filter = 
      '*.TXT  ( Archivo Texto )|*.txt|*.DOC  ( Archivo Texto )|*.doc|*.' +
      '*   ( Todos )|*.*'
    Title = 'Nombre de Archivo Texto'
    Left = 682
    Top = 346
  end
  object ppdb1: TppDBPipeline
    UserName = 'db1'
    Left = 648
    Top = 400
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
    Template.FileName = 'C:\DemaExes\RTMS\CAJA\Dema\PagoDetraccion.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 688
    Top = 408
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
    Report = ppr1
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 728
    Top = 392
  end
  object sdImp: TSaveDialog
    DefaultExt = 'TXT'
    Filter = 
      '*.TXT  ( Archivo Texto )|*.txt|*.DOC  ( Archivo Texto )|*.doc|*.' +
      '*   ( Todos )|*.*'
    Title = 'Nombre de Archivo Texto'
    Left = 690
    Top = 306
  end
end

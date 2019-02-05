object FTarjetaImportarDet: TFTarjetaImportarDet
  Left = 657
  Top = 171
  Width = 760
  Height = 504
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Detalle'
  Color = clBtnFace
  Constraints.MaxHeight = 504
  Constraints.MaxWidth = 760
  Constraints.MinHeight = 504
  Constraints.MinWidth = 760
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object dbgConta: TwwDBGrid
    Left = 0
    Top = 48
    Width = 737
    Height = 355
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    KeyOptions = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
    TabOrder = 0
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = True
    OnTitleButtonClick = dbgContaTitleButtonClick
    OnDblClick = dbgContaDblClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 1
    Width = 737
    Height = 46
    Enabled = False
    TabOrder = 1
    object Label1: TLabel
      Left = 12
      Top = 13
      Width = 42
      Height = 21
      Caption = 'Fecha'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 574
      Top = 13
      Width = 55
      Height = 21
      Caption = 'N'#250'mero'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbeNumero: TwwDBEdit
      Left = 637
      Top = 8
      Width = 96
      Height = 31
      DataField = 'NUMERO'
      DataSource = DMTE.dsCabTranf
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dtpFecha: TwwDBDateTimePicker
      Left = 61
      Top = 7
      Width = 121
      Height = 31
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'FECHA'
      DataSource = DMTE.dsCabTranf
      Epoch = 1950
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      ShowButton = True
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 407
    Width = 737
    Height = 55
    TabOrder = 2
    object lblCia: TLabel
      Left = 374
      Top = 4
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
    object Bevel1: TBevel
      Left = 354
      Top = 2
      Width = 5
      Height = 50
    end
    object Bevel2: TBevel
      Left = 680
      Top = 3
      Width = 5
      Height = 49
    end
    object Label3: TLabel
      Left = 19
      Top = 4
      Width = 62
      Height = 19
      Caption = 'Por fecha'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label4: TLabel
      Left = 102
      Top = 4
      Width = 76
      Height = 19
      Caption = 'Por Importe'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label5: TLabel
      Left = 186
      Top = 4
      Width = 95
      Height = 19
      Caption = 'Por N'#186' Operac'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object dblcCia: TwwDBLookupCombo
      Left = 363
      Top = 24
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
      Left = 406
      Top = 24
      Width = 129
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
    object bbtnBusca: TBitBtn
      Left = 290
      Top = 16
      Width = 60
      Height = 29
      Caption = 'Buscar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = bbtnBuscaClick
    end
    object dtpFecBus: TwwDBDateTimePicker
      Left = 10
      Top = 24
      Width = 86
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ShowButton = True
      TabOrder = 3
    end
    object meImporte: TMaskEdit
      Left = 100
      Top = 24
      Width = 80
      Height = 21
      TabOrder = 4
    end
    object Z2bbtnSalir: TBitBtn
      Left = 689
      Top = 11
      Width = 40
      Height = 36
      Hint = 'Salir de opci'#243'n'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'Garamond'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = Z2bbtnSalirClick
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
    object bbtnMarcar: TBitBtn
      Left = 544
      Top = 18
      Width = 60
      Height = 29
      Caption = 'Marcar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = bbtnMarcarClick
    end
    object BitBtn1: TBitBtn
      Left = 612
      Top = 5
      Width = 59
      Height = 21
      Caption = 'Total'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = BitBtn1Click
    end
    object meTOT: TMaskEdit
      Left = 612
      Top = 26
      Width = 58
      Height = 21
      TabOrder = 8
      Text = '0.00'
    end
    object Edit_operacion: TEdit
      Left = 188
      Top = 24
      Width = 91
      Height = 21
      TabOrder = 9
    end
  end
  object GroupBox1: TGroupBox
    Left = 240
    Top = 0
    Width = 329
    Height = 41
    Caption = 'Filtrar movimientos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object Rb_Todos: TRadioButton
      Left = 16
      Top = 16
      Width = 113
      Height = 17
      Caption = 'Todos'
      TabOrder = 0
      OnClick = Rb_todosClick
    end
    object Rb_NoIdentificados: TRadioButton
      Left = 120
      Top = 16
      Width = 113
      Height = 17
      Caption = 'No Identificados'
      TabOrder = 1
      OnClick = Rb_NoIdentificadosClick
    end
    object Btn_resumen: TButton
      Left = 256
      Top = 8
      Width = 65
      Height = 25
      Caption = 'Resumen'
      TabOrder = 2
      OnClick = Btn_resumenClick
    end
  end
  object Panel_resumen: TPanel
    Left = 72
    Top = 88
    Width = 585
    Height = 201
    TabOrder = 4
    Visible = False
    object Label6: TLabel
      Left = 8
      Top = 8
      Width = 53
      Height = 13
      Caption = 'Resumen'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Aceptar: TButton
      Left = 504
      Top = 168
      Width = 75
      Height = 25
      Caption = 'Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = AceptarClick
    end
    object dbgResumen: TwwDBGrid
      Left = 8
      Top = 24
      Width = 569
      Height = 137
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      ExportOptions.Delimiter = '|'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
    end
    object Rb_PorEntidad: TRadioButton
      Left = 406
      Top = 8
      Width = 81
      Height = 17
      Caption = 'Por Entidad'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      TabStop = True
      OnClick = Rb_PorEntidadClick
    end
    object Rb_PorCompania: TRadioButton
      Left = 486
      Top = 8
      Width = 97
      Height = 17
      Caption = 'Por Compa'#241#237'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = Rb_PorCompaniaClick
    end
  end
end

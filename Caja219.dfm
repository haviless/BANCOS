object FEntrChqs: TFEntrChqs
  Left = 190
  Top = 104
  BorderStyle = bsDialog
  Caption = 'Control de Entrega de Cheques - [FEntrChqs]'
  ClientHeight = 581
  ClientWidth = 800
  Color = clBtnFace
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
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object dbgEgrCaja: TwwDBGrid
    Left = 3
    Top = 193
    Width = 786
    Height = 336
    DisableThemesInTitle = False
    Selected.Strings = (
      'ECFCOMP'#9'10'#9'Fecha Comp.'
      'ECCHKEST'#9'8'#9'Estado ~Actual'
      'ECNOCHQ'#9'14'#9'Nro. Cheque'
      'ECGIRA'#9'33'#9'Girado a'
      'ECGLOSA'#9'30'#9'Glosa'
      'ECFENTR'#9'10'#9'Fecha~de Entrega'
      'LK_RESPDES'#9'28'#9'Persona Responsable'
      'ECPERREC'#9'40'#9'Persona Receptora'
      'LK_TIPDOCDES'#9'20'#9'Documento~de Identidad'
      'ECPERNDOC'#9'15'#9'N'#186' de Documento'
      'ECMTOORI'#9'13'#9'Monto Origen')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = DM1.dsEgrCaja2
    Enabled = False
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
    TabOrder = 0
    TitleAlignment = taCenter
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = False
    OnDblClick = dbgEgrCajaDblClick
  end
  object plnFiltro: TPanel
    Left = 2
    Top = 1
    Width = 790
    Height = 185
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Bevel3: TBevel
      Left = 5
      Top = 13
      Width = 569
      Height = 58
      Shape = bsFrame
    end
    object Label11: TLabel
      Left = 14
      Top = 23
      Width = 49
      Height = 13
      Caption = 'Compa'#241#237'a'
    end
    object Bevel4: TBevel
      Left = 6
      Top = 82
      Width = 569
      Height = 58
      Shape = bsFrame
    end
    object Label12: TLabel
      Left = 17
      Top = 76
      Width = 119
      Height = 13
      Caption = 'Banco - Cuenta Corriente'
    end
    object Label10: TLabel
      Left = 237
      Top = 95
      Width = 79
      Height = 13
      Caption = 'Cuenta Corriente'
    end
    object Label9: TLabel
      Left = 16
      Top = 95
      Width = 31
      Height = 13
      Caption = 'Banco'
    end
    object Bevel5: TBevel
      Left = 577
      Top = 82
      Width = 207
      Height = 58
      Shape = bsFrame
    end
    object Label13: TLabel
      Left = 584
      Top = 78
      Width = 85
      Height = 13
      Caption = 'Rango de Fechas'
    end
    object Label7: TLabel
      Left = 584
      Top = 97
      Width = 37
      Height = 13
      Caption = 'Desde :'
    end
    object Label8: TLabel
      Left = 681
      Top = 96
      Width = 34
      Height = 13
      Caption = 'Hasta :'
    end
    object Bevel6: TBevel
      Left = 5
      Top = 144
      Width = 779
      Height = 35
    end
    object rgEstado: TRadioGroup
      Left = 577
      Top = 8
      Width = 207
      Height = 64
      Caption = 'Estado Actual :'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Pendientes'
        'Entregados'
        'Todos')
      TabOrder = 6
      OnClick = rgEstadoClick
    end
    object dblcCIA: TwwDBLookupCombo
      Left = 14
      Top = 40
      Width = 59
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'C'#243'digo'#9'F'
        'CIADES'#9'40'#9'Descripci'#243'n'#9'F'
        'CIAABR'#9'15'#9'Abreviatura'#9'F')
      LookupTable = DM1.cdsCia
      LookupField = 'CIAID'
      Options = [loColLines, loTitles]
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcCIAExit
      OnNotInList = dblcNotInList
    end
    object dbeCIA: TwwDBEdit
      Left = 76
      Top = 40
      Width = 490
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcCtaCte: TwwDBLookupCombo
      Left = 238
      Top = 112
      Width = 128
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CCBCOID'#9'30'#9'C'#243'digo'#9'F'
        'CCBCODES'#9'40'#9'Descripci'#243'n'#9'F')
      LookupTable = DM1.cdsCCBco
      LookupField = 'CCBCOID'
      Options = [loColLines, loTitles]
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcCtaCteExit
      OnNotInList = dblcNotInList
    end
    object dbeCtaCte: TwwDBEdit
      Left = 369
      Top = 112
      Width = 200
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcBanco: TwwDBLookupCombo
      Left = 16
      Top = 112
      Width = 59
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'BANCOID'#9'3'#9'C'#243'digo'#9'F'
        'BANCONOM'#9'40'#9'Descripci'#243'n'#9'F'
        'BANCOABR'#9'15'#9'Abreviatura'#9'F')
      LookupTable = DM1.cdsBanco
      LookupField = 'BANCOID'
      Options = [loColLines, loTitles]
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcBancoExit
      OnNotInList = dblcNotInList
    end
    object dbeBanco: TwwDBEdit
      Left = 78
      Top = 112
      Width = 156
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbdpFIni: TwwDBDateTimePicker
      Left = 584
      Top = 112
      Width = 95
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 7
      OnChange = dbdpFIniChange
      OnEnter = dbdpFIniEnter
    end
    object dbdpFFin: TwwDBDateTimePicker
      Left = 682
      Top = 111
      Width = 95
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 8
      OnChange = dbdpFFinChange
      OnEnter = dbdpFFinEnter
    end
    object z2bbtnOKCab: TBitBtn
      Left = 754
      Top = 147
      Width = 26
      Height = 29
      Hint = 'Pasa a Registrar Detalle'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnClick = z2bbtnOKCabClick
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
  object pnlBotones: TPanel
    Left = 4
    Top = 533
    Width = 787
    Height = 39
    BevelOuter = bvLowered
    Enabled = False
    TabOrder = 3
    object z2bbtnSalir: TBitBtn
      Left = 751
      Top = 4
      Width = 32
      Height = 32
      Hint = 'Salir'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = z2bbtnSalirClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
        0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
        0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
        0333337F777FFFFF7F3333000000000003333377777777777333}
      NumGlyphs = 2
    end
    object Z2bbtnPrint: TBitBtn
      Left = 642
      Top = 4
      Width = 32
      Height = 32
      Hint = 'Imprimir'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = Z2bbtnPrintClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
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
    object Z2bbtnRegresa: TBitBtn
      Left = 570
      Top = 4
      Width = 32
      Height = 32
      Hint = 'Modifica Datos de Cabecera'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = Z2bbtnRegresaClick
      Glyph.Data = {
        9A050000424D9A05000000000000360000002800000014000000170000000100
        1800000000006405000000000000000000000000000000000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0000000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000000000C0C0C0C0C0C0C0C0C0C0C0C000000000000000
        0000000000000000000000FF0000000000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000000000000000000000000000C0C0C0000000FFFFFFFFFFFFFFFF
        FFCCCCCC00000000000000000000000000000000000000000000000000000000
        0000000000FFFFFFFFFFFF000000C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFF
        000000000000CCCCCCCCCCCCCCCCCCCCCCCC999999CCCCCC9999990000000000
        00FFFFFFFFFFFF000000C0C0C0000000FFFFFFFFFFFFFFFFFF000000CCCCCCFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF666666999999CCCCCC999999000000FFFFFF
        FFFFFF000000C0C0C0000000FFFFFFFFFFFFCCCCCC000000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFCCCCCC999999666666CCCCCC666666000000FFFFFFFFFFFF00
        0000C0C0C0000000FFFFFFFFFFFF999999999999FFFFFFFFFFFFFFFFFFFFFFFF
        CCCCCC666666000000666666CCCCCC999999000000FFFFFFFFFFFF000000C0C0
        C0000000FFFFFFFFFFFF000000CCCCCCFFFFFFFFFFFFFFFFFFFFFFFF00000099
        9999000000999999000000000000000000FFFFFFFFFFFF000000C0C0C0000000
        FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFCCCCCC0000000000000000
        00000000666666CCCCCC000000000000FFFFFF000000C0C0C0000000FFFFFFFF
        FFFF000000FFFFFFCCCCCCFFFFFFFFFFFF999999000000000000666666CCCCCC
        000000CCCCCC666666000000FFFFFF000000C0C0C0000000FFFFFFFFFFFF0000
        00FFFFFFCCCCCCFFFFFFFFFFFF666666000000999999000000CCCCCC00000066
        6666CCCCCC000000FFFFFF000000C0C0C0000000FFFFFFFFFFFF000000FFFFFF
        CCCCCCFFFFFFFFFFFF999999000000CCCCCC000000666666CCCCCC0000000000
        00FFFFFFFFFFFF000000C0C0C0000000FFFFFFFFFFFF000000FFFFFFCCCCCC66
        6666FFFFFFFFFFFF000000666666CCCCCC000000FFFFFF000000FFFFFFFFFFFF
        FFFFFF000000C0C0C0000000FFFFFFFFFFFF000000FFFFFFCCCCCC0000009999
        99FFFFFF000000000000FFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFF00
        0000C0C0C0000000FFFFFFFFFFFF000000FFFFFFCCCCCC000000000000FFFFFF
        666666000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0
        C0000000FFFFFFFFFFFF000000FFFFFFCCCCCC000000000000FFFFFFCCCCCC00
        0000FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0C0000000
        FFFFFFFFFFFF000000FFFFFFCCCCCC000000000000FFFFFFCCCCCC000000FFFF
        FFFFFFFF000000000000000000000000000000000000C0C0C0000000FFFFFFFF
        FFFF000000FFFFFFCCCCCC000000FFFFFF000000000000FFFFFFFFFFFFFFFFFF
        000000FFFFFFFFFFFFFFFFFF000000C0C0C0C0C0C0000000FFFFFFFFFFFF0000
        00FFFFFFCCCCCC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
        FFFFFFFFFF000000C0C0C0C0C0C0C0C0C0000000FFFFFFFFFFFF000000FFFFFF
        666666000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF0000
        00C0C0C0C0C0C0C0C0C0C0C0C0000000000000000000000000FFFFFF99999900
        0000000000000000000000000000000000000000000000000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000999999999999000000C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0}
    end
    object Z2bbtnGraba: TBitBtn
      Left = 606
      Top = 4
      Width = 32
      Height = 32
      Hint = 'Grabar Cambios'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = Z2bbtnGrabaClick
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
  end
  object pnlEntrega: TPanel
    Left = 187
    Top = 154
    Width = 431
    Height = 235
    BevelInner = bvLowered
    BorderStyle = bsSingle
    TabOrder = 2
    Visible = False
    object Label1: TLabel
      Left = 12
      Top = 28
      Width = 30
      Height = 13
      Caption = 'Fecha'
    end
    object Label2: TLabel
      Left = 106
      Top = 28
      Width = 104
      Height = 13
      Caption = 'Persona Responsable'
    end
    object Label3: TLabel
      Left = 12
      Top = 73
      Width = 92
      Height = 13
      Caption = 'Persona Receptora'
    end
    object Label4: TLabel
      Left = 12
      Top = 119
      Width = 117
      Height = 13
      Caption = 'Documento de Identidad'
    end
    object Label5: TLabel
      Left = 12
      Top = 198
      Width = 58
      Height = 13
      Caption = 'Comentarios'
      Visible = False
    end
    object Label6: TLabel
      Left = 192
      Top = 120
      Width = 99
      Height = 13
      Caption = 'Nro. de Documento :'
    end
    object Bevel2: TBevel
      Left = 8
      Top = 162
      Width = 412
      Height = 9
      Shape = bsTopLine
    end
    object Bevel1: TBevel
      Left = 4
      Top = 23
      Width = 420
      Height = 169
      Shape = bsFrame
    end
    object dbdECFCOMP: TwwDBDateTimePicker
      Left = 12
      Top = 45
      Width = 93
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'ECFENTR'
      DataSource = DM1.dsEgrCaja2
      Epoch = 1950
      ShowButton = True
      TabOrder = 0
      OnExit = dbdECFCOMPExit
    end
    object dblcPERID: TwwDBLookupCombo
      Left = 107
      Top = 45
      Width = 63
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'PERID'#9'3'#9'C'#243'digo'#9'F'
        'PERDES'#9'40'#9'Descripci'#243'n'#9'F'
        'PERABR'#9'15'#9'Abreviatura'#9'F')
      DataField = 'PERID'
      DataSource = DM1.dsEgrCaja2
      LookupTable = DM1.cdsResponsable
      LookupField = 'PERID'
      Options = [loColLines, loTitles]
      MaxLength = 2
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcPERIDExit
    end
    object dbePERID: TwwDBEdit
      Left = 172
      Top = 45
      Width = 246
      Height = 21
      Enabled = False
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeECPERREC: TwwDBEdit
      Left = 12
      Top = 90
      Width = 405
      Height = 21
      DataField = 'ECPERREC'
      DataSource = DM1.dsEgrCaja2
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dbeECPERRECExit
    end
    object dblcTIPDOCCOD: TwwDBLookupCombo
      Left = 12
      Top = 134
      Width = 54
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TIPDOCCOD'#9'2'#9'C'#243'digo'#9'F'
        'TIPDOCDES'#9'35'#9'Descripci'#243'n'#9'F'
        'TIPDOCABR'#9'10'#9'Abreviatura'#9'F')
      DataField = 'TIPDOCCOD'
      DataSource = DM1.dsEgrCaja2
      LookupField = 'TIPDOCCOD'
      Options = [loColLines, loTitles]
      MaxLength = 2
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcTIPDOCCODExit
    end
    object dbeTDOCIDEN: TwwDBEdit
      Left = 68
      Top = 134
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeOBS: TwwDBEdit
      Left = 12
      Top = 214
      Width = 407
      Height = 63
      AutoSize = False
      TabOrder = 12
      UnboundDataType = wwDefault
      Visible = False
      WantReturns = True
      WordWrap = True
    end
    object z2bbtnOkCono: TBitBtn
      Left = 358
      Top = 195
      Width = 32
      Height = 33
      Hint = 'Cuadrar y Cancelar Comprobante'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnClick = z2bbtnOkConoClick
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
    object z2bbtnCancelCono: TBitBtn
      Left = 392
      Top = 195
      Width = 32
      Height = 33
      Hint = 'Cancela Actualizaciones'
      Cancel = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnClick = z2bbtnCancelConoClick
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
    object dbeECPERNDOC: TwwDBEdit
      Left = 192
      Top = 134
      Width = 121
      Height = 21
      DataField = 'ECPERNDOC'
      DataSource = DM1.dsEgrCaja2
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dbeECPERNDOCExit
    end
    object Panel4: TPanel
      Left = 2
      Top = 2
      Width = 427
      Height = 20
      BevelOuter = bvLowered
      Caption = 'Datos de la Entrega'
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
      object Button1: TButton
        Left = 408
        Top = 2
        Width = 15
        Height = 15
        Caption = 'X'
        TabOrder = 0
        OnClick = z2bbtnCancelConoClick
      end
    end
    object chkbtnPend: TRadioButton
      Left = 118
      Top = 171
      Width = 97
      Height = 17
      Caption = 'Pendiente'
      TabOrder = 8
      OnClick = chkbtnPendClick
    end
    object chkbtnEntre: TRadioButton
      Left = 14
      Top = 171
      Width = 97
      Height = 17
      Caption = 'Entregado'
      TabOrder = 7
      OnClick = chkEntreClick
    end
  end
  object dbpplEgrCaja: TppDBPipeline
    UserName = 'a'
    Left = 127
    Top = 25
  end
  object pprEgrCaja: TppReport
    AutoStop = False
    DataPipeline = dbpplEgrCaja
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210874
    PrinterSetup.mmPaperWidth = 296863
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\SolCaja\SolFormatos\ChqEntregado.rtm'
    Units = utScreenPixels
    BeforePrint = pprEgrCajaBeforePrint
    DeviceType = 'Screen'
    OnPreviewFormCreate = pprEgrCajaPreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 216
    Top = 25
    Version = '7.02'
    mmColumnWidth = 198174
    DataPipelineName = 'dbpplEgrCaja'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 35719
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Control de Entrega de Cheques'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 4233
        mmLeft = 100013
        mmTop = 2646
        mmWidth = 80169
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Desde :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 112448
        mmTop = 13494
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Hasta :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 148432
        mmTop = 13494
        mmWidth = 10319
        BandType = 0
      end
      object pplFDesde: TppLabel
        UserName = 'lFDesde'
        Caption = 'lFDesde'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 126471
        mmTop = 13494
        mmWidth = 11906
        BandType = 0
      end
      object pplFHasta: TppLabel
        UserName = 'lFHasta'
        Caption = 'lFHasta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 161661
        mmTop = 13494
        mmWidth = 11113
        BandType = 0
      end
      object pplEstado: TppLabel
        UserName = 'lEstado'
        Caption = 'lEstado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 135732
        mmTop = 7673
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Banco'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 1852
        mmTop = 23019
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Cuenta Corriente'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 67204
        mmTop = 22490
        mmWidth = 24871
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Moneda'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 125413
        mmTop = 22490
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Glosa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 230453
        mmTop = 28840
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'N'#186' de Cheque'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 28310
        mmTop = 29633
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Monto Soles'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 170392
        mmTop = 28840
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Fecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 2381
        mmTop = 29633
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Girado a '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 66411
        mmTop = 29369
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'N'#186' de Comprobante'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 127265
        mmTop = 28840
        mmWidth = 28840
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Pen.Style = psDot
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 0
        mmTop = 20902
        mmWidth = 281782
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Pen.Style = psDot
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 0
        mmTop = 34925
        mmWidth = 281782
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Monto USD'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 206640
        mmTop = 28840
        mmWidth = 16404
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'ECFCOMP'
        DataPipeline = dbpplEgrCaja
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'dbpplEgrCaja'
        mmHeight = 3969
        mmLeft = 1852
        mmTop = 1058
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'ECGLOSA'
        DataPipeline = dbpplEgrCaja
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbpplEgrCaja'
        mmHeight = 3969
        mmLeft = 230982
        mmTop = 794
        mmWidth = 53446
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'ECNOCOMP'
        DataPipeline = dbpplEgrCaja
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbpplEgrCaja'
        mmHeight = 3969
        mmLeft = 125413
        mmTop = 1058
        mmWidth = 32544
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'ECNOCHQ'
        DataPipeline = dbpplEgrCaja
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbpplEgrCaja'
        mmHeight = 3969
        mmLeft = 26988
        mmTop = 1058
        mmWidth = 35719
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'ECGIRA'
        DataPipeline = dbpplEgrCaja
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbpplEgrCaja'
        mmHeight = 3969
        mmLeft = 65088
        mmTop = 1058
        mmWidth = 58738
        BandType = 4
      end
      object vMntLOC: TppVariable
        UserName = 'vMntLOC'
        AutoSize = False
        CalcOrder = 0
        DataType = dtDouble
        DisplayFormat = '### ### ##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        OnCalc = vMntLOCCalc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 162984
        mmTop = 794
        mmWidth = 29898
        BandType = 4
      end
      object vMntExt: TppVariable
        UserName = 'vMntExt'
        AutoSize = False
        CalcOrder = 1
        DataType = dtDouble
        DisplayFormat = '### ### ##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        OnCalc = vMntExtCalc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 198967
        mmTop = 794
        mmWidth = 29898
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      BeforePrint = ppSummaryBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Total General :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 134938
        mmTop = 529
        mmWidth = 22490
        BandType = 7
      end
      object TotalGL: TppVariable
        UserName = 'TotalGL'
        AutoSize = False
        CalcOrder = 0
        DataType = dtDouble
        DisplayFormat = '### ### ##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 162190
        mmTop = 529
        mmWidth = 29898
        BandType = 7
      end
      object TotalGE: TppVariable
        UserName = 'TotalGLE'
        AutoSize = False
        CalcOrder = 1
        DataType = dtDouble
        DisplayFormat = '### ### ##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 198702
        mmTop = 529
        mmWidth = 29898
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'BANCOID'
      DataPipeline = dbpplEgrCaja
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbpplEgrCaja'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        BeforePrint = ppGroupHeaderBand1BeforePrint
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = 14869218
          Pen.Style = psClear
          mmHeight = 4233
          mmLeft = 529
          mmTop = 265
          mmWidth = 284163
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'BANCOID'
          DataPipeline = dbpplEgrCaja
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbpplEgrCaja'
          mmHeight = 3969
          mmLeft = 2117
          mmTop = 265
          mmWidth = 8731
          BandType = 3
          GroupNo = 0
        end
        object pplblBcoDes: TppLabel
          UserName = 'lblBcoDes'
          Caption = 'lblBcoDes'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 15081
          mmTop = 265
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGFBanco: TppGroupFooterBand
        BeforePrint = ppGFBancoBeforePrint
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppLabel18: TppLabel
          UserName = 'Label18'
          Caption = 'Total Banco :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 137584
          mmTop = 0
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          Weight = 0.750000000000000000
          mmHeight = 265
          mmLeft = 162190
          mmTop = 4763
          mmWidth = 67469
          BandType = 5
          GroupNo = 0
        end
        object TotalBCOS: TppVariable
          UserName = 'TotalBCOS'
          AutoSize = False
          CalcOrder = 0
          DataType = dtDouble
          DisplayFormat = '### ### ##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 162719
          mmTop = 265
          mmWidth = 29898
          BandType = 5
          GroupNo = 0
        end
        object TotalBCOU: TppVariable
          UserName = 'TotalBCOSU'
          AutoSize = False
          CalcOrder = 1
          DataType = dtDouble
          DisplayFormat = '### ### ##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 199232
          mmTop = 265
          mmWidth = 29898
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'CCBCOID'
      DataPipeline = dbpplEgrCaja
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbpplEgrCaja'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        BeforePrint = ppGroupHeaderBand2BeforePrint
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          DataField = 'CCBCOID'
          DataPipeline = dbpplEgrCaja
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbpplEgrCaja'
          mmHeight = 3969
          mmLeft = 65088
          mmTop = 0
          mmWidth = 59002
          BandType = 3
          GroupNo = 1
        end
        object pplblMoneda: TppLabel
          UserName = 'lblMoneda'
          Caption = 'lblMoneda'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 126207
          mmTop = 0
          mmWidth = 15081
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGFCTA: TppGroupFooterBand
        BeforePrint = ppGFCTABeforePrint
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppLabel17: TppLabel
          UserName = 'Label17'
          Caption = 'Total Cta. Cte.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 135732
          mmTop = 265
          mmWidth = 22225
          BandType = 5
          GroupNo = 1
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Weight = 0.750000000000000000
          mmHeight = 265
          mmLeft = 162190
          mmTop = 4763
          mmWidth = 67469
          BandType = 5
          GroupNo = 1
        end
        object TotalCTACTES: TppVariable
          UserName = 'TotalCTACTES'
          AutoSize = False
          CalcOrder = 0
          DataType = dtDouble
          DisplayFormat = '### ### ##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          OnCalc = TotalCTACTESCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 162454
          mmTop = 265
          mmWidth = 29898
          BandType = 5
          GroupNo = 1
        end
        object TotalCTACTEU: TppVariable
          UserName = 'TotalCTACTEU'
          AutoSize = False
          CalcOrder = 1
          DataType = dtDouble
          DisplayFormat = '### ### ##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          OnCalc = TotalCTACTEUCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 199496
          mmTop = 265
          mmWidth = 29898
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
end

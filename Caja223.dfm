object FTrans: TFTrans
  Left = 295
  Top = 150
  BorderStyle = bsDialog
  Caption = 'Transferencias de Conciliaci'#243'n Bancaria'
  ClientHeight = 273
  ClientWidth = 416
  Color = 12904163
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTransf: TPanel
    Left = 27
    Top = 16
    Width = 350
    Height = 199
    Caption = 'pnlTransf'
    TabOrder = 5
    Visible = False
    object dbgMov: TwwDBGrid
      Left = 7
      Top = 8
      Width = 336
      Height = 150
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
    end
    object bbtnTransfer: TBitBtn
      Left = 306
      Top = 162
      Width = 33
      Height = 32
      Hint = 'Transferir a Archivo..'
      Default = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
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
  object gbHEADER: TGroupBox
    Left = 7
    Top = 4
    Width = 402
    Height = 221
    Caption = 'Compa'#241#237'a && Bancos'
    Color = 10207162
    ParentColor = False
    TabOrder = 0
    object Label9: TLabel
      Left = 9
      Top = 66
      Width = 31
      Height = 15
      Caption = 'Banco'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 9
      Top = 18
      Width = 49
      Height = 15
      Caption = 'Compa'#241#237'a'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 9
      Top = 158
      Width = 259
      Height = 15
      Caption = 'Archivo de texto correspondiente a la conciliaci'#243'n'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 11
      Top = 113
      Width = 87
      Height = 15
      Caption = 'Cuenta Corriente'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object dblcBanco: TwwDBLookupCombo
      Left = 9
      Top = 83
      Width = 59
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'BANCOID'#9'3'#9'C'#243'digo'#9'F'
        'BANCONOM'#9'40'#9'Descripci'#243'n'#9'F'
        'BANCOABR'#9'15'#9'Abreviatura'#9'F')
      LookupTable = DMTE.cdsBanco
      LookupField = 'BANCOID'
      Options = [loColLines, loTitles]
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnChange = dblcBancoChange
      OnExit = dblcExist
      OnNotInList = dblcNotInList
    end
    object dbeBanco: TwwDBEdit
      Left = 71
      Top = 83
      Width = 320
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 7
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcCIA: TwwDBLookupCombo
      Left = 9
      Top = 35
      Width = 59
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'C'#243'digo'#9'F'
        'CIADES'#9'40'#9'Descripci'#243'n'#9'F'
        'CIAABR'#9'15'#9'Abreviatura'#9'F')
      LookupTable = DMTE.cdsCia
      LookupField = 'CIAID'
      Options = [loColLines, loTitles]
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnChange = dblcCIAChange
      OnExit = dblcExist
      OnNotInList = dblcNotInList
    end
    object dbeCIA: TwwDBEdit
      Left = 71
      Top = 35
      Width = 320
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edFILEPATH: TEdit
      Left = 9
      Top = 179
      Width = 277
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 3
      OnChange = edFILEPATHChange
    end
    object btnFILEPATH: TButton
      Left = 290
      Top = 178
      Width = 24
      Height = 23
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = btnFILEPATHClick
    end
    object dblcCtaCte: TwwDBLookupCombo
      Left = 9
      Top = 130
      Width = 150
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CCBCOID'#9'30'#9'C'#243'digo'#9'F'
        'CCBCODES'#9'40'#9'Descripci'#243'n'#9'F')
      LookupTable = DMTE.cdsCCBco
      LookupField = 'CCBCOID'
      Options = [loColLines, loTitles]
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnNotInList = dblcNotInList
    end
    object dbeCtaCte: TwwDBEdit
      Left = 161
      Top = 130
      Width = 230
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  object Z2bbtnOK: TBitBtn
    Left = 318
    Top = 236
    Width = 33
    Height = 32
    Hint = 'Transferir a Archivo..'
    Default = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = Z2bbtnOKClick
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
  object Z2bbtnVerArch: TBitBtn
    Left = 279
    Top = 236
    Width = 33
    Height = 32
    Hint = 'Ver Achivo...'
    Enabled = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = Z2bbtnVerArchClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
      FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
      00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
      F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
      00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
      F033777777777337F73309999990FFF0033377777777FFF77333099999000000
      3333777777777777333333399033333333333337773333333333333903333333
      3333333773333333333333303333333333333337333333333333}
    NumGlyphs = 2
  end
  object Z2bbtnProcesar: TBitBtn
    Left = 240
    Top = 238
    Width = 33
    Height = 30
    Hint = 'Procesar Transferencias...'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Visible = False
    OnClick = Z2bbtnProcesarClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
      33333333333F8888883F33330000324334222222443333388F3833333388F333
      000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
      F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
      223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
      3338888300003AAAAAAA33333333333888888833333333330000333333333333
      333333333333333333FFFFFF000033333333333344444433FFFF333333888888
      00003A444333333A22222438888F333338F3333800003A2243333333A2222438
      F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
      22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
      33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
      3333333333338888883333330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object pb: TProgressBar
    Left = 8
    Top = 244
    Width = 207
    Height = 16
    TabOrder = 4
    Visible = False
  end
  object opDLG: TOpenDialog
    DefaultExt = '*.TXT'
    Filter = 'Archivos de Texto (*.TXT)|*.TXT|Otros(*.PRN)|*.PRN'
    Title = 'Seleccione el Archivo de Conciliaci'#243'n'
    Left = 144
    Top = 230
  end
  object scFILES: TStrContainer
    Left = 88
    Top = 230
  end
end

object FTarjetaImportar: TFTarjetaImportar
  Left = 451
  Top = 202
  Width = 740
  Height = 570
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Cobranza Dep'#243'sito Bancos'
  Color = clBtnFace
  Constraints.MaxHeight = 570
  Constraints.MaxWidth = 740
  Constraints.MinHeight = 570
  Constraints.MinWidth = 740
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
  object dbgDescago: TwwDBGrid
    Left = 8
    Top = 62
    Width = 716
    Height = 387
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = DMTE.dsCabTranf
    KeyOptions = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    TabOrder = 0
    TitleAlignment = taCenter
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = False
    OnDblClick = dbgDescagoDblClick
    OnKeyDown = dbgDescagoKeyDown
  end
  object Panel2: TPanel
    Left = 8
    Top = 456
    Width = 716
    Height = 76
    TabOrder = 1
    object Label2: TLabel
      Left = 9
      Top = 11
      Width = 24
      Height = 19
      Caption = 'Mes'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BitBtn1: TBitBtn
      Left = 140
      Top = 9
      Width = 230
      Height = 25
      Caption = 'Importar Tarjetas Cr'#233'dito'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object bbtnContab: TBitBtn
      Left = 627
      Top = 5
      Width = 38
      Height = 35
      Hint = 'Contabilizar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = bbtnContabClick
      Glyph.Data = {
        F6020000424DF602000000000000760000002800000021000000200000000100
        0400000000008002000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888880000000888888888888888888888888888888888000
        0000888888888888888888888888888888888000000080000000000000000000
        000000000000800000000000000000000000000000000000000000000000000F
        0F0F0F0F0F0F0F0F0F0F0F0FF0000000000000F0F0F0F0F0F0F0F0F0F0F0F0F0
        0F000000000000FF00000000000000000000000000F00000000000FF00000000
        00000000000000000F000000000000FF00000000BBBBBBBBBBBBB00000F00000
        000000FF0000000000000000000000000F000000000000FF0000000000000000
        0000000000F00000000000FF0000BBBBBBBBBBBBBBBBBBBB0F000000000000FF
        00000000000000000000000000F00000000000FF000000000000000000000000
        0F000000000000FF0BBBB0BBB00B0B0B0BBB0BBB00F00000000000FF0B00B0B0
        B00B0B0B0B0B0B0B0F000000000000FF0B00B0B0B00B0B0B0BBB0B0B00F00000
        000000FF0B0000B0B00B0B0B000B0B0B0F000000000000FF0B0000BBB0BBBB0B
        0BBB0BBB00F00000000000FF0B000000000000BBB0000B000F000000000000FF
        0B00B0000000000B00000B0000F00000000000FF0BBBB0000000000000000000
        0F000000000000FF00000000000000000000000000F00000000000FF00000000
        00000000000000000F000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000
        0000000FFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000
        0000000000000000000080000000000000000000000000000000800000008888
        8888888888888888888888888888800000008888888888888888888888888888
        8888800000008888888888888888888888888888888880000000}
    end
    object seAno: TSpinEdit
      Left = 37
      Top = 11
      Width = 50
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 2
      Value = 2009
    end
    object seMes: TSpinEdit
      Left = 89
      Top = 11
      Width = 38
      Height = 22
      MaxValue = 12
      MinValue = 1
      TabOrder = 3
      Value = 12
    end
    object Z2bbtnSalir: TBitBtn
      Left = 671
      Top = 5
      Width = 38
      Height = 35
      Hint = 'Salir de opci'#243'n'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'Garamond'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
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
    object BitBtn2: TBitBtn
      Left = 387
      Top = 9
      Width = 230
      Height = 25
      Caption = 'Importar OTRAS Cuentas Bco.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = BitBtn2Click
    end
    object bbtnPagoServ: TBitBtn
      Left = 140
      Top = 41
      Width = 230
      Height = 25
      Caption = 'Importar Pagos Servicios'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = bbtnPagoServClick
    end
  end
  object Panel1: TPanel
    Left = 8
    Top = 6
    Width = 715
    Height = 51
    TabOrder = 2
    object Label1: TLabel
      Left = 13
      Top = 8
      Width = 303
      Height = 35
      Caption = 'Cobranza Dep'#243'sito Bancos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -24
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 323
      Top = 24
      Width = 25
      Height = 13
      Caption = 'V.1.3'
    end
    object bbtnBuscar: TBitBtn
      Left = 622
      Top = 13
      Width = 75
      Height = 27
      Caption = 'Buscar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = bbtnBuscarClick
    end
    object dtpFecBus: TwwDBDateTimePicker
      Left = 506
      Top = 14
      Width = 105
      Height = 27
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      ShowButton = True
      TabOrder = 1
    end
  end
  object sdGraba: TSaveDialog
    DefaultExt = '*.txt'
    FileName = 'c:\oaEjecuta\*.txt'
    Filter = '*.txt  ( Archivo txt )|*.txt|*.*   ( Todos )|*.*'
    Title = 'Cabecera de Contabilidad'
    Left = 374
    Top = 401
  end
  object scData: TStrContainer
    Left = 405
    Top = 401
  end
end

object FContabTarCre: TFContabTarCre
  Left = 268
  Top = 169
  Width = 720
  Height = 520
  Caption = 'Contabilidad de Tarjetas de Cr'#233'dito'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object wwDBGrid1: TwwDBGrid
    Left = 8
    Top = 67
    Width = 697
    Height = 361
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = DMTE.dsTarCreTransf
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
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 697
    Height = 55
    TabOrder = 1
    object lblCia: TLabel
      Left = 18
      Top = 5
      Width = 49
      Height = 17
      Caption = 'Compa'#241#237'a'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblTDiario: TLabel
      Left = 210
      Top = 5
      Width = 79
      Height = 17
      Caption = 'Tipo de Diario'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label15: TLabel
      Left = 412
      Top = 5
      Width = 79
      Height = 17
      Caption = 'F.Comprobante'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label20: TLabel
      Left = 522
      Top = 5
      Width = 40
      Height = 17
      Caption = 'Periodo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object lblNoReg: TLabel
      Left = 587
      Top = 5
      Width = 88
      Height = 17
      Caption = 'No.Comprobante'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object dblcCia: TwwDBLookupCombo
      Left = 14
      Top = 21
      Width = 49
      Height = 22
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'Cia'#9'F'
        'CIAABR'#9'15'#9'Raz'#243'n Social'#9'F')
      DataField = 'CIAID'
      LookupTable = DMTE.cdsCia
      LookupField = 'CIAID'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcCiaExit
    end
    object dblcTDiario: TwwDBLookupCombo
      Left = 206
      Top = 21
      Width = 49
      Height = 22
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TDIARID'#9'2'#9'Tipo de Diario'#9'F'
        'TDIARDES'#9'40'#9'Descripci'#243'n'#9'F')
      DataField = 'TDIARID'
      LookupTable = DMTE.cdsTDiario
      LookupField = 'TDIARID'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      MaxLength = 2
      ParentFont = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
    end
    object dtpFComp: TwwDBDateTimePicker
      Left = 409
      Top = 21
      Width = 90
      Height = 22
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      ShowButton = True
      TabOrder = 2
      OnExit = dtpFCompExit
    end
    object edtPeriodo: TEdit
      Left = 520
      Top = 21
      Width = 52
      Height = 21
      Enabled = False
      TabOrder = 3
    end
    object dbeNoComp: TwwDBEdit
      Left = 593
      Top = 21
      Width = 82
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edtCia: TEdit
      Left = 62
      Top = 21
      Width = 131
      Height = 21
      Color = clInactiveBorder
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object edtTDiario: TEdit
      Left = 256
      Top = 21
      Width = 137
      Height = 21
      Color = clActiveBorder
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 432
    Width = 697
    Height = 49
    TabOrder = 2
    object bbtnGraba: TBitBtn
      Left = 531
      Top = 5
      Width = 43
      Height = 38
      Hint = 'Grabar Comprobante'
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
    object bbtnContab: TBitBtn
      Left = 582
      Top = 5
      Width = 43
      Height = 38
      Hint = 'Cuadrar y Asientos Autom'#225'ticos'
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
    object bbtnImprime: TBitBtn
      Left = 633
      Top = 5
      Width = 43
      Height = 38
      Hint = 'Imprimir Comprobante'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
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
    object BitBtn1: TBitBtn
      Left = 16
      Top = 11
      Width = 193
      Height = 25
      Caption = 'Transferir Registros seleccionados'
      TabOrder = 3
      OnClick = BitBtn1Click
    end
  end
end

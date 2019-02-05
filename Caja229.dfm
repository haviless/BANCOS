object FMovPendientes: TFMovPendientes
  Left = 156
  Top = 176
  BorderStyle = bsDialog
  Caption = 'Pendientes de Cancelaci'#243'n'
  ClientHeight = 529
  ClientWidth = 771
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 4
    Top = 17
    Width = 759
    Height = 141
    Shape = bsFrame
  end
  object Bevel2: TBevel
    Left = 4
    Top = 174
    Width = 759
    Height = 141
    Shape = bsFrame
  end
  object Bevel3: TBevel
    Left = 4
    Top = 337
    Width = 759
    Height = 141
    Shape = bsFrame
  end
  object Bevel4: TBevel
    Left = 4
    Top = 483
    Width = 759
    Height = 41
    Shape = bsFrame
  end
  object dbgMov: TwwDBGrid
    Left = 14
    Top = 27
    Width = 738
    Height = 120
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = 7566265
    FixedCols = 0
    ShowHorzScrollBar = True
    Color = clWhite
    TabOrder = 0
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
    FooterColor = 7566265
  end
  object StaticText1: TStaticText
    Left = 16
    Top = 8
    Width = 127
    Height = 19
    Caption = 'Movimientos Pendientes'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object dbgOPago: TwwDBGrid
    Left = 14
    Top = 184
    Width = 738
    Height = 120
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = 7566265
    FixedCols = 0
    ShowHorzScrollBar = True
    Color = clWhite
    TabOrder = 2
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
    FooterColor = 7566265
  end
  object StaticText2: TStaticText
    Left = 16
    Top = 165
    Width = 147
    Height = 19
    Caption = 'Ordenes de Pago Pendientes'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object dbgNotaCob: TwwDBGrid
    Left = 14
    Top = 347
    Width = 738
    Height = 120
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = 7566265
    FixedCols = 0
    ShowHorzScrollBar = True
    Color = clWhite
    TabOrder = 4
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
    FooterColor = 7566265
  end
  object StaticText3: TStaticText
    Left = 16
    Top = 328
    Width = 158
    Height = 19
    Caption = 'Notas de Cobranza Pendientes'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object Z2bbtnOK: TBitBtn
    Left = 689
    Top = 489
    Width = 30
    Height = 30
    Hint = 'Confrrma Cancelaci'#243'n'
    TabOrder = 6
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
  object Z2bbtnCancel: TBitBtn
    Left = 726
    Top = 489
    Width = 30
    Height = 30
    Hint = 'Salir de la Opci'#243'n'
    TabOrder = 7
    OnClick = Z2bbtnCancelClick
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
end

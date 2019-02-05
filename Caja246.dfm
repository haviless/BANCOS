object FToolDeposito: TFToolDeposito
  Left = 0
  Top = 81
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  AutoSize = True
  BorderStyle = bsSingle
  Caption = 'Dep'#243'sito de Concesiones'
  ClientHeight = 48
  ClientWidth = 795
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object TLabel
    Left = 298
    Top = 4
    Width = 31
    Height = 13
    Caption = 'Desde'
  end
  object pnlDeposito: TPanel
    Left = 0
    Top = 0
    Width = 795
    Height = 48
    Color = 12904163
    TabOrder = 0
    DesignSize = (
      795
      48)
    object lblDesde: TLabel
      Left = 298
      Top = 4
      Width = 31
      Height = 15
      Caption = 'Desde'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object lblHasta: TLabel
      Left = 394
      Top = 4
      Width = 29
      Height = 15
      Caption = 'Hasta'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object lblAcep: TLabel
      Left = 581
      Top = 4
      Width = 76
      Height = 15
      Anchors = [akTop, akRight]
      Caption = 'Contabilizando'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object dtpFechaDesde: TDateTimePicker
      Left = 297
      Top = 18
      Width = 89
      Height = 23
      Date = 36902.492354282400000000
      Time = 36902.492354282400000000
      TabOrder = 1
      Visible = False
    end
    object z2bbtnOK: TBitBtn
      Left = 493
      Top = 5
      Width = 35
      Height = 35
      Hint = 'Acepta Filtro'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
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
    object rgDeposito: TRadioGroup
      Left = 8
      Top = 8
      Width = 185
      Height = 33
      Caption = 'Estado de D'#233'positos'
      Columns = 2
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Pendientes'
        'Actualizados')
      ParentFont = False
      TabOrder = 0
    end
    object z2bbtnCont: TBitBtn
      Left = 539
      Top = 5
      Width = 35
      Height = 35
      Hint = 'Asientos Autom'#225'ticos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = z2bbtnContClick
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
    object dtpFechaHasta: TDateTimePicker
      Left = 393
      Top = 18
      Width = 89
      Height = 23
      Date = 36902.492354282400000000
      Time = 36902.492354282400000000
      TabOrder = 2
      Visible = False
    end
    object chbRango: TCheckBox
      Left = 200
      Top = 24
      Width = 97
      Height = 17
      Hint = 'Toma el Rango de Fecha'
      Caption = 'Activa Rango'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = chbRangoClick
    end
    object pbAvance: TProgressBar
      Left = 582
      Top = 18
      Width = 202
      Height = 17
      Anchors = [akTop, akRight]
      TabOrder = 6
      Visible = False
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 456
    Top = 8
  end
end

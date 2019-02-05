object FGenCartas: TFGenCartas
  Left = 191
  Top = 86
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderStyle = bsSingle
  Caption = 'Generación de Cartas'
  ClientHeight = 424
  ClientWidth = 405
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 15
  object pnlCabecera: TPanel
    Left = 0
    Top = 0
    Width = 405
    Height = 425
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object lblCiaid: TLabel
      Left = 8
      Top = 8
      Width = 49
      Height = 15
      Caption = 'Compañia'
    end
    object lblBanco: TLabel
      Left = 8
      Top = 56
      Width = 31
      Height = 15
      Caption = 'Banco'
    end
    object lblCtacte: TLabel
      Left = 242
      Top = 56
      Width = 40
      Height = 15
      Caption = 'Cta. Cte'
    end
    object lblDescrip: TLabel
      Left = 8
      Top = 115
      Width = 60
      Height = 15
      Caption = 'Descriptivo'
    end
    object lblNumReg: TLabel
      Left = 312
      Top = 8
      Width = 72
      Height = 15
      Caption = 'Núm. Registro'
    end
    object Label1: TLabel
      Left = 272
      Top = 115
      Width = 102
      Height = 15
      Caption = 'Nombre del Archivo'
    end
    object Label2: TLabel
      Left = 8
      Top = 217
      Width = 188
      Height = 15
      Caption = 'Datos para que aparescan en la carta'
    end
    object lblDirigido: TLabel
      Left = 8
      Top = 159
      Width = 58
      Height = 15
      Caption = 'Dirigido a :'
    end
    object lblDirecc: TLabel
      Left = 206
      Top = 159
      Width = 51
      Height = 15
      Caption = 'Dirección'
    end
    object dblcCia: TwwDBLookupCombo
      Left = 8
      Top = 24
      Width = 41
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'Código'#9'F'
        'CIAABR'#9'15'#9'Abreviatura'#9'F')
      LookupTable = DM1.cdsCia
      LookupField = 'CIAID'
      Options = [loColLines, loTitles]
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnExit = dblcCiaExit
    end
    object dblcBanco: TwwDBLookupCombo
      Left = 8
      Top = 72
      Width = 41
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'BANCOID'#9'3'#9'Banco'#9'F'
        'BANCONOM'#9'40'#9'Nombre'#9'F')
      LookupTable = DM1.cdsBanco
      LookupField = 'BANCOID'
      Options = [loColLines, loTitles]
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnExit = dblcBancoExit
    end
    object dblcCtaCte: TwwDBLookupCombo
      Left = 242
      Top = 72
      Width = 145
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CCBCOID'#9'40'#9'Cta. Cte.'#9'F'
        'BANCOID'#9'3'#9'Banco'#9'F')
      LookupTable = DM1.cdsCCBco
      LookupField = 'CCBCOID'
      Options = [loColLines, loTitles]
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnExit = dblcCtaCteExit
    end
    object dbeDescrip: TwwDBEdit
      Left = 8
      Top = 131
      Width = 249
      Height = 23
      CharCase = ecUpperCase
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeNumReg: TwwDBEdit
      Left = 312
      Top = 24
      Width = 73
      Height = 23
      Color = clInfoBk
      Enabled = False
      TabOrder = 9
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object z2bbtnOKCab: TBitBtn
      Left = 352
      Top = 386
      Width = 40
      Height = 32
      Hint = 'Pasa a Registrar Detalle'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
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
    object dbremswCartas: TwwDBRichEditMSWord
      Left = 162
      Top = 227
      Width = 135
      Height = 31
      AutoURLDetect = True
      PrintJobName = 'Delphi 5'
      TabOrder = 10
      Visible = False
      PopupOptions = []
      EditorOptions = [reoShowRuler, reoShowSpellCheck]
      EditorCaption = 'SACSA'
      EditorPosition.Left = 0
      EditorPosition.Top = 0
      EditorPosition.Width = 0
      EditorPosition.Height = 0
      MeasurementUnits = muCentimeters
      PrintMargins.Top = 1
      PrintMargins.Bottom = 1
      PrintMargins.Left = 1
      PrintMargins.Right = 1
      RichEditVersion = 2
      Data = {
        B40000007B5C727466315C616E73695C616E7369637067313235325C64656666
        305C6465666C616E6731303235307B5C666F6E7474626C7B5C66305C666E696C
        5C66636861727365743020436F6D69632053616E73204D533B7D7D0D0A7B5C63
        6F6C6F7274626C203B5C726564305C677265656E305C626C75653132383B7D0D
        0A5C766965776B696E64345C7563315C706172645C6366315C66305C66733136
        20646272656D73774361727461735C7061720D0A7D0D0A00}
    end
    object dbeArchivo: TwwDBEdit
      Left = 272
      Top = 131
      Width = 113
      Height = 23
      CharCase = ecUpperCase
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edtCia: TEdit
      Left = 57
      Top = 24
      Width = 240
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
      TabOrder = 11
    end
    object edtBanco: TEdit
      Left = 57
      Top = 72
      Width = 176
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
      TabOrder = 12
    end
    object clbDescrip: TCheckListBox
      Left = 8
      Top = 233
      Width = 385
      Height = 145
      OnClickCheck = clbDescripClickCheck
      Columns = 2
      ItemHeight = 16
      Style = lbOwnerDrawFixed
      TabOrder = 7
    end
    object clbCampo: TCheckListBox
      Left = 248
      Top = 233
      Width = 121
      Height = 145
      ItemHeight = 15
      TabOrder = 13
      Visible = False
    end
    object edtDirigido: TEdit
      Left = 8
      Top = 176
      Width = 193
      Height = 23
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object edtDirecc: TEdit
      Left = 207
      Top = 176
      Width = 186
      Height = 23
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
  end
end

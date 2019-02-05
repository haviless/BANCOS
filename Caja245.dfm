object FConcesion: TFConcesion
  Left = 210
  Top = 106
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderStyle = bsSingle
  Caption = 'Concesiones'
  ClientHeight = 478
  ClientWidth = 733
  Color = 12904163
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCabecera1: TPanel
    Left = 4
    Top = 8
    Width = 725
    Height = 241
    BorderWidth = 1
    BorderStyle = bsSingle
    Color = 10207162
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object lblCia: TLabel
      Left = 14
      Top = 4
      Width = 49
      Height = 15
      Caption = 'Compa'#241#237'a'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblFComp: TLabel
      Left = 180
      Top = 4
      Width = 56
      Height = 15
      Caption = 'F.Comprob.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object lblTDiario: TLabel
      Left = 377
      Top = 4
      Width = 59
      Height = 15
      Caption = 'Tipo Diario'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object lblPeriodo: TLabel
      Left = 293
      Top = 4
      Width = 39
      Height = 15
      Caption = 'Periodo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object lblNoComp: TLabel
      Left = 635
      Top = 4
      Width = 66
      Height = 15
      Caption = 'Comprobante'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object lblBanco: TLabel
      Left = 351
      Top = 4
      Width = 65
      Height = 15
      Caption = 'Caja/Bancos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object lblCCBco: TLabel
      Left = 493
      Top = 4
      Width = 43
      Height = 15
      Caption = 'Cta. Cte.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 14
      Top = 44
      Width = 67
      Height = 15
      Caption = 'Cta. Contable'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblConcepto: TLabel
      Left = 130
      Top = 44
      Width = 47
      Height = 15
      Caption = 'Concepto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object lblGlosa: TLabel
      Left = 232
      Top = 44
      Width = 28
      Height = 15
      Caption = 'Glosa'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object lblTMon: TLabel
      Left = 14
      Top = 88
      Width = 50
      Height = 15
      Caption = 'T.Moneda'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblTCambio: TLabel
      Left = 123
      Top = 88
      Width = 47
      Height = 15
      Caption = 'T.Cambio'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblTDoc: TLabel
      Left = 186
      Top = 88
      Width = 97
      Height = 15
      Caption = 'Tipo de Documento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object lblNoDoc: TLabel
      Left = 349
      Top = 88
      Width = 79
      Height = 15
      Caption = 'Nro.Documento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label23: TLabel
      Left = 14
      Top = 134
      Width = 73
      Height = 15
      Caption = 'Clase Auxiliar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblProvRuc: TLabel
      Left = 269
      Top = 134
      Width = 22
      Height = 15
      Caption = 'RUC'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblProvDes: TLabel
      Left = 384
      Top = 134
      Width = 119
      Height = 15
      Caption = 'Nombre o Raz'#243'n Social'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 168
      Top = 134
      Width = 58
      Height = 15
      Caption = 'Id Auxiliar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label12: TLabel
      Left = 14
      Top = 180
      Width = 41
      Height = 15
      Caption = 'Importe'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 132
      Top = 180
      Width = 62
      Height = 15
      Caption = 'Monto Local'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 250
      Top = 180
      Width = 91
      Height = 15
      Caption = 'Monto Extranjero'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object lblFormPago: TLabel
      Left = 484
      Top = 89
      Width = 73
      Height = 15
      Caption = 'Forma de Pago'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object lblEstado: TLabel
      Left = 396
      Top = 200
      Width = 260
      Height = 23
      Alignment = taCenter
      Caption = 'S I N      A C T U A L I Z A R'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object edtCia: TEdit
      Left = 54
      Top = 19
      Width = 123
      Height = 23
      Color = clBtnFace
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
    object dblcCia: TwwDBLookupCombo
      Left = 14
      Top = 19
      Width = 42
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'Id'#9'F'
        'CIADES'#9'40'#9'Compa'#241'ia'#9'F')
      LookupTable = DM1.cdsCia
      LookupField = 'CIAID'
      Options = [loColLines, loRowLines, loTitles]
      Color = clBtnFace
      Enabled = False
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
    end
    object dbdtpFComp: TwwDBDateTimePicker
      Left = 180
      Top = 19
      Width = 109
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Color = clBtnFace
      Epoch = 1950
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ShowButton = True
      TabOrder = 2
    end
    object edtPeriodo: TEdit
      Left = 292
      Top = 19
      Width = 56
      Height = 23
      Color = clBtnFace
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object dbeNoComp: TwwDBEdit
      Left = 635
      Top = 19
      Width = 77
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      MaxLength = 6
      ParentFont = False
      Picture.PictureMask = '##########'
      TabOrder = 7
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcBanco: TwwDBLookupCombo
      Left = 350
      Top = 19
      Width = 42
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'BANCOID'#9'3'#9'Id'#9'F'
        'BANCONOM'#9'40'#9'Banco'#9'F')
      LookupTable = DM1.cdsBancoEgr
      LookupField = 'BANCOID'
      Options = [loColLines, loRowLines, loTitles]
      MaxLength = 2
      ParentFont = False
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcBancoExit
    end
    object edtBanco: TEdit
      Left = 394
      Top = 19
      Width = 95
      Height = 23
      Color = clBtnFace
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object dblcCCBco: TwwDBLookupCombo
      Left = 493
      Top = 19
      Width = 140
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CCBCOID'#9'30'#9'Cuenta Corriente del Banco'#9'F'
        'CCBCODES'#9'40'#9'Descripci'#243'n'#9'F')
      LookupTable = DM1.cdsCCBco
      LookupField = 'CCBCOID'
      Options = [loColLines, loRowLines, loTitles]
      MaxLength = 30
      ParentFont = False
      TabOrder = 6
      AutoDropDown = False
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcCCBcoExit
    end
    object edtCuenta: TEdit
      Left = 14
      Top = 58
      Width = 105
      Height = 23
      Color = clBtnFace
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
    object dblcdCnp: TwwDBLookupComboDlg
      Left = 130
      Top = 58
      Width = 90
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'CPTOID'#9'15'#9'Id'#9'F'
        'CPTODES'#9'40'#9'Concepto'#9'F'
        'CUENTAID'#9'15'#9'Cuenta'#9'F')
      LookupTable = DM1.cdsCnpEgr
      LookupField = 'CPTOID'
      ParentFont = False
      TabOrder = 9
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnExit = dblcdCnpExit
    end
    object dbeGlosa: TwwDBEdit
      Left = 232
      Top = 58
      Width = 335
      Height = 23
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      MaxLength = 40
      ParentFont = False
      TabOrder = 10
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcTMon: TwwDBLookupCombo
      Left = 14
      Top = 104
      Width = 42
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TMONID'#9'3'#9'Moneda'#9'F'
        'TMONDES'#9'30'#9'Descripci'#243'n'#9'F')
      LookupTable = DM1.cdsTMon
      LookupField = 'TMONID'
      Options = [loColLines, loRowLines, loTitles]
      Color = clBtnFace
      Enabled = False
      MaxLength = 2
      ParentFont = False
      TabOrder = 11
      AutoDropDown = False
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcTMonExit
    end
    object edtTMon: TEdit
      Left = 56
      Top = 104
      Width = 58
      Height = 23
      Color = clBtnFace
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
    end
    object dbeTCambio: TwwDBEdit
      Left = 123
      Top = 104
      Width = 59
      Height = 23
      Color = clBtnFace
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 13
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dbeTCambioExit
    end
    object dblcTDoc: TwwDBLookupCombo
      Left = 186
      Top = 104
      Width = 42
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DOCID'#9'2'#9'Id'#9'F'
        'DOCDES'#9'30'#9'Documento'#9'F')
      LookupTable = DM1.cdsTDoc
      LookupField = 'DOCID'
      Options = [loColLines, loRowLines, loTitles]
      Color = clBtnFace
      Enabled = False
      MaxLength = 2
      ParentFont = False
      TabOrder = 14
      AutoDropDown = False
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcTDocExit
    end
    object edtTDoc: TEdit
      Left = 233
      Top = 104
      Width = 105
      Height = 23
      Color = clBtnFace
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 15
    end
    object dbeNoDoc: TwwDBEdit
      Left = 349
      Top = 104
      Width = 131
      Height = 23
      CharCase = ecUpperCase
      Color = clBtnFace
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      MaxLength = 20
      ParentFont = False
      Picture.PictureMask = '[*&][*#]'
      TabOrder = 16
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcClAux: TwwDBLookupCombo
      Left = 14
      Top = 149
      Width = 42
      Height = 23
      AutoSize = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CLAUXID'#9'2'#9'Id'#9'F'
        'CLAUXDES'#9'30'#9'Clase Auxiliar'#9'F')
      LookupTable = DM1.cdsClaseAux
      LookupField = 'CLAUXID'
      Options = [loColLines, loRowLines, loTitles]
      AutoSelect = False
      Color = clBtnFace
      Enabled = False
      MaxLength = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 17
      AutoDropDown = False
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      OrderByDisplay = False
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcClAuxExit
    end
    object edtClAux: TEdit
      Left = 56
      Top = 149
      Width = 104
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
      TabOrder = 18
    end
    object dblcdAux: TwwDBLookupComboDlg
      Left = 162
      Top = 149
      Width = 107
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Cliente'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'AUXID'#9'8'#9'AUXID'#9'F'
        'AUXRUC'#9'10'#9'AUXRUC'#9'F'
        'AUXABR'#9'15'#9'AUXABR'#9'F'
        'AUXNOMB'#9'40'#9'AUXNOMB'#9'F')
      LookupTable = DM1.cdsAux
      LookupField = 'AUXID'
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      Color = clBtnFace
      Enabled = False
      MaxLength = 8
      ParentFont = False
      TabOrder = 19
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcdAuxExit
    end
    object edtAuxRuc: TEdit
      Left = 269
      Top = 148
      Width = 110
      Height = 23
      Color = clBtnFace
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 20
    end
    object dbeGiradoA: TwwDBEdit
      Left = 384
      Top = 149
      Width = 281
      Height = 23
      CharCase = ecUpperCase
      Color = clBtnFace
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      MaxLength = 60
      ParentFont = False
      TabOrder = 21
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeImporte2: TwwDBEdit
      Left = 14
      Top = 200
      Width = 105
      Height = 23
      Color = clBtnFace
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 22
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dbeImporte2Exit
    end
    object edtMtoLoc: TwwDBEdit
      Left = 132
      Top = 200
      Width = 105
      Height = 23
      Color = clBtnFace
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 23
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edtMtoExt: TwwDBEdit
      Left = 250
      Top = 200
      Width = 105
      Height = 23
      Color = clBtnFace
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 24
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object z2bbtnGraba: TBitBtn
      Left = 679
      Top = 189
      Width = 35
      Height = 35
      Hint = 'Grabar Comprobante'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 25
      OnClick = z2bbtnGrabaClick
      Glyph.Data = {
        8A010000424D8A01000000000000760000002800000017000000170000000100
        04000000000014010000CE0E0000D80E00001000000000000000000000000000
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
    object dblcFormPago: TwwDBLookupCombo
      Left = 483
      Top = 104
      Width = 42
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'FPAGOID'#9'2'#9'Id'#9'F'
        'FPAGODES'#9'30'#9'Forma de Pago'#9'F')
      LookupTable = DM1.cdsFormPago
      LookupField = 'FPAGOID'
      Options = [loColLines, loRowLines, loTitles]
      Color = clBtnFace
      Enabled = False
      MaxLength = 2
      ParentFont = False
      TabOrder = 26
      Visible = False
      AutoDropDown = False
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcFormPagoExit
    end
    object edtFormPago: TEdit
      Left = 527
      Top = 104
      Width = 105
      Height = 23
      Color = clBtnFace
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 27
      Visible = False
    end
  end
  object pnlClone: TPanel
    Left = 152
    Top = 254
    Width = 449
    Height = 219
    Color = 10207162
    Enabled = False
    TabOrder = 1
    object Label3: TLabel
      Left = 136
      Top = 4
      Width = 147
      Height = 19
      Caption = 'Movimientos Pendientes'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lblBusca: TLabel
      Left = 13
      Top = 21
      Width = 35
      Height = 15
      Caption = 'Buscar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object dbgClone: TwwDBGrid
      Left = 8
      Top = 63
      Width = 433
      Height = 144
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = 10207162
      FixedCols = 0
      ShowHorzScrollBar = True
      Color = 14811135
      DataSource = DM1.dsRec
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ReadOnly = True
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = True
      OnTitleButtonClick = dbgCloneTitleButtonClick
      OnDblClick = dbgCloneDblClick
    end
    object isClone: TwwIncrementalSearch
      Left = 10
      Top = 39
      Width = 105
      Height = 21
      DataSource = DM1.dsRec
      PictureMaskFromField = True
      CharCase = ecUpperCase
      TabOrder = 1
      Visible = False
      OnExit = isCloneExit
    end
  end
end

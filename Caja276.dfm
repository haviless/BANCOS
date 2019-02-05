object FSelecCajero: TFSelecCajero
  Left = 362
  Top = 204
  AutoScroll = False
  BorderIcons = [biSystemMenu]
  Caption = 'Asignar Cajero'
  ClientHeight = 126
  ClientWidth = 336
  Color = clBtnFace
  Constraints.MaxHeight = 164
  Constraints.MaxWidth = 352
  Constraints.MinHeight = 160
  Constraints.MinWidth = 344
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
  object pnlDet: TPanel
    Left = 4
    Top = 6
    Width = 333
    Height = 123
    BevelOuter = bvNone
    Color = 14869218
    TabOrder = 0
    object Label2: TLabel
      Left = 36
      Top = 19
      Width = 50
      Height = 17
      Caption = 'Cajero(a)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object dblcdCajero: TwwDBLookupComboDlg
      Left = 17
      Top = 39
      Width = 100
      Height = 21
      CharCase = ecUpperCase
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'USUARIO'#9'15'#9'Cajero(a)'
        'USERNOM'#9'30'#9'Nombre')
      DataField = 'USUASIGNA'
      DataSource = DMTE.dsPagoCxP
      LookupTable = DMTE.cdsQry4
      LookupField = 'USUARIO'
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      OnExit = dblcdCajeroExit
    end
    object dbeUsuNom: TwwDBEdit
      Left = 118
      Top = 39
      Width = 200
      Height = 21
      ReadOnly = True
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object BitBtn1: TBitBtn
      Left = 224
      Top = 88
      Width = 75
      Height = 25
      Caption = 'Aceptar'
      TabOrder = 2
      OnClick = BitBtn1Click
    end
  end
end

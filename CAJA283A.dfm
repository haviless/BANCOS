object FSelDocPagoServicio: TFSelDocPagoServicio
  Left = 507
  Top = 272
  Width = 762
  Height = 330
  Caption = 'Seleccionar Documento Pago Servicio'
  Color = clBtnFace
  Constraints.MaxHeight = 330
  Constraints.MaxWidth = 762
  Constraints.MinHeight = 330
  Constraints.MinWidth = 762
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 2
    Top = 4
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
  object dbgListDocPagoServicio: TwwDBGrid
    Left = 2
    Top = 33
    Width = 736
    Height = 223
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    ExportOptions.Delimiter = '|'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    KeyOptions = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    TabOrder = 0
    TitleAlignment = taLeftJustify
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = False
  end
  object btnAceptarDocPagoServicio: TButton
    Left = 657
    Top = 260
    Width = 76
    Height = 25
    Caption = 'Aceptar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnAceptarDocPagoServicioClick
  end
  object btnCancelarDocPagoServicio: TButton
    Left = 579
    Top = 260
    Width = 76
    Height = 25
    Caption = 'Cancelar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnCancelarDocPagoServicioClick
  end
  object seAno: TSpinEdit
    Left = 30
    Top = 4
    Width = 50
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 3
    Value = 2009
  end
  object seMes: TSpinEdit
    Left = 82
    Top = 4
    Width = 38
    Height = 22
    MaxValue = 12
    MinValue = 1
    TabOrder = 4
    Value = 12
  end
  object btnFiltrar: TButton
    Left = 128
    Top = 4
    Width = 75
    Height = 25
    Caption = 'Filtrar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = btnFiltrarClick
  end
end

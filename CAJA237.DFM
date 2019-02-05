object FCierreO: TFCierreO
  Left = 322
  Top = 244
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Cierre Operativo de Almacén'
  ClientHeight = 194
  ClientWidth = 414
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object Z2bbtnRegOk: TBitBtn
    Left = 344
    Top = 158
    Width = 30
    Height = 28
    Hint = 'Confirma Actualización'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = Z2bbtnRegOkClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000010000000000000000000
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
  object Z2bbtnRegCanc: TBitBtn
    Left = 376
    Top = 158
    Width = 30
    Height = 28
    Hint = 'Cancela Actualización'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = Z2bbtnRegCancClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000010000000000000000000
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
  object pcCierre: TPageControl
    Left = 0
    Top = 0
    Width = 414
    Height = 150
    ActivePage = tsCierre
    Align = alTop
    HotTrack = True
    TabOrder = 2
    object tsCierre: TTabSheet
      Caption = 'Cierre'
      object Bevel1: TBevel
        Left = 0
        Top = 0
        Width = 406
        Height = 120
        Align = alClient
        Shape = bsFrame
      end
      object Label1: TLabel
        Left = 17
        Top = 63
        Width = 57
        Height = 15
        Caption = 'Frecuencia'
      end
      object Label3: TLabel
        Left = 92
        Top = 63
        Width = 110
        Height = 15
        Caption = 'Ult. Fecha de Cerrada'
      end
      object Label4: TLabel
        Left = 220
        Top = 63
        Width = 102
        Height = 15
        Caption = 'Fecha Actual Cierre'
      end
      object pnlDA: TPanel
        Left = 5
        Top = 7
        Width = 543
        Height = 55
        BevelOuter = bvNone
        TabOrder = 0
        object lblCIA: TLabel
          Left = 13
          Top = 1
          Width = 49
          Height = 15
          Caption = 'Compañía'
        end
        object dbeCIA: TwwDBEdit
          Left = 66
          Top = 18
          Width = 331
          Height = 23
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dblcCIA: TwwDBLookupCombo
          Left = 8
          Top = 18
          Width = 53
          Height = 23
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'CIAID'#9'2'#9'Código'#9'F'
            'CIAABR'#9'15'#9'Abreviatura'#9'F')
          DataField = 'CIAID'
          LookupTable = DM1.cdsCia
          LookupField = 'CIAID'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          OnChange = dblcCIAChange
          OnExit = dblcCIAExit
          OnNotInList = dblcNotInList
        end
      end
      object dbeFrecu: TwwDBEdit
        Left = 15
        Top = 83
        Width = 56
        Height = 23
        DataField = 'CNSFRECU'
        Enabled = False
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeUltFec: TwwDBEdit
        Left = 92
        Top = 83
        Width = 105
        Height = 23
        DataField = 'CNSULTCIE'
        Enabled = False
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeActFec: TwwDBEdit
        Left = 220
        Top = 83
        Width = 105
        Height = 23
        Enabled = False
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
  end
end

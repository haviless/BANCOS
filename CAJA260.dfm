object FToolCheque: TFToolCheque
  Left = 234
  Top = 111
  Width = 800
  Height = 150
  Caption = 'Cheques'
  Color = 10207162
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCheque: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 116
    Align = alClient
    Color = 14869218
    TabOrder = 0
    object pgctrlOrigen: TPageControl
      Left = 1
      Top = 1
      Width = 790
      Height = 114
      ActivePage = tsPorPagar
      Align = alClient
      TabOrder = 0
      object tsPorPagar: TTabSheet
        Caption = 'Cheques por Pagar'
        object sbDisenoRep: TSpeedButton
          Left = 2
          Top = 64
          Width = 7
          Height = 22
          Flat = True
          OnClick = sbDisenoRepClick
        end
        object gbEstado1: TGroupBox
          Left = 287
          Top = 3
          Width = 120
          Height = 52
          Caption = 'Extorno de Cheque'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object bbtnExtorna: TBitBtn
            Left = 12
            Top = 17
            Width = 99
            Height = 28
            Hint = 'Extorno de Cheque'
            Caption = 'Extornar'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnClick = bbtnExtornaClick
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
        object GroupBox1: TGroupBox
          Left = 12
          Top = 38
          Width = 249
          Height = 43
          TabOrder = 1
          object Label3: TLabel
            Left = 12
            Top = 16
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
          object dblcBcoxPag: TwwDBLookupCombo
            Left = 65
            Top = 13
            Width = 50
            Height = 21
            DropDownAlignment = taLeftJustify
            LookupTable = DMTE.cdsBancoEgr
            LookupField = 'BANCOID'
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            PreciseEditRegion = False
            AllowClearKey = False
            OnEnter = dblcBcoxPagEnter
            OnExit = dblcBcoxPagExit
          end
          object edtBcoxPag: TwwDBEdit
            Left = 117
            Top = 13
            Width = 122
            Height = 21
            Enabled = False
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
        object Z2bbtnOrdenPago: TBitBtn
          Left = 468
          Top = 8
          Width = 97
          Height = 37
          Hint = 'Orden de Pago'
          Caption = 'O.de Pago'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = Z2bbtnOrdenPagoClick
          Glyph.Data = {
            56020000424D56020000000000007600000028000000200000001E0000000100
            040000000000E0010000C40E0000C40E00001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFF0078800FFFFFFFFFFFFFFFFFFFFFFF007
            77888800FFFFFFFFFFFFFFFFFFF007777800888800FFFFFFFFFFFFFFF0077778
            878800888800FFFFFFFFFFF00777788787888800888800FFFFFFFF0777788777
            8788888800888800FFFFFF877887777787888888880088880FFFFF8887777777
            87888888888800880FFFF8878777777787888888888888000FFFF8F78777777F
            887788888888888880FFF8F787777FF77788778888888888800FF8F7877FF777
            7777887788888888808FF8F78FF777997788778877888888808FF8FF8877AA77
            887777708877888880FFF88F778877887777700F7088778880FFFFF88F778888
            77700FFFF077887780FFFFFFF88F7788800FFFCCF7087788FFFFFFFFFFF88F77
            88FFCCFFFF0888FFFFFFFFFFFFFFF88F778FFFFCCF70FFFFFFFFFFFFFFFFFFF8
            8F8FFCCFFFF70FFFFFFFFFFFFFFFFFFFF888FFFFCCFF70FFFFFFFFFFFFFFFFFF
            FFFF8FFFFFCCFF700FFFFFFFFFFFFFFFFFFFF8FFCCFFFFF88FFFFFFFFFFFFFFF
            FFFFFF8FFFFFF88FFFFFFFFFFFFFFFFFFFFFFFF8FFF88FFFFFFFFFFFFFFFFFFF
            FFFFFFFF888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        end
        object GroupBox3: TGroupBox
          Left = 12
          Top = 0
          Width = 249
          Height = 43
          TabOrder = 3
          object Label4: TLabel
            Left = 11
            Top = 16
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
          object dblcCiaxPag: TwwDBLookupCombo
            Left = 65
            Top = 13
            Width = 50
            Height = 21
            DropDownAlignment = taLeftJustify
            LookupTable = DMTE.cdsCia
            LookupField = 'CIAID'
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            PreciseEditRegion = False
            AllowClearKey = False
            OnEnter = dblcCiaxPagEnter
            OnExit = dblcCiaxPagExit
            OnNotInList = dblcCiaxPagNotInList
          end
          object edtCiaxPag: TwwDBEdit
            Left = 117
            Top = 13
            Width = 122
            Height = 21
            Enabled = False
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
        object Z2bbtnSinEmitir: TBitBtn
          Left = 468
          Top = 48
          Width = 97
          Height = 37
          Hint = 'Orden de Pago'
          Caption = 'Sin Emitir'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = Z2bbtnSinEmitirClick
          Glyph.Data = {
            56020000424D56020000000000007600000028000000200000001E0000000100
            040000000000E0010000C40E0000C40E00001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFF0078800FFFFFFFFFFFFFFFFFFFFFFF007
            77888800FFFFFFFFFFFFFFFFFFF007777800888800FFFFFFFFFFFFFFF0077778
            878800888800FFFFFFFFFFF00777788787888800888800FFFFFFFF0777788777
            8788888800888800FFFFFF877887777787888888880088880FFFFF8887777777
            87888888888800880FFFF8878777777787888888888888000FFFF8F78777777F
            887788888888888880FFF8F787777FF77788778888888888800FF8F7877FF777
            7777887788888888808FF8F78FF777997788778877888888808FF8FF8877AA77
            887777708877888880FFF88F778877887777700F7088778880FFFFF88F778888
            77700FFFF077887780FFFFFFF88F7788800FFFCCF7087788FFFFFFFFFFF88F77
            88FFCCFFFF0888FFFFFFFFFFFFFFF88F778FFFFCCF70FFFFFFFFFFFFFFFFFFF8
            8F8FFCCFFFF70FFFFFFFFFFFFFFFFFFFF888FFFFCCFF70FFFFFFFFFFFFFFFFFF
            FFFF8FFFFFCCFF700FFFFFFFFFFFFFFFFFFFF8FFCCFFFFF88FFFFFFFFFFFFFFF
            FFFFFF8FFFFFF88FFFFFFFFFFFFFFFFFFFFFFFF8FFF88FFFFFFFFFFFFFFFFFFF
            FFFFFFFF888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        end
        object Z2bbtnEmitidos: TBitBtn
          Left = 569
          Top = 8
          Width = 97
          Height = 37
          Hint = 'Orden de Pago'
          Caption = 'Emitidos'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnClick = Z2bbtnEmitidosClick
          Glyph.Data = {
            56020000424D56020000000000007600000028000000200000001E0000000100
            040000000000E0010000C40E0000C40E00001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFF0078800FFFFFFFFFFFFFFFFFFFFFFF007
            77888800FFFFFFFFFFFFFFFFFFF007777800888800FFFFFFFFFFFFFFF0077778
            878800888800FFFFFFFFFFF00777788787888800888800FFFFFFFF0777788777
            8788888800888800FFFFFF877887777787888888880088880FFFFF8887777777
            87888888888800880FFFF8878777777787888888888888000FFFF8F78777777F
            887788888888888880FFF8F787777FF77788778888888888800FF8F7877FF777
            7777887788888888808FF8F78FF777997788778877888888808FF8FF8877AA77
            887777708877888880FFF88F778877887777700F7088778880FFFFF88F778888
            77700FFFF077887780FFFFFFF88F7788800FFFCCF7087788FFFFFFFFFFF88F77
            88FFCCFFFF0888FFFFFFFFFFFFFFF88F778FFFFCCF70FFFFFFFFFFFFFFFFFFF8
            8F8FFCCFFFF70FFFFFFFFFFFFFFFFFFFF888FFFFCCFF70FFFFFFFFFFFFFFFFFF
            FFFF8FFFFFCCFF700FFFFFFFFFFFFFFFFFFFF8FFCCFFFFF88FFFFFFFFFFFFFFF
            FFFFFF8FFFFFF88FFFFFFFFFFFFFFFFFFFFFFFF8FFF88FFFFFFFFFFFFFFFFFFF
            FFFFFFFF888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        end
        object BitBtn1: TBitBtn
          Left = 570
          Top = 48
          Width = 97
          Height = 37
          Hint = 'Orden de Pago'
          Caption = 'Total Ch.'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          OnClick = BitBtn1Click
          Glyph.Data = {
            56020000424D56020000000000007600000028000000200000001E0000000100
            040000000000E0010000C40E0000C40E00001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFF0078800FFFFFFFFFFFFFFFFFFFFFFF007
            77888800FFFFFFFFFFFFFFFFFFF007777800888800FFFFFFFFFFFFFFF0077778
            878800888800FFFFFFFFFFF00777788787888800888800FFFFFFFF0777788777
            8788888800888800FFFFFF877887777787888888880088880FFFFF8887777777
            87888888888800880FFFF8878777777787888888888888000FFFF8F78777777F
            887788888888888880FFF8F787777FF77788778888888888800FF8F7877FF777
            7777887788888888808FF8F78FF777997788778877888888808FF8FF8877AA77
            887777708877888880FFF88F778877887777700F7088778880FFFFF88F778888
            77700FFFF077887780FFFFFFF88F7788800FFFCCF7087788FFFFFFFFFFF88F77
            88FFCCFFFF0888FFFFFFFFFFFFFFF88F778FFFFCCF70FFFFFFFFFFFFFFFFFFF8
            8F8FFCCFFFF70FFFFFFFFFFFFFFFFFFFF888FFFFCCFF70FFFFFFFFFFFFFFFFFF
            FFFF8FFFFFCCFF700FFFFFFFFFFFFFFFFFFFF8FFCCFFFFF88FFFFFFFFFFFFFFF
            FFFFFF8FFFFFF88FFFFFFFFFFFFFFFFFFFFFFFF8FFF88FFFFFFFFFFFFFFFFFFF
            FFFFFFFF888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        end
        object bbtnAnulados: TBitBtn
          Left = 672
          Top = 48
          Width = 97
          Height = 37
          Hint = 'Orden de Pago'
          Caption = 'Anulados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          Glyph.Data = {
            56020000424D56020000000000007600000028000000200000001E0000000100
            040000000000E0010000C40E0000C40E00001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFF0078800FFFFFFFFFFFFFFFFFFFFFFF007
            77888800FFFFFFFFFFFFFFFFFFF007777800888800FFFFFFFFFFFFFFF0077778
            878800888800FFFFFFFFFFF00777788787888800888800FFFFFFFF0777788777
            8788888800888800FFFFFF877887777787888888880088880FFFFF8887777777
            87888888888800880FFFF8878777777787888888888888000FFFF8F78777777F
            887788888888888880FFF8F787777FF77788778888888888800FF8F7877FF777
            7777887788888888808FF8F78FF777997788778877888888808FF8FF8877AA77
            887777708877888880FFF88F778877887777700F7088778880FFFFF88F778888
            77700FFFF077887780FFFFFFF88F7788800FFFCCF7087788FFFFFFFFFFF88F77
            88FFCCFFFF0888FFFFFFFFFFFFFFF88F778FFFFCCF70FFFFFFFFFFFFFFFFFFF8
            8F8FFCCFFFF70FFFFFFFFFFFFFFFFFFFF888FFFFCCFF70FFFFFFFFFFFFFFFFFF
            FFFF8FFFFFCCFF700FFFFFFFFFFFFFFFFFFFF8FFCCFFFFF88FFFFFFFFFFFFFFF
            FFFFFF8FFFFFF88FFFFFFFFFFFFFFFFFFFFFFFF8FFF88FFFFFFFFFFFFFFFFFFF
            FFFFFFFF888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        end
        object cbDisenoRep: TCheckBox
          Left = 675
          Top = 16
          Width = 97
          Height = 17
          Caption = 'cbDisenoRep'
          Enabled = False
          TabOrder = 8
          Visible = False
        end
      end
      object tsPorCobrar: TTabSheet
        Caption = 'Cheques por Cobrar en Bancos'
        ImageIndex = 1
        OnShow = tsPorCobrarShow
        object gbEstado: TGroupBox
          Left = 488
          Top = 0
          Width = 276
          Height = 90
          Caption = 'Cambiar Estado'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object Label2: TLabel
            Left = 10
            Top = 19
            Width = 30
            Height = 15
            Caption = 'Fecha'
          end
          object Label6: TLabel
            Left = 10
            Top = 43
            Width = 111
            Height = 15
            Caption = 'Motivo de Devoluci'#243'n'
          end
          object bbtnCobrado: TBitBtn
            Left = 198
            Top = 24
            Width = 70
            Height = 23
            Caption = 'Cobrado'
            TabOrder = 2
            OnClick = bbtnCobradoClick
          end
          object bbtnDevuelto: TBitBtn
            Left = 198
            Top = 58
            Width = 70
            Height = 23
            Caption = 'Devuelto'
            TabOrder = 3
            OnClick = bbtnDevueltoClick
          end
          object FecCheque: TwwDBDateTimePicker
            Left = 44
            Top = 16
            Width = 89
            Height = 23
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            Epoch = 1950
            ShowButton = True
            TabOrder = 0
          end
          object dblcMotDevChq: TwwDBLookupCombo
            Left = 11
            Top = 59
            Width = 50
            Height = 23
            DropDownAlignment = taLeftJustify
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 1
            AutoDropDown = False
            ShowButton = True
            PreciseEditRegion = False
            AllowClearKey = False
            OnExit = dblcMotDevChqExit
          end
          object edtMotDevChq: TwwDBEdit
            Left = 62
            Top = 59
            Width = 122
            Height = 23
            Enabled = False
            TabOrder = 4
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
        object GroupBox2: TGroupBox
          Left = 249
          Top = 0
          Width = 233
          Height = 90
          Caption = 'Seleccionar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object Label1: TLabel
            Left = 10
            Top = 12
            Width = 127
            Height = 15
            Caption = 'Banco Emisor del Cheque'
          end
          object lblEstado: TLabel
            Left = 10
            Top = 48
            Width = 34
            Height = 15
            Caption = 'Estado'
          end
          object dblcBanco: TwwDBLookupCombo
            Left = 10
            Top = 25
            Width = 50
            Height = 23
            DropDownAlignment = taLeftJustify
            LookupTable = DMTE.cdsBancoEgr
            LookupField = 'BANCOID'
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            PreciseEditRegion = False
            AllowClearKey = False
            OnEnter = dblcBancoEnter
            OnExit = dblcBancoExit
          end
          object edtBanco: TwwDBEdit
            Left = 61
            Top = 25
            Width = 122
            Height = 23
            Enabled = False
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object bbtnOk: TBitBtn
            Left = 199
            Top = 26
            Width = 24
            Height = 26
            TabOrder = 2
            OnClick = bbtnOkClick
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
          object dblcEstado: TwwDBLookupCombo
            Left = 10
            Top = 62
            Width = 102
            Height = 23
            DropDownAlignment = taLeftJustify
            TabOrder = 3
            AutoDropDown = False
            ShowButton = True
            PreciseEditRegion = False
            AllowClearKey = False
          end
        end
        object GroupBox4: TGroupBox
          Left = 0
          Top = 0
          Width = 243
          Height = 89
          TabOrder = 0
          object Label5: TLabel
            Left = 13
            Top = 9
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
          object Label9: TLabel
            Left = 12
            Top = 48
            Width = 99
            Height = 13
            Caption = 'Banco Transferencia'
          end
          object dblcCiaxCob: TwwDBLookupCombo
            Left = 12
            Top = 24
            Width = 50
            Height = 21
            DropDownAlignment = taLeftJustify
            LookupTable = DMTE.cdsCia
            LookupField = 'CIAID'
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            PreciseEditRegion = False
            AllowClearKey = False
            OnEnter = dblcCiaxCobEnter
            OnExit = dblcCiaxCobExit
          end
          object edtCiaxCob: TwwDBEdit
            Left = 64
            Top = 23
            Width = 165
            Height = 21
            Enabled = False
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dblcBancoDest: TwwDBLookupCombo
            Left = 12
            Top = 61
            Width = 50
            Height = 21
            DropDownAlignment = taLeftJustify
            LookupTable = DMTE.cdsBancoEgr
            LookupField = 'BANCOID'
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 2
            AutoDropDown = False
            ShowButton = True
            PreciseEditRegion = False
            AllowClearKey = False
            OnExit = dblcBancoDestExit
          end
          object edtBcoDescDest: TwwDBEdit
            Left = 63
            Top = 61
            Width = 165
            Height = 21
            Enabled = False
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
      end
      object tsPorCobrarCaja: TTabSheet
        Caption = 'Cheques por Cobrar en Caja'
        ImageIndex = 2
        OnShow = tsPorCobrarCajaShow
        object GroupBox5: TGroupBox
          Left = 0
          Top = 0
          Width = 243
          Height = 89
          TabOrder = 0
          object Label7: TLabel
            Left = 17
            Top = 10
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
          object Label12: TLabel
            Left = 16
            Top = 49
            Width = 21
            Height = 13
            Caption = 'Caja'
          end
          object dblcCiaCaja: TwwDBLookupCombo
            Left = 12
            Top = 25
            Width = 50
            Height = 21
            DropDownAlignment = taLeftJustify
            LookupTable = DMTE.cdsCia
            LookupField = 'CIAID'
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            PreciseEditRegion = False
            AllowClearKey = False
            OnExit = dblcCiaCajaExit
          end
          object edtCiaCaja: TwwDBEdit
            Left = 64
            Top = 24
            Width = 167
            Height = 21
            Enabled = False
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dblcCajaDest: TwwDBLookupCombo
            Left = 12
            Top = 62
            Width = 50
            Height = 21
            DropDownAlignment = taLeftJustify
            LookupTable = DMTE.cdsQry3
            LookupField = 'BANCOID'
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 2
            AutoDropDown = False
            ShowButton = True
            PreciseEditRegion = False
            AllowClearKey = False
            OnExit = dblcCajaDestExit
          end
          object edtCajaDest: TwwDBEdit
            Left = 63
            Top = 62
            Width = 167
            Height = 21
            Enabled = False
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
        object GroupBox6: TGroupBox
          Left = 249
          Top = 0
          Width = 233
          Height = 68
          Caption = 'Seleccionar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object Label8: TLabel
            Left = 12
            Top = 18
            Width = 127
            Height = 15
            Caption = 'Banco Emisor del Cheque'
          end
          object dblcBancoCaja: TwwDBLookupCombo
            Left = 10
            Top = 34
            Width = 50
            Height = 23
            DropDownAlignment = taLeftJustify
            LookupTable = DMTE.cdsBancoEgr
            LookupField = 'BANCOID'
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            PreciseEditRegion = False
            AllowClearKey = False
            OnExit = dblcBancoCajaExit
          end
          object edtBcoNomCaja: TwwDBEdit
            Left = 61
            Top = 34
            Width = 122
            Height = 23
            Enabled = False
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object bbtnAceptarCaja: TBitBtn
            Left = 199
            Top = 28
            Width = 24
            Height = 26
            TabOrder = 2
            OnClick = bbtnAceptarCajaClick
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
        object GroupBox7: TGroupBox
          Left = 488
          Top = 0
          Width = 276
          Height = 90
          Caption = 'Cambiar Estado'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object Label10: TLabel
            Left = 10
            Top = 21
            Width = 30
            Height = 15
            Caption = 'Fecha'
          end
          object Label11: TLabel
            Left = 10
            Top = 44
            Width = 111
            Height = 15
            Caption = 'Motivo de Devoluci'#243'n'
          end
          object bbtnDevueltoCaja: TBitBtn
            Left = 198
            Top = 57
            Width = 70
            Height = 23
            Caption = 'Devuelto'
            TabOrder = 2
            OnClick = bbtnDevueltoCajaClick
          end
          object FecChequeCaja: TwwDBDateTimePicker
            Left = 44
            Top = 18
            Width = 89
            Height = 23
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            Epoch = 1950
            ShowButton = True
            TabOrder = 0
          end
          object dblcMotDevChqCaja: TwwDBLookupCombo
            Left = 11
            Top = 60
            Width = 50
            Height = 23
            DropDownAlignment = taLeftJustify
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 1
            AutoDropDown = False
            ShowButton = True
            PreciseEditRegion = False
            AllowClearKey = False
            OnExit = dblcMotDevChqCajaExit
          end
          object edtMotDevChqCaja: TwwDBEdit
            Left = 62
            Top = 60
            Width = 122
            Height = 23
            Enabled = False
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object Z2bbtnCambiaFV: TBitBtn
            Left = 167
            Top = 21
            Width = 100
            Height = 23
            Caption = 'F.Vencimiento'
            TabOrder = 4
            OnClick = Z2bbtnCambiaFVClick
          end
        end
      end
    end
  end
  object ppdbCheques: TppDBPipeline
    DataSource = DMTE.dsSQL
    UserName = 'dbCheques'
    Left = 373
    Top = 87
  end
  object pprCheques: TppReport
    AutoStop = False
    DataPipeline = ppdbCheques
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 341
    Top = 87
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbCheques'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
  object ppd1: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppRptCheque
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 309
    Top = 87
  end
  object dbpCheque: TppDBPipeline
    DataSource = DMTE.dsQry2
    UserName = 'dbpCheque'
    Left = 757
    Top = 4
    object ppField1: TppField
      FieldAlias = 'SRV_RUTA'
      FieldName = 'SRV_RUTA'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppField2: TppField
      FieldAlias = 'SRV_DB'
      FieldName = 'SRV_DB'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object ppField3: TppField
      FieldAlias = 'SRV_VERS'
      FieldName = 'SRV_VERS'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object ppField4: TppField
      FieldAlias = 'SRV_EQUIP'
      FieldName = 'SRV_EQUIP'
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
    object ppField5: TppField
      FieldAlias = 'SRV_PRESU'
      FieldName = 'SRV_PRESU'
      FieldLength = 1
      DisplayWidth = 1
      Position = 4
    end
    object ppField6: TppField
      FieldAlias = 'DIFCAMBIO'
      FieldName = 'DIFCAMBIO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 5
    end
    object ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'DECPU_OC'
      FieldName = 'DECPU_OC'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 6
    end
    object ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'NDIG_PROV'
      FieldName = 'NDIG_PROV'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 7
    end
    object ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'NDIG_ARTIC'
      FieldName = 'NDIG_ARTIC'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 8
    end
    object ppField10: TppField
      FieldAlias = 'NISA_IGV'
      FieldName = 'NISA_IGV'
      FieldLength = 1
      DisplayWidth = 1
      Position = 9
    end
    object ppField11: TppField
      FieldAlias = 'ACFCTAS1'
      FieldName = 'ACFCTAS1'
      FieldLength = 20
      DisplayWidth = 20
      Position = 10
    end
    object ppField12: TppField
      FieldAlias = 'ACFCTAS2'
      FieldName = 'ACFCTAS2'
      FieldLength = 20
      DisplayWidth = 20
      Position = 11
    end
    object ppField13: TppField
      FieldAlias = 'RQSCOMP'
      FieldName = 'RQSCOMP'
      FieldLength = 2
      DisplayWidth = 2
      Position = 12
    end
    object ppField14: TppField
      FieldAlias = 'RPTCIA'
      FieldName = 'RPTCIA'
      FieldLength = 12
      DisplayWidth = 12
      Position = 13
    end
    object ppField15: TppField
      FieldAlias = 'URQCIA'
      FieldName = 'URQCIA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 14
    end
    object ppField16: TppField
      FieldAlias = 'CTRL_PCG'
      FieldName = 'CTRL_PCG'
      FieldLength = 1
      DisplayWidth = 1
      Position = 15
    end
    object ppField17: TppField
      FieldAlias = 'EXOVIS'
      FieldName = 'EXOVIS'
      FieldLength = 1
      DisplayWidth = 1
      Position = 16
    end
    object ppField18: TppField
      FieldAlias = 'NEGCIA'
      FieldName = 'NEGCIA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 17
    end
    object ppField19: TppField
      FieldAlias = 'AMEDIDAOPC'
      FieldName = 'AMEDIDAOPC'
      FieldLength = 15
      DisplayWidth = 15
      Position = 18
    end
    object ppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'RQSCONSUMO'
      FieldName = 'RQSCONSUMO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 19
    end
  end
  object ppRptCheque: TppReport
    AutoStop = False
    DataPipeline = dbpCheque
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A3 transversal - 297 x 420 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 11350
    PrinterSetup.mmMarginLeft = 1000
    PrinterSetup.mmMarginRight = 1000
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279100
    PrinterSetup.mmPaperWidth = 220500
    PrinterSetup.PaperSize = 256
    Template.FileName = 'C:\SOLExes\SOLFormatos\Caja\BHL\ORD. DE PAGO.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 726
    Top = 4
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'dbpCheque'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 35983
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Cia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 2117
        mmTop = 29633
        mmWidth = 3969
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = '# orden'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 8202
        mmTop = 25400
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'de Pago'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 7938
        mmTop = 29633
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Corriente'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 26723
        mmTop = 29633
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Cheque'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 46038
        mmTop = 29633
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Numero'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 45508
        mmTop = 25400
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Cuenta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 28310
        mmTop = 25400
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Monto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 107156
        mmTop = 29633
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Mon'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 116946
        mmTop = 29633
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Fecha de'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 123561
        mmTop = 25400
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Emisi'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 123825
        mmTop = 29633
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Portador'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 144727
        mmTop = 29633
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Descripci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 75671
        mmTop = 29633
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Observaci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 186002
        mmTop = 29633
        mmWidth = 15081
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 0
        mmTop = 33867
        mmWidth = 218546
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'CIAID'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 3704
        mmTop = 5027
        mmWidth = 4498
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'RAZ_SOC_COMPANIA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 10319
        mmTop = 5027
        mmWidth = 72761
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'REPORTE DE CHEQUES CONFIRMADOS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 71438
        mmTop = 11113
        mmWidth = 57679
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Fecha :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 176742
        mmTop = 5556
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Hora :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 176742
        mmTop = 10583
        mmWidth = 7673
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 186796
        mmTop = 5821
        mmWidth = 14288
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 189971
        mmTop = 10319
        mmWidth = 11113
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageSetDesc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 176742
        mmTop = 14817
        mmWidth = 16404
        BandType = 0
      end
      object pplblSubTitulo: TppLabel
        UserName = 'lblSubTitulo'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 67204
        mmTop = 15610
        mmWidth = 86254
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'ECNOCOMP'
        DataPipeline = dbpCheque
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbpCheque'
        mmHeight = 2910
        mmLeft = 6085
        mmTop = 794
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'CIAID'
        DataPipeline = dbpCheque
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbpCheque'
        mmHeight = 2910
        mmLeft = 794
        mmTop = 794
        mmWidth = 4233
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'CCBCOID'
        DataPipeline = dbpCheque
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbpCheque'
        mmHeight = 2910
        mmLeft = 23283
        mmTop = 794
        mmWidth = 20108
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'ECNOCHQ'
        DataPipeline = dbpCheque
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbpCheque'
        mmHeight = 2910
        mmLeft = 43921
        mmTop = 794
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'PROV'
        DataPipeline = dbpCheque
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbpCheque'
        mmHeight = 2910
        mmLeft = 57415
        mmTop = 794
        mmWidth = 7673
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'AUXNOMB'
        DataPipeline = dbpCheque
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbpCheque'
        mmHeight = 2910
        mmLeft = 65881
        mmTop = 794
        mmWidth = 37042
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'ECMTOORI'
        DataPipeline = dbpCheque
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbpCheque'
        mmHeight = 2910
        mmLeft = 103188
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'TMONID'
        DataPipeline = dbpCheque
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'dbpCheque'
        mmHeight = 2910
        mmLeft = 118534
        mmTop = 794
        mmWidth = 3440
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'ECFEMICH'
        DataPipeline = dbpCheque
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbpCheque'
        mmHeight = 2910
        mmLeft = 122238
        mmTop = 794
        mmWidth = 13494
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'ECGIRA'
        DataPipeline = dbpCheque
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbpCheque'
        mmHeight = 2910
        mmLeft = 136261
        mmTop = 794
        mmWidth = 37042
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'ECGLOSA'
        DataPipeline = dbpCheque
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbpCheque'
        mmHeight = 2910
        mmLeft = 173832
        mmTop = 794
        mmWidth = 44450
        BandType = 4
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 11642
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataPipeline = dbpCheque
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'dbpCheque'
        mmHeight = 3704
        mmLeft = 42333
        mmTop = 3175
        mmWidth = 17198
        BandType = 7
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Total de Registros :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 5556
        mmTop = 3175
        mmWidth = 28310
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataPipeline = dbpCheque
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbpCheque'
        mmHeight = 2910
        mmLeft = 101071
        mmTop = 3175
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataPipeline = dbpCheque
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbpCheque'
        mmHeight = 2910
        mmLeft = 101071
        mmTop = 8202
        mmWidth = 17198
        BandType = 7
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'Nuevos Soles'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 73025
        mmTop = 3175
        mmWidth = 17727
        BandType = 7
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'Dolares'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 73025
        mmTop = 8202
        mmWidth = 10319
        BandType = 7
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 0
        mmTop = 265
        mmWidth = 218546
        BandType = 7
      end
      object pplblTotMN: TppLabel
        UserName = 'lblTotMN'
        Caption = 'lblTotMN'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 121973
        mmTop = 3175
        mmWidth = 10054
        BandType = 7
      end
      object pplblTotME: TppLabel
        UserName = 'lblTotME'
        Caption = 'lblTotME'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 122238
        mmTop = 8467
        mmWidth = 9790
        BandType = 7
      end
    end
  end
end

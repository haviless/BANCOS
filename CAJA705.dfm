object FToolConciliacion: TFToolConciliacion
  Left = 286
  Top = 238
  Width = 696
  Height = 92
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pnl: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 65
    Align = alClient
    Color = 14869218
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 80
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Plantilla'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 200
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Transferencia'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 312
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Conciliaci'#243'n'
      TabOrder = 2
      Visible = False
      OnClick = BitBtn3Click
    end
  end
end

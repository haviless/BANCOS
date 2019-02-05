object FToolConta: TFToolConta
  Left = 217
  Top = 212
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  AutoScroll = False
  AutoSize = True
  Caption = 'Contabilizaci'#243'n'
  ClientHeight = 41
  ClientWidth = 536
  Color = 10207162
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
  object pnlConta: TPanel
    Left = 0
    Top = 0
    Width = 536
    Height = 41
    Align = alTop
    Color = 10207162
    TabOrder = 0
    object z2bbtnConta: TfcShapeBtn
      Left = 501
      Top = 6
      Width = 32
      Height = 31
      Hint = 'Proceso de Contabilizaci'#243'n'
      Color = 10207162
      DitherColor = clWhite
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
        73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
        0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
        0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
        0333337F777777737F333308888888880333337F333333337F33330888888888
        03333373FFFFFFFF733333700000000073333337777777773333}
      NumGlyphs = 2
      Options = [boFocusable]
      ParentClipping = True
      ParentShowHint = False
      RoundRectBias = 25
      ShadeStyle = fbsHighlight
      Shape = bsEllipse
      ShowHint = True
      TabOrder = 0
      TabStop = True
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      OnClick = z2bbtnContaClick
    end
    object z2bbtnCre: TfcShapeBtn
      Left = 8
      Top = 6
      Width = 57
      Height = 31
      Hint = 'Mov. de Cr'#233'ditos'
      Caption = 'Cr'#233'dito'
      Color = 10207162
      DitherColor = clWhite
      NumGlyphs = 2
      Options = [boFocusable]
      ParentClipping = True
      ParentShowHint = False
      RoundRectBias = 25
      ShadeStyle = fbsHighlight
      Shape = bsEllipse
      ShowHint = True
      TabOrder = 1
      TabStop = True
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      OnClick = z2bbtnCreClick
    end
    object z2bbtnCob: TfcShapeBtn
      Left = 77
      Top = 6
      Width = 57
      Height = 31
      Hint = 'Mov. de Cobranza'
      Caption = 'Cobranza'
      Color = 10207162
      DitherColor = clWhite
      NumGlyphs = 2
      Options = [boFocusable]
      ParentClipping = True
      ParentShowHint = False
      RoundRectBias = 25
      ShadeStyle = fbsHighlight
      Shape = bsEllipse
      ShowHint = True
      TabOrder = 2
      TabStop = True
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      OnClick = z2bbtnCobClick
    end
    object z2bbtnApo: TfcShapeBtn
      Left = 147
      Top = 6
      Width = 57
      Height = 31
      Hint = 'Mov. de Aportes'
      Caption = 'Aportes'
      Color = 10207162
      DitherColor = clWhite
      NumGlyphs = 2
      Options = [boFocusable]
      ParentClipping = True
      ParentShowHint = False
      RoundRectBias = 25
      ShadeStyle = fbsHighlight
      Shape = bsEllipse
      ShowHint = True
      TabOrder = 3
      TabStop = True
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      OnClick = z2bbtnApoClick
    end
    object z2bbtnPre: TfcShapeBtn
      Left = 216
      Top = 6
      Width = 57
      Height = 31
      Hint = 'Mov. de Previsi'#243'n'
      Caption = 'Previsi'#243'n'
      Color = 10207162
      DitherColor = clWhite
      NumGlyphs = 2
      Options = [boFocusable]
      ParentClipping = True
      ParentShowHint = False
      RoundRectBias = 25
      ShadeStyle = fbsHighlight
      Shape = bsEllipse
      ShowHint = True
      TabOrder = 4
      TabStop = True
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      OnClick = z2bbtnPreClick
    end
  end
end

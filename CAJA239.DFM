object FToolCJA1: TFToolCJA1
  Left = 26
  Top = 140
  Width = 786
  Height = 70
  BorderIcons = [biSystemMenu]
  Caption = 'FToolCJA1'
  Color = clMenu
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 15
  object cb1: TControlBar
    Left = 0
    Top = 0
    Width = 778
    Height = 38
    Align = alTop
    Color = clMenu
    ParentColor = False
    TabOrder = 0
    object spbAct: TSpeedButton
      Left = 552
      Top = 2
      Width = 110
      Height = 22
      GroupIndex = 1
      Caption = 'Actualizac.General'
    end
    object spbNor: TSpeedButton
      Left = 429
      Top = 2
      Width = 110
      Height = 22
      GroupIndex = 1
      Caption = 'Normal'
    end
    object ToolBar2: TToolBar
      Left = 11
      Top = 2
      Width = 405
      Height = 48
      Align = alClient
      TabOrder = 0
      object spb1: TSpeedButton
        Left = 0
        Top = 2
        Width = 145
        Height = 22
        GroupIndex = 1
        Caption = 'Parametros de reposición'
      end
      object spb2: TSpeedButton
        Left = 145
        Top = 2
        Width = 145
        Height = 22
        GroupIndex = 1
        Caption = 'Actualización de Ubicación'
      end
      object spb3: TSpeedButton
        Left = 290
        Top = 2
        Width = 110
        Height = 22
        GroupIndex = 1
        Caption = 'Saldos Iniciales'
      end
    end
  end
end

object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 379
  ClientWidth = 758
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object TabControl1: TTabControl
    Left = 8
    Top = 8
    Width = 737
    Height = 363
    TabOrder = 0
    Tabs.Strings = (
      'Database'
      'Colours')
    TabIndex = 1
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 737
    Height = 363
    ActivePage = TabSheet1
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object Button1: TButton
        Left = 632
        Top = 7
        Width = 81
        Height = 41
        Caption = 'Search for date abnormaitites'
        TabOrder = 0
        WordWrap = True
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 632
        Top = 62
        Width = 81
        Height = 41
        Caption = 'Delete date abnormalities'
        TabOrder = 1
        WordWrap = True
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 632
        Top = 120
        Width = 81
        Height = 65
        Caption = 'Search for user/employee username overlap'
        TabOrder = 2
        WordWrap = True
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 632
        Top = 200
        Width = 81
        Height = 41
        Caption = 'Find Category Totals'
        TabOrder = 3
        WordWrap = True
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 632
        Top = 256
        Width = 81
        Height = 32
        Caption = 'Total Items'
        TabOrder = 4
        OnClick = Button5Click
      end
      object DBGrid1: TDBGrid
        Left = 3
        Top = 7
        Width = 609
        Height = 281
        DataSource = DataModule3.DataSource1
        TabOrder = 5
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Button6: TButton
        Left = 24
        Top = 174
        Width = 75
        Height = 25
        Caption = 'Button6'
        TabOrder = 0
        OnClick = Button6Click
      end
      object ComboBox1: TComboBox
        Left = 24
        Top = 21
        Width = 145
        Height = 21
        TabOrder = 1
        Items.Strings = (
          'darken'
          'lighten')
      end
      object Edit1: TEdit
        Left = 24
        Top = 63
        Width = 121
        Height = 21
        TabOrder = 2
      end
      object Edit2: TEdit
        Left = 177
        Top = 63
        Width = 121
        Height = 21
        TabOrder = 3
      end
      object Panel1: TPanel
        Left = 24
        Top = 104
        Width = 121
        Height = 41
        Caption = 'Panel1'
        ParentBackground = False
        TabOrder = 4
      end
      object Panel2: TPanel
        Left = 177
        Top = 104
        Width = 121
        Height = 41
        Caption = 'Panel2'
        ParentBackground = False
        TabOrder = 5
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'TabSheet3'
      ImageIndex = 2
      object Button7: TButton
        Left = 328
        Top = 152
        Width = 75
        Height = 25
        Caption = 'Button7'
        TabOrder = 0
        OnClick = Button7Click
      end
      object Panel3: TPanel
        Left = 80
        Top = 32
        Width = 185
        Height = 41
        Caption = 'Panel3'
        TabOrder = 1
      end
    end
  end
end

object Form1: TForm1
  Left = 305
  Top = 247
  Width = 416
  Height = 233
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = BcBarMainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 20
    Width = 389
    Height = 57
    AutoSize = False
    BiDiMode = bdRightToLeftNoAlign
    Caption = 
      'This example demonstrates how to change font in menuitems while ' +
      'preserving the default drawing of the menuitems.'
    ParentBiDiMode = False
    WordWrap = True
  end
  object Label2: TLabel
    Left = 8
    Top = 76
    Width = 389
    Height = 57
    AutoSize = False
    BiDiMode = bdRightToLeftNoAlign
    Caption = 
      'Look the Favourites menu. All items within it have a custom font' +
      '.'
    ParentBiDiMode = False
    WordWrap = True
  end
  object BcBarMainMenu1: TBcBarMainMenu
    OwnerDraw = True
    Bar.Visible = False
    Bar.BarCaption.Font.Charset = DEFAULT_CHARSET
    Bar.BarCaption.Font.Color = clWhite
    Bar.BarCaption.Font.Height = -19
    Bar.BarCaption.Font.Name = 'Tahoma'
    Bar.BarCaption.Font.Style = [fsBold, fsItalic]
    Separators.Fade = True
    Separators.Font.Charset = DEFAULT_CHARSET
    Separators.Font.Color = clWindowText
    Separators.Font.Height = -11
    Separators.Font.Name = 'MS Sans Serif'
    Separators.Font.Style = []
    Separators.SeparatorStyle = ssShortLine
    Separators.UseSystemFont = False
    MenuFont.Charset = DEFAULT_CHARSET
    MenuFont.Color = clWindowText
    MenuFont.Height = -11
    MenuFont.Name = 'MS Sans Serif'
    MenuFont.Style = []
    DrawModule = BcCustomDrawModule1
    Left = 12
    Top = 12
    object mnuFile: TMenuItem
      Caption = 'File'
      object FileItem11: TMenuItem
        Caption = 'New'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Open1: TMenuItem
        Caption = 'Open'
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Save1: TMenuItem
        Caption = 'Save'
      end
      object SaveAs1: TMenuItem
        Caption = 'Save As...'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object FileItem21: TMenuItem
        Caption = 'Exit'
        OnClick = FileItem21Click
      end
    end
    object mnuFavourites: TMenuItem
      Caption = 'Favourites'
      object MyComputer1: TMenuItem
        Caption = 'My Computer'
      end
      object BooksFolder1: TMenuItem
        Caption = 'Books Folder'
      end
      object Googlecom1: TMenuItem
        Caption = 'Google.com'
      end
      object Borlandcom1: TMenuItem
        Caption = 'Borland.com'
      end
      object Notepad1: TMenuItem
        Caption = 'Notepad'
      end
      object InternetExplorer1: TMenuItem
        Caption = 'Internet Explorer'
      end
      object Outlook1: TMenuItem
        Caption = 'Outlook'
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object More1: TMenuItem
        Tag = 1
        Caption = 'More'
        object WithDefaultFont1: TMenuItem
          Caption = 'These Items'
        end
        object AreWithDefaultFont1: TMenuItem
          Caption = 'Are With Default Font'
        end
        object BecauseWeCheckOnly1: TMenuItem
          Caption = 'Because We Check Only'
        end
        object ForItemsWhichAre1: TMenuItem
          Caption = 'For Items Which Are'
        end
        object DirectlyAtTheFavourites1: TMenuItem
          Caption = 'Directly At The Favourites'
        end
        object Menu1: TMenuItem
          Caption = 'Menu.'
        end
        object HoweverTheMore1: TMenuItem
          Caption = 'However The '#39'More'#39' Item Is'
        end
        object WithDefaultFontAsWellBecause1: TMenuItem
          Caption = 'With Default Font As Well Because'
        end
        object ItHasTagValueOfNonzero1: TMenuItem
          Caption = 'It Has Tag Value Of Nonzero.'
        end
      end
    end
  end
  object BcCustomDrawModule1: TBcCustomDrawModule
    OnDrawMenuItem = BcCustomDrawModule1DrawMenuItem
    OnMeasureMenuItem = BcCustomDrawModule1MeasureMenuItem
    Left = 44
    Top = 12
  end
end

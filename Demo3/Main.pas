unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, BarMenus, BcDrawModule, BcCustomDrawModule, StdCtrls;

type
  TForm1 = class(TForm)
    BcBarMainMenu1: TBcBarMainMenu;
    mnuFile: TMenuItem;
    mnuFavourites: TMenuItem;
    FileItem11: TMenuItem;
    FileItem21: TMenuItem;
    Open1: TMenuItem;
    N1: TMenuItem;
    Save1: TMenuItem;
    SaveAs1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    MyComputer1: TMenuItem;
    BooksFolder1: TMenuItem;
    Googlecom1: TMenuItem;
    Borlandcom1: TMenuItem;
    Notepad1: TMenuItem;
    InternetExplorer1: TMenuItem;
    Outlook1: TMenuItem;
    BcCustomDrawModule1: TBcCustomDrawModule;
    Label1: TLabel;
    Label2: TLabel;
    N4: TMenuItem;
    More1: TMenuItem;
    WithDefaultFont1: TMenuItem;
    AreWithDefaultFont1: TMenuItem;
    BecauseWeCheckOnly1: TMenuItem;
    ForItemsWhichAre1: TMenuItem;
    DirectlyAtTheFavourites1: TMenuItem;
    Menu1: TMenuItem;
    HoweverTheMore1: TMenuItem;
    WithDefaultFontAsWellBecause1: TMenuItem;
    ItHasTagValueOfNonzero1: TMenuItem;
    procedure BcCustomDrawModule1DrawMenuItem(Sender: TObject;
      AMenuItem: TMenuItem; ACanvas: TCanvas; ARect: TRect;
      State: TOwnerDrawState; ABarVisible: Boolean;
      var DefaultDraw: Boolean);
    procedure BcCustomDrawModule1MeasureMenuItem(Sender: TObject;
      AMenuItem: TMenuItem; ACanvas: TCanvas; var Width, Height: Integer;
      ABarVisible: Boolean; var DefaultMeasure: Boolean);
    procedure FileItem21Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.BcCustomDrawModule1DrawMenuItem(Sender: TObject;
  AMenuItem: TMenuItem; ACanvas: TCanvas; ARect: TRect;
  State: TOwnerDrawState; ABarVisible: Boolean; var DefaultDraw: Boolean);
begin
  if (AMenuItem.Parent = mnuFavourites) and (AMenuItem.Tag = 0) then
  begin
    ACanvas.Font.Name := 'Arial';
    ACanvas.Font.Size := 18;
    ACanvas.Font.Style := [fsBold];
  end else
  begin
    ACanvas.Font.Assign(Screen.MenuFont);
  end;
  DefaultDraw := True;
end;

procedure TForm1.BcCustomDrawModule1MeasureMenuItem(Sender: TObject;
  AMenuItem: TMenuItem; ACanvas: TCanvas; var Width, Height: Integer;
  ABarVisible: Boolean; var DefaultMeasure: Boolean);
begin
  if (AMenuItem.Parent = mnuFavourites) and (AMenuItem.Tag = 0) then
  begin
    Width := Width * 2;
    Height := Height * 8 div 5;
  end;
  DefaultMeasure := True;
end;

procedure TForm1.FileItem21Click(Sender: TObject);
begin
  Close;
end;

end.

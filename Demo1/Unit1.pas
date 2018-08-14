{ Unit: Unit1
  ===========================================================================

  The contents of this file are subject to the Bluecave Public License V 1.1
  (the "License"). You may not copy or use this file, in either source code
  or executable form, except in compliance with the License. You may obtain
  a copy of the License at http://www.bluecave.net/licenses/.

  Software distributed under the License is distributed on an "AS IS" basis,
  WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
  for the specific language governing rights and limitations under the
  License.

  Copyright (C) 2001-2002 Bluecave Software. All Rights Reserved.
  http://www.bluecave.net/

  Copyright (C) 2001-2002 Jouni Airaksinen. All Rights Reserved.
  http://Mintus.Codefield.com/ -- Mintus@Codefield.com

  ===========================================================================

  Unit description:

    BarMenus Demo Copyright (C) 2001-2002 Bluecave Software.

  =========================================================================== }

{.$I DFS.inc}
{.$I BcDirectives.inc}

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, BarMenus, ImgList, ExtCtrls, ComCtrls, StdCtrls, BcDrawModule,
  BcCustomDrawModule;

type
  TForm1 = class(TForm)
    BcBarPopupMenu1: TBcBarPopupMenu;
    mnuCopy: TMenuItem;
    mnuCut: TMenuItem;
    mnuPaste: TMenuItem;
    mnuEnabled: TMenuItem;
    mnuSearch: TMenuItem;
    mnuReplace: TMenuItem;
    mnuSelectAll: TMenuItem;
    mnuSelectionLine: TMenuItem;
    mnuConfigurationLine: TMenuItem;
    mnuProperties: TMenuItem;
    mnuEnabledLine: TMenuItem;
    mnuSearchLine: TMenuItem;
    PopupMenuImages: TImageList;
    mnuEditingLine: TMenuItem;
    BcBarPopupMenu2: TBcBarPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem12: TMenuItem;
    Item11: TMenuItem;
    Item21: TMenuItem;
    N1: TMenuItem;
    Item22: TMenuItem;
    SomemoreitemsItem21: TMenuItem;
    SomemoreitemsItem31: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    PlahplahplahAgainitem1: TMenuItem;
    ThisisdemoapplicationfortheBarMenus1: TMenuItem;
    N5: TMenuItem;
    Exit1: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    Copyright2001BluecaveSoftware1: TMenuItem;
    httpwwwbluecavenet1: TMenuItem;
    BcBarMainMenu1: TBcBarMainMenu;
    MnuFile: TMenuItem;
    Testing2: TMenuItem;
    Search1: TMenuItem;
    View1: TMenuItem;
    Help1: TMenuItem;
    MnuNew: TMenuItem;
    Save1: TMenuItem;
    Open1: TMenuItem;
    N4: TMenuItem;
    SaveAs1: TMenuItem;
    SaveCopyAs1: TMenuItem;
    N6: TMenuItem;
    Close1: TMenuItem;
    CloseAll1: TMenuItem;
    N7: TMenuItem;
    Exit2: TMenuItem;
    Copy1: TMenuItem;
    Cut1: TMenuItem;
    Paste1: TMenuItem;
    Delete1: TMenuItem;
    SelectAll1: TMenuItem;
    N8: TMenuItem;
    Find1: TMenuItem;
    Replace1: TMenuItem;
    N9: TMenuItem;
    FindInFiles1: TMenuItem;
    Searchagain1: TMenuItem;
    Arrange1: TMenuItem;
    Minimizeall1: TMenuItem;
    FAQ1: TMenuItem;
    Web1: TMenuItem;
    FAQ2: TMenuItem;
    Homepage1: TMenuItem;
    N10: TMenuItem;
    Downloadlatestversion1: TMenuItem;
    About1: TMenuItem;
    N11: TMenuItem;
    Content1: TMenuItem;
    Topic1: TMenuItem;
    Find2: TMenuItem;
    N12: TMenuItem;
    Editor11: TMenuItem;
    N2Images1: TMenuItem;
    N3Musicplayer1: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    mnuCustom1: TMenuItem;
    mnuCustom2: TMenuItem;
    mnuCustom3: TMenuItem;
    mnuCustom4: TMenuItem;
    SampleCustomdrawnitems1: TMenuItem;
    N19: TMenuItem;
    mnuCustom5: TMenuItem;
    mnuCustom6: TMenuItem;
    mnuCustom7: TMenuItem;
    Panel3: TPanel;
    BcBarPopupMenu3: TBcBarPopupMenu;
    Inthismenu1: TMenuItem;
    through1: TMenuItem;
    N20: TMenuItem;
    Asyoucansee1: TMenuItem;
    formelyknownasBarPopupMenu1: TMenuItem;
    youcandoalmostanythingyouwant1: TMenuItem;
    iftheDefaultDrawdoesnt1: TMenuItem;
    N21: TMenuItem;
    Virtuallyanythingispossible1: TMenuItem;
    Eventhoughthisexampleispretty1: TMenuItem;
    simpleitdemonstratesthepower1: TMenuItem;
    Label1: TLabel;
    Image1: TImage;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    FontDialog1: TFontDialog;
    CheckBox4: TCheckBox;
    BcCustomDrawModule1: TBcCustomDrawModule;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    Panel4: TPanel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox8: TCheckBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    procedure mnuEnabledClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure MnuNewClick(Sender: TObject);
    procedure Downloadlatestversion1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BcBarPopupMenu3BeforeDrawBar(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; var DefaultDraw: Boolean);
    procedure BcBarPopupMenu1AfterDrawBar(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure Inthismenu1MeasureItem(Sender: TObject; ACanvas: TCanvas;
      var Width, Height: Integer);
    procedure BcBarPopupMenu2MeasureMenuItem(Sender: TObject;
      AMenuItem: TMenuItem; ACanvas: TCanvas; var Width, Height: Integer;
      ABarVisible: Boolean; var DefaultMeasure: Boolean);
    procedure BcCustomDrawModule1DrawMenuItem(Sender: TObject;
      AMenuItem: TMenuItem; ACanvas: TCanvas; ARect: TRect;
      State: TOwnerDrawState; ABarVisible: Boolean; var DefaultDraw: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure Editor11Click(Sender: TObject);
    procedure BcBarMainMenu1MeasureMenuItem(Sender: TObject;
      AMenuItem: TMenuItem; ACanvas: TCanvas; var Width, Height: Integer;
      ABarVisible: Boolean; var DefaultMeasure: Boolean);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
  private
    { Private declarations }
    FDrawBuffer: TBitmap;
    function GetDrawBuffer: TBitmap;
  public
    { Public declarations }
    procedure DrawGradient(Canvas: TCanvas; ARect: TRect; StartingColor,
      EndingColor: TColor; Style: TGradientStyle);

    property DrawBuffer: TBitmap read GetDrawBuffer;
  end;


var
  Form1: TForm1;

implementation

uses ShellAPI, BcRectUtilities;

{$R *.DFM}
{$R WinXP.RES}

{ Gradient drawing uses DrawBuffer to buffer the drawing to memory and then
  copying drawn part to visible screen (makes things faster but uses a bit
  more memory and resources). Recommended way if using gsDiagonal* gradient
  styles. BarMenus.DrawGradient does not use buffer as it is low level procedure. }
procedure TForm1.DrawGradient(Canvas: TCanvas; ARect: TRect; StartingColor,
  EndingColor: TColor; Style: TGradientStyle);
begin
  DrawBuffer.Height := RectHeight(ARect);
  DrawBuffer.Width := RectWidth(ARect);
  BarMenus.DrawGradient(DrawBuffer, nil, BitmapRect(DrawBuffer), startingColor, EndingColor, Style);
  Canvas.Draw(ARect.Left, ARect.Top, DrawBuffer); // copy the buffer
  DrawBuffer.Height := 0;
  DrawBuffer.Width := 0;
end;

procedure TForm1.mnuEnabledClick(Sender: TObject);
var
  bEnabled: Boolean;
begin
  bEnabled := not TMenuItem(Sender).Checked;
  TMenuItem(Sender).Checked := bEnabled;

  BcBarPopupMenu1.Bar.Visible := bEnabled;
  mnuEditingLine.Enabled := bEnabled;
  mnuEditingLine.Visible := bEnabled;
  mnuSelectionLine.Enabled := bEnabled;
  mnuSearchLine.Enabled := bEnabled;
  mnuConfigurationLine.Enabled := bEnabled;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.About1Click(Sender: TObject);
begin
  ShowMessage(PChar('BarMenus Demo Copyright (C) Bluecave Software. All Rights Reserved.' + #13 +
    'BarMenu Components Copyright (C) Bluecave Software. All Rights Reserved.'));
end;

procedure TForm1.MnuNewClick(Sender: TObject);
begin
  ShowMessage(PChar('You clicked item "' + TMenuItem(Sender).Caption + '"'));
end;

procedure TForm1.Downloadlatestversion1Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open',
    'http://Mintus.Codefield.com/download/BarMenus/BarMenus.zip', nil, nil, SW_NORMAL);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  { setup selection colors for ownerdrawn items }
  ComboBox1.ItemIndex := Integer(BcBarMainMenu1.MenuStyle);
  ComboBox2.ItemIndex := Integer(BcBarPopupMenu1.MenuStyle);
  mnuCustom1.Tag := clBlack;
  mnuCustom2.Tag := clRed;
  mnuCustom3.Tag := clGreen;
  mnuCustom4.Tag := clNavy;
  mnuCustom5.Tag := clPurple;
  mnuCustom6.Tag := clOlive;
  mnuCustom7.Tag := clTeal;
end;

procedure TForm1.BcBarPopupMenu3BeforeDrawBar(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; var DefaultDraw: Boolean);
begin
  DefaultDraw := False; { do not allow default drawing }
  with ACanvas do
  begin
    { background color }
    Brush.Color := clBtnFace;
    FillRect(ARect);

    { fill the bar with something }
    Brush.Bitmap := AllocPatternBitmap(clRed, clYellow);
    Pen.Color := clBlack;
    RoundRect(ARect.Left, ARect.Top, ARect.Right, ARect.Bottom,
      (ARect.Right - ARect.Left), (ARect.Bottom - ARect.Top) div 8);
  end;
end;

procedure TForm1.BcBarPopupMenu1AfterDrawBar(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect);
begin
  with Image1.Canvas do
  begin
    { empty the image }
    Brush.Color := Form1.Color;
    FillRect(Rect(0, 0, Image1.Width, Image1.Height));
    { copy the menu bar to the image1 }
    CopyRect(ARect, ACanvas, ARect);
  end;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  BcBarMainMenu1.Bar.Visible := not TCheckBox(Sender).Checked;
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
  MnuFile.Visible := not TCheckBox(Sender).Checked;
  BcBarMainMenu1.FlushDoubleBuffer;
end;

procedure TForm1.CheckBox3Click(Sender: TObject);
begin
  MnuNew.Visible := not TCheckBox(Sender).Checked;
  BcBarMainMenu1.FlushDoubleBuffer;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  BcBarPopupMenu1.FlushDoubleBuffer;
  BcBarPopupMenu2.FlushDoubleBuffer;
  BcBarPopupMenu3.FlushDoubleBuffer;
  BcBarMainMenu1.FlushDoubleBuffer;
  Image1.Picture.Graphic := nil;

  FreeAndNil(FDrawBuffer); // free this too
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  FontDialog1.Font.Assign(BcBarPopupMenu3.MenuFont);
  if FontDialog1.Execute then
    BcBarPopupMenu3.MenuFont.Assign(FontDialog1.Font);
end;

procedure TForm1.CheckBox4Click(Sender: TObject);
begin
  Button2.Enabled := not TCheckBox(Sender).Checked;
  BcBarPopupMenu3.UseSystemFont := TCheckBox(Sender).Checked;
end;

procedure TForm1.Inthismenu1MeasureItem(Sender: TObject; ACanvas: TCanvas;
  var Width, Height: Integer);
begin
  Width := 350;
end;

procedure TForm1.BcBarPopupMenu2MeasureMenuItem(Sender: TObject;
  AMenuItem: TMenuItem; ACanvas: TCanvas; var Width, Height: Integer;
  ABarVisible: Boolean; var DefaultMeasure: Boolean);
begin
  if not IsInTopMainMenu(AMenuItem) then
  begin
    DefaultMeasure := False;
    if not (AMenuItem.Caption = cLineCaption) then
    begin
      Height := 22;
      Width := Width + 32;
    end;
  end;
end;

procedure TForm1.BcCustomDrawModule1DrawMenuItem(Sender: TObject;
  AMenuItem: TMenuItem; ACanvas: TCanvas; ARect: TRect;
  State: TOwnerDrawState; ABarVisible: Boolean; var DefaultDraw: Boolean);
var
  R: TRect;
  ImageList: TCustomImageList;

  procedure DrawCheckedPattern(Inflate: Boolean);
  begin
    if odChecked in State then
    begin
      if Inflate then InflateRect(R, -2, -2);
//      ACanvas.Brush.Bitmap := AllocPatternBitmap(clBtnFace, clWhite);
//      ACanvas.FillRect(R);
      ACanvas.Brush.Color := clBlack;
      ACanvas.FrameRect(R);
      if Inflate then InflateRect(R, 2, 2);
    end;
  end;

begin
  DefaultDraw := False;
  { menuitem drawing }
  if (AMenuItem.Caption = cLineCaption) then
  begin
    { background }
    DrawGradient(ACanvas, ARect, clWhite, clBtnFace, gsHorizontal);

    { align the text and draw it }
    R := ARect;
    R.Left := R.Right - ACanvas.TextWidth(AMenuItem.Hint) - 15;
    ACanvas.Brush.Style := bsClear;
    DrawText(ACanvas.Handle,
      PChar(AMenuItem.Hint), Length(AMenuItem.Hint),
      R, 0);

    { draw the line so that it won't draw over text }
    R := ARect;
    Inc(R.Top, (R.Bottom - R.Top) div 2);
    R.Bottom := R.Top + 1;
    Dec(R.Right, ACanvas.TextWidth(AMenuItem.Hint) + 10 + 10);
    ACanvas.Brush.Color := clGray;
    ACanvas.FillRect(R);
  end else
  begin
    { use default drawing for mainmenu top items }
    if IsInTopMainMenu(AMenuItem) then
    begin
      DefaultDraw := True;
      Exit;
    end;
    with ACanvas do
    begin
      R := ARect;
      if odSelected in State then
      begin
        { draw frame and selection gradient }
        Brush.Color := clGray;
        FrameRect(R);
        InflateRect(R, -2, -2);
        DrawGradient(ACanvas, R, clWhite, AMenuItem.Tag, gsDiagonalLeftRight);
        DrawCheckedPattern(False);
        { adjust rect so that text will be aligned to right }
        R.Left := R.Right - TextWidth(AMenuItem.Caption) - 5;
        Font.Color := clWhite; // caption color
      end else
      begin
        { draw background gradient }
        DrawGradient(ACanvas, R, clWhite, clBtnFace, gsHorizontal);
        DrawCheckedPattern(True);
        { leave space for menuitem image }
        Inc(R.Left, 38);
        Font.Color := clBlack; // caption color
      end;
      if (odDisabled in State) or (odGrayed in State) then
        Font.Color := clGrayText;

      { draw caption }
      InflateRect(R, 0, -(
        (R.Bottom - R.Top - TextHeight(AMenuItem.Caption) - 1)
         div 2));
      Brush.Style := bsClear;
      DrawText(Handle,
        PChar(AMenuItem.Caption), Length(AMenuItem.Caption),
        R, 0);

      { draw menuitem image }
      with AMenuItem do
      begin
        ImageList := GetImageList;
        if (ImageIndex <> -1) and Assigned(ImageList) then
          ImageList.Draw(ACanvas, ARect.Left + 11,
            ARect.Top + (ARect.Bottom - ARect.Top - ImageList.Height) div 2, ImageIndex);
      end;
    end;
  end;
end;

function TForm1.GetDrawBuffer: TBitmap;
begin
  if not Assigned(FDrawBuffer) then
    FDrawBuffer := TBitmap.Create;
  Result := FDrawBuffer;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FDrawBuffer);
end;

procedure TForm1.CheckBox8Click(Sender: TObject);
begin
  if TCheckBox(Sender).Checked then
    BcBarMainMenu1.DrawModule := BcCustomDrawModule1
  else
    BcBarMainMenu1.DrawModule := nil;
end;

procedure TForm1.CheckBox7Click(Sender: TObject);
begin
  if TCheckBox(Sender).Checked then
    BcBarPopupMenu1.DrawModule := BcCustomDrawModule1
  else
    BcBarPopupMenu1.DrawModule := nil;
end;

procedure TForm1.CheckBox5Click(Sender: TObject);
begin
  if TCheckBox(Sender).Checked then
    BcBarPopupMenu2.DrawModule := BcCustomDrawModule1
  else
    BcBarPopupMenu2.DrawModule := nil;
end;

procedure TForm1.CheckBox6Click(Sender: TObject);
begin
  if TCheckBox(Sender).Checked then
    BcBarPopupMenu3.DrawModule := BcCustomDrawModule1
  else
    BcBarPopupMenu3.DrawModule := nil;
end;

procedure TForm1.Editor11Click(Sender: TObject);
begin
  TMenuItem(Sender).Checked := True;
end;

procedure TForm1.BcBarMainMenu1MeasureMenuItem(Sender: TObject;
  AMenuItem: TMenuItem; ACanvas: TCanvas; var Width, Height: Integer;
  ABarVisible: Boolean; var DefaultMeasure: Boolean);
begin
  if (GetMenuBarMenusIntf(TMenu(Sender)).UseMenuStyle = msWindowsXP) then
    Height := Height + 2;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  BcBarMainMenu1.MenuStyle := TBcMenuStyle(TComboBox(Sender).ItemIndex);
end;

procedure TForm1.ComboBox2Change(Sender: TObject);
begin
  BcBarPopupMenu1.MenuStyle := TBcMenuStyle(TComboBox(Sender).ItemIndex);
end;

end.

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

  Copyright (C) 2001 Bluecave Software. All Rights Reserved.
  http://www.bluecave.net/

  Copyright (C) 2001 Jouni Airaksinen. All Rights Reserved.
  http://Mintus.Codefield.com/ -- Mintus@Codefield.com

  ===========================================================================

  Unit description:

    Small menu integrated file explorer with buffering and population on
    demand. Removable drives don't have buffering.

    Note that in "real" application you would use SystemImagelist for the
    images.

    This example uses *very* non standard way to interfere TMenuItem's
    way to add items to it's internal list. This way we can bypass few
    calls. Especially the RebuildHandle call which rebuilds the menu
    on every add which makes the menu *very slow* if it has more than 500 items
    to be created/added.

    If you recompile this with other version of Delphi, be sure to check the
    TMenuItemPrivateHack to match with the TMenuItem in Menus.pas. If the
    TMenuItemPrivateHack does not have correct class definition it won't
    work.

    If someone knows better solution, tell me. And yes, I know it's not
    very convient way to browse lots of items in one menu :) So better
    solution would be to group large number of files e.g. to sub menus.

    By setting AutoHotkeys to maManual for folder item it's shown A LOT
    faster, if there are lots of items in the folder.

    Compare these times with folder with about 2000 files (Windows XP,
      Windows\system32\):
      with FASTHACK:    around 400ms = 0,4 seconds
      without FASTHACK: around 120000ms = 2 minutes !!

    I have tested the FASTHACK with MemProof. It shouldn't leak any memory.

  History:

    2001-11-30: Initial version

  =========================================================================== }

{$I DFS.inc}
{$I BcDirectives.inc}
{.$DEFINE SHOWITEMTIME}
{$DEFINE FASTHACK}

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Menus, BarMenus, ImgList;

type
  TForm1 = class(TForm)
    BcBarMainMenu1: TBcBarMainMenu;
    FileBrowser1: TMenuItem;
    Label1: TLabel;
    ImageList1: TImageList;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure CreateFileBrowser(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    ItemCount: Integer;
    ShowMemoryStatus: Boolean;
    procedure AddSub(MI: TMenuItem);
    procedure RemoveItems(MI: TMenuItem);
  public
    { Public declarations }
    procedure OpenFile(Sender: TObject);
    procedure ExitClick(Sender: TObject);
    procedure ClearBuffersClick(Sender: TObject);
    procedure PopuplateDirectory(Sender: TObject);
    procedure ShowMemoryStatusClick(Sender: TObject);
    procedure UpdateMemoryPanel;
    procedure AddItem(TargetItem, AMenuItem: TMenuItem);
  end;

{$IFDEF FASTHACK}
  { TESTED ONLY WITH DELPHI 5 ENTERPRISE. THE FIELD ORDER/SIZE MUST MATCH SO THAT
    FItems: TList AND FParent: TMenuItem ARE ACCESSIBLE. }
  TMenuItemPrivateHack = class(TComponent)
  private
{$HINTS OFF}
    FCaption: string;
    FHandle: HMENU;
    FChecked: Boolean;
    FEnabled: Boolean;
    FDefault: Boolean;
    FAutoHotkeys: TMenuItemAutoFlag;
    FAutoLineReduction: TMenuItemAutoFlag;
    FRadioItem: Boolean;
    FVisible: Boolean;
    FGroupIndex: Byte;
    FImageIndex: TImageIndex;
    FActionLink: TMenuActionLink;
    FBreak: TMenuBreak;
    FBitmap: TBitmap;
    FCommand: Word;
    FHelpContext: THelpContext;
    FHint: string;
    FItems: TList;
    FShortCut: TShortCut;
    FParent: TMenuItem;
{$HINTS ON}
  end;
{$ENDIF}

function VolumeID(Drive: string): string;

var
  Form1: TForm1;

implementation

uses ShellAPI, MMSystem;

{$R *.DFM}

function VolumeID(Drive: string): string;
var
  OldErrorMode: Integer;
  NotUsed, VolFlags: DWORD;
  Buf: array [0..MAX_PATH] of Char;
begin
  if Drive = '' then
  begin
    Result := '';
    Exit;
  end else
  begin
    OldErrorMode := SetErrorMode(SEM_FAILCRITICALERRORS);
    try
      Buf[0] := #$00;
      if GetVolumeInformation(PChar(Drive), Buf, DWORD(sizeof(Buf)),
        nil, NotUsed, VolFlags, nil, 0) then
        SetString(Result, Buf, StrLen(Buf))
      else Result := '';
    finally
      SetErrorMode(OldErrorMode);
    end;
  end;
end;

procedure TForm1.CreateFileBrowser(Sender: TObject);
var
  MI, OMI: TMenuItem;
  S, Drive, DriveType: string;
  I: Integer;
  DriveTypeInt, OldDriveTypeInt: Cardinal;
begin
  with BcBarMainMenu1 do
  begin
    BeginUpdate;
    OMI := TMenuItem(Sender); // executes faster when this is in var (typecast takes time)
    if OMI.Count = 0 then
    begin
      SetLength(S, 64);
      SetLength(S, GetLogicalDriveStrings(64, PChar(S)));
      OldDriveTypeInt := $FFFFFFFF;
      DriveTypeInt := $FFFFFFFF;
      for I := 0 to (Length(S) div 4)-1 do
      begin
        Drive := S[I*4+1] + ':';
        DriveType := '';
        if I > 0 then OldDriveTypeInt := DriveTypeInt;
        DriveTypeInt := GetDriveType(PChar(Drive + '\'));
        case DriveTypeInt of
          DRIVE_REMOVABLE: DriveType := 'Removable Media';
          DRIVE_FIXED: DriveType := 'Hard Disk(s)';
          DRIVE_CDROM: DriveType := 'CD Drive(s)';
        else
          DriveType := 'Other';
        end;
        if OldDriveTypeInt <> DriveTypeInt then
        begin
          OMI.NewBottomLine;
          OMI.Items[OMI.Count-1].Hint := DriveType;
        end;
        MI := TMenuItem.Create(OMI);
        with MI do
        begin
          Hint := Drive + '\';
          Tag := -1;
          case DriveTypeInt of
            DRIVE_REMOVABLE:
              begin
                Caption :=  'Drive ' + ' (' + Drive + ')';
                ImageIndex := 0;
                Tag := -2; // refresh always
              end;
            DRIVE_FIXED:
              begin
                Caption := VolumeID(Drive + '\') + ' (' + Drive + ')';
                ImageIndex := 1;
              end;
            DRIVE_CDROM:
              begin
                Caption :=  'CD Drive ' + ' (' + Drive + ')';
                ImageIndex := 2;
                Tag := -2; // refresh always
              end;
          else
            ImageIndex := -1;
          end;
          AutoHotkeys := maManual;
          AutoLineReduction := maAutomatic;
          OnClick := PopuplateDirectory;
        end;
        AddSub(MI);

        OMI.Add(MI);
//        ShowMessage(Drive);
      end;
    end;


    OMI.NewBottomLine;
    MI := TMenuItem.Create(OMI);
    with MI do
    begin
      Caption := 'Show memory status';
//      Hint := Caption;
      Tag := 0;
      Checked := ShowMemoryStatus;
      OnClick := ShowMemoryStatusClick;
    end;
    OMI.Add(MI);

    MI := TMenuItem.Create(OMI);
    with MI do
    begin
      Caption := 'Clear buffers';
//      Hint := Caption;
      Tag := 0;
      OnClick := ClearBuffersClick;
    end;
    OMI.Add(MI);

    OMI.NewBottomLine; 
    MI := TMenuItem.Create(OMI);
    with MI do
    begin
      Caption := 'Exit';
//      Hint := Caption;
      Tag := 0;
      OnClick := ExitClick;
    end;
    OMI.Add(MI);

    EndUpdate;
  end;
end;

procedure TForm1.OpenFile(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PChar(TMenuItem(Sender).Hint), nil, nil, SW_SHOW);
end;

procedure TForm1.PopuplateDirectory(Sender: TObject);
var
  ErrorMode: Word;
  MI: TMenuItem;
  PopuplateTime: Cardinal;

  { in a "real" application you would use SystemImagelist }
  function GetImageIndex(AFileName: string): Integer;
  var S: string;
  begin
    S := UpperCase(ExtractFileExt(AFileName));
    Result := 4; // default Windows icon
    if S = '.URL' then
      Result := 5
    else if (S = '.TXT') or (S = '.DOC') then
      Result := 6
    else if (S = '.HTM') or (S = '.HTML') then
      Result := 7
    else if (S = '.ZIP') or (S = '.CAB') then
      Result := 8
    else if (S = '.EXE') or (S = '.BAT') or (S = '.COM') then
      Result := 9
    else if (S = '.WAV') or (S = '.MP3') or (S = '.M3U') or (S = '.MID') then
      Result := 10;
  end;

  function PopuplateIt(AMI: TMenuItem): string;
  var
    SR: TSearchRec;
    Found: Boolean;
    NMI: TMenuItem;
    Directories: Boolean;
{$IFDEF SHOWITEMTIME}
    AddTime: Cardinal;
{$ENDIF}
  begin
    { first directories }
    Directories := False;
    Found := FindFirst(AMI.Hint + '*', faDirectory + faReadOnly + faArchive, SR) = 0;
    try
      if Found then
      begin
        while Found do
        begin
          if ((SR.Attr and faDirectory) <> 0) and not ((SR.Name = '.') or (SR.Name = '..')) then
          begin
            if AMI.Count > 0 then
              AMI.Items[0].Visible := False;
            if AMI.Tag = -1 then
              AMI.Tag := 0;
            Directories := True;
            Inc(ItemCount);
{$IFDEF SHOWITEMTIME}
            AddTime := timeGetTime;
{$ENDIF}
            NMI := TMenuItem.Create(AMI);
            with NMI do
            begin
              Caption := SR.Name;
              Hint := AMI.Hint + SR.Name + '\';
              ImageIndex := 3; // folder image
              Tag := -1;
              AutoHotkeys := maManual;
              AutoLineReduction := maAutomatic;
              OnClick := PopuplateDirectory;
            end;
            AddSub(NMI);
            AddItem(AMI, NMI);
            UpdateMemoryPanel;
{$IFDEF SHOWITEMTIME}
            Caption := IntToStr(timeGetTime - AddTime);
            Application.ProcessMessages;
{$ENDIF}
          end;
          Found := FindNext(SR) = 0;
        end;
      end;
    finally
      FindClose(SR);
    end;

    { then files }
    Found := FindFirst(AMI.Hint + '*', faReadOnly + faArchive, SR) = 0;
    try
      if Found then
      begin
        if AMI.Count > 0 then
          AMI.Items[0].Visible := False;
        if AMI.Tag = -1 then
          AMI.Tag := 0;
        if Directories then AMI.NewBottomLine;
        while Found do
        begin
          Inc(ItemCount);
{$IFDEF SHOWITEMTIME}
          AddTime := timeGetTime;
{$ENDIF}
          NMI := TMenuItem.Create(AMI);
          with NMI do
          begin
            Caption := SR.Name;
            Hint := AMI.Hint + SR.Name;
            ImageIndex := GetImageIndex(SR.Name);
            Tag := -1;
            AutoHotkeys := maManual;
            AutoLineReduction := maManual;
            OnClick := OpenFile;
          end;
          AddItem(AMI, NMI);
          UpdateMemoryPanel;
{$IFDEF SHOWITEMTIME}
          Caption := IntToStr(timeGetTime - AddTime);
          Application.ProcessMessages;
{$ENDIF}
          Found := FindNext(SR) = 0;
        end;
      end;
    finally
      FindClose(SR);
    end;
{$IFDEF FASTHACK}
    { because fast hack does not rebuild the handle, we use the autolinereduction
      to do that. Add extract line here so it will rebuild the handle. Otherwise
      we don't see any items in the menu.. :) }
    AMI.NewBottomLine;
{$ENDIF}
   end;

begin
  MI := TMenuItem(Sender);
  if (MI.Tag < 0) or (MI.Hint = '') then
  begin
    ErrorMode := SetErrorMode(SEM_FAILCRITICALERRORS); // don't display errors e.g. on A:
    try
      ItemCount := 0;
      if MI.Tag = -2 then
        RemoveItems(MI);
      timeBeginPeriod(1);
      BcBarMainMenu1.BeginUpdate;
      try
        Caption := 'Populating...';
        Application.ProcessMessages;
        PopuplateTime := timeGetTime;
{$IFDEF FASTHACK}
        { allocate some space for the items TList. E.g. space for 4096 items should
          be enough. }
        TMenuItemPrivateHack(MI).FItems.Capacity := 4096;
{$ENDIF}
        PopuplateIt(MI);
        Caption := 'Popuplated in ' + IntToStr(timeGetTime - PopuplateTime) + ' ms.';
//        Application.ProcessMessages;
      finally
        BcBarMainMenu1.EndUpdate;
        timeEndPeriod(1);
      end;
    finally
      SetErrorMode(ErrorMode);
    end;
  end else
    Caption := 'Buffer used.';
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ShowMemoryStatus := True;
  UpdateMemoryPanel;
  ShowMemoryStatus := False;
  CreateFileBrowser(FileBrowser1);
  ItemCount := 0;
end;

procedure TForm1.AddSub(MI: TMenuItem);
var MISub: TMenuItem;
begin
  MISub := TMenuItem.Create(MI);
  with MISub do
  begin
    Caption := '(Folder empty)';
    Enabled := False;
    Hint := '';
    MI.Add(MISub);
  end;
end;

procedure TForm1.ClearBuffersClick(Sender: TObject);
begin
  FileBrowser1.Clear;
  CreateFileBrowser(FileBrowser1);
  UpdateMemoryPanel;
end;

procedure TForm1.ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.RemoveItems(MI: TMenuItem);
var I: Integer;
begin
  if MI.Count = 1 then Exit;
  BcBarMainMenu1.BeginUpdate;
  for I := MI.Count - 1 downto 1 do
    MI.Items[I].Free;
  if MI.Count > 0 then
    MI.Items[0].Visible := True;
  if not (MI.Tag = -2) then MI.Tag := -1;
  BcBarMainMenu1.EndUpdate;
end;

procedure TForm1.UpdateMemoryPanel;
var HS: THeapStatus;
begin
  if ShowMemoryStatus then
  begin
    HS := GetHeapStatus;
    Label3.Caption := Format('U:%d / C:%d / T:%d bytes', [HS.TotalUncommitted , HS.TotalCommitted, HS.TotalAddrSpace]);
    Label5.Caption := Format('U:%d / FS:%d / FB:%d / T:%d bytes', [HS.Unused , HS.FreeSmall, HS.FreeBig, HS.TotalFree]);
    Label7.Caption := Format('%d bytes', [HS.Overhead]);
    Label9.Caption := Format('%d', [ItemCount]);
{$IFNDEF SHOWITEMTIME}
    Application.ProcessMessages;
{$ENDIF}
  end;
end;

procedure TForm1.ShowMemoryStatusClick(Sender: TObject);
begin
  ShowMemoryStatus := not TMenuItem(Sender).Checked;
  TMenuItem(Sender).Checked  := ShowMemoryStatus
end;

procedure TForm1.AddItem(TargetItem, AMenuItem: TMenuItem);
begin
{$IFDEF FASTHACK}
  with TMenuItemPrivateHack(TargetItem) do
  begin
    if FItems = nil then FItems := TList.Create;
    FItems.Insert(FItems.Count, AMenuItem);
    TMenuItemPrivateHack(AMenuItem).FParent := TargetItem;
//    Item.FOnChange := SubItemChanged;
  end;
{$ELSE}
  TargetItem.Add(AMenuItem);
{$ENDIF}
end;

end.

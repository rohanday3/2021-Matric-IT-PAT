{ ******************************************************************************
  ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤIT MATRIC PAT 2021 - Robin Hood
  ㅤㅤㅤㅤㅤCopyright (C) 2021 by Rohan Dayaram <rohanday4@gmail.com>
  ㅤㅤㅤㅤㅤㅤㅤhttps://github.com/rohanday3/2021-Matric-IT-PAT
  ******************************************************************************
  Robin Hood is a multi-purpose company management system for the financial and
  inventory systems etc of the Robin Hood© foundation which is for the purposes
  of my matric pat, an NGO dedicated to feeding homeless children under the ages
  of 3.  The  company needed a system to manage their inventory,  payments  and
  other systems which would otherwise be managed by staff and recorded on paper.
  The design is a modern one with a  dashboard and a multiview drawer  which is
  used to navigate the other tabs.  Many additional "nice to have" features are
  included as well which are docuemented in the help tab as well as the feature
  docuement included in the same folder as the project and can also be found on
  my github page stated above.
  ****************************************************************************** }

unit uPreferences;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Platform, FMX.Objects, System.uiconsts, FMX.TabControl,
  FMX.Controls.Presentation, FMX.StdCtrls, System.ImageList, FMX.ImgList,
  FMX.ListBox, uSettingsTab, IniFiles, FMX.Edit;

type
  TfrmPreferences = class(TForm)
    Layout1: TLayout;
    rectCategoryLabel: TRectangle;
    rectCategoryGroup: TRectangle;
    rectCategoryHeader: TRectangle;
    tabcontrol_settings: TTabControl;
    rectSaveBtn: TRectangle;
    rectCancelBtn: TRectangle;
    lblCategoryLabel: TLabel;
    lblSaveBtn: TLabel;
    lblCancelBtn: TLabel;
    lblCategoryHeader: TLabel;
    tabInterface: TTabItem;
    tabGeneral: TTabItem;
    tabAccount: TTabItem;
    rectInterface: TRectangle;
    rectGeneral: TRectangle;
    rectAccount: TRectangle;
    flowInterface: TFlowLayout;
    rectScale1: TRectangle;
    rectScaleParent: TRectangle;
    rectScale2: TRectangle;
    lblScale1: TLabel;
    imgScale: TImage;
    ImageList1: TImageList;
    scale_rad_0: TRadioButton;
    scale_rad_1: TRadioButton;
    scale_rad_2: TRadioButton;
    cmbScale: TComboBox;
    rectCustomScale: TRectangle;
    StyleBook1: TStyleBook;
    imgScale2: TImage;
    flowCategory: TFlowLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    Layout4: TLayout;
    flowGeneral: TFlowLayout;
    rectDatabaseParent: TRectangle;
    rectDatabase1: TRectangle;
    lblDatabase1: TLabel;
    imgDatabase: TImage;
    rectDatabase2: TRectangle;
    rectDatabaseEdit: TRectangle;
    btnDatabase1: TButton;
    lblDatabase2: TLabel;
    lblDatabase3: TLabel;
    btnRestore: TButton;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    function ChangeColour(colour, option: string): string;
    procedure rectSaveBtnMouseEnter(Sender: TObject);
    procedure rectSaveBtnMouseLeave(Sender: TObject);
    procedure rectSaveBtnMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure rectSaveBtnMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure rectCancelBtnClick(Sender: TObject);
    procedure rectScale1Click(Sender: TObject);
    procedure imgScale2Click(Sender: TObject);
    procedure rectCustomScaleClick(Sender: TObject);
    procedure ScaleRadioGroupChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tabcontrol_settingsChange(Sender: TObject);
    procedure btnDatabase1Click(Sender: TObject);
    procedure lblSaveBtnClick(Sender: TObject);
    procedure btnRestoreClick(Sender: TObject);
  private
    { Private declarations }
    NaviPanels: array of TSettingsTab;
    procedure ScaleScreen;
    function GetScreenScale: Single;
    procedure LoadSettingsNavi;
    procedure LoadSettings;
    procedure SaveSettingString(Section, Name, Value: string);
    function LoadSettingString(Section, Name, Value: string): string;
    function shortenPath(PATH: string; rect_width: integer;
      AFont: TFont = nil): string;
  public
    { Public declarations }
    class function Execute: boolean;
  end;

var
  frmPreferences: TfrmPreferences;
  clrBackground, clrForeground, clrAccent1, clrAccent2, clrAccent3: TAlphaColor;
  scale_changed: boolean;
  databasepath: string;
  databasepath_changed: boolean;

const
  iniWidth: integer = 717;
  iniHeight: integer = 564;
  CONFIG_FILE_NAME = 'config.ini';

implementation

{$R *.fmx}
{ TfrmPreferences }

uses
  uMain;

procedure TfrmPreferences.btnDatabase1Click(Sender: TObject);
begin
  with TOpenDialog.Create(nil) do
  begin
    Filter := 'Microsoft Access Database (*.mdb)|*.MDB';
    InitialDir := GetCurrentDir;
    if Execute then
    begin
      lblDatabase2.Text := shortenPath(FileName, round(rectDatabaseEdit.Width));
      databasepath := FileName;
      databasepath_changed := True;
      rectSaveBtn.Enabled := True;
    end;
    Free;
  end;
end;

procedure TfrmPreferences.btnRestoreClick(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to restore the default settings?',
    TMsgDlgType.mtConfirmation, mbYesNo, 0) = 6 then
    lblDatabase2.Text := shortenPath(GetCurrentDir + '\robinhood.mdb',
      round(rectDatabaseEdit.Width) - 10)
end;

function TfrmPreferences.ChangeColour(colour, option: string): string;
var
  colour_string: string;
  Red, green, blue: integer;
const
  change_by: integer = 10;
begin
  colour_string := Copy(colour, 4, 6);
  Red := StrToInt64('$' + Copy(colour_string, 1, 2));
  green := StrToInt64('$' + Copy(colour_string, 3, 2));
  blue := StrToInt64('$' + Copy(colour_string, 5, 2));

  if option = 'lighten' then
    result := Copy(colour, 1, 3) + IntToHex(Red + change_by, 1) +
      IntToHex(green + change_by, 1) + IntToHex(blue + change_by, 1);
  if option = 'darken' then
    result := Copy(colour, 1, 3) + IntToHex(Red - change_by, 1) +
      IntToHex(green - change_by, 1) + IntToHex(blue - change_by, 1);
end;

class function TfrmPreferences.Execute: boolean;
begin
  with TfrmPreferences.Create(nil) do
    try
      result := ShowModal = mrOk;
    finally
      TSettingsTab.Release(NaviPanels);
      SetLength(NaviPanels, 0);
      Free;
    end;
end;

procedure TfrmPreferences.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ModalResult := mrCancel;
end;

procedure TfrmPreferences.FormCreate(Sender: TObject);
begin
  ScaleScreen;
  clrBackground := StringToAlphaColor('#FF444444');
  clrAccent1 := StringToAlphaColor('#FF5d5d5d');
  clrForeground := StringToAlphaColor('#FF494949');
  clrAccent2 := StringToAlphaColor('#FF2b2b2b');
  clrAccent3 := StringToAlphaColor('#FF5285a6');

  LoadSettings;
  rectSaveBtn.Enabled := False;
  LoadSettingsNavi;
end;

function TfrmPreferences.GetScreenScale: Single;
var
  ScrService: IFMXScreenService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXScreenService,
    ScrService) then
  begin
    result := ScrService.GetScreenScale;
  end;
end;

procedure TfrmPreferences.imgScale2Click(Sender: TObject);
begin
  cmbScale.DropDown;
end;

procedure TfrmPreferences.lblSaveBtnClick(Sender: TObject);
var
  scale_i: string;
begin
  if databasepath_changed then
    SaveSettingString('General', 'database_path', databasepath);
  if scale_changed then
  begin
    if scale_rad_0.IsChecked then
      scale_i := '0'
    else if scale_rad_1.IsChecked then
      scale_i := '1'
    else
      scale_i := '2';
    SaveSettingString('Interface', 'scale', scale_i);
  end;

end;

procedure TfrmPreferences.LoadSettings;
begin
  case strtoint(LoadSettingString('Interface', 'Scaling', '0')) of
    0:
      scale_rad_0.IsChecked := True;
    1:
      scale_rad_1.IsChecked := True;
    2:
      scale_rad_2.IsChecked := True;
  end;
  lblDatabase2.Text := shortenPath(LoadSettingString('General', 'databasepath',
    GetCurrentDir + '\robinhood.mdb'), round(rectDatabaseEdit.Width));
end;

procedure TfrmPreferences.LoadSettingsNavi;
var
  i: integer;
begin
  SetLength(NaviPanels, tabcontrol_settings.TabCount);
  for i := 0 to tabcontrol_settings.TabCount - 1 do
  begin
    NaviPanels[i] := TSettingsTab.Create(Self, flowCategory);
    with NaviPanels[i] do
    begin
      setTabIndex(i);
      // SetLabel(tabcontrol_settings.Tabs[i].Name);
      setTabControl(tabcontrol_settings);
    end;
  end;
  NaviPanels[0].SetLabel('General');
  NaviPanels[0].setClicked;
  tabcontrol_settings.ActiveTab := tabGeneral;
  NaviPanels[1].SetLabel('Interface');
  NaviPanels[2].SetLabel('3');
end;

function TfrmPreferences.LoadSettingString(Section, Name,
  Value: string): string;
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(GetCurrentDir + '\' + CONFIG_FILE_NAME);
  try
    result := ini.ReadString(Section, Name, Value);
  finally
    ini.Free;
  end;
end;

procedure TfrmPreferences.rectCustomScaleClick(Sender: TObject);
begin
  cmbScale.DropDown;
end;

procedure TfrmPreferences.rectCancelBtnClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmPreferences.rectSaveBtnMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  TRectangle(Sender).Fill.Color :=
    StringToAlphaColor(ChangeColour(alphacolortostring(TRectangle(Sender)
    .Fill.Color), 'lighten'));
end;

procedure TfrmPreferences.rectSaveBtnMouseEnter(Sender: TObject);
begin
  TRectangle(Sender).Fill.Color :=
    StringToAlphaColor(ChangeColour(alphacolortostring(TRectangle(Sender)
    .Fill.Color), 'lighten'));
end;

procedure TfrmPreferences.rectSaveBtnMouseLeave(Sender: TObject);
begin
  TRectangle(Sender).Fill.Color := clrAccent1;
end;

procedure TfrmPreferences.rectSaveBtnMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  TRectangle(Sender).Fill.Color :=
    StringToAlphaColor(ChangeColour(alphacolortostring(TRectangle(Sender)
    .Fill.Color), 'darken'));
end;

procedure TfrmPreferences.rectScale1Click(Sender: TObject);
begin
  if TRectangle(TRectangle(Sender).Parent).Height = 40 then
  begin
    TRectangle(TRectangle(TRectangle(Sender).Parent).Children[1])
      .Visible := True;
    TRectangle(TRectangle(Sender).Parent).Height := 160;
    TImage(TRectangle(Sender).Children[1]).Bitmap := ImageList1.Source.Items[0]
      .MultiResBitmap.Bitmaps[1];
  end
  else
  begin
    TRectangle(TRectangle(TRectangle(Sender).Parent).Children[1])
      .Visible := False;
    TRectangle(TRectangle(Sender).Parent).Height := 40;
    TImage(TRectangle(Sender).Children[1]).Bitmap := ImageList1.Source.Items[1]
      .MultiResBitmap.Bitmaps[1];
  end;

end;

procedure TfrmPreferences.SaveSettingString(Section, Name, Value: string);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(GetCurrentDir + '\' + CONFIG_FILE_NAME);
  try
    ini.WriteString(Section, Name, Value);
  finally
    ini.Free;
  end;
end;

procedure TfrmPreferences.ScaleRadioGroupChange(Sender: TObject);
begin
  scale_changed := True;
  rectSaveBtn.Enabled := True;
  if not scale_rad_1.IsChecked then
    rectCustomScale.Enabled := False;
end;

procedure TfrmPreferences.ScaleScreen;
var
  ScreenSize: TSize;
  SysScale: Single;
begin
  ScreenSize := Screen.Size;
  SysScale := GetScreenScale;
  // Put in settings tab
  // Label23.Text := 'T: ' + floattostr(TrackBar2.Value) + '\n Width: ' +
  // Inttostr(Width) + '\n Height: ' + Inttostr(Height);
  // Label22.Text := floattostr(TrackBar1.Value) + '   ' +
  // floattostr(Layout1.Scale.X);
  // Label24.Text := 'R: ' + floattostr(ScreenSize.Width / Width) + ':' +
  // floattostr(ScreenSize.Height / Height);

  Layout1.Scale.X := (ScreenSize.Width / 3840) * (2.25 / SysScale);
  Layout1.Scale.Y := (ScreenSize.Height / 2160) * (2.25 / SysScale);
  Self.Width := round(iniWidth * (ScreenSize.Width / 3840) * (2.25 / SysScale));
  Self.Height := round(iniHeight * (ScreenSize.Height / 2160) *
    (2.25 / SysScale));
end;

// Feature
function TfrmPreferences.shortenPath(PATH: string; rect_width: integer;
  AFont: TFont = nil): string;
var
  p, p2: integer;
  tempstr, endstr: string;
  lbl: TLabel;
begin
  lbl := TLabel.Create(Self);
  lbl.Parent := Self;
  lbl.WordWrap := False;
  lbl.AutoSize := True;
  if AFont <> nil then
  begin
    lbl.Font := AFont;
  end;
  TLabel(lbl).Text := PATH;
  while TLabel(lbl).Width > rect_width do
  begin
    p := LastDelimiter('\', PATH);
    tempstr := Copy(PATH, 0, p - 1);
    p2 := LastDelimiter('\', tempstr);
    TLabel(lbl).Text := Copy(PATH, 0, p2) + '...' + Copy(PATH, p, length(PATH));
    PATH := Copy(PATH, 0, p2 - 1) + '...' + Copy(PATH, p, length(PATH));
  end;
  endstr := TLabel(lbl).Text;
  lbl.Free;
  result := endstr;;
end;

procedure TfrmPreferences.tabcontrol_settingsChange(Sender: TObject);
var
  i: integer;
begin
  lblCategoryHeader.Text := NaviPanels[tabcontrol_settings.TabIndex].GetLabel;
  for i := 0 to length(NaviPanels) - 1 do
  begin
    if NaviPanels[i].GetTabIndex <> tabcontrol_settings.TabIndex then
    begin
      NaviPanels[i].resetColor;
    end;
  end;
end;

end.

﻿{ ******************************************************************************
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
  FMX.ListBox, uSettingsTab, IniFiles;

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
    Label1: TLabel;
    imgScale: TImage;
    ImageList1: TImageList;
    scale_rad_0: TRadioButton;
    scale_rad_1: TRadioButton;
    scale_rad_2: TRadioButton;
    cmbScale: TComboBox;
    rectCustomScale: TRectangle;
    StyleBook1: TStyleBook;
    Image1: TImage;
    flowCategory: TFlowLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    Layout4: TLayout;
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
    procedure Image1Click(Sender: TObject);
    procedure rectCustomScaleClick(Sender: TObject);
    procedure ScaleRadioGroupChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tabcontrol_settingsChange(Sender: TObject);
  private
    { Private declarations }
    NaviPanels: array of TSettingsTab;
    procedure ScaleScreen;
    function GetScreenScale: Single;
    procedure LoadSettingsNavi;
    procedure LoadSettings;
    procedure SaveSettingString(Section, Name, Value: string);
    function LoadSettingString(Section, Name, Value: string): string;
  public
    { Public declarations }
    class function Execute: boolean;
  end;

var
  frmPreferences: TfrmPreferences;
  clrBackground, clrForeground, clrAccent1, clrAccent2, clrAccent3: TAlphaColor;
  bChanged: boolean;

const
  iniWidth: Integer = 717;
  iniHeight: Integer = 564;
  CONFIG_FILE_NAME = 'config.ini';

implementation

{$R *.fmx}
{ TfrmPreferences }

uses
  uMain;

function TfrmPreferences.ChangeColour(colour, option: string): string;
var
  colour_string: string;
  Red, green, blue: Integer;
const
  change_by: Integer = 10;
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

procedure TfrmPreferences.Image1Click(Sender: TObject);
begin
  cmbScale.DropDown;
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
end;

procedure TfrmPreferences.LoadSettingsNavi;
var
  I: Integer;
begin
  SetLength(NaviPanels, tabcontrol_settings.TabCount);
  for I := 0 to tabcontrol_settings.TabCount - 1 do
  begin
    NaviPanels[I] := TSettingsTab.Create(Self, flowCategory);
    with NaviPanels[I] do
    begin
      setTabIndex(I);
      // SetLabel(tabcontrol_settings.Tabs[i].Name);
      setTabControl(tabcontrol_settings);
    end;
  end;
  NaviPanels[0].SetLabel('General');
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
  bChanged := True;
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
  Self.Width := Round(iniWidth * (ScreenSize.Width / 3840) * (2.25 / SysScale));
  Self.Height := Round(iniHeight * (ScreenSize.Height / 2160) *
    (2.25 / SysScale));
end;

procedure TfrmPreferences.tabcontrol_settingsChange(Sender: TObject);
var
  I: Integer;
begin
  lblCategoryHeader.Text := NaviPanels[tabcontrol_settings.TabIndex].GetLabel;
  for I := 0 to Length(NaviPanels) - 1 do
  begin
    if NaviPanels[I].GetTabIndex <> tabcontrol_settings.TabIndex then
    begin
      NaviPanels[I].resetColor;
    end;
  end;
end;

end.

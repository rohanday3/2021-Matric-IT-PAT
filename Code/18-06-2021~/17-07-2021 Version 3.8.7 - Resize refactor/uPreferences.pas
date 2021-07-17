unit uPreferences;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Platform, FMX.Objects, System.uiconsts, FMX.TabControl,
  FMX.Controls.Presentation, FMX.StdCtrls, System.ImageList, FMX.ImgList,
  FMX.ListBox, uSettingsTab;

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
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
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
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    NaviPanels: array of TSettingsTab;
    procedure ScaleScreen;
    function GetScreenScale: Single;
    procedure LoadSettingsNavi;
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

implementation

{$R *.fmx}
{ TfrmPreferences }

procedure TfrmPreferences.Button1Click(Sender: TObject);
begin
  TSettingsTab.Free(NaviPanels);
  SetLength(NaviPanels, 0);
end;

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
      TSettingsTab.Free(NaviPanels);
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

procedure TfrmPreferences.ScaleRadioGroupChange(Sender: TObject);
begin
  bChanged := True;
  rectSaveBtn.Enabled := True;
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

end.
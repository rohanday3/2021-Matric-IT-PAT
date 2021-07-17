unit uSettingsTab;

interface

uses
  FMX.StdCtrls, FMX.Objects, FMX.Controls, FMX.Layouts, FMX.Types, UIConsts,
  UITypes, FMX.TabControl, FMX.Multiview, FMX.Dialogs, System.SysUtils;

Type
  TSettingsTab = Class(TObject)
  public
    { public fields }
    constructor Create(AOwner, AParent: TFmxObject);
    procedure SetLabel(caption: string);
    function GetLabel: string;
    procedure SetImage(image: string);
    function GetTImage: TImage;
    function GetTabIndex: integer;
    procedure setTabIndex(index: integer);
    procedure setTabControl(AObject: TTabControl);
    procedure resetColor;
    procedure setClicked;
    class procedure Free(arr: array of TSettingsTab);
  protected
    { protected fields }
    { protected methods }
  private
    { private fields }
    olabel: TLabel;
    oimage: TImage;
    opanel: TRectangle;
    tabcontrolindex: integer;
    TabControl: TTabControl;
    selected: boolean;
    { private methods }
    procedure onMouseEnter(Sender: TObject);
    procedure onMouseLeave(Sender: TObject);
    procedure onPanelClick(Sender: TObject);
    procedure FreePanel;
  end;

implementation

{ TSettingsTab }

constructor TSettingsTab.Create(AOwner, AParent: TFmxObject);
begin
  selected := False;
  opanel := TRectangle.Create(AOwner);
  opanel.Parent := AParent;
  opanel.Width := TFlowLayout(AParent).Width - 4;
  opanel.Height := 18;
  opanel.Stroke.Thickness := 0;
  opanel.OnClick := onPanelClick;
  opanel.Fill.Color := StringToAlphaColor('#FF2b2b2b');
  opanel.Margins.Left := 2;
  opanel.onMouseEnter := onMouseEnter;
  opanel.onMouseLeave := onMouseLeave;
  olabel := TLabel.Create(AOwner);
  olabel.Parent := opanel;
  olabel.Position.X := 20;
  olabel.Position.Y := 0;
  olabel.StyledSettings := olabel.StyledSettings - [TStyledSetting.ssFamily,
    TStyledSetting.ssSize, TStyledSetting.FontColor];
  olabel.AutoSize := True;
  olabel.TextSettings.Font.Size := 12;
  olabel.TextSettings.FontColor := TAlphaColors.White;
  olabel.Font.Family := 'Segoe UI';
  oimage := TImage.Create(AOwner);
  oimage.Parent := opanel;
  oimage.Position.X := 5;
  oimage.Position.Y := 5;
  oimage.Width := 5;
  oimage.Height := 5;
  oimage.OnClick := opanel.OnClick;
  oimage.onMouseEnter := onMouseEnter;
  oimage.onMouseLeave := onMouseLeave;
end;

class procedure TSettingsTab.Free(arr: array of TSettingsTab);
var
  a: TSettingsTab;
begin
  for a in arr do
  begin
    a.FreePanel;
  end;
end;

procedure TSettingsTab.FreePanel;
begin
opanel.Free;
end;

function TSettingsTab.GetLabel: string;
begin
  Result := olabel.Text;
end;

function TSettingsTab.GetTImage: TImage;
begin
  Result := oimage;
end;

function TSettingsTab.GetTabIndex: integer;
begin
  Result := tabcontrolindex;
end;

procedure TSettingsTab.onMouseEnter(Sender: TObject);
begin
  if (selected <> True) then
    // opanel.Fill.Color := StringToAlphaColor('#FF1D262B');
    opanel.Fill.Color := StringToAlphaColor('#FF6699ba');
end;

procedure TSettingsTab.onMouseLeave(Sender: TObject);
begin
  if not selected then
    opanel.Fill.Color := StringToAlphaColor('#FF2b2b2b');
end;

procedure TSettingsTab.onPanelClick(Sender: TObject);
begin
  TabControl.TabIndex := tabcontrolindex;
  selected := True;
  opanel.Fill.Color := StringToAlphaColor('#FF5285a6');
end;

procedure TSettingsTab.resetColor;
begin
  opanel.Fill.Color := StringToAlphaColor('#FF2b2b2b');
  selected := False;
end;

procedure TSettingsTab.setClicked;
begin
  opanel.Fill.Color := StringToAlphaColor('#FFF15A23');
  selected := True;
end;

procedure TSettingsTab.SetImage(image: string);
begin
  oimage.Bitmap.LoadFromFile(image);
end;

procedure TSettingsTab.SetLabel(caption: string);
begin
  olabel.Text := caption;
  oimage.Hint := caption;
  oimage.ShowHint := True;
  opanel.Hint := caption;
  opanel.ShowHint := True;
end;

procedure TSettingsTab.setTabControl(AObject: TTabControl);
begin
  TabControl := AObject;
end;

procedure TSettingsTab.setTabIndex(index: integer);
begin
  tabcontrolindex := index;
end;

end.

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
    destructor Destroy; override;
    class procedure Release(arr: array of TSettingsTab);
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

destructor TSettingsTab.Destroy;
begin
  opanel.Free;
  inherited;
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

class procedure TSettingsTab.Release(arr: array of TSettingsTab);
var
  a: TSettingsTab;
begin
  for a in arr do
  begin
    a.Destroy;
  end;
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

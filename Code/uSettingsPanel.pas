unit uSettingsPanel;

interface

uses
  FMX.StdCtrls, FMX.Objects, FMX.Controls, FMX.Layouts, FMX.Types, UIConsts,
  UITypes, FMX.TabControl, FMX.Multiview, FMX.Dialogs, System.SysUtils;

Type
  TSettingsPanel = Class(TObject)
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

  const
    baseColor: string = '#FF2b2b2b';
    clickColor: string = '#FF5285a6';
    hoverColor: string = '#FF535353';
  end;

implementation

{ TSettingsPanel }

constructor TSettingsPanel.Create(AOwner, AParent: TFmxObject);
begin
  selected := False;
  opanel := TRectangle.Create(AOwner);
  opanel.Parent := AParent;
  opanel.Width := TFlowLayout(AParent).Width;
  opanel.Height := 30;
  opanel.Stroke.Thickness := 0;
  opanel.Stroke.Color := StringToAlphaColor(baseColor);
  opanel.OnClick := onPanelClick;
  opanel.Fill.Color := StringToAlphaColor(baseColor);
  opanel.onMouseEnter := onMouseEnter;
  opanel.onMouseLeave := onMouseLeave;
  olabel := TLabel.Create(AOwner);
  olabel.Parent := opanel;
  olabel.Position.Y := 7;
  olabel.Position.X := 40;
  olabel.StyledSettings := olabel.StyledSettings - [TStyledSetting.ssFamily,
    TStyledSetting.ssSize, TStyledSetting.FontColor];
  olabel.AutoSize := True;
  olabel.TextSettings.Font.Size := 12;
  olabel.TextSettings.FontColor := TAlphaColors.White;
  olabel.Font.Family := 'Segoe UI';
  oimage := TImage.Create(AOwner);
  oimage.Parent := opanel;
  oimage.Position.X := 6;
  oimage.Position.Y := 5;
  oimage.Width := 20;
  oimage.Height := 20;
  oimage.OnClick := opanel.OnClick;
  oimage.onMouseEnter := onMouseEnter;
  oimage.onMouseLeave := onMouseLeave;
end;

function TSettingsPanel.GetLabel: string;
begin
  Result := olabel.Text;
end;

function TSettingsPanel.GetTImage: TImage;
begin
  Result := oimage;
end;

function TSettingsPanel.GetTabIndex: integer;
begin
  Result := tabcontrolindex;
end;

procedure TSettingsPanel.onMouseEnter(Sender: TObject);
begin
  if (selected <> True) then
    // opanel.Fill.Color := StringToAlphaColor('#FF1D262B');
    opanel.Fill.Color := StringToAlphaColor(hoverColor);
end;

procedure TSettingsPanel.onMouseLeave(Sender: TObject);
begin
  if not selected then
    opanel.Fill.Color := StringToAlphaColor(baseColor);
end;

procedure TSettingsPanel.onPanelClick(Sender: TObject);
begin
  TabControl.TabIndex := tabcontrolindex;
  selected := True;
  opanel.Fill.Color := StringToAlphaColor(clickColor);
end;

procedure TSettingsPanel.resetColor;
begin
  opanel.Fill.Color := StringToAlphaColor(baseColor);
  selected := False;
end;

procedure TSettingsPanel.setClicked;
begin
  opanel.Fill.Color := StringToAlphaColor(clickColor);
  selected := True;
end;

procedure TSettingsPanel.SetImage(image: string);
begin
  oimage.Bitmap.LoadFromFile(image);
end;

procedure TSettingsPanel.SetLabel(caption: string);
begin
  olabel.Text := caption;
end;

procedure TSettingsPanel.setTabControl(AObject: TTabControl);
begin
  TabControl := AObject;
end;

procedure TSettingsPanel.setTabIndex(index: integer);
begin
  tabcontrolindex := index;
end;

end.

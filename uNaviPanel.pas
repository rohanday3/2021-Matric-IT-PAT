unit uNaviPanel;

interface

uses
  FMX.StdCtrls, FMX.Objects, FMX.Controls, FMX.Layouts, FMX.Types, UIConsts,
  UITypes, FMX.TabControl;

Type
  TNaviPanel = Class(TPanel)
  public
    { public fields }
    constructor Create(AOwner, AParent: TFmxObject);
    procedure SetLabel(caption: string);
    function GetLabel: string;
    procedure SetImage(image: string);
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
  end;

implementation

{ TNaviPanel }

constructor TNaviPanel.Create(AOwner, AParent: TFmxObject);
begin
  selected := False;
  opanel := TRectangle.Create(AOwner);
  opanel.Parent := AParent;
  opanel.Width := TFlowLayout(AParent).Width;
  opanel.onMouseEnter := onMouseEnter;
  opanel.onMouseLeave := onMouseLeave;
  opanel.Height := 55;
  opanel.Stroke.Thickness := 0;
  opanel.OnClick := onPanelClick;
  opanel.Fill.Color := StringToAlphaColor('#FF222D31');
  olabel := TLabel.Create(AOwner);
  olabel.Parent := opanel;
  olabel.Position.X := 100;
  olabel.Position.Y := 14;
  olabel.StyledSettings := olabel.StyledSettings - [TStyledSetting.ssFamily,
    TStyledSetting.ssSize, TStyledSetting.FontColor];
  olabel.AutoSize := True;
  olabel.TextSettings.Font.Size := 18;
  olabel.TextSettings.FontColor := TAlphaColors.White;
  olabel.Font.Family := 'Segoe UI';
  oimage := TImage.Create(AOwner);
  oimage.Parent := opanel;
  oimage.Position.X := 6;
  oimage.Position.Y := 7;
  oimage.Width := 40;
  oimage.Height := 40;
end;

function TNaviPanel.GetLabel: string;
begin
  Result := olabel.Text;
end;

function TNaviPanel.GetTabIndex: integer;
begin
  Result := tabcontrolindex;
end;

procedure TNaviPanel.onMouseEnter(Sender: TObject);
begin
  if not selected then
    // opanel.Fill.Color := StringToAlphaColor('#FF1D262B');
    opanel.Fill.Color := StringToAlphaColor('#FF6d797e');
end;

procedure TNaviPanel.onMouseLeave(Sender: TObject);
begin
  if not selected then
    opanel.Fill.Color := StringToAlphaColor('#FF222D31');
end;

procedure TNaviPanel.onPanelClick(Sender: TObject);
begin
  TabControl.TabIndex := tabcontrolindex;
  selected := True;
  opanel.Fill.Color := StringToAlphaColor('#FFF15A23');
end;

procedure TNaviPanel.resetColor;
begin
  opanel.Fill.Color := StringToAlphaColor('#FF222D31');
  selected := False;
end;

procedure TNaviPanel.setClicked;
begin
  opanel.Fill.Color := StringToAlphaColor('#FFF15A23');
  selected:=True;
end;

procedure TNaviPanel.SetImage(image: string);
begin
  oimage.Bitmap.LoadFromFile(image);
end;

procedure TNaviPanel.SetLabel(caption: string);
begin
  olabel.Text := caption;
end;

procedure TNaviPanel.setTabControl(AObject: TTabControl);
begin
  TabControl := AObject;
end;

procedure TNaviPanel.setTabIndex(index: integer);
begin
  tabcontrolindex := index;
end;

end.

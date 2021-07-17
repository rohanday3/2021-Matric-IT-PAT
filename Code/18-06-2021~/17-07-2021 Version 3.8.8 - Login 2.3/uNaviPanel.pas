unit uNaviPanel;

interface

uses
  FMX.StdCtrls, FMX.Objects, FMX.Controls, FMX.Layouts, FMX.Types, UIConsts,
  UITypes, FMX.TabControl, FMX.Multiview, FMX.Dialogs, System.SysUtils;

Type
  TNaviPanel = Class(TObject)
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
    class procedure Release(arr: array of TNaviPanel);
    destructor Destroy; override;
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
  opanel.Height := 55;
  opanel.Stroke.Thickness := 0;
  opanel.OnClick := onPanelClick;
  opanel.Fill.Color := StringToAlphaColor('#FF222D31');
  opanel.onMouseEnter := onMouseEnter;
  opanel.onMouseLeave := onMouseLeave;
  olabel := TLabel.Create(AOwner);
  olabel.Parent := opanel;
  olabel.Position.X := 70;
  olabel.Position.Y := 15;
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
  oimage.OnClick := opanel.OnClick;
  oimage.onMouseEnter := onMouseEnter;
  oimage.onMouseLeave := onMouseLeave;
end;

class procedure TNaviPanel.Release(arr: array of TNaviPanel);
var
  a: TNaviPanel;
begin
  for a in arr do
  begin
    a.Destroy;
  end;
end;

destructor TNaviPanel.Destroy;
begin
  opanel.Free;
  inherited;
end;

function TNaviPanel.GetLabel: string;
begin
  Result := olabel.Text;
end;

function TNaviPanel.GetTImage: TImage;
begin
  Result := oimage;
end;

function TNaviPanel.GetTabIndex: integer;
begin
  Result := tabcontrolindex;
end;

procedure TNaviPanel.onMouseEnter(Sender: TObject);
begin
  if (selected <> True) then
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
  selected := True;
end;

procedure TNaviPanel.SetImage(image: string);
begin
  oimage.Bitmap.LoadFromFile(image);
end;

procedure TNaviPanel.SetLabel(caption: string);
begin
  olabel.Text := caption;
  oimage.Hint := caption;
  oimage.ShowHint := True;
  opanel.Hint := caption;
  opanel.ShowHint := True;
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

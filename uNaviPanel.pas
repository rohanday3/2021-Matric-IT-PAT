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
    procedure SetImage(image: string);
    function GetTabIndex: integer;
    procedure setTabIndex(index: integer);
    procedure setTabControl(AObject: TTabControl);
  protected
    { protected fields }
    { protected methods }
  private
    { private fields }
    olabel: TLabel;
    oimage: TImage;
    opanel: TRectangle;
    tabcontrolindex: integer;
    tabcontrol:TTabControl;
    { private methods }
    procedure onMouseEnter(Sender: TObject);
    procedure onMouseLeave(Sender: TObject);
    procedure onPanelClick(Sender: TObject);
  end;

implementation

{ TNaviPanel }

constructor TNaviPanel.Create(AOwner, AParent: TFmxObject);
begin
  opanel := TRectangle.Create(AOwner);
  opanel.Parent := AParent;
  opanel.Width := TFlowLayout(AParent).Width;
  opanel.onMouseEnter := onMouseEnter;
  opanel.Height := 55;
  opanel.Stroke.Thickness := 0;
  opanel.OnClick:=onPanelClick;
  opanel.Fill.Color := TAlphaColors.Dodgerblue;
  olabel := TLabel.Create(AOwner);
  olabel.Parent := opanel;
  olabel.Position.X := 100;
  olabel.Position.Y := 14;
  olabel.StyledSettings := olabel.StyledSettings - [TStyledSetting.ssFamily,
    TStyledSetting.ssSize, TStyledSetting.FontColor];
  olabel.AutoSize := True;
  olabel.TextSettings.Font.Size := 18;
  olabel.TextSettings.FontColor := TAlphaColors.White;
  olabel.Font.Style := [];
  olabel.Font.Family := 'Segoe UI';
  oimage := TImage.Create(AOwner);
  oimage.Parent := opanel;
  oimage.Position.X := 6;
  oimage.Position.Y := 7;
  oimage.Width := 40;
  oimage.Height := 40;
end;

function TNaviPanel.GetTabIndex: integer;
begin
  Result := tabcontrolindex;
end;

procedure TNaviPanel.onMouseEnter(Sender: TObject);
begin
  opanel.Fill.Color := StringToAlphaColor('#1E90FE');
end;

procedure TNaviPanel.onMouseLeave(Sender: TObject);
begin

end;

procedure TNaviPanel.onPanelClick(Sender: TObject);
begin
  tabcontrol.TabIndex:=tabcontrolindex;
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
tabcontrol:=AObject;
end;

procedure TNaviPanel.setTabIndex(index: integer);
begin
  tabcontrolindex := index;
end;

end.

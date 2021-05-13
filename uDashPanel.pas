unit uDashPanel;

interface

uses
  FMX.StdCtrls, FMX.Objects, FMX.Controls, FMX.Layouts, FMX.Types, UIConsts,
  UITypes, FMX.TabControl;

Type
  TDashPanel = Class(TPanel)
  public
    { public fields }
    constructor Create(AOwner, AParent: TFmxObject);
    procedure SetLabel1(caption: string);
    procedure SetLabel2(caption: string);
    function GetLabel1: string;
    procedure SetImage(image: string);
    procedure resetColor;
    procedure setColor(Color: TAlphaColor);
    function GetTImage:TImage;
  protected
    { protected fields }
    { protected methods }
  private
    { private fields }
    olabel1: TLabel;
    olabel2: TLabel;
    oimage: TImage;
    opanel: TRectangle;
    { private methods }
    procedure onMouseEnter(Sender: TObject);
    procedure onMouseLeave(Sender: TObject);
    procedure onPanelClick(Sender: TObject);
  end;

implementation

{ TDashPanel }

constructor TDashPanel.Create(AOwner, AParent: TFmxObject);
begin
  opanel := TRectangle.Create(AOwner);
  opanel.Parent := AParent;
  opanel.Width := 300;
  opanel.Height := 150;
  opanel.Margins.Top := 10;
  opanel.Margins.Left := 10;
  opanel.Margins.Right := 10;
  opanel.Margins.Bottom := 10;
  opanel.Stroke.Thickness := 0;

  olabel1 := TLabel.Create(AOwner);
  olabel1.Parent := opanel;
  olabel1.Font.Family := 'Vollkorn SC SemiBold';
  olabel1.Font.Size := 56;
  olabel1.Position.X := 12;
  olabel1.Position.Y := -8;
  olabel1.FontColor := talphacolors.White;
  olabel1.StyledSettings := [];
  olabel1.AutoSize := true;
  olabel1.Text := '1';

  olabel2 := TLabel.Create(AOwner);
  olabel2.Parent := opanel;
  olabel2.Font.Family := 'Carlson Blur Bold';
  olabel2.Font.Size := 22;
  olabel2.Position.X := 15;
  olabel2.Position.Y := 64;
  olabel2.FontColor := talphacolors.White;
  olabel2.StyledSettings := [];
  olabel2.Width:=250;
  olabel2.AutoSize := true;
  olabel2.Text := '1';

  oimage := TImage.Create(AOwner);
  oimage.Parent := opanel;
  oimage.Opacity := 0.15;
  oimage.Position.X := 130;
  oimage.Position.Y := 15;
  oimage.Width := 180;
  oimage.Height := 120;
end;

function TDashPanel.GetLabel1: string;
begin

end;

function TDashPanel.GetTImage: TImage;
begin
  Result:= oimage;
end;

procedure TDashPanel.onMouseEnter(Sender: TObject);
begin

end;

procedure TDashPanel.onMouseLeave(Sender: TObject);
begin

end;

procedure TDashPanel.onPanelClick(Sender: TObject);
begin

end;

procedure TDashPanel.resetColor;
begin

end;

procedure TDashPanel.setColor(Color: TAlphaColor);
begin
  opanel.Fill.Color := Color;
end;

procedure TDashPanel.SetImage(image: string);
begin
  oimage.Bitmap.LoadFromFile(image);
end;

procedure TDashPanel.SetLabel1(caption: string);
begin
  olabel1.Text := caption;
end;

procedure TDashPanel.SetLabel2(caption: string);
begin
  olabel2.Text := caption;
end;

end.

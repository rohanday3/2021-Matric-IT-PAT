unit uDashPanel;

interface

uses
  FMX.StdCtrls, FMX.Objects, FMX.Controls, FMX.Layouts, FMX.Types, UIConsts,
  UITypes, FMX.TabControl, FMX.Ani, System.SysUtils, System.Types, FMX.Forms;

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
    function GetTImage: TImage;
    procedure AnimationF;
    procedure AnimationR;
  protected
    { protected fields }
    { protected methods }
  private
    { private fields }
    olabel1: TLabel;
    olabel2: TLabel;
    orect: TRectangle;
    oimage: TImage;
    oFloatAnimationF: tfloatanimation;
    oFloatAnimationR: tfloatanimation;
    MouseInRect: Boolean;
    { private methods }
    procedure onMouseEnter(Sender: TObject);
    procedure onMouseLeave(Sender: TObject);
    procedure onPanelClick(Sender: TObject);
    procedure ChangeColour(colour, option: string);
  published
    opanel: TRectangle;
  end;

implementation

{ TDashPanel }

procedure TDashPanel.AnimationF;
begin
  oFloatAnimationF.Start;
end;

procedure TDashPanel.AnimationR;
begin
  oFloatAnimationR.Start;
end;

procedure TDashPanel.ChangeColour(colour, option: string);
var
  colour_string: string;
  red, green, blue: integer;
const
  change_by: integer = 10;
begin
  colour_string := copy(colour, 4, 6);
  red := StrToInt64('$' + copy(colour_string, 1, 2));
  green := StrToInt64('$' + copy(colour_string, 3, 2));
  blue := StrToInt64('$' + copy(colour_string, 5, 2));

  if option = 'lighten' then
    opanel.fill.Color := StringtoAlphaColor(copy(colour, 1, 3) +
      IntToHex(red + change_by, 1) + IntToHex(green + change_by, 1) +
      IntToHex(blue + change_by, 1));
  if option = 'darken' then
    opanel.fill.Color := StringtoAlphaColor(copy(colour, 1, 3) +
      IntToHex(red - change_by, 1) + IntToHex(green - change_by, 1) +
      IntToHex(blue - change_by, 1));
end;

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
  olabel1.Width := 200;
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
  olabel2.Width := 250;
  olabel2.AutoSize := true;
  olabel2.Text := '1';

  oimage := TImage.Create(AOwner);
  oimage.Parent := opanel;
  oimage.Opacity := 0.15;
  oimage.Position.X := 130;
  oimage.Position.Y := 15;
  oimage.Width := 180;
  oimage.Height := 120;
  oimage.onMouseEnter := onMouseEnter;
  oimage.onMouseLeave := onMouseLeave;

  oFloatAnimationF := tfloatanimation.Create(AOwner);
  oFloatAnimationF.Parent := oimage;
  oFloatAnimationF.PropertyName := 'Position.Y';
  oFloatAnimationF.Duration := 0.2;
  oFloatAnimationF.StartValue := 15;
  oFloatAnimationF.StopValue := 10;

  oFloatAnimationR := tfloatanimation.Create(AOwner);
  oFloatAnimationR.Parent := oimage;
  oFloatAnimationR.PropertyName := 'Position.Y';
  oFloatAnimationR.Duration := 0.2;
  oFloatAnimationR.StartValue := 10;
  oFloatAnimationR.StopValue := 15;

  orect := TRectangle.Create(AOwner);
  orect.Parent := opanel;
  orect.Align := TAlignLayout.Client;
  orect.fill.Color := StringtoAlphaColor('#00FFFFFF');
  orect.Stroke.Color := StringtoAlphaColor('#00FFFFFF');
  orect.onMouseEnter := onMouseEnter;
  orect.onMouseLeave := onMouseLeave;
  orect.BringToFront;
end;

function TDashPanel.GetLabel1: string;
begin

end;

function TDashPanel.GetTImage: TImage;
begin
  Result := oimage;
end;

procedure TDashPanel.onMouseEnter(Sender: TObject);
begin
  (ChangeColour(AlphaColorToString(opanel.fill.Color), 'lighten'));
  oFloatAnimationF.Start;
end;

procedure TDashPanel.onMouseLeave(Sender: TObject);
begin
  (ChangeColour(AlphaColorToString(opanel.fill.Color), 'darken'));
  oFloatAnimationR.Start;
end;

procedure TDashPanel.onPanelClick(Sender: TObject);
begin

end;

procedure TDashPanel.resetColor;
begin

end;

procedure TDashPanel.setColor(Color: TAlphaColor);
begin
  opanel.fill.Color := Color;
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
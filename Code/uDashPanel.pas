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

unit uDashPanel;

interface

uses
  FMX.StdCtrls, FMX.Objects, FMX.Controls, FMX.Layouts, FMX.Types, UIConsts,
  UITypes, FMX.TabControl, FMX.Ani, System.SysUtils, System.Types, FMX.Forms,
  FMX.Effects;

Type
  TDashPanel = Class(TObject)
    olabel1: TLabel;
    olabel2: TLabel;
    orect: TRectangle;
    oimage: TImage;
    oFloatAnimationF: tfloatanimation;
    oFloatAnimationR: tfloatanimation;
    oSizeAnimationF: tfloatanimation;
    oSizeAnimationR: tfloatanimation;
    oshaddow: TShadowEffect;
  public
    { public fields }
    procedure SetLabel1(caption: string);
    procedure SetLabel2(caption: string);
    function GetLabel1: string;
    procedure SetImage(image: string);
    procedure resetColor;
    procedure setColor(Color: TAlphaColor);
    function GetTImage: TImage;
    procedure AnimationF;
    procedure AnimationR;
    destructor Destroy; override;
    class procedure Release(arr: array of TDashPanel);
  protected
    { protected fields }
    { protected methods }
  private
    { private fields }
    MouseInRect: Boolean;
    { private methods }
    procedure onMouseEnter(Sender: TObject);
    procedure onMouseLeave(Sender: TObject);
    procedure onPanelClick(Sender: TObject);
    procedure ChangeColour(colour, option: string);
  published
    opanel: TRectangle;
    constructor Create(AOwner, AParent: TFmxObject);
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
  with opanel do
  begin
    Parent := AParent;
    Width := 320;
    Height := 160;
    Margins.Top := 10;
    Margins.Left := 10;
    Margins.Right := 10;
    Margins.Bottom := 10;
    Stroke.Thickness := 0;
    XRadius := 5;
    YRadius := 5;
  end;

  oshaddow := TShadowEffect.Create(AOwner);
  with oshaddow do
  begin
    Parent := opanel;
    Direction := 60;
    Softness := 0.5;
    Opacity := 0.5;
    Distance := 2;
    Enabled := False;
  end;

  olabel1 := TLabel.Create(AOwner);
  with olabel1 do
  begin
    Parent := opanel;
    Font.Family := 'Arial Rounded MT Bold';
    // Arial Rounded MT Bold //Arial Black // Vollkorn SC SemiBold
    Font.Size := 54;
    Position.X := 12;
    Position.Y := 66;
    Width := 200;
    FontColor := talphacolors.White;
    StyledSettings := [];
    AutoSize := true;
    Text := '1';
  end;

  olabel2 := TLabel.Create(AOwner);
  with olabel2 do
  begin
    Parent := opanel;
    Font.Family := 'Gill Sans MT';
    Font.Size := 24;
    Position.X := 15;
    Position.Y := 20;
    FontColor := talphacolors.White;
    StyledSettings := [];
    Width := 250;
    AutoSize := true;
    Text := '1';
  end;

  oimage := TImage.Create(AOwner);
  // oimage.onMouseEnter := onMouseEnter;
  // oimage.onMouseLeave := onMouseLeave;
  with oimage do
  begin
    Parent := opanel;
    Opacity := 0.15;
    Position.X := 150;
    Position.Y := 25;
    Width := 180;
    Height := 120;
  end;

  oFloatAnimationF := tfloatanimation.Create(AOwner);
  with oFloatAnimationF do
  begin
    Parent := oimage;
    PropertyName := 'Position.Y';
    Duration := 0.2;
    StartValue := 25;
    StopValue := 10;
  end;

  oFloatAnimationR := tfloatanimation.Create(AOwner);
  with oFloatAnimationR do
  begin
    Parent := oimage;
    PropertyName := 'Position.Y';
    Duration := 0.2;
    StartValue := 10;
    StopValue := 25;
  end;

  oSizeAnimationF := tfloatanimation.Create(AOwner);
  with oSizeAnimationF do
  begin
    Parent := oimage;
    PropertyName := 'Height';
    Duration := 0.2;
    StartValue := 120;
    StopValue := 130;
  end;

  oSizeAnimationR := tfloatanimation.Create(AOwner);
  with oSizeAnimationR do
  begin
    Parent := oimage;
    PropertyName := 'Height';
    Duration := 0.2;
    StartValue := 130;
    StopValue := 120;
  end;

  orect := TRectangle.Create(AOwner);
  with orect do
  begin
    Parent := opanel;
    Align := TAlignLayout.Client;
    fill.Color := StringtoAlphaColor('#00FFFFFF');
    Stroke.Color := StringtoAlphaColor('#00FFFFFF');
    onMouseEnter := Self.onMouseEnter;
    onMouseLeave := Self.onMouseLeave;
    BringToFront;
  end;
end;

destructor TDashPanel.Destroy;
begin
  opanel.Free;
  inherited;
end;

class procedure TDashPanel.Release(arr: array of TDashPanel);
var
  a: TDashPanel;
begin
  for a in arr do
  begin
    a.Destroy;
  end;
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
  oSizeAnimationF.Start;
  oshaddow.Enabled := true;
  // olabel1.FontColor := talphacolors.Black;
  // olabel2.FontColor := talphacolors.Dodgerblue;;
end;

procedure TDashPanel.onMouseLeave(Sender: TObject);
begin
  (ChangeColour(AlphaColorToString(opanel.fill.Color), 'darken'));
  oFloatAnimationR.Start;
  oSizeAnimationR.Start;
  oshaddow.Enabled := False;
  // olabel1.FontColor := talphacolors.White;
  // olabel2.FontColor := talphacolors.White;
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

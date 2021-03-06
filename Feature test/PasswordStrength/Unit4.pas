unit Unit4;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Ani, UIConsts,
  Unit1, Windows, StrUtils;

type
  TForm4 = class(TForm)
    rectCreateAccountPassword: TRectangle;
    floatCreateAccountPassF: TFloatAnimation;
    floatCreateAccountPassR: TFloatAnimation;
    rectCreateAccountPassUI: TRectangle;
    lblCreateAccountPasswordSubtitle: TLabel;
    lblCreateAccountPasswordTitle: TLabel;
    floatCreateAccountPassUIF: TFloatAnimation;
    floatCreateAccountPassUIR: TFloatAnimation;
    rectCreateAccountPasswordError: TRectangle;
    rectCreatePasswordBtnNext: TRectangle;
    lblCreatePasswordBtnNext: TLabel;
    rectCreateShowPassword: TRectangle;
    rectCreateShowPasswordBox: TRectangle;
    imgCreateShowPasswordBox: TImage;
    lblCreateShowPassword: TLabel;
    rectEdtCreateAccountPassword: TRectangle;
    edtCreateAccountPassword: TEdit;
    rectCreateBtnBackP: TRectangle;
    floatCreateBackF: TFloatAnimation;
    floatCreateBackR: TFloatAnimation;
    rectCreateBtnBack: TRectangle;
    imgCreateBtnBack: TImage;
    lblCreateBtnBack: TLabel;
    lblCreateAccountPasswordError: TLabel;
    rectPassStrength: TRectangle;
    rectPassStrength1: TRectangle;
    rectPassStrength2: TRectangle;
    rectPassStrength5: TRectangle;
    rectPassStrength4: TRectangle;
    rectPassStrength3: TRectangle;
    lblPassStrength: TLabel;
    procedure rectCreateShowPasswordClick(Sender: TObject);
    procedure rectCreateShowPasswordMouseEnter(Sender: TObject);
    procedure rectCreateShowPasswordMouseLeave(Sender: TObject);
    procedure edtCreateAccountPasswordTyping(Sender: TObject);
  private
    { Private declarations }
    procedure password_strength(Password: string);
    function StrInArray(const Value: String;
      const ArrayOfString: Array of String): Boolean;
    procedure passStrengthMeter(strength: integer);
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}

procedure TForm4.edtCreateAccountPasswordTyping(Sender: TObject);
var
  frmPass: TForm1;
begin
  {
    frmPass := TForm1.Create(self);
    frmPass.Position := TFormPosition.Designed;
    frmPass.Left := round(rectCreateAccountPassword.AbsoluteToLocal(edtCreateAccountPassword.Position.Point).X);
    frmPass.Top := round(rectCreateAccountPassword.AbsoluteToLocal(edtCreateAccountPassword.Position.Point).Y);
    frmPass.Show;
  }
  password_strength(edtCreateAccountPassword.Text);
end;

procedure TForm4.passStrengthMeter(strength: integer);
const
  captions: array of string = ['Too short', 'Weak', 'Poor', 'Fair', 'Good',
    'Strong'];
var
  grey, red, orange, yellow, blue, green: TAlphaColor;

begin
  grey := StringToAlphaColor('#FFE0E0E0');
  red := StringToAlphaColor('#FFE44242');
  orange := StringToAlphaColor('#FFF99F4A');
  yellow := StringToAlphaColor('#FFf3CC3E');
  blue := StringToAlphaColor('#FF1493FF');
  green := StringToAlphaColor('#FF36C565');
  lblPassStrength.Text := 'Password strength: ' + captions[strength];
  case strength of
    0:
      begin
        rectPassStrength1.Fill.Color := grey;
        rectPassStrength2.Fill.Color := grey;
        rectPassStrength3.Fill.Color := grey;
        rectPassStrength4.Fill.Color := grey;
        rectPassStrength5.Fill.Color := grey;
      end;
    1:
      begin
        rectPassStrength1.Fill.Color := red;
        rectPassStrength2.Fill.Color := grey;
        rectPassStrength3.Fill.Color := grey;
        rectPassStrength4.Fill.Color := grey;
        rectPassStrength5.Fill.Color := grey;
      end;
    2:
      begin
        rectPassStrength1.Fill.Color := orange;
        rectPassStrength2.Fill.Color := orange;
        rectPassStrength3.Fill.Color := grey;
        rectPassStrength4.Fill.Color := grey;
        rectPassStrength5.Fill.Color := grey;
      end;
    3:
      begin
        rectPassStrength1.Fill.Color := yellow;
        rectPassStrength2.Fill.Color := yellow;
        rectPassStrength3.Fill.Color := yellow;
        rectPassStrength4.Fill.Color := grey;
        rectPassStrength5.Fill.Color := grey;
      end;
    4:
      begin
        rectPassStrength1.Fill.Color := blue;
        rectPassStrength2.Fill.Color := blue;
        rectPassStrength3.Fill.Color := blue;
        rectPassStrength4.Fill.Color := blue;
        rectPassStrength5.Fill.Color := grey;
      end;
    5:
      begin
        rectPassStrength1.Fill.Color := green;
        rectPassStrength2.Fill.Color := green;
        rectPassStrength3.Fill.Color := green;
        rectPassStrength4.Fill.Color := green;
        rectPassStrength5.Fill.Color := green;
      end;
  end;
end;

procedure TForm4.password_strength(Password: string);
var
  Len, number, upp, low, special, req: Boolean;
  s: char;
  k: char;
  n: char;
  points: integer;
  j: TObject;
const
  numbers = ['0' .. '9'];
  special_char = ['~', '`', '!', '@', '#', '$', '%', '^', '&', '*', '(', ')',
    '_', '-', '+', '=', '{', '}', '[', ']', '|', '\', ':', ';', '"', '''', '>',
    '<', '.', ',', '?', '/'];

begin

  Len := False;
  number := False;
  upp := False;
  low := False;
  special := False;
  // Verify the strength of 'password'
  // Returns a dict indicating the wrong criteria
  // A password is considered strong if:
  // 8 characters length or more
  // 1 digit or more
  // 1 symbol or more
  // 1 uppercase letter or more
  // 1 lowercase letter or more
  //
  // Uppercase letters: A-Z
  // Lowercase letters: a-z
  // Numbers: 0-9
  // Symbols: ~`!@#$%^&*()_-+={[}]|\:;"'<,>.?/

  points := 0;

  if (Length(Password) >= 8) then
    Len := True;

  for s in Password do
  begin
    if s in numbers then
    begin
      number := True;
      // Break
    end;
    if s = UpperCase(s) then
      upp := True;
    if s = Lowercase(s) then
      low := True;
    if s in special_char then
    begin
      special := True;
      // Break;
    end;
  end;

  if Len then
    Inc(points);
  if number then
    Inc(points);
  if upp then
    Inc(points);
  if low then
    Inc(points);
  if special then
    Inc(points);

  // ShowMessage('Length: ' + BoolToStr(Len) + #13 + 'Number: ' + BoolToStr(number)
  // + #13 + 'Uppercasse: ' + BoolToStr(upp) + #13 + 'Lowercase: ' + BoolToStr(low) + #13 + 'Special: ' + BoolToStr(special) + #13 + 'Score: ' + IntToStr(points));

  passStrengthMeter(points);

end;

procedure TForm4.rectCreateShowPasswordClick(Sender: TObject);
begin
  if rectCreateShowPasswordBox.Fill.Color = StringToAlphaColor('#ffffffff') then
  begin
    rectCreateShowPasswordBox.Fill.Color := StringToAlphaColor('#ff135fc9');
    edtCreateAccountPassword.Password := False;
  end
  else
  begin
    rectCreateShowPasswordBox.Fill.Color := StringToAlphaColor('#ffffffff');
    edtCreateAccountPassword.Password := True;
  end;
end;

procedure TForm4.rectCreateShowPasswordMouseEnter(Sender: TObject);
begin
  if rectCreateShowPasswordBox.Fill.Color = StringToAlphaColor('#ff1a79ff') then
    rectCreateShowPasswordBox.Fill.Color := StringToAlphaColor('#ff135fc9');
end;

procedure TForm4.rectCreateShowPasswordMouseLeave(Sender: TObject);
begin
  if rectCreateShowPasswordBox.Fill.Color = StringToAlphaColor('#ff135fc9') then
    rectCreateShowPasswordBox.Fill.Color := StringToAlphaColor('#ff1a79ff');
end;

function TForm4.StrInArray(const Value: String;
  const ArrayOfString: array of String): Boolean;
var
  Loop: String;
begin
  for Loop in ArrayOfString do
  begin
    if Value = Loop then
    begin
      Exit(True);
    end;
  end;
  result := False;
end;

end.

unit uLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Platform, FMX.Ani,
  FMX.Edit, UIConsts, FMX.ListBox, FMX.Layouts;

type
  TForm2 = class(TForm)
    Rectangle1: TRectangle;
    Label1: TLabel;
    Rectangle2: TRectangle;
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    float: TFloatAnimation;
    zoom: TFloatAnimation;
    zoomfromcenteradjust: TFloatAnimation;
    fadeoutrectPos: TFloatAnimation;
    fadeoutrectOpacity: TFloatAnimation;
    fadeoutLabel3Opacity: TFloatAnimation;
    fadeoutLabe3Pos: TFloatAnimation;
    fadeoutLabel2Opacity: TFloatAnimation;
    fadeoutLabel2Pos: TFloatAnimation;
    Label4: TLabel;
    Rectangle3: TRectangle;
    Label5: TLabel;
    Label6: TLabel;
    loginshowRect2Height: TFloatAnimation;
    loginshowImage1Pos: TFloatAnimation;
    loginshowImage1Height: TFloatAnimation;
    rectLogin: TRectangle;
    Label7: TLabel;
    Label8: TLabel;
    Edit1: TEdit;
    Rectangle5: TRectangle;
    Label9: TLabel;
    Label10: TLabel;
    rectBtnNext: TRectangle;
    rectBtnBack: TRectangle;
    Label11: TLabel;
    Label12: TLabel;
    Rectangle4: TRectangle;
    Label13: TLabel;
    Rectangle6: TRectangle;
    rectLogin2: TRectangle;
    Rectangle7: TRectangle;
    Image2: TImage;
    Label14: TLabel;
    Label15: TLabel;
    Rectangle8: TRectangle;
    Edit2: TEdit;
    Label16: TLabel;
    Rectangle9: TRectangle;
    Rectangle10: TRectangle;
    Label17: TLabel;
    floatRectLoginPosF: TFloatAnimation;
    floatRectLoginPosR: TFloatAnimation;
    floatRectLoginFadeF: TFloatAnimation;
    floatRectLogin2FadeR: TFloatAnimation;
    Rectangle11: TRectangle;
    Rectangle12: TRectangle;
    floatRectLogin2PosF: TFloatAnimation;
    floatRectLogin2PosR: TFloatAnimation;
    floatRect11PosF: TFloatAnimation;
    floatRect11PosR: TFloatAnimation;
    Rectangle13: TRectangle;
    Label18: TLabel;
    Rectangle14: TRectangle;
    AniIndicator1: TAniIndicator;
    Timer1: TTimer;
    Rectangle15: TRectangle;
    Label19: TLabel;
    Rectangle16: TRectangle;
    Label20: TLabel;
    Rectangle17: TRectangle;
    Edit3: TEdit;
    Rectangle18: TRectangle;
    StyleBook1: TStyleBook;
    ComboBox1: TComboBox;
    Label21: TLabel;
    Rectangle19: TRectangle;
    procedure zoomFinish(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure floatFinish(Sender: TObject);
    procedure Rectangle1Click(Sender: TObject);
    procedure fadeoutLabel2PosFinish(Sender: TObject);
    procedure Rectangle3Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Rectangle4MouseEnter(Sender: TObject);
    procedure Rectangle4MouseLeave(Sender: TObject);
    procedure rectBtnBackMouseEnter(Sender: TObject);
    procedure rectBtnBackMouseLeave(Sender: TObject);
    procedure rectBtnNextMouseLeave(Sender: TObject);
    procedure rectBtnNextMouseEnter(Sender: TObject);
    procedure rectBtnNextClick(Sender: TObject);
    procedure Edit1Typing(Sender: TObject);
    procedure Rectangle7MouseEnter(Sender: TObject);
    procedure Rectangle7MouseLeave(Sender: TObject);
    procedure Image2MouseEnter(Sender: TObject);
    procedure Image2MouseLeave(Sender: TObject);
    procedure Rectangle9MouseEnter(Sender: TObject);
    procedure Rectangle9MouseLeave(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure floatRectLoginPosFFinish(Sender: TObject);
    procedure floatRectLoginPosRFinish(Sender: TObject);
    procedure floatRect11PosFFinish(Sender: TObject);
    procedure Rectangle4Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Rectangle15Click(Sender: TObject);
    procedure Rectangle14Click(Sender: TObject);
    procedure Rectangle13Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure Rectangle19Click(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure FormPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
  private
    { Private declarations }
    iconstarty: Single;
    function confirmAccount: Boolean;
    procedure hideerror;
    procedure showerror(error: integer);
    procedure LoadCountryCodes;
    procedure LoadCountryCodeFiles;
    procedure StyleComboBoxItems(ComboBox: TComboBox; Family: string;
      Size: Single; Color: string);
    procedure FilterComboBox(ComboBox: TComboBox; Key: String);
    procedure ResetComboBox;
    function GetVersionNumber:string;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  errorlogin: Boolean;
  last_error: integer;
  CreateAccountForward: Boolean;
  CurrentListItem: integer;
  ComboboxSearch: string;
  CountryCodes: TStringList;
  CountryCodesFiltered: TStringList;

implementation

{$R *.fmx}

Procedure TForm2.StyleComboBoxItems(ComboBox: TComboBox; Family: string;
  Size: Single; Color: string);
var
  Item: TListBoxItem;
  i: integer;
begin
  for i := 0 to ComboBox.Count - 1 do
  begin
    Item := ComboBox.ListItems[i];
    Item.Font.Family := Family; // eg. 'Arial';
    Item.Font.Size := Size; // eg. 20;
    Item.FontColor := StringToAlphaColor(Color);
    Item.StyledSettings := Item.StyledSettings - [TStyledSetting.Family,
      TStyledSetting.Size, TStyledSetting.FontColor];
    // Item.Text := '*'+Item.Text;
  end;
end;

procedure TForm2.ComboBox1Change(Sender: TObject);
var
  s: string;
begin
  Rectangle18.Fill.Color := StringToAlphaColor('#ffffffff');
  Rectangle19.Fill.Color := StringToAlphaColor('#ffffffff');
  s := ComboBox1.Items[ComboBox1.ItemIndex];
  Label21.Text := Copy(s, Pos('+', s), Length(s) - Pos('+', s) + 1);
end;

procedure TForm2.ComboBox1Click(Sender: TObject);
begin
  Rectangle18.Fill.Color := StringToAlphaColor('#ffeeeeee');
  Rectangle19.Fill.Color := StringToAlphaColor('#ffeeeeee');
end;

procedure TForm2.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Inttostr(Key) = Inttostr(8) then // Backspace
    ComboboxSearch := Copy(ComboboxSearch, 0, Length(ComboboxSearch) - 1)
  else if Inttostr(Key) = Inttostr(16) then // Shift key press
    // Enable for debugging ShowMessage(ComboboxSearch)
  else
    ComboboxSearch := ComboboxSearch + KeyChar;
  // ShowMessage(Inttostr(Key))

  // Remove spaces
  ComboboxSearch := StringReplace(ComboboxSearch, ' ', '', [rfReplaceAll]);

  FilterComboBox(ComboBox1, ComboboxSearch)
end;

function TForm2.confirmAccount: Boolean;
begin
  if Edit1.Text = 'admin' then
    Result := True
  else
    Result := False;
end;

procedure TForm2.Edit1Click(Sender: TObject);
begin
  if not errorlogin then
    TRectangle(TEdit(Sender).Parent).Stroke.Color :=
      StringToAlphaColor('#FF1A69B9');
end;

procedure TForm2.Edit1Exit(Sender: TObject);
begin
  TRectangle(TEdit(Sender).Parent).Stroke.Color := TAlphaColors.black;
end;

procedure TForm2.Edit1Typing(Sender: TObject);
begin
  if errorlogin then
  begin
    if Length(Edit1.Text) > 0 then
    begin
      hideerror;
      errorlogin := True;
    end
    else
      showerror(2);
  end;
end;

procedure TForm2.fadeoutLabel2PosFinish(Sender: TObject);
begin
  //
  Label4.Visible := True;
  Rectangle3.Visible := True;
  Label6.Visible := True;
  Rectangle1.Cursor := crDefault;
  Rectangle1.Enabled := False;
end;

procedure TForm2.FilterComboBox(ComboBox: TComboBox; Key: String);
var
  i: integer;
begin
  if Key = '' then
  begin
    ComboBox.Items.AddStrings(CountryCodes);
    StyleComboBoxItems(ComboBox, 'Calibri', 16, '#ff000000');
    Exit;
  end;
  CountryCodesFiltered := TStringList.Create;

  CountryCodesFiltered.Clear;

  for i := 0 to CountryCodes.Count - 1 do
    if Pos(Lowercase(Key), Lowercase(CountryCodes[i])) > 0 then
      CountryCodesFiltered.Add(CountryCodes[i]);

  ComboBox.Items.Clear;
  ComboBox.Items.AddStrings(CountryCodesFiltered);
  StyleComboBoxItems(ComboBox, 'Calibri', 16, '#ff000000');
end;

procedure TForm2.floatFinish(Sender: TObject);
begin
  Label2.Visible := True;
  Label3.Visible := True;
  Rectangle1.Visible := True;
end;

procedure TForm2.floatRect11PosFFinish(Sender: TObject);
begin
  floatRectLoginPosR.Start;
end;

procedure TForm2.floatRectLoginPosFFinish(Sender: TObject);
begin
  Rectangle11.Visible := True;
  floatRect11PosR.Start;
end;

procedure TForm2.floatRectLoginPosRFinish(Sender: TObject);
begin
  Rectangle12.Visible := True;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  Rectangle2.Width := Form2.Width;
  Rectangle2.Height := Form2.Height;
  Rectangle1.Visible := False;
  Label2.Visible := False;
  Label3.Visible := False;
  iconstarty := round((Form2.Height / 2) - (Image1.Width / 2));
  zoomfromcenteradjust.StopValue := iconstarty;
  zoomfromcenteradjust.StartValue := iconstarty + 36;
  LoadCountryCodeFiles;
  LoadCountryCodes;
  Label6.Text := GetVersionNumber;
  float.StartValue := iconstarty;
  rectLogin2.BringToFront;
  rectLogin.BringToFront;
  Rectangle2.BringToFront;
  hideerror;
end;

procedure TForm2.FormPaint(Sender: TObject; Canvas: TCanvas;
  const ARect: TRectF);
begin
  if ComboBox1.DroppedDown = False then
    ResetComboBox;
end;

function TForm2.GetVersionNumber:string;
begin
Result:=Inttostr(TOSVersion.Major)+'.'+IntToStr(TOSVersion.Minor)+'.'+IntToStr(TOSVersion.Build);
//ShowMessage();
//GetEnvironmentVariable()
end;

procedure TForm2.hideerror;
begin
  Label13.Text := '';
  Rectangle6.Position.Y := 115;
  Rectangle5.Stroke.Color := StringToAlphaColor('#FF1A69B9');
  errorlogin := False;
end;

procedure TForm2.Image2Click(Sender: TObject);
begin
  // Rectangle12.Visible := False;
  floatRect11PosF.Start;
end;

procedure TForm2.Image2MouseEnter(Sender: TObject);
begin
  Rectangle7.Fill.Color := StringToAlphaColor('#FFe5e5e5');
end;

procedure TForm2.Image2MouseLeave(Sender: TObject);
begin
  Rectangle7.Fill.Color := StringToAlphaColor('#FFFFFFFF');
end;

procedure TForm2.LoadCountryCodeFiles;
var
  filestream: TFileStream;
begin
  CountryCodes := TStringList.Create;
  filestream := TFileStream.Create((GetCurrentDir + '\Country-Codes.txt'),
    fmShareDenyNone);
  Try
    CountryCodes.LoadFromStream(filestream);
  Except
    on Exception do
    begin
      ShowMessage('Country codes file not found.');
    end;
  End;
  filestream.Destroy();
end;

procedure TForm2.LoadCountryCodes;
begin
  try
    ComboBox1.Items.Clear();
    ComboBox1.Items.AddStrings(CountryCodes);
  except

  end;
  StyleComboBoxItems(ComboBox1, 'Calibri', 16, '#ff000000');
end;

procedure TForm2.Rectangle13Click(Sender: TObject);
begin
  Rectangle18.Fill.Color := StringToAlphaColor('#FFFFFFFF');
  Rectangle19.Fill.Color := StringToAlphaColor('#FFFFFFFF');
end;

procedure TForm2.Rectangle14Click(Sender: TObject);
begin
  Rectangle18.Fill.Color := StringToAlphaColor('#FFFFFFFF');
  Rectangle19.Fill.Color := StringToAlphaColor('#FFFFFFFF');
end;

procedure TForm2.Rectangle15Click(Sender: TObject);
begin
  Rectangle14.Visible := False;
  AniIndicator1.Visible := True;
  AniIndicator1.Enabled := True;
  Timer1.Interval := Random(2000) + 1000;
  Timer1.Enabled := True;
end;

procedure TForm2.Rectangle19Click(Sender: TObject);
begin
  ComboBox1.DropDown;
  ComboBox1.OnClick(ComboBox1);
  ComboBox1.SetFocus;
end;

procedure TForm2.Rectangle1Click(Sender: TObject);
begin
  fadeoutrectPos.Start;
  fadeoutrectOpacity.Start;
  fadeoutLabel3Opacity.Start;
  fadeoutLabe3Pos.Start;
  fadeoutLabel2Opacity.Start;
  fadeoutLabel2Pos.Start;
end;

procedure TForm2.Rectangle3Click(Sender: TObject);
begin
  //
  Label4.Visible := False;
  Label6.Visible := False;
  Rectangle3.Visible := False;
  Rectangle3.Enabled := False;
  loginshowRect2Height.Start;
  loginshowImage1Pos.Start;
  loginshowImage1Height.Start;
end;

procedure TForm2.Rectangle4Click(Sender: TObject);
begin
  //
  Rectangle13.BringToFront;
  Rectangle14.Visible := False;
  AniIndicator1.Visible := True;
  AniIndicator1.Enabled := True;
  Timer1.Interval := Random(1000) + 1000;
  Timer1.Enabled := True;
  CreateAccountForward := True;
end;

procedure TForm2.Rectangle4MouseEnter(Sender: TObject);
begin
  Label10.Font.Style := [TFontStyle.fsUnderline];
  Label10.FontColor := StringToAlphaColor('#FF666666');
end;

procedure TForm2.Rectangle4MouseLeave(Sender: TObject);
begin
  Label10.Font.Style := [];
  Label10.FontColor := StringToAlphaColor('#FF1A69B9');
end;

procedure TForm2.Rectangle7MouseEnter(Sender: TObject);
begin
  Rectangle7.Fill.Color := StringToAlphaColor('#FFe5e5e5');
end;

procedure TForm2.Rectangle7MouseLeave(Sender: TObject);
begin
  Rectangle7.Fill.Color := StringToAlphaColor('#FFFFFFFF');
end;

procedure TForm2.Rectangle9MouseEnter(Sender: TObject);
begin
  Label16.Font.Style := [TFontStyle.fsUnderline];
  Label16.FontColor := StringToAlphaColor('#FF666666');
end;

procedure TForm2.Rectangle9MouseLeave(Sender: TObject);
begin
  Label16.Font.Style := [];
  Label16.FontColor := StringToAlphaColor('#FF3E81C4');
end;

procedure TForm2.rectBtnBackMouseEnter(Sender: TObject);
begin
  TRectangle(Sender).Fill.Color := StringToAlphaColor('#FFb2b2b2');
end;

procedure TForm2.rectBtnBackMouseLeave(Sender: TObject);
begin
  TRectangle(Sender).Fill.Color := StringToAlphaColor('#FFcccccc');
end;

procedure TForm2.rectBtnNextClick(Sender: TObject);
begin
  if confirmAccount then
  begin
    hideerror;
    Label14.Text := Edit1.Text;
    Rectangle2.SendToBack;
    Rectangle11.Visible := False;
    // floatRectLoginFadeF.Start;
    // rectLogin2.Opacity:=0;
    floatRectLoginPosF.Start;
    // floatRectLogin2FadeR.Start;
  end
  else
  begin
    Label13.Visible := True;
    if Length(Edit1.Text) > 0 then
      showerror(0)
    else
      showerror(1);
  end;
end;

procedure TForm2.rectBtnNextMouseEnter(Sender: TObject);
begin
  TRectangle(Sender).Fill.Color := StringToAlphaColor('#FF165fa7');
end;

procedure TForm2.rectBtnNextMouseLeave(Sender: TObject);
begin
  TRectangle(Sender).Fill.Color := StringToAlphaColor('#FF1a69b9');
end;

procedure TForm2.ResetComboBox;
begin
  ComboboxSearch := '';
  LoadCountryCodes;
end;

procedure TForm2.showerror(error: integer);
begin
  Rectangle5.Stroke.Color := StringToAlphaColor('#FFde1916');
  if error = 0 then
  begin
    Label13.Text :=
      'That Appname account does not exist. Enter a different account or ';
    // red(get a new one).
    Rectangle6.Position.Y := 160;
    last_error := 0;
  end
  else if error = 1 then
  begin
    Label13.Text := 'Enter a valid username or email address';
    Rectangle6.Position.Y := 135;
    last_error := 1;
  end
  else
    showerror(last_error);
  errorlogin := True;
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
  AniIndicator1.Enabled := False;
  AniIndicator1.Visible := False;
  if CreateAccountForward then
  begin
    Rectangle14.Visible := True;
    CreateAccountForward := False;
  end
  else
    Rectangle13.SendToBack;
  Timer1.Enabled := False;
end;

procedure TForm2.zoomFinish(Sender: TObject);
begin
  float.Start;
end;

end.
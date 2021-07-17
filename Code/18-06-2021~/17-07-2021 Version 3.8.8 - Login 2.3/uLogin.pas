unit uLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Platform, FMX.Ani,
  FMX.Edit, UIConsts, FMX.ListBox, FMX.Layouts, System.Rtti,
  FMX.Grid.Style, Data.Bind.EngExt, FMX.Bind.DBEngExt, FMX.Bind.Grid,
  System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, FMX.ScrollBox, FMX.Grid, Data.DB,
  Data.Win.ADODB, System.NetEncoding, FMX.GIFImage;

type
  TForm2 = class(TForm)
    rectWelcomeBtn1: TRectangle;
    lblWelcomeBtn1: TLabel;
    RectWelome: TRectangle;
    imgAppIcon: TImage;
    lblWelcomeTitle: TLabel;
    lblWelcomeSubtitle: TLabel;
    float: TFloatAnimation;
    zoom: TFloatAnimation;
    zoomfromcenteradjust: TFloatAnimation;
    fadeoutrectPos: TFloatAnimation;
    fadeoutrectOpacity: TFloatAnimation;
    fadeoutLabel3Opacity: TFloatAnimation;
    fadeoutLabe3Pos: TFloatAnimation;
    fadeoutLabel2Opacity: TFloatAnimation;
    fadeoutLabel2Pos: TFloatAnimation;
    lblWelcome2: TLabel;
    rectWelcomeBtn2: TRectangle;
    lblWelcomeBtn2: TLabel;
    lblVersion: TLabel;
    loginshowRect2Height: TFloatAnimation;
    loginshowImage1Pos: TFloatAnimation;
    loginshowImage1Height: TFloatAnimation;
    rectLogin: TRectangle;
    lblLoginTitle: TLabel;
    lblLoginSubtitle: TLabel;
    edtLoginUsername: TEdit;
    rectLoginUsername: TRectangle;
    lblNoAccount: TLabel;
    lblBtnCreateAccount: TLabel;
    rectBtnNext: TRectangle;
    rectLoginBtnBack: TRectangle;
    Label11: TLabel;
    lblLoginBack: TLabel;
    rectBtnCreateAccount: TRectangle;
    lblLoginError: TLabel;
    rectErrorMoveUI: TRectangle;
    rectLogin2: TRectangle;
    rectLogin2BtnBack: TRectangle;
    Image2: TImage;
    lblUsernameBackBtn: TLabel;
    lblLogin2Title: TLabel;
    rectLogin2Password: TRectangle;
    edtLoginPassword: TEdit;
    Label16: TLabel;
    rectForgotPassword: TRectangle;
    rectBtnSignIn: TRectangle;
    lblBtnSignIn: TLabel;
    floatRectLoginPosF: TFloatAnimation;
    floatRectLoginPosR: TFloatAnimation;
    floatRectLoginFadeF: TFloatAnimation;
    floatRectLogin2FadeR: TFloatAnimation;
    rectLogin2UI: TRectangle;
    rectLoginUIPnl: TRectangle;
    floatRectLogin2PosF: TFloatAnimation;
    floatRectLogin2PosR: TFloatAnimation;
    floatRect11PosF: TFloatAnimation;
    floatRect11PosR: TFloatAnimation;
    RectCreateAccount: TRectangle;
    lblCreateAccountTitle: TLabel;
    rectCreateAccountUIpnl: TRectangle;
    timerAnimation: TTimer;
    rectCreateAccountBack: TRectangle;
    lblCreateAccountBack: TLabel;
    rectCreateAccountBtnNext: TRectangle;
    lblCreateAccountBtnNext: TLabel;
    rectCreateAccountPhone: TRectangle;
    edtCreateAccountPhone: TEdit;
    rectAreaCodeCombo: TRectangle;
    StyleBook1: TStyleBook;
    cmbAreaCodes: TComboBox;
    lblAreaCodes: TLabel;
    rectAreaCodeLabel: TRectangle;
    loginhideRect2Height: TFloatAnimation;
    loginhideImage1Pos: TFloatAnimation;
    loginhideImage1Height: TFloatAnimation;
    ADOQuery1: TADOQuery;
    Layout1: TLayout;
    lblUseEmail: TLabel;
    rectUseEmail: TRectangle;
    gifLoading: TGIFImage;
    lblLogin2Error: TLabel;
    rectError2MoveUI: TRectangle;
    procedure zoomFinish(Sender: TObject);
    procedure floatFinish(Sender: TObject);
    procedure rectWelcomeBtn1Click(Sender: TObject);
    procedure fadeoutLabel2PosFinish(Sender: TObject);
    procedure rectWelcomeBtn2Click(Sender: TObject);
    procedure edtLoginUsernameClick(Sender: TObject);
    procedure edtLoginUsernameExit(Sender: TObject);
    procedure rectBtnCreateAccountMouseEnter(Sender: TObject);
    procedure rectBtnCreateAccountMouseLeave(Sender: TObject);
    procedure rectLoginBtnBackMouseEnter(Sender: TObject);
    procedure rectLoginBtnBackMouseLeave(Sender: TObject);
    procedure rectBtnNextMouseLeave(Sender: TObject);
    procedure rectBtnNextMouseEnter(Sender: TObject);
    procedure rectBtnNextClick(Sender: TObject);
    procedure edtLoginUsernameTyping(Sender: TObject);
    procedure rectLogin2BtnBackMouseEnter(Sender: TObject);
    procedure rectLogin2BtnBackMouseLeave(Sender: TObject);
    procedure Image2MouseEnter(Sender: TObject);
    procedure Image2MouseLeave(Sender: TObject);
    procedure rectForgotPasswordMouseEnter(Sender: TObject);
    procedure rectForgotPasswordMouseLeave(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure floatRectLoginPosFFinish(Sender: TObject);
    procedure floatRectLoginPosRFinish(Sender: TObject);
    procedure floatRect11PosFFinish(Sender: TObject);
    procedure rectBtnCreateAccountClick(Sender: TObject);
    procedure timerAnimationTimer(Sender: TObject);
    procedure rectCreateAccountBackClick(Sender: TObject);
    procedure rectCreateAccountUIpnlClick(Sender: TObject);
    procedure RectCreateAccountClick(Sender: TObject);
    procedure cmbAreaCodesChange(Sender: TObject);
    procedure cmbAreaCodesClick(Sender: TObject);
    procedure rectAreaCodeLabelClick(Sender: TObject);
    procedure cmbAreaCodesKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure FormPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
    procedure rectLoginBtnBackClick(Sender: TObject);
    procedure loginhideRect2HeightFinish(Sender: TObject);
    procedure rectBtnSignInClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtLoginUsernameKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edtLoginPasswordKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure lblUseEmailClick(Sender: TObject);
    procedure lblUseEmailMouseEnter(Sender: TObject);
    procedure edtLoginPasswordClick(Sender: TObject);
    procedure edtLoginPasswordTyping(Sender: TObject);
  private
    { Private declarations }
    iconstarty: Single;
    function confirmAccount: Boolean;
    function confirmPassword: Boolean;
    procedure hideerror1;
    procedure hideerror2;
    procedure showerror1(error: integer);
    procedure showerror2(error: integer);
    procedure LoadCountryCodes;
    procedure LoadCountryCodeFiles;
    procedure StyleComboBoxItems(ComboBox: TComboBox; Family: string;
      Size: Single; Color: string);
    procedure FilterComboBox(ComboBox: TComboBox; Key: String);
    procedure ResetComboBox;
    function GetVersionNumber: string;
    procedure ScaleScreen;
    function GetScreenScale: Single;

  const
    iniWidth: integer = 455;
    iniHeight: integer = 635;
    Appname: string = 'Robin Hood';
    clr_accent1: String = '#FF00f0cb';
    clr_accent2: String = '#FF00c78c';
  public
    { Public declarations }
    class function Execute: Boolean;
  end;

var
  Form2: TForm2;
  errorlogin1, errorlogin2: Boolean;
  last_error1, last_error2, login_state: integer;
  CreateAccountForward: Boolean;
  CurrentListItem: integer;
  ComboboxSearch: string;
  CountryCodes: TStringList;
  CountryCodesFiltered: TStringList;
  FormWidth, FormHeight: integer;

implementation

uses
  uMain;

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
    Item.FontColor := StringToAlphacolor(Color);
    Item.StyledSettings := Item.StyledSettings - [TStyledSetting.Family,
      TStyledSetting.Size, TStyledSetting.FontColor];
    // Item.Text := '*'+Item.Text;
  end;
end;

procedure TForm2.cmbAreaCodesChange(Sender: TObject);
var
  s: string;
begin
  rectAreaCodeCombo.Fill.Color := StringToAlphacolor('#ffffffff');
  rectAreaCodeLabel.Fill.Color := StringToAlphacolor('#ffffffff');
  s := cmbAreaCodes.Items[cmbAreaCodes.ItemIndex];
  lblAreaCodes.Text := Copy(s, Pos('+', s), Length(s) - Pos('+', s) + 1);
end;

procedure TForm2.cmbAreaCodesClick(Sender: TObject);
begin
  rectAreaCodeCombo.Fill.Color := StringToAlphacolor('#ffeeeeee');
  rectAreaCodeLabel.Fill.Color := StringToAlphacolor('#ffeeeeee');
end;

procedure TForm2.cmbAreaCodesKeyDown(Sender: TObject; var Key: Word;
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

  FilterComboBox(cmbAreaCodes, ComboboxSearch)
end;

function TForm2.confirmAccount: Boolean;
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT * FROM Users Where (username = :User)');
  ADOQuery1.Parameters.ParamByName('User').Value := edtLoginUsername.Text;
  ADOQuery1.Open;
  if ADOQuery1.RecordCount = 0 then
  begin
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('SELECT * FROM Employees Where (username = :User)');
    ADOQuery1.Parameters.ParamByName('User').Value := edtLoginUsername.Text;
    ADOQuery1.Open;
  end;
  if ADOQuery1.RecordCount > 0 then
    Result := True
  else
    Result := False;
end;

function TForm2.confirmPassword: Boolean;
begin
  if TNetEncoding.Base64.EncodeBytesToString
    (TEncoding.UTF8.GetBytes(edtLoginPassword.Text)) = ADOQuery1.FieldByName
    ('password').AsString then
    Result := True
  else
    Result := False;

end;

procedure TForm2.edtLoginUsernameClick(Sender: TObject);
begin
  if not errorlogin1 then
    TRectangle(TEdit(Sender).Parent).Stroke.Color :=
      StringToAlphacolor('#FF1A69B9');
end;

procedure TForm2.edtLoginUsernameExit(Sender: TObject);
begin
  TRectangle(TEdit(Sender).Parent).Stroke.Color := TAlphaColors.black;
end;

procedure TForm2.edtLoginUsernameKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if (Key = 13) and (login_state = 1) then
  begin
    rectBtnNextClick(nil);
  end;
end;

procedure TForm2.edtLoginUsernameTyping(Sender: TObject);
begin
  if errorlogin1 then
  begin
    if Length(edtLoginUsername.Text) > 0 then
    begin
      hideerror1;
      errorlogin1 := True;
    end
    else
      showerror1(2);
  end;
end;

procedure TForm2.edtLoginPasswordClick(Sender: TObject);
begin
  if not errorlogin2 then
    TRectangle(TEdit(Sender).Parent).Stroke.Color :=
      StringToAlphacolor('#FF1A69B9');
end;

procedure TForm2.edtLoginPasswordKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if (Key = 13) and (login_state = 2) then
  begin
    rectBtnSignInClick(nil);
  end;
end;

procedure TForm2.edtLoginPasswordTyping(Sender: TObject);
begin
  if errorlogin2 then
  begin
    if Length(edtLoginPassword.Text) > 0 then
    begin
      hideerror2;
      errorlogin2 := True;
    end
    else
      showerror2(2);
  end;
end;

class function TForm2.Execute: Boolean;
begin
  with TForm2.Create(nil) do
    try
      Result := ShowModal = mrOk;
    finally
      Free;
    end;
end;

procedure TForm2.fadeoutLabel2PosFinish(Sender: TObject);
begin
  //
  lblWelcome2.Visible := True;
  rectWelcomeBtn2.Visible := True;
  lblVersion.Visible := True;
  rectWelcomeBtn1.Cursor := crDefault;
  rectWelcomeBtn1.Enabled := False;
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
  lblWelcomeTitle.Visible := True;
  lblWelcomeSubtitle.Visible := True;
  rectWelcomeBtn1.Visible := True;
end;

procedure TForm2.floatRect11PosFFinish(Sender: TObject);
begin
  floatRectLoginPosR.Start;
end;

procedure TForm2.floatRectLoginPosFFinish(Sender: TObject);
begin
  rectLogin2UI.Visible := True;
  floatRect11PosR.Start;
end;

procedure TForm2.floatRectLoginPosRFinish(Sender: TObject);
begin
  rectLoginUIPnl.Visible := True;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  ADOQuery1.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='
    + GetCurrentDir + '\robinhood.mdb' + ';Persist Security Info=False';
  ScaleScreen;
  lblLoginSubtitle.Text := 'to continue to ' + Appname;
  lblWelcomeTitle.Text := 'Welcome to ' + Appname;
  login_state := 0;
  RectWelome.Width := 460;
  RectWelome.Height := 640;
  rectWelcomeBtn1.Visible := False;
  lblWelcomeTitle.Visible := False;
  lblWelcomeSubtitle.Visible := False;
  iconstarty := Round((640 / 2) - (imgAppIcon.Width / 2));
  zoomfromcenteradjust.StopValue := iconstarty;
  zoomfromcenteradjust.StartValue := iconstarty + 36;
  LoadCountryCodeFiles;
  LoadCountryCodes;
  lblVersion.Text := GetVersionNumber;
  float.StartValue := iconstarty;
  rectLogin2.BringToFront;
  rectLogin.BringToFront;
  RectWelome.BringToFront;
  hideerror1;
  hideerror2;
end;

procedure TForm2.FormPaint(Sender: TObject; Canvas: TCanvas;
  const ARect: TRectF);
begin
  if cmbAreaCodes.DroppedDown = False then
    ResetComboBox;
end;

function TForm2.GetScreenScale: Single;
var
  ScrService: IFMXScreenService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXScreenService,
    ScrService) then
  begin
    Result := ScrService.GetScreenScale;
  end;
end;

function TForm2.GetVersionNumber: string;
begin
  Result := Inttostr(TOSVersion.Major) + '.' + Inttostr(TOSVersion.Minor) + '.'
    + Inttostr(TOSVersion.Build);
  // ShowMessage();
  // GetEnvironmentVariable()
end;

procedure TForm2.hideerror1;
begin
  lblLoginError.Text := '';
  rectErrorMoveUI.Position.Y := 130;
  rectLoginUsername.Stroke.Color := StringToAlphacolor('#FF1A69B9');
  errorlogin1 := False;
end;

procedure TForm2.hideerror2;
begin
  lblLogin2Error.Text := '';
  rectError2MoveUI.Position.Y := 130;
  rectLogin2Password.Stroke.Color := StringToAlphacolor('#FF1A69B9');
  errorlogin2 := False;
end;

procedure TForm2.Image2Click(Sender: TObject);
begin
  // Rectangle12.Visible := False;
  floatRect11PosF.Start;
end;

procedure TForm2.Image2MouseEnter(Sender: TObject);
begin
  rectLogin2BtnBack.Fill.Color := StringToAlphacolor('#FFe5e5e5');
end;

procedure TForm2.Image2MouseLeave(Sender: TObject);
begin
  rectLogin2BtnBack.Fill.Color := StringToAlphacolor('#FFFFFFFF');
end;

procedure TForm2.lblUseEmailClick(Sender: TObject);
var
  phone: Boolean;
const
  width1: integer = 311;
  width2: integer = 407;
  xpos1: integer = 120;
  xpos2: integer = 24;
  lbl1: string = 'Use your email instead';
  lbl2: string = 'Use a phone number instead';
begin
  ShowMessage(BoolToStr(phone));
  if phone then
  begin
    rectCreateAccountPhone.Width := width2;
    rectCreateAccountPhone.Position.X := xpos2;
    lblUseEmail.Text := lbl2;
    phone := False;
  end
  else
  begin
    rectCreateAccountPhone.Width := width1;
    rectCreateAccountPhone.Position.X := xpos1;
    lblUseEmail.Text := lbl1;
    phone := True;
  end;
end;

procedure TForm2.lblUseEmailMouseEnter(Sender: TObject);
begin
  lblUseEmail.TextSettings.Font.Style := lblUseEmail.TextSettings.Font.Style +
    [TFontStyle.fsBold]
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
    cmbAreaCodes.Items.Clear();
    cmbAreaCodes.Items.AddStrings(CountryCodes);
  except

  end;
  StyleComboBoxItems(cmbAreaCodes, 'Calibri', 16, '#ff000000');
end;

procedure TForm2.loginhideRect2HeightFinish(Sender: TObject);
begin
  lblWelcome2.Visible := True;
  lblVersion.Visible := True;
  rectWelcomeBtn2.Visible := True;
  rectWelcomeBtn2.Enabled := True;
end;

procedure TForm2.RectCreateAccountClick(Sender: TObject);
begin
  rectAreaCodeLabel.Fill.Color := StringToAlphacolor('#FFFFFFFF');
  rectAreaCodeCombo.Fill.Color := StringToAlphacolor('#FFFFFFFF');
end;

procedure TForm2.rectBtnSignInClick(Sender: TObject);
begin
  if confirmPassword then
  begin
    // hideerror2;
    rectLogin2Password.Stroke.Color := TAlphaColors.Green;
    rectLogin2Password.Fill.Color := StringToAlphacolor('#9b37cf7b');
    Application.Hint := ADOQuery1.FieldByName('first_name').AsString;
    ModalResult := mrOk;
  end
  else
  begin
    lblLoginError.Visible := True;
    if Length(edtLoginPassword.Text) > 0 then
      showerror2(0)
    else
      showerror2(1);
  end;
end;

procedure TForm2.rectCreateAccountUIpnlClick(Sender: TObject);
begin
  rectAreaCodeCombo.Fill.Color := StringToAlphacolor('#FFFFFFFF');
  rectAreaCodeLabel.Fill.Color := StringToAlphacolor('#FFFFFFFF');
end;

procedure TForm2.rectCreateAccountBackClick(Sender: TObject);
begin
  rectCreateAccountUIpnl.Visible := False;
  rectLoginUIPnl.Visible := False;
  gifLoading.Play;
  gifLoading.Visible := True;
  gifLoading.Enabled := True;
  timerAnimation.Interval := Random(2000) + 1000;
  timerAnimation.Enabled := True;
end;

procedure TForm2.rectAreaCodeLabelClick(Sender: TObject);
begin
  cmbAreaCodes.DropDown;
  cmbAreaCodes.OnClick(cmbAreaCodes);
  cmbAreaCodes.SetFocus;
end;

procedure TForm2.rectWelcomeBtn1Click(Sender: TObject);
begin
  fadeoutrectPos.Start;
  fadeoutrectOpacity.Start;
  fadeoutLabel3Opacity.Start;
  fadeoutLabe3Pos.Start;
  fadeoutLabel2Opacity.Start;
  fadeoutLabel2Pos.Start;
end;

procedure TForm2.rectWelcomeBtn2Click(Sender: TObject);
begin
  //
  lblWelcome2.Visible := False;
  lblVersion.Visible := False;
  rectWelcomeBtn2.Visible := False;
  rectWelcomeBtn2.Enabled := False;
  loginshowRect2Height.Start;
  loginshowImage1Pos.Start;
  loginshowImage1Height.Start;
  login_state := 1;
end;

procedure TForm2.rectBtnCreateAccountClick(Sender: TObject);
begin
  //
  rectLoginUIPnl.Visible := False;
  RectCreateAccount.BringToFront;
  rectCreateAccountUIpnl.Visible := False;
  gifLoading.Visible := True;
  gifLoading.Enabled := True;
  gifLoading.Play;
  timerAnimation.Interval := Random(1000) + 1000;
  timerAnimation.Enabled := True;
  CreateAccountForward := True;
end;

procedure TForm2.rectBtnCreateAccountMouseEnter(Sender: TObject);
begin
  with TLabel(TRectangle(Sender).Children[0]) do
  begin
    Font.Style := [TFontStyle.fsUnderline];
    FontColor := StringToAlphacolor('#FF666666');
  end;
end;

procedure TForm2.rectBtnCreateAccountMouseLeave(Sender: TObject);
begin
  with TLabel(TRectangle(Sender).Children[0]) do
  begin
    Font.Style := [];
    FontColor := StringToAlphacolor('#FF1A69B9');
  end;
end;

procedure TForm2.rectLogin2BtnBackMouseEnter(Sender: TObject);
begin
  rectLogin2BtnBack.Fill.Color := StringToAlphacolor('#FFe5e5e5');
end;

procedure TForm2.rectLogin2BtnBackMouseLeave(Sender: TObject);
begin
  rectLogin2BtnBack.Fill.Color := StringToAlphacolor('#FFFFFFFF');
end;

procedure TForm2.rectForgotPasswordMouseEnter(Sender: TObject);
begin
  Label16.Font.Style := [TFontStyle.fsUnderline];
  Label16.FontColor := StringToAlphacolor('#FF666666');
end;

procedure TForm2.rectForgotPasswordMouseLeave(Sender: TObject);
begin
  Label16.Font.Style := [];
  Label16.FontColor := StringToAlphacolor('#FF3E81C4');
end;

procedure TForm2.rectLoginBtnBackClick(Sender: TObject);
begin
  //
  RectWelome.BringToFront;
  loginhideRect2Height.Start;
  loginhideImage1Pos.Start;
  loginhideImage1Height.Start;
end;

procedure TForm2.rectLoginBtnBackMouseEnter(Sender: TObject);
begin
  TRectangle(Sender).Fill.Color := StringToAlphacolor('#FFb2b2b2');
end;

procedure TForm2.rectLoginBtnBackMouseLeave(Sender: TObject);
begin
  TRectangle(Sender).Fill.Color := StringToAlphacolor('#FFcccccc');
end;

procedure TForm2.rectBtnNextClick(Sender: TObject);
begin
  if confirmAccount then
  begin
    // hideerror;
    lblUsernameBackBtn.Text := edtLoginUsername.Text;
    rectLogin2.BringToFront;
    rectLogin.BringToFront;
    // RectWelome.SendToBack;
    rectLogin2UI.Visible := False;
    floatRectLoginPosF.Start;
    edtLoginPassword.SetFocus;
    login_state := 2;
  end
  else
  begin
    lblLoginError.Visible := True;
    if Length(edtLoginUsername.Text) > 0 then
      showerror1(0)
    else
      showerror1(1);
  end;
end;

procedure TForm2.rectBtnNextMouseEnter(Sender: TObject);
begin
  TRectangle(Sender).Fill.Color := StringToAlphacolor('#FF165fa7');
end;

procedure TForm2.rectBtnNextMouseLeave(Sender: TObject);
begin
  TRectangle(Sender).Fill.Color := StringToAlphacolor('#FF1a69b9');
end;

procedure TForm2.ResetComboBox;
begin
  ComboboxSearch := '';
  LoadCountryCodes;
end;

procedure TForm2.ScaleScreen;
var
  ScreenSize: TSize;
  SysScale: Single;
begin
  ScreenSize := Screen.Size;
  SysScale := GetScreenScale;
  // Put in settings tab
  // Label23.Text := 'T: ' + floattostr(TrackBar2.Value) + '\n Width: ' +
  // Inttostr(Width) + '\n Height: ' + Inttostr(Height);
  // Label22.Text := floattostr(TrackBar1.Value) + '   ' +
  // floattostr(Layout1.Scale.X);
  // Label24.Text := 'R: ' + floattostr(ScreenSize.Width / Width) + ':' +
  // floattostr(ScreenSize.Height / Height);

  Layout1.Scale.X := (ScreenSize.Width / 3840) * (2.25 / SysScale);
  Layout1.Scale.Y := (ScreenSize.Height / 2160) * (2.25 / SysScale);
  Self.Width := Round(iniWidth * (ScreenSize.Width / 3840) * (2.25 / SysScale));
  Self.Height := Round(iniHeight * (ScreenSize.Height / 2160) *
    (2.25 / SysScale));
end;

procedure TForm2.showerror1(error: integer);
begin
  rectLoginUsername.Stroke.Color := StringToAlphacolor('#FFde1916');
  if error = 0 then
  begin
    lblLoginError.Text := 'That ' + Appname +
      ' account does not exist. Enter a different account or get a new one';
    // red(get a new one).
    rectErrorMoveUI.Position.Y := 160;
    last_error1 := 0;
  end
  else if error = 1 then
  begin
    lblLoginError.Text := 'Enter a valid username or email address';
    rectErrorMoveUI.Position.Y := 135;
    last_error1 := 1;
  end
  else
    showerror1(last_error1);
  errorlogin1 := True;
end;

procedure TForm2.showerror2(error: integer);
begin
  rectLogin2Password.Stroke.Color := StringToAlphacolor('#FFde1916');
  if error = 0 then
  begin
    lblLogin2Error.Text :=
      'Your account or password is incorrect. If you don''t remember your password, reset it.';
    // red(get a new one).
    rectError2MoveUI.Position.Y := 165;
    last_error2 := 0;
  end
  else if error = 1 then
  begin
    lblLogin2Error.Text := 'Please enter the password for your ' + Appname +
      ' account.';
    rectError2MoveUI.Position.Y := 147;
    last_error2 := 1;
  end
  else
    showerror2(last_error2);
  errorlogin2 := True;
end;

procedure TForm2.timerAnimationTimer(Sender: TObject);
begin
  gifLoading.Stop;
  gifLoading.Enabled := False;
  gifLoading.Visible := False;
  if CreateAccountForward then
  begin
    rectCreateAccountUIpnl.Visible := True;
    CreateAccountForward := False;
  end
  else
  begin
    rectLogin.BringToFront;
    rectLoginUIPnl.Visible := True;
  end;
  timerAnimation.Enabled := False;
end;

procedure TForm2.zoomFinish(Sender: TObject);
begin
  float.Start;
end;

end.

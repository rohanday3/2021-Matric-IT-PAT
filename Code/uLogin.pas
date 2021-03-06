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
  Data.Win.ADODB, System.NetEncoding, FMX.GIFImage, IniFiles, FMX.ExtCtrls,
  Windows, Math, System.ImageList, FMX.ImgList, FMX.Effects, StrUtils,
  IdGlobalProtocols;

// Custom type for storing error state
type
  TErrors = array [0 .. 2] of integer;

type
  TfrmLogin = class(TForm)
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
    fadeoutlblWelcomeSubtitleOpacity: TFloatAnimation;
    fadeoutlblWelcomeSubtitlePos: TFloatAnimation;
    fadeoutlblWelcomeTitleOpacity: TFloatAnimation;
    fadeoutlblWelcomeTitlePos: TFloatAnimation;
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
    lblBtnNext: TLabel;
    lblLoginBack: TLabel;
    rectBtnCreateAccount: TRectangle;
    lblLoginError: TLabel;
    rectErrorMoveUI: TRectangle;
    rectLogin2: TRectangle;
    rectLogin2BtnBack: TRectangle;
    imgLogin2BtnBack: TImage;
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
    lblCreateBtnBack: TLabel;
    rectCreateBtnBack: TRectangle;
    imgCreateBtnBack: TImage;
    rectCreateBtnBackP: TRectangle;
    floatCreateBackF: TFloatAnimation;
    floatCreateBackR: TFloatAnimation;
    rectCreateAccountPassword: TRectangle;
    lblCreateAccountPasswordTitle: TLabel;
    lblCreateAccountPasswordSubtitle: TLabel;
    rectEdtCreateAccountPassword: TRectangle;
    edtCreateAccountPassword: TEdit;
    rectCreatePasswordBtnNext: TRectangle;
    lblCreatePasswordBtnNext: TLabel;
    rectCreateShowPassword: TRectangle;
    rectCreateShowPasswordBox: TRectangle;
    lblCreateShowPassword: TLabel;
    imgCreateShowPasswordBox: TImage;
    floatRectCreateAccountF: TFloatAnimation;
    floatRectCreateAccountR: TFloatAnimation;
    floatCreateAccountPassF: TFloatAnimation;
    floatCreateAccountPassR: TFloatAnimation;
    floatImgIconOpacity: TFloatAnimation;
    rectCreateAccountPassUI: TRectangle;
    floatCreateAccountPassUIF: TFloatAnimation;
    floatCreateAccountPassUIR: TFloatAnimation;
    rectUsernameBack: TRectangle;
    floatRectUsernameBackOpacityF: TFloatAnimation;
    floatRectUsernameBackOpacityR: TFloatAnimation;
    rectCreateAccountError: TRectangle;
    lblCreateAccountError: TLabel;
    lblCreateAccountPasswordError: TLabel;
    rectCreateAccountPasswordError: TRectangle;
    rectPassStrength: TRectangle;
    rectPassStrength1: TRectangle;
    rectPassStrength2: TRectangle;
    rectPassStrength5: TRectangle;
    rectPassStrength4: TRectangle;
    rectPassStrength3: TRectangle;
    lblPassStrength: TLabel;
    imgPassStrengthHelp: TImage;
    rectCreateAccountName: TRectangle;
    lblCreateAccountNameSubtitle: TLabel;
    lblCreateAccountNameTitle: TLabel;
    rectCreateAccountNameFirstName: TRectangle;
    edtCreateAccountNameFirstName: TEdit;
    rectCreateAccountNameLastName: TRectangle;
    edtCreateAccountNameLastName: TEdit;
    rectCreateAccountNameBtnNext: TRectangle;
    lblCreateAccountNameBtnNext: TLabel;
    floatCreateAccountNameF: TFloatAnimation;
    floatCreateAccountNameR: TFloatAnimation;
    floatCreateAccountPassUIF2: TFloatAnimation;
    floatCreateAccountPassUIR2: TFloatAnimation;
    rectCreateAccountNameError: TRectangle;
    lblCreateAccountNameErrorFirst: TLabel;
    lblCreateAccountNameErrorLast: TLabel;
    rectCreateAccountPicture: TRectangle;
    lblCreateAccountPictureSubtitle: TLabel;
    lblCreateAccountPictureTitle: TLabel;
    circleProfilePicture: TCircle;
    lblCreateAccountPictureRemove: TLabel;
    lblCreateAccountPictureUpload: TLabel;
    rectlblCreateAccountPictureUpload: TRectangle;
    rectlblCreateAccountPictureRemove: TRectangle;
    imglstProfile: TImageList;
    rectBtnFinish: TRectangle;
    lblFinish: TLabel;
    GlowEffect1: TGlowEffect;
    lblAddImage: TLabel;
    lblAddImageSubtitle: TLabel;
    rectImgDragDrop: TRectangle;
    lblDragDrop: TLabel;
    tblUsers: TADOTable;
    rectCreateAccountUsername: TRectangle;
    edtCreateAccountUsername: TEdit;
    lblCreateAccountNameErrorUsername: TLabel;
    floatRectLoginFadeR: TFloatAnimation;
    floatRectLogin2FadeF: TFloatAnimation;
    gifLoading2: TGIFImage;
    timerGifLoading: TTimer;
    procedure zoomFinish(Sender: TObject);
    procedure floatFinish(Sender: TObject);
    procedure rectWelcomeBtn1Click(Sender: TObject);
    procedure fadeoutlblWelcomeTitlePosFinish(Sender: TObject);
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
    procedure imgLogin2BtnBackMouseEnter(Sender: TObject);
    procedure imgLogin2BtnBackMouseLeave(Sender: TObject);
    procedure rectForgotPasswordMouseEnter(Sender: TObject);
    procedure rectForgotPasswordMouseLeave(Sender: TObject);
    procedure imgLogin2BtnBackClick(Sender: TObject);
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
    procedure lblUseEmailClick(Sender: TObject);
    procedure edtLoginPasswordClick(Sender: TObject);
    procedure edtLoginPasswordTyping(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure loginshowImage1HeightFinish(Sender: TObject);
    procedure loginhideImage1HeightFinish(Sender: TObject);
    procedure rectCreateAccountBtnNextClick(Sender: TObject);
    procedure imgCreateBtnBackMouseEnter(Sender: TObject);
    procedure imgCreateBtnBackMouseLeave(Sender: TObject);
    procedure rectCreateBtnBackClick(Sender: TObject);
    procedure rectCreateShowPasswordClick(Sender: TObject);
    procedure rectCreateShowPasswordMouseEnter(Sender: TObject);
    procedure rectCreateShowPasswordMouseLeave(Sender: TObject);
    procedure floatRectCreateAccountFFinish(Sender: TObject);
    procedure floatCreateAccountPassRFinish(Sender: TObject);
    procedure floatCreateAccountPassUIRFinish(Sender: TObject);
    procedure edtCreateAccountPhoneTyping(Sender: TObject);
    procedure rectCreatePasswordBtnNextClick(Sender: TObject);
    procedure edtCreateAccountPasswordTyping(Sender: TObject);
    procedure floatCreateAccountPassUIF2Finish(Sender: TObject);
    procedure floatCreateAccountNameRFinish(Sender: TObject);
    procedure rectCreateAccountNameBtnNextClick(Sender: TObject);
    procedure edtCreateAccountNameFirstNameTyping(Sender: TObject);
    procedure edtCreateAccountNameLastNameTyping(Sender: TObject);
    procedure circleProfilePictureClick(Sender: TObject);
    procedure rectlblCreateAccountPictureRemoveClick(Sender: TObject);
    procedure rectBtnFinishClick(Sender: TObject);
    procedure rectImgDragDropDragOver(Sender: TObject; const Data: TDragObject;
      const Point: TPointF; var Operation: TDragOperation);
    procedure rectImgDragDropDragLeave(Sender: TObject);
    procedure rectImgDragDropDragDrop(Sender: TObject; const Data: TDragObject;
      const Point: TPointF);
    procedure rectCreateAccountPictureDragOver(Sender: TObject;
      const Data: TDragObject; const Point: TPointF;
      var Operation: TDragOperation);
    procedure rectCreateAccountPictureDragLeave(Sender: TObject);
    procedure rectCreateAccountPictureDragDrop(Sender: TObject;
      const Data: TDragObject; const Point: TPointF);
    procedure rectCreateAccountPictureDragEnd(Sender: TObject);
    procedure timerGifLoadingTimer(Sender: TObject);
  private
    { Private declarations }
    iconstarty: Single;
    function confirmAccount: Boolean;
    function confirmPassword: Boolean;
    procedure hideerrorLoginU;
    procedure hideerrorLoginP;
    procedure hideerrorCreate1;
    procedure hideerrorCreateP;
    procedure hideerrorCreateName(opt: integer = 0);
    procedure showerrorLoginU(error: integer);
    procedure showerrorLoginP(error: integer);
    procedure showerrorCreate1(error: integer; s: string = '');
    procedure showerrorCreateP(error: integer);
    procedure showerrorCreateName(error: TErrors);
    procedure LoadCountryCodes;
    procedure LoadCountryCodeFiles;
    procedure StyleComboBoxItems(ComboBox: TComboBox; Family: string;
      Size: Single; Color: string);
    procedure FilterComboBox(ComboBox: TComboBox; Key: String);
    procedure ResetComboBox;
    function GetVersionNumber: string;
    procedure ScaleScreen;
    function GetScreenScale: Single;
    procedure resetUsernameScreen;
    procedure resetPasswordScreen;
    procedure resetCreateScreen;
    procedure SaveSettingString(Section, Name, Value: string);
    function LoadSettingString(Section, Name, Value: string): string;
    function GetCountryFlag(): string;
    function CountryCodeToString(CountryCode: string): string;
    procedure LoadCountry;
    function IsValidEmail(const Value: string): Boolean;
    function IsPhoneUsed(Phone: string): Boolean;
    function IsEmailUsed(Email: string): Boolean;
    function IsUsernameUsed(Username: string): Boolean;
    function FormatPhone(Phone: string): string;
    function password_strength(Password: string): integer;
    procedure passStrengthMeter(strength: integer);
    procedure rectCreateBtnBackClick2(Sender: TObject);
    function TErrorsCreate(arr: array of integer): TErrors;
    procedure loadImageProfilePicture(imagepath: string);

  const
    // ALL GLOBAL CONSTANT VARIABLE NAMES ARE IN CAPS.
    // Size of the form when designed for a 3840 * 2160 screen. Used for scaling.
    I_INI_FORM_WIDTH: integer = 455;
    I_INI_FORM_HEIGHT: integer = 635;
    S_APP_NAME: string = 'Robin Hood';
    F_CONFIG_FILE = 'config.ini';
  public
    { Public declarations }
    class function Execute: Boolean;
  end;

var
  frmLogin: TfrmLogin;

  // ==================== Error variables ====================
  {
    [u] Username
    [p] Password
    [1] Phone/Email
    [n] Name
  }
  b_err_login_u, b_err_login_p, b_err_create_1, b_err_create_p,
    b_err_create_n: Boolean;
  i_prev_err_login_u, i_prev_err_login_p, i_prev_err_create_1,
    i_prev_err_create_p: integer;
  arr_prev_err_create_n: TErrors;

  // ================ Position in login form =================
  {
    [-1] rectWelcome1
    [0] rectWelcome2
    [1] rectLogin
    [2] rectLogin2
    [3] rectCreateAccount
    [4] rectCreateAccountPassword
    [5] rectCreateAccountName
  }
  i_login_state: integer;

  // ================= Country Code Search ===================
  s_ctry_code_search: string;
  slst_ctry_codes: TStringList;
  slst_ctry_codes_ftrd: TStringList;

  i_form_width, i_form_height: integer;

  // Phone number or email chosen to create account
  b_phone: Boolean;

  grad_drag_drop: TGradient;

  // Custom profile picture image chosen
  b_custom_image: Boolean;

  // =================== Create account ======================
  db_first_name, db_email, db_last_name, db_phone, db_username, db_password,
    db_picture: string;

implementation

uses
  uMain;

{$R *.fmx}

// Change the font etc. of items in combobox
Procedure TfrmLogin.StyleComboBoxItems(ComboBox: TComboBox; Family: string;
  Size: Single; Color: string);
var
  Item: TListBoxItem;
  i: integer;
begin
  for i := 0 to ComboBox.Count - 1 do
  begin
    Item := ComboBox.ListItems[i];
    Item.Font.Family := Family;
    Item.Font.Size := Size;
    Item.FontColor := StringToAlphacolor(Color);
    Item.StyledSettings := Item.StyledSettings - [TStyledSetting.Family,
      TStyledSetting.Size, TStyledSetting.FontColor];
  end;
end;

function TfrmLogin.TErrorsCreate(arr: array of integer): TErrors;
var
  errors: TErrors;
begin
  errors[0] := arr[0];
  errors[1] := arr[1];
  errors[2] := arr[2];
  Result := errors;
end;

procedure TfrmLogin.circleProfilePictureClick(Sender: TObject);
begin
  with TOpenDialog.Create(nil) do
  begin
    Filter := 'Image Files|*.bmp;*.gif;*.jpeg;*.jpg;*.ico;*.png;*.tiff|All Files|*.*';
    if Execute then
    begin
      // A procedure to load an image to the circle is beneficial is more than
      // one way to select an image (DragDrop)
      loadImageProfilePicture(FileName);
    end;
  end;
end;

procedure TfrmLogin.cmbAreaCodesChange(Sender: TObject);
var
  s: string;
begin
  // The Country code needs to be displayed without the name of the country
  // normally the combobox will display the whole item when selected.
  rectAreaCodeCombo.Fill.Color := StringToAlphacolor('#ffffffff');
  rectAreaCodeLabel.Fill.Color := StringToAlphacolor('#ffffffff');
  s := cmbAreaCodes.Items[cmbAreaCodes.ItemIndex];
  lblAreaCodes.Text := Copy(s, Pos('+', s), Length(s) - Pos('+', s) + 1);
end;

procedure TfrmLogin.cmbAreaCodesClick(Sender: TObject);
begin
  rectAreaCodeCombo.Fill.Color := StringToAlphacolor('#ffeeeeee');
  rectAreaCodeLabel.Fill.Color := StringToAlphacolor('#ffeeeeee');
end;

procedure TfrmLogin.cmbAreaCodesKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  // TODO: Add to settings (toggle feature)

  if Inttostr(Key) = Inttostr(8) then
    s_ctry_code_search := Copy(s_ctry_code_search, 0,
      Length(s_ctry_code_search) - 1)
  else
    s_ctry_code_search := s_ctry_code_search + KeyChar;

  // Remove spaces
  s_ctry_code_search := StringReplace(s_ctry_code_search, ' ', '',
    [rfReplaceAll]);

  FilterComboBox(cmbAreaCodes, s_ctry_code_search)
end;

function TfrmLogin.confirmAccount: Boolean;
begin
  // Check if account exists
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

function TfrmLogin.confirmPassword: Boolean;
begin
  // Encrypt the password entered and compare it with the encrypted password
  // stored in the database.
  if TNetEncoding.Base64.EncodeBytesToString
    (TEncoding.UTF8.GetBytes(edtLoginPassword.Text)) = ADOQuery1.FieldByName
    ('password').AsString then
    Result := True
  else
    Result := False;

end;

// Part 3/3 of a larger function to automatically detect the country and selects
// the corresponding country code.
function TfrmLogin.CountryCodeToString(CountryCode: string): string;
var
  csv: TextFile;
  line: string;
  i: integer;
begin
  if FileExists(GetCurrentDir + '\countries.csv') then
    AssignFile(csv, GetCurrentDir + '\countries.csv')
  else
    Exit;

  Reset(csv);
  while not Eof(csv) do
  begin
    Readln(csv, line);
    i := Pos(',', line);
    if Pos(CountryCode, Copy(line, i, Length(line))) > 0 then
      Result := Copy(line, 1, i - 1);
  end;
end;

procedure TfrmLogin.edtLoginUsernameClick(Sender: TObject);
begin
  if not b_err_login_u then
    TRectangle(TEdit(Sender).Parent).Stroke.Color :=
      StringToAlphacolor('#FF1A69B9');
end;

procedure TfrmLogin.edtLoginUsernameExit(Sender: TObject);
begin
  TRectangle(TEdit(Sender).Parent).Stroke.Color := TAlphaColors.black;
end;

procedure TfrmLogin.edtLoginUsernameTyping(Sender: TObject);
begin
  if b_err_login_u then
  begin
    if Length(edtLoginUsername.Text) > 0 then
    begin
      hideerrorLoginU;
      b_err_login_u := True;
    end
    else
      showerrorLoginU(2);
  end;
end;

procedure TfrmLogin.edtCreateAccountNameFirstNameTyping(Sender: TObject);
begin
  if b_err_create_n then
  begin
    if Length(edtCreateAccountNameFirstName.Text) > 0 then
    begin
      hideerrorCreateName(1);
      b_err_create_n := True;
    end
    else
      showerrorCreateName(TErrorsCreate([0, -1]));
  end;
end;

procedure TfrmLogin.edtCreateAccountNameLastNameTyping(Sender: TObject);
begin
  if b_err_create_n then
  begin
    if Length(edtCreateAccountNameLastName.Text) > 0 then
    begin
      hideerrorCreateName(2);
      b_err_create_n := True;
    end
    else
      showerrorCreateName(TErrorsCreate([-1, 0]));
  end;
end;

procedure TfrmLogin.edtCreateAccountPasswordTyping(Sender: TObject);
begin
  if b_err_create_p then
  begin
    if Length(edtCreateAccountPassword.Text) > 0 then
    begin
      hideerrorCreateP;
      b_err_create_p := True;
    end
    else
      showerrorCreateP(0);
  end;
  passStrengthMeter(password_strength(edtCreateAccountPassword.Text));
end;

procedure TfrmLogin.edtCreateAccountPhoneTyping(Sender: TObject);
begin
  if b_err_create_1 then
  begin
    if Length(edtCreateAccountPhone.Text) > 0 then
    begin
      hideerrorCreate1;
      b_err_create_1 := True;
    end
    else if b_phone then
      showerrorCreate1(1)
    else
      showerrorCreate1(3);
  end;
end;

procedure TfrmLogin.edtLoginPasswordClick(Sender: TObject);
begin
  if not b_err_login_p then
    TRectangle(TEdit(Sender).Parent).Stroke.Color :=
      StringToAlphacolor('#FF1A69B9');
end;

procedure TfrmLogin.edtLoginPasswordTyping(Sender: TObject);
begin
  if b_err_login_p then
  begin
    if Length(edtLoginPassword.Text) > 0 then
    begin
      hideerrorLoginP;
      b_err_login_p := True;
    end
    else
      showerrorLoginP(2);
  end;
end;

{
  Allows the login program to be created with a function whose result indicates
  if the login was successful.

  UPSIDE:
  This means that the login screen can be created very quickly, as the rest of
  the application does not have to be loaded until the application recognises
  a valid user login.

  DOWNSIDE:
  The datamodule cannot be used since it has not been created yet. This means
  adoquery and adotable components need to be created in the login form which
  decreases the usefulness of having a datamodule.
}
class function TfrmLogin.Execute: Boolean;
begin
  with TfrmLogin.Create(nil) do
    try
      Result := ShowModal = mrOk;
    finally
      // The login form is no longer needed after the user signs in.
      Free;
    end;
end;

procedure TfrmLogin.fadeoutlblWelcomeTitlePosFinish(Sender: TObject);
begin
  lblWelcome2.Visible := True;
  rectWelcomeBtn2.Visible := True;
  lblVersion.Visible := True;
  rectWelcomeBtn1.Cursor := crDefault;
  rectWelcomeBtn1.Enabled := False;
  i_login_state := 0;
end;

procedure TfrmLogin.FilterComboBox(ComboBox: TComboBox; Key: String);
var
  i: integer;
begin
  if Key = '' then
  begin
    ComboBox.Items.AddStrings(slst_ctry_codes);
    StyleComboBoxItems(ComboBox, 'Calibri', 16, '#ff000000');
    Exit;
  end;
  slst_ctry_codes_ftrd := TStringList.Create;

  slst_ctry_codes_ftrd.Clear;

  for i := 0 to slst_ctry_codes.Count - 1 do
    if Pos(Lowercase(Key), Lowercase(slst_ctry_codes[i])) > 0 then
      slst_ctry_codes_ftrd.Add(slst_ctry_codes[i]);

  ComboBox.Items.Clear;
  ComboBox.Items.AddStrings(slst_ctry_codes_ftrd);
  StyleComboBoxItems(ComboBox, 'Calibri', 16, '#ff000000');
end;

procedure TfrmLogin.floatCreateAccountNameRFinish(Sender: TObject);
begin
  floatCreateAccountPassUIR2.Start;
end;

procedure TfrmLogin.floatCreateAccountPassRFinish(Sender: TObject);
begin
  floatRectCreateAccountR.Start;
end;

procedure TfrmLogin.floatCreateAccountPassUIF2Finish(Sender: TObject);
begin
  floatCreateAccountNameF.Start;
end;

procedure TfrmLogin.floatCreateAccountPassUIRFinish(Sender: TObject);
begin
  RectCreateAccount.BringToFront;
  floatRectCreateAccountR.Start;
end;

procedure TfrmLogin.floatFinish(Sender: TObject);
begin
  lblWelcomeTitle.Visible := True;
  lblWelcomeSubtitle.Visible := True;
  rectWelcomeBtn1.Visible := True;
end;

procedure TfrmLogin.floatRect11PosFFinish(Sender: TObject);
begin
  floatRectLoginPosR.Start;
  floatRectLoginFadeR.Start;
end;

procedure TfrmLogin.floatRectCreateAccountFFinish(Sender: TObject);
begin
  rectCreateAccountPassword.BringToFront;
  floatCreateAccountPassUIF.Start;
  floatCreateBackF.Start;
end;

procedure TfrmLogin.floatRectLoginPosFFinish(Sender: TObject);
begin
  rectLogin2UI.Visible := True;
  floatRect11PosR.Start;
  floatRectLogin2FadeR.Start;
  floatRectUsernameBackOpacityF.Start;
end;

procedure TfrmLogin.floatRectLoginPosRFinish(Sender: TObject);
begin
  rectLoginUIPnl.Visible := True;
end;

function TfrmLogin.FormatPhone(Phone: string): string;
begin
  Result := Phone;
  Insert('-', Result, 4);
  Insert('-', Result, 8);
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
var
  databasepath: string;
begin
  ScaleScreen;
  lblLoginSubtitle.Text := 'to continue to ' + S_APP_NAME;
  lblWelcomeTitle.Text := 'Welcome to ' + S_APP_NAME;
  i_login_state := -1;
  b_phone := True;
  RectWelome.Width := 460;
  RectWelome.Height := 640;
  rectCreateAccountName.Position.X := 455;
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
  rectWelcomeBtn1.SetFocus;
  hideerrorLoginU;
  hideerrorLoginP;
  hideerrorCreate1;
  hideerrorCreateP;
  hideerrorCreateName;
  b_custom_image := False;
  rectLogin2UI.Opacity := 0;

  grad_drag_drop := TGradient.Create;
  with grad_drag_drop do
  begin
    Color := StringToAlphacolor('#FF3ABCF3');
    Color1 := StringToAlphacolor('#FF207BD6');
    Style := TGradientStyle.Linear;
    RadialTransform.RotationAngle := 25;
  end;

  imgPassStrengthHelp.Hint := 'A password is considered strong if:' + #13 +
    '8 characters length or more' + #13 + '1 digit or more' + #13 +
    '1 symbol or more' + #13 + '1 uppercase letter or more' + #13 +
    '1 lowercase letter or more';

  if not FileExists(GetCurrentDir + '\' + F_CONFIG_FILE) then
  begin
    SaveSettingString('General', 'database_path',
      GetCurrentDir + '\robinhood.mdb');
    SaveSettingString('Interface', 'Scaling', '0');
  end;

  databasepath := LoadSettingString('General', 'database_path',
    GetCurrentDir + '\robinhood.mdb');

  if not FileExists(databasepath) then
  begin
    if MessageDlg(databasepath +
      ' could not be found. Would you like to select it now? (If you do not select a valid database file now the application will close)',
      TMsgDlgType.mtWarning, mbYesNo, 0) = 6 then
    begin
      with TOpenDialog.Create(nil) do
      begin
        Filter := 'Microsoft Access Database (*.mdb)|*.MDB';
        InitialDir := GetCurrentDir;
        if Execute then
        begin
          ADOQuery1.ConnectionString :=
            'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' + FileName +
            ';Persist Security Info=False';
          tblUsers.ConnectionString :=
            'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' + FileName +
            ';Persist Security Info=False';
          tblUsers.TableName := 'Users';
          SaveSettingString('General', 'database_path', FileName);
        end
        else
        begin
          ShowMessage('No file was chosen. The application will close.');
          Application.Terminate;
        end;
        Free;
      end;
    end
    else
    begin
      ShowMessage('No file was chosen. The application will close.');
      Application.Terminate;
    end;
  end
  else
  begin
    ADOQuery1.ConnectionString :=
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' + databasepath +
      ';Persist Security Info=False';
    tblUsers.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='
      + databasepath + ';Persist Security Info=False';
    tblUsers.TableName := 'Users';
  end;
end;

// Allows the enter key to "press" the next button on the current screen.
procedure TfrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Key = 13 then
  begin
    case i_login_state of
      - 1:
        rectWelcomeBtn1Click(nil);
      0:
        rectWelcomeBtn2Click(nil);
      1:
        rectBtnNextClick(nil);
      2:
        rectBtnSignInClick(nil);
      3:
        rectCreateAccountBtnNextClick(nil);
      4:
        rectCreatePasswordBtnNextClick(nil);
      5:
        rectCreateAccountNameBtnNextClick(nil);
    end;
  end;
end;

procedure TfrmLogin.FormPaint(Sender: TObject; Canvas: TCanvas;
  const ARect: TRectF);
begin
  if cmbAreaCodes.DroppedDown = False then
    ResetComboBox;
end;

// Part 2/3 of a larger function to automatically detect the country and selects
// the corresponding country code.
function TfrmLogin.GetCountryFlag: string;
var
  Buffer: PChar;
  Size: integer;
begin
  Size := GetLocaleInfo(LOCALE_USER_DEFAULT, LOCALE_SABBREVCTRYNAME, nil, 0);
  GetMem(Buffer, Size);
  try
    GetLocaleInfo(LOCALE_USER_DEFAULT, LOCALE_SABBREVCTRYNAME, Buffer, Size);
    Result := Copy(Buffer, 0, 2);
  finally
    FreeMem(Buffer);
  end;
end;

// Retrieves the current device scaling setting for the display.
// The app is designed to look the same on every screen size, this
// allows the app to compensate for the scaling by increasing or decreaing the
// app size.
function TfrmLogin.GetScreenScale: Single;
var
  ScrService: IFMXScreenService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXScreenService,
    ScrService) then
  begin
    Result := ScrService.GetScreenScale;
  end;
end;

// FIX
function TfrmLogin.GetVersionNumber: string;
begin
  Result := Inttostr(TOSVersion.Major) + '.' + Inttostr(TOSVersion.Minor) + '.'
    + Inttostr(TOSVersion.Build);
end;

procedure TfrmLogin.hideerrorLoginU;
begin
  lblLoginError.Text := '';
  rectErrorMoveUI.Position.Y := 120;
  rectLoginUsername.Stroke.Color := StringToAlphacolor('#FF1A69B9');
  b_err_login_u := False;
end;

procedure TfrmLogin.hideerrorLoginP;
begin
  lblLogin2Error.Text := '';
  rectError2MoveUI.Position.Y := 130;
  rectLogin2Password.Stroke.Color := StringToAlphacolor('#FF1A69B9');
  b_err_login_p := False;
end;

procedure TfrmLogin.hideerrorCreate1;
begin
  lblCreateAccountError.Text := '';
  rectCreateAccountError.Position.Y := 104;
  rectCreateAccountPhone.Stroke.Color := StringToAlphacolor('#FF1A69B9');
  b_err_create_1 := False;
end;

procedure TfrmLogin.hideerrorCreateP;
begin
  lblCreateAccountPasswordError.Text := '';
  rectCreateAccountPasswordError.Position.Y := 170;
  rectEdtCreateAccountPassword.Stroke.Color := StringToAlphacolor('#FF1A69B9');
  b_err_create_p := False;
end;

procedure TfrmLogin.hideerrorCreateName(opt: integer = 0);
begin
  case opt of
    0:
      begin
        lblCreateAccountNameErrorFirst.Height := 1;
        lblCreateAccountNameErrorLast.Height := 1;
        lblCreateAccountNameErrorUsername.Height := 1;
      end;
    1:
      lblCreateAccountNameErrorFirst.Height := 1;
    2:
      lblCreateAccountNameErrorLast.Height := 1;
    3:
      lblCreateAccountNameErrorUsername.Height := 1;
  end;
end;

procedure TfrmLogin.imgCreateBtnBackMouseEnter(Sender: TObject);
begin
  rectCreateBtnBack.Fill.Color := StringToAlphacolor('#FFe5e5e5');
end;

procedure TfrmLogin.imgCreateBtnBackMouseLeave(Sender: TObject);
begin
  rectCreateBtnBack.Fill.Color := StringToAlphacolor('#FFFFFFFF');
end;

procedure TfrmLogin.imgLogin2BtnBackClick(Sender: TObject);
begin
  floatRect11PosF.Start;
  edtLoginUsername.SetFocus;
  floatRectLogin2FadeF.Start;
  floatRectUsernameBackOpacityR.Start;
  i_login_state := 1;
end;

procedure TfrmLogin.imgLogin2BtnBackMouseEnter(Sender: TObject);
begin
  rectLogin2BtnBack.Fill.Color := StringToAlphacolor('#FFe5e5e5');
end;

procedure TfrmLogin.imgLogin2BtnBackMouseLeave(Sender: TObject);
begin
  rectLogin2BtnBack.Fill.Color := StringToAlphacolor('#FFFFFFFF');
end;

// Checks if email is already taken when creating account
function TfrmLogin.IsEmailUsed(Email: string): Boolean;
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT * FROM Users Where (email = :email)');
  ADOQuery1.Parameters.ParamByName('email').Value := Email;
  ADOQuery1.Open;
  if ADOQuery1.RecordCount = 0 then
  begin
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('SELECT * FROM Employees Where (email = :email)');
    ADOQuery1.Parameters.ParamByName('email').Value := Email;
    ADOQuery1.Open;
  end;
  if ADOQuery1.RecordCount > 0 then
    Result := True
  else
    Result := False;
end;

// Checks if email is already taken when creating account
function TfrmLogin.IsPhoneUsed(Phone: string): Boolean;
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT * FROM Users Where (phone = :Phone)');
  ADOQuery1.Parameters.ParamByName('Phone').Value := Phone;
  ADOQuery1.Open;
  if ADOQuery1.RecordCount = 0 then
  begin
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('SELECT * FROM Employees Where (phone = :Phone)');
    ADOQuery1.Parameters.ParamByName('Phone').Value := Phone;
    ADOQuery1.Open;
  end;
  if ADOQuery1.RecordCount > 0 then
    Result := True
  else
    Result := False;
end;

function TfrmLogin.IsUsernameUsed(Username: string): Boolean;
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT * FROM Users Where (username = :Username)');
  ADOQuery1.Parameters.ParamByName('Username').Value := Username;
  ADOQuery1.Open;
  if ADOQuery1.RecordCount = 0 then
  begin
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('SELECT * FROM Employees Where (username = :Username)');
    ADOQuery1.Parameters.ParamByName('Username').Value := Username;
    ADOQuery1.Open;
  end;
  if ADOQuery1.RecordCount > 0 then
    Result := True
  else
    Result := False;
end;

// Check if email follows RegEX (regular expression) for email addresses
function TfrmLogin.IsValidEmail(const Value: string): Boolean;
  function CheckAllowed(const s: string): Boolean;
  var
    i: integer;
  begin
    Result := False;
    for i := 1 to Length(s) do
    begin
      // illegal char - not valid address
      if not(s[i] in ['a' .. 'z', 'A' .. 'Z', '0' .. '9', '_', '-', '.', '+'])
      then
        Exit;
    end;
    Result := True;
  end;

var
  i: integer;
  namePart, serverPart: string;
begin
  Result := False;

  i := Pos('@', Value);
  if (i = 0) then
    Exit;

  if (Pos('..', Value) > 0) or (Pos('@@', Value) > 0) or (Pos('.@', Value) > 0)
  then
    Exit;

  if (Pos('.', Value) = 1) or (Pos('@', Value) = 1) then
    Exit;

  namePart := Copy(Value, 1, i - 1);
  serverPart := Copy(Value, i + 1, Length(Value));
  if (Length(namePart) = 0) or (Length(serverPart) < 5) then
    Exit; // too short

  i := Pos('.', serverPart);
  // must have dot and at least 2 places from end
  if (i = 0) or (i > (Length(serverPart) - 2)) then
    Exit;

  Result := CheckAllowed(namePart) and CheckAllowed(serverPart);
end;

procedure TfrmLogin.lblUseEmailClick(Sender: TObject);
const
  edtWidth1: integer = 311;
  edtWidth2: integer = 407;
  xpos1: integer = 98;
  xpos2: integer = 0;
  lblWidth1: integer = 145;
  lblWidth2: integer = 200;

  lbl1: string = 'Use your email instead';
  lbl2: string = 'Use a phone number instead';
  edtHint1: string = 'someone@example.com';
  edtHint2: string = 'Phone number';
begin
  resetCreateScreen;
  if b_phone then
  begin
    { enter email number }
    rectUseEmail.Width := 180;
    edtCreateAccountPhone.TextPrompt := edtHint1;
    rectAreaCodeCombo.Visible := False;
    rectCreateAccountPhone.Width := edtWidth2;
    rectCreateAccountPhone.Position.X := xpos2;
    lblUseEmail.Text := lbl2;
    b_phone := False;
  end
  else
  begin
    { enter phone number }
    rectUseEmail.Width := 145;
    edtCreateAccountPhone.TextPrompt := edtHint2;
    rectAreaCodeCombo.Visible := True;
    rectCreateAccountPhone.Width := edtWidth1;
    rectCreateAccountPhone.Position.X := xpos1;
    lblUseEmail.Text := lbl1;
    b_phone := True;
  end;
end;

// Part 1/3 of a larger function to automatically detect the country and selects
// the corresponding country code.
procedure TfrmLogin.LoadCountry;
var
  Item, country: string;
begin
  country := CountryCodeToString(GetCountryFlag);
  for Item in cmbAreaCodes.Items do
  begin
    if Pos(country, Item) > 0 then
    begin
      lblAreaCodes.Text := Copy(Item, Pos('+', Item),
        Length(Item) - Pos('+', Item) + 1);
    end;
  end;
end;

// Populates the countrycode stringlists from a textfile
procedure TfrmLogin.LoadCountryCodeFiles;
var
  filestream: TFileStream;
begin
  slst_ctry_codes := TStringList.Create;
  filestream := TFileStream.Create((GetCurrentDir + '\Country-Codes.txt'),
    fmShareDenyNone);
  Try
    slst_ctry_codes.LoadFromStream(filestream);
  Except
    on Exception do
    begin
      ShowMessage('Country codes file not found.');
    end;
  End;
  filestream.Destroy();
end;

// Populates the cmbAreaCodes combobox from the countrycode stringlist
procedure TfrmLogin.LoadCountryCodes;
begin
  try
    cmbAreaCodes.Items.Clear();
    cmbAreaCodes.Items.AddStrings(slst_ctry_codes);
  except

  end;
  StyleComboBoxItems(cmbAreaCodes, 'Calibri', 16, '#ff000000');
end;

procedure TfrmLogin.loadImageProfilePicture(imagepath: string);
var
  bytes: integer;
  megabytes: real;
begin
  bytes := filesizebyname(imagepath);
  megabytes := bytes / 1000000;
  if megabytes > 4 then
  begin
    ShowMessage('Try another image. File size must be less than 4 MB.');
    Exit
  end;
  circleProfilePicture.Fill.Bitmap.Bitmap.LoadFromFile(imagepath);
  rectlblCreateAccountPictureUpload.Position.X := 126;
  rectlblCreateAccountPictureRemove.Position.X := 227;
  lblCreateAccountPictureRemove.Visible := True;
  b_custom_image := True;
end;

// Returns the setting value from the setting file
function TfrmLogin.LoadSettingString(Section, Name, Value: string): string;
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(GetCurrentDir + '\' + F_CONFIG_FILE);
  try
    Result := ini.ReadString(Section, Name, Value);
  finally
    ini.Free;
  end;
end;

procedure TfrmLogin.loginhideImage1HeightFinish(Sender: TObject);
begin
  i_login_state := 0;
end;

procedure TfrmLogin.loginhideRect2HeightFinish(Sender: TObject);
begin
  lblWelcome2.Visible := True;
  lblVersion.Visible := True;
  rectWelcomeBtn2.Visible := True;
  rectWelcomeBtn2.Enabled := True;
end;

procedure TfrmLogin.loginshowImage1HeightFinish(Sender: TObject);
begin
  i_login_state := 1;
end;

// Sets the password strength meter to the correct position
procedure TfrmLogin.passStrengthMeter(strength: integer);
const
  captions: array of string = ['Too short', 'Weak', 'Poor', 'Fair', 'Good',
    'Strong'];
var
  grey, red, orange, yellow, blue, green: TAlphaColor;

begin
  grey := StringToAlphacolor('#FFE0E0E0');
  red := StringToAlphacolor('#FFE44242');
  orange := StringToAlphacolor('#FFF99F4A');
  yellow := StringToAlphacolor('#FFf3CC3E');
  blue := StringToAlphacolor('#FF1493FF');
  green := StringToAlphacolor('#FF36C565');
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

// Calculates the password strength
function TfrmLogin.password_strength(Password: string): integer;
var
  Len, number, upp, low, special: Boolean;
  s: Char;
  Points: integer;
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

  Points := 0;

  if (Length(Password) >= 8) then
    Len := True;

  for s in Password do
  begin
    if s in numbers then
    begin
      number := True;
    end;
    if s = UpperCase(s) then
      upp := True;
    if s = Lowercase(s) then
      low := True;
    if s in special_char then
    begin
      special := True;
    end;
  end;

  if Len then
    Inc(Points);
  if number then
    Inc(Points);
  if upp then
    Inc(Points);
  if low then
    Inc(Points);
  if special then
    Inc(Points);
  Result := Points;

end;

procedure TfrmLogin.rectCreateBtnBackClick(Sender: TObject);
begin
  floatCreateAccountPassUIR.Start;
  floatCreateBackR.Start;
  i_login_state := 3;
end;

procedure TfrmLogin.rectCreateBtnBackClick2(Sender: TObject);
begin
  rectCreateBtnBack.OnClick := rectCreateBtnBackClick;
  imgCreateBtnBack.OnClick := rectCreateBtnBackClick;
  floatCreateAccountNameR.Start;
  i_login_state := 4;
end;

// Checks if the password is a valid password and strong enough.
procedure TfrmLogin.rectCreatePasswordBtnNextClick(Sender: TObject);
var
  pass: string;
  error: integer;
const
  numbers = ['0' .. '9'];
  UpperCase = ['A' .. 'Z'];
  Lowercase = ['a' .. 'z'];
  special_char = ['~', '`', '!', '@', '#', '$', '%', '^', '&', '*', '(', ')',
    '_', '-', '+', '=', '{', '}', '[', ']', '|', '\', ':', ';', '"', '''', '>',
    '<', '.', ',', '?', '/'];
begin
  error := -1;
  pass := edtCreateAccountPassword.Text;
  // Passwords must have at least 8 characters and contain at
  // least two of the following: uppercase letters, lowercase
  // letters, numbers, and symbols.

  if (Length(pass) < 8) or (password_strength(pass) < 3) then
    error := 1
  else if Length(pass) = 0 then
    error := 0;

  if error > -1 then
  begin
    showerrorCreateP(error);
    Exit;
  end;
  db_password := pass;
  i_login_state := 5;
  rectCreateBtnBack.OnClick := rectCreateBtnBackClick2;
  imgCreateBtnBack.OnClick := rectCreateBtnBackClick2;
  floatCreateAccountPassUIF2.Start;
end;

procedure TfrmLogin.rectCreateShowPasswordClick(Sender: TObject);
begin
  if rectCreateShowPasswordBox.Fill.Color = StringToAlphacolor('#ffffffff') then
  begin
    rectCreateShowPasswordBox.Fill.Color := StringToAlphacolor('#ff135fc9');
    edtCreateAccountPassword.Password := False;
  end
  else
  begin
    rectCreateShowPasswordBox.Fill.Color := StringToAlphacolor('#ffffffff');
    edtCreateAccountPassword.Password := True;
  end;

end;

procedure TfrmLogin.rectCreateShowPasswordMouseEnter(Sender: TObject);
begin
  if rectCreateShowPasswordBox.Fill.Color = StringToAlphacolor('#ff1a79ff') then
    rectCreateShowPasswordBox.Fill.Color := StringToAlphacolor('#ff135fc9');
end;

procedure TfrmLogin.rectCreateShowPasswordMouseLeave(Sender: TObject);
begin
  if rectCreateShowPasswordBox.Fill.Color = StringToAlphacolor('#ff135fc9') then
    rectCreateShowPasswordBox.Fill.Color := StringToAlphacolor('#ff1a79ff');
end;

procedure TfrmLogin.RectCreateAccountClick(Sender: TObject);
begin
  rectAreaCodeLabel.Fill.Color := StringToAlphacolor('#FFFFFFFF');
  rectAreaCodeCombo.Fill.Color := StringToAlphacolor('#FFFFFFFF');
end;

procedure TfrmLogin.rectBtnSignInClick(Sender: TObject);
begin
  if confirmPassword then
  begin
    rectLogin2Password.Stroke.Color := TAlphaColors.green;
    rectLogin2Password.Fill.Color := StringToAlphacolor('#9b37cf7b');
    Application.Hint := ADOQuery1.FieldByName('first_name').AsString;
    ModalResult := mrOk;
  end
  else
  begin
    lblLoginError.Visible := True;
    if Length(edtLoginPassword.Text) > 0 then
      showerrorLoginP(0)
    else
      showerrorLoginP(1);
  end;
end;

// Checks if the name, surname and username are valid.
procedure TfrmLogin.rectCreateAccountNameBtnNextClick(Sender: TObject);
var
  first_name, last_name, Username: string;
  c: Char;
  error_first, error_last, error_username: integer;
const
  LowercaseChar = ['a' .. 'z'];
  digits = ['0' .. '9'];
begin
  error_first := -1;
  error_last := -1;
  error_username := -1;
  first_name := Lowercase(edtCreateAccountNameFirstName.Text);
  last_name := Lowercase(edtCreateAccountNameLastName.Text);
  Username := Lowercase(edtCreateAccountUsername.Text);
  for c in first_name do
    if not(c in LowercaseChar) then
      error_first := 1;

  for c in last_name do
    if not(c in LowercaseChar) then
      error_last := 1;

  if IsUsernameUsed(Username) then
  begin
    error_username := 3;
  end;

  for c in Username do
    if not(c in LowercaseChar) and not(c in digits) then
      error_username := 2;

  if Length(first_name) = 0 then
    error_first := 0;
  if Length(last_name) = 0 then
    error_last := 0;
  if Length(Username) = 0 then
    error_username := 0;

  if (error_first > -1) or (error_last > -1) or (error_username > -1) then
  begin
    showerrorCreateName(TErrorsCreate([error_first, error_last,
      error_username]));
    Exit;
  end;

  b_err_create_n := False;
  db_first_name := first_name;
  db_last_name := last_name;
  db_username := Username;
  rectCreateAccountPassword.Visible := False;
  RectWelome.Visible := False;
  rectCreateAccountPicture.BringToFront;
end;

procedure TfrmLogin.rectCreateAccountPictureDragDrop(Sender: TObject;
  const Data: TDragObject; const Point: TPointF);
begin
  {
    Okay so this is a complicated one with a weird fix.
    The rectangle component which functions as the area to receive the image
    when dragging and dropping, needs to be behind everything else when not in
    use. If it is in the front when not dragging and dropping, the buttons behind
    it become unusable even if the rectangle is made invisiable.
    If the rectangle is always at the back, it can never accept files during
    dragging and dropping.
  }
  rectImgDragDrop.SendToBack;
end;

procedure TfrmLogin.rectCreateAccountPictureDragEnd(Sender: TObject);
begin
  rectImgDragDrop.SendToBack;
end;

procedure TfrmLogin.rectCreateAccountPictureDragLeave(Sender: TObject);
begin
  rectImgDragDrop.SendToBack;
end;

procedure TfrmLogin.rectCreateAccountPictureDragOver(Sender: TObject;
  const Data: TDragObject; const Point: TPointF; var Operation: TDragOperation);
begin
  rectImgDragDrop.BringToFront;
end;

procedure TfrmLogin.rectCreateAccountUIpnlClick(Sender: TObject);
begin
  rectAreaCodeCombo.Fill.Color := StringToAlphacolor('#FFFFFFFF');
  rectAreaCodeLabel.Fill.Color := StringToAlphacolor('#FFFFFFFF');
end;

procedure TfrmLogin.rectCreateAccountBackClick(Sender: TObject);
begin
  hideerrorLoginU;
  hideerrorLoginP;
  hideerrorCreate1;
  resetUsernameScreen;
  rectCreateAccountUIpnl.Visible := False;
  rectLoginUIPnl.Visible := False;
  gifLoading.Play;
  gifLoading.Visible := True;
  gifLoading.Enabled := True;
  timerAnimation.Interval := Random(2000) + 1000;
  timerAnimation.Enabled := True;
  i_login_state := 1;
end;

// Validate the email/phone used to create the new account.
procedure TfrmLogin.rectCreateAccountBtnNextClick(Sender: TObject);
var
  uname, area: string;
  error: integer;
  s: Char;
const
  number = [0 .. 9];
  letter = ['a' .. 'z', 'A' .. 'Z'];
begin
  error := -1;
  uname := edtCreateAccountPhone.Text;
  uname := uname.Trim;
  area := Copy(lblAreaCodes.Text, 2, Length(lblAreaCodes.Text) - 1);
  if b_phone then
  begin

    for s in uname do
    begin
      try
        strtoint(s);
      except
        showerrorCreate1(0);
        Exit;
      end;
    end;

    if Length(uname) = 9 then
    else if (Length(uname) = 10) and (uname[1] = '0') then
      uname := Copy(uname, 2, 9)
    else if Length(uname) = 0 then
      error := 1
    else
      error := 0;

    if error > -1 then
    begin
      showerrorCreate1(error);
      Exit;
    end;

    if IsPhoneUsed(area + '-' + FormatPhone(uname)) then
    begin
      showerrorCreate1(4, lblAreaCodes.Text + uname);
      Exit;
    end;
    db_phone := area + '-' + FormatPhone(uname);
    db_email := '';
    uname := lblAreaCodes.Text + uname;

  end
  else
  begin
    if Length(uname) = 0 then
      error := 3
    else if not IsValidEmail(uname) then
      error := 2;

    if error > -1 then
    begin
      showerrorCreate1(error);
      Exit;
    end;

    if IsEmailUsed(uname) then
    begin
      showerrorCreate1(4, uname);
      Exit;
    end;
    db_email := uname;
    db_phone := '';
  end;

  rectCreateAccountPassUI.Position.X := 455;
  lblCreateBtnBack.Text := uname;
  floatRectCreateAccountF.Start;
  i_login_state := 4;
end;

procedure TfrmLogin.rectAreaCodeLabelClick(Sender: TObject);
begin
  cmbAreaCodes.DropDown;
  cmbAreaCodes.OnClick(cmbAreaCodes);
  cmbAreaCodes.SetFocus;
end;

procedure TfrmLogin.rectWelcomeBtn1Click(Sender: TObject);
begin
  fadeoutrectPos.Start;
  fadeoutrectOpacity.Start;
  fadeoutlblWelcomeSubtitleOpacity.Start;
  fadeoutlblWelcomeSubtitlePos.Start;
  fadeoutlblWelcomeTitleOpacity.Start;
  fadeoutlblWelcomeTitlePos.Start;
end;

procedure TfrmLogin.rectWelcomeBtn2Click(Sender: TObject);
begin
  //
  lblWelcome2.Visible := False;
  lblVersion.Visible := False;
  rectWelcomeBtn2.Visible := False;
  rectWelcomeBtn2.Enabled := False;
  loginshowRect2Height.Start;
  loginshowImage1Pos.Start;
  loginshowImage1Height.Start;
  resetUsernameScreen;
  edtLoginUsername.SetFocus;
end;

procedure TfrmLogin.rectBtnCreateAccountClick(Sender: TObject);
begin
  //
  resetCreateScreen;
  rectLoginUIPnl.Visible := False;
  RectCreateAccount.BringToFront;
  rectCreateAccountUIpnl.Visible := False;
  gifLoading.Visible := True;
  gifLoading.Enabled := True;
  gifLoading.Play;
  LoadCountry;
  timerAnimation.Interval := Random(1000) + 1000;
  timerAnimation.Enabled := True;
  i_login_state := 3;
end;

procedure TfrmLogin.rectBtnCreateAccountMouseEnter(Sender: TObject);
begin
  with TLabel(TRectangle(Sender).Children[0]).TextSettings do
  begin
    Font.Style := [TFontStyle.fsUnderline];
    FontColor := StringToAlphacolor('#FF666666');
  end;
end;

procedure TfrmLogin.rectBtnCreateAccountMouseLeave(Sender: TObject);
begin
  with TLabel(TRectangle(Sender).Children[0]).TextSettings do
  begin
    Font.Style := [];
    FontColor := StringToAlphacolor('#FF1A69B9');
  end;
end;

procedure TfrmLogin.rectBtnFinishClick(Sender: TObject);
begin
  rectlblCreateAccountPictureUpload.Enabled := False;
  circleProfilePicture.Enabled := False;
  rectImgDragDrop.Enabled := False;
  rectBtnFinish.Enabled := False;
  gifLoading2.BringToFront;
  gifLoading2.Visible := True;
  gifLoading2.Enabled := True;
  gifLoading2.Play;
  timerGifLoading.Interval := Random(2000) + 2000;
  timerGifLoading.Enabled := True;

  // Create record and save image in correct place
  if b_custom_image then
  begin
    circleProfilePicture.Fill.Bitmap.Bitmap.SaveToFile
      (GetCurrentDir + '\accounts\' + db_username + '.png');
    db_picture := GetCurrentDir + '\accounts\' + db_username + '.png';
  end
  else
    db_picture := '';

  tblUsers.Open;
  tblUsers.Append;
  tblUsers['first_name'] := db_first_name;
  tblUsers['email'] := db_email;
  tblUsers['last_name'] := db_last_name;
  tblUsers['phone'] := db_phone;
  tblUsers['username'] := db_username;
  tblUsers['password'] := TNetEncoding.Base64.EncodeBytesToString
    (TEncoding.UTF8.GetBytes(db_password));
  tblUsers['picture'] := db_picture;
  try
    tblUsers.Post;
    ShowMessage('Account created successfully. Close this message to continue.');
  except
    ShowMessage('Oops. There was an error creating your account.');
    timerGifLoadingTimer(nil);
    tblUsers.Cancel;
  end;
  tblUsers.Close;
  Application.Hint := db_first_name;
  ModalResult := mrOk;
end;

procedure TfrmLogin.rectLogin2BtnBackMouseEnter(Sender: TObject);
begin
  rectLogin2BtnBack.Fill.Color := StringToAlphacolor('#FFe5e5e5');
end;

procedure TfrmLogin.rectLogin2BtnBackMouseLeave(Sender: TObject);
begin
  rectLogin2BtnBack.Fill.Color := StringToAlphacolor('#FFFFFFFF');
end;

procedure TfrmLogin.rectForgotPasswordMouseEnter(Sender: TObject);
begin
  Label16.Font.Style := [TFontStyle.fsUnderline];
  Label16.FontColor := StringToAlphacolor('#FF666666');
end;

procedure TfrmLogin.rectForgotPasswordMouseLeave(Sender: TObject);
begin
  Label16.Font.Style := [];
  Label16.FontColor := StringToAlphacolor('#FF3E81C4');
end;

procedure TfrmLogin.rectImgDragDropDragDrop(Sender: TObject;
  const Data: TDragObject; const Point: TPointF);
begin
  rectImgDragDrop.Fill.Kind := TBrushKind.None;
  lblDragDrop.Visible := False;
  if MatchText(ExtractFileExt(Data.Files[0]), ['.bmp', '.gif', '.jpeg', '.jpg',
    '.ico', '.png', '.tiff']) then
  begin
    loadImageProfilePicture(Data.Files[0]);
  end;
  rectImgDragDrop.SendToBack;
end;

procedure TfrmLogin.rectImgDragDropDragLeave(Sender: TObject);
begin
  rectImgDragDrop.Fill.Kind := TBrushKind.None;
  lblDragDrop.Visible := False;
  rectImgDragDrop.SendToBack;
end;

procedure TfrmLogin.rectImgDragDropDragOver(Sender: TObject;
  const Data: TDragObject; const Point: TPointF; var Operation: TDragOperation);
begin
  rectImgDragDrop.BringToFront;
  if MatchText(ExtractFileExt(Data.Files[0]), ['.bmp', '.gif', '.jpeg', '.jpg',
    '.ico', '.png', '.tiff']) then
  begin
    Operation := TDragOperation.Copy;
    rectImgDragDrop.Fill.Kind := TBrushKind.Gradient;
    rectImgDragDrop.Fill.Gradient := grad_drag_drop;
    lblDragDrop.Visible := True;
  end
  else
    Operation := TDragOperation.None;

end;

procedure TfrmLogin.rectlblCreateAccountPictureRemoveClick(Sender: TObject);
begin
  rectlblCreateAccountPictureUpload.Position.X := 179;
  lblCreateAccountPictureRemove.Visible := False;
  circleProfilePicture.Fill.Bitmap.Bitmap := imglstProfile.Source.Items[0]
    .MultiResBitmap.Bitmaps[1];
  b_custom_image := False;
  db_picture := '';

end;

procedure TfrmLogin.rectLoginBtnBackClick(Sender: TObject);
begin
  RectWelome.BringToFront;
  loginhideRect2Height.Start;
  loginhideImage1Pos.Start;
  loginhideImage1Height.Start;
end;

procedure TfrmLogin.rectLoginBtnBackMouseEnter(Sender: TObject);
begin
  TRectangle(Sender).Fill.Color := StringToAlphacolor('#FFb2b2b2');
end;

procedure TfrmLogin.rectLoginBtnBackMouseLeave(Sender: TObject);
begin
  TRectangle(Sender).Fill.Color := StringToAlphacolor('#FFcccccc');
end;

procedure TfrmLogin.rectBtnNextClick(Sender: TObject);
begin
  if confirmAccount then
  begin
    lblUsernameBackBtn.Text := edtLoginUsername.Text;
    rectLogin2.BringToFront;
    rectLogin.BringToFront;
    rectLogin2UI.Visible := False;
    floatRectLoginFadeF.Start;
    floatRectLoginPosF.Start;
    resetPasswordScreen;
    edtLoginPasswordClick(edtLoginPassword);
    i_login_state := 2;
  end
  else
  begin
    lblLoginError.Visible := True;
    if Length(edtLoginUsername.Text) > 0 then
      showerrorLoginU(0)
    else
      showerrorLoginU(1);
  end;
end;

procedure TfrmLogin.rectBtnNextMouseEnter(Sender: TObject);
begin
  TRectangle(Sender).Fill.Color := StringToAlphacolor('#FF165fa7');
end;

procedure TfrmLogin.rectBtnNextMouseLeave(Sender: TObject);
begin
  TRectangle(Sender).Fill.Color := StringToAlphacolor('#FF1a69b9');
end;

procedure TfrmLogin.ResetComboBox;
begin
  s_ctry_code_search := '';
  LoadCountryCodes;
end;

procedure TfrmLogin.resetCreateScreen;
begin
  rectCreateAccountPhone.Stroke.Color := TAlphaColors.black;
  edtCreateAccountPhone.Text := '';
  hideerrorCreate1;
end;

procedure TfrmLogin.resetPasswordScreen;
begin
  rectLogin2.Stroke.Color := TAlphaColors.black;
  edtLoginPassword.Text := '';
end;

procedure TfrmLogin.resetUsernameScreen;
begin
  rectLogin.Stroke.Color := TAlphaColors.black;
  edtLoginUsername.Text := '';
end;

// Overwrites, Sets or Creates the specified setting in the config file
procedure TfrmLogin.SaveSettingString(Section, Name, Value: string);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(GetCurrentDir + '\' + F_CONFIG_FILE);
  try
    ini.WriteString(Section, Name, Value);
  finally
    ini.Free;
  end;
end;

procedure TfrmLogin.ScaleScreen;
var
  ScreenSize: TSize;
  SysScale: Single;
begin
  // Retrieves the screen resolution
  ScreenSize := Screen.Size;
  // Retrieves the screen scale
  SysScale := GetScreenScale;
  // Put in settings tab

  // 2.25 is the scale of the screen the application was created on (Mine)

  Layout1.Scale.X := (ScreenSize.Width / 3840) * (2.25 / SysScale);
  Layout1.Scale.Y := (ScreenSize.Height / 2160) * (2.25 / SysScale);
  Self.Width := Round(I_INI_FORM_WIDTH * (ScreenSize.Width / 3840) *
    (2.25 / SysScale));
  Self.Height := Round(I_INI_FORM_HEIGHT * (ScreenSize.Height / 2160) *
    (2.25 / SysScale));
end;

procedure TfrmLogin.showerrorLoginU(error: integer);
begin
  rectLoginUsername.Stroke.Color := StringToAlphacolor('#FFde1916');
  case error of
    0:
      begin
        lblLoginError.Text := 'That ' + S_APP_NAME +
          ' account does not exist. Enter a different account or get a new one';
        rectErrorMoveUI.Position.Y := 160;
      end;
    1:
      begin
        lblLoginError.Text := 'Enter a valid username or email address';
        rectErrorMoveUI.Position.Y := 135;
      end;
  else
    showerrorLoginU(i_prev_err_login_u);
  end;
  i_prev_err_login_u := error;
  b_err_login_u := True;
end;

procedure TfrmLogin.showerrorLoginP(error: integer);
begin
  rectLogin2Password.Stroke.Color := StringToAlphacolor('#FFde1916');
  case error of
    0:
      begin
        lblLogin2Error.Text :=
          'Your account or password is incorrect. If you don''t remember your password, reset it.';
        rectError2MoveUI.Position.Y := 165;
      end;
    1:
      begin
        lblLogin2Error.Text := 'Please enter the password for your ' +
          S_APP_NAME + ' account.';
        rectError2MoveUI.Position.Y := 147;
      end;
    2:
      begin
        lblLogin2Error.Text := 'You have not selected a country code.';
        rectError2MoveUI.Position.Y := 147;
      end;
  else
    showerrorLoginP(i_prev_err_login_p);
  end;
  i_prev_err_login_p := error;
  b_err_login_p := True;
end;

procedure TfrmLogin.showerrorCreate1(error: integer; s: string = '');
begin
  rectCreateAccountPhone.Stroke.Color := StringToAlphacolor('#FFde1916');
  case error of
    0:
      begin
        lblCreateAccountError.Text :=
          'The phone number you entered isn''t valid. Your phone number can contain numbers and spaces.';
        rectCreateAccountError.Position.Y := 155;
      end;
    1:
      begin
        lblCreateAccountError.Text := 'A phone number is required';
        rectCreateAccountError.Position.Y := 135;
      end;
    2:
      begin
        lblCreateAccountError.Text := 'Enter the email address in the format' +
          #13 + 'someone@example.com';
        rectCreateAccountError.Position.Y := 145;
      end;
    3:
      begin
        lblCreateAccountError.Text := 'An email address is required';
        rectCreateAccountError.Position.Y := 120;
      end;
    4:
      begin
        if b_phone then
        begin
          lblCreateAccountError.Text := s + ' is already a ' + S_APP_NAME +
            ' account.';
          rectCreateAccountError.Position.Y := 140;
        end
        else
        begin
          lblCreateAccountError.Text := s + ' is already a ' + S_APP_NAME +
            ' account.';
          rectCreateAccountError.Position.Y := 125;
        end;
      end;
  else
    showerrorCreate1(i_prev_err_create_1);
  end;
  i_prev_err_create_1 := error;
  b_err_create_1 := True;
end;

procedure TfrmLogin.showerrorCreateP(error: integer);
begin
  rectEdtCreateAccountPassword.Stroke.Color := StringToAlphacolor('#FFde1916');
  case error of
    0:
      begin
        lblCreateAccountPasswordError.Text := 'A password is required.';
        rectCreateAccountPasswordError.Position.Y := 190;
      end;
    1:
      begin
        lblCreateAccountPasswordError.Text :=
          'Passwords must have at least 8 characters and contain at' + #13 +
          'least two of the following: uppercase letters, lowercase' + #13 +
          'letters, numbers, and symbols.';
        rectCreateAccountPasswordError.Position.Y := 230;
      end;
  else
    showerrorCreateP(i_prev_err_create_p);
  end;
  i_prev_err_create_p := error;
  b_err_create_p := True;
end;

procedure TfrmLogin.showerrorCreateName(error: TErrors);
// [First name error, Last name error]
const
  err: array [0 .. 3] of string = ('This information is required.',
    'Your name contains characters that are not allowed.',
    'Your username contains characters that are not allowed.',
    'Username is taken.');
var
  i: integer;
begin
  if error[0] > -1 then
    with lblCreateAccountNameErrorFirst do
    begin
      Height := 20;
      Text := err[error[0]]
    end;
  if error[1] > -1 then
    with lblCreateAccountNameErrorLast do
    begin
      Height := 20;
      Text := err[error[1]]
    end;
  if error[2] > -1 then
    with lblCreateAccountNameErrorUsername do
    begin
      Height := 20;
      Text := err[error[2]]
    end;

  arr_prev_err_create_n := error;
  b_err_create_n := True;
end;

procedure TfrmLogin.timerAnimationTimer(Sender: TObject);
begin
  gifLoading.Stop;
  gifLoading.Enabled := False;
  gifLoading.Visible := False;
  if i_login_state = 3 then
  begin
    rectCreateAccountUIpnl.Visible := True;
  end
  else
  begin
    rectLogin.BringToFront;
    rectLoginUIPnl.Visible := True;
  end;
  timerAnimation.Enabled := False;
end;

procedure TfrmLogin.timerGifLoadingTimer(Sender: TObject);
begin
  gifLoading2.Stop;
  gifLoading2.Enabled := False;
  gifLoading2.Visible := False;
  timerGifLoading.Enabled := False;
  rectlblCreateAccountPictureUpload.Enabled := True;
  circleProfilePicture.Enabled := True;
  rectImgDragDrop.Enabled := True;
  rectBtnFinish.Enabled := True;
end;

procedure TfrmLogin.zoomFinish(Sender: TObject);
begin
  float.Start;
end;

end.

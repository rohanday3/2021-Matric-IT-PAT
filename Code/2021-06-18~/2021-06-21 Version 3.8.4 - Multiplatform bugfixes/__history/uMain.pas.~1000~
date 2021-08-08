unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.MultiView, FMX.Objects, FMX.Layouts,
  uNaviPanel, FMX.StdCtrls, FMX.TabControl, uDashPanel, UIConsts, FMX.Edit,
  FMX.ListBox, uDonationPanel, System.ImageList, FMX.ImgList, Datamodule,
  FMX.Ani, uDonationsThread, uSplashscreen, System.Diagnostics,
  System.Timespan, System.Rtti, FMX.Grid.Style, FMX.ScrollBox, FMX.Grid,
  System.StrUtils, winApi.Windows, FMX.Platform, uSettingsPanel, FMX.GIFImage,
  FMX.DateTimeCtrls, System.Dateutils, uPreferences;

type
  TForm1 = class(TForm)
    MultiView1: TMultiView;
    StyleBook1: TStyleBook;
    imgNaviBar: TImage;
    flowNavibar: TFlowLayout;
    pnlTop: TPanel;
    imgAccount: TImage;
    lblDatetime: TLabel;
    Timer1: TTimer;
    lblAccount: TLabel;
    tContrMain: TTabControl;
    tabHome: TTabItem;
    tabDonations: TTabItem;
    tabPayments: TTabItem;
    tabInventory: TTabItem;
    tabReport: TTabItem;
    lblTab: TLabel;
    rectCopyright: TRectangle;
    lblCopyright: TLabel;
    flowHome: TFlowLayout;
    tabBackup: TTabItem;
    tabSettings: TTabItem;
    tabHelp: TTabItem;
    pnlDonationQuery: TPanel;
    edtDonationsSearch: TEdit;
    cmbShowNumRec: TComboBox;
    lbl_showing_donations: TLabel;
    ImageList1: TImageList;
    ImageList2: TImageList;
    ImageList3: TImageList;
    FloatAnimation1: TFloatAnimation;
    FloatAnimation2: TFloatAnimation;
    StringGrid1: TStringGrid;
    StringColumn1: TStringColumn;
    StringColumn2: TStringColumn;
    StringColumn3: TStringColumn;
    StringColumn4: TStringColumn;
    StringColumn5: TStringColumn;
    StringColumn6: TStringColumn;
    Layout1: TLayout;
    ImageList4: TImageList;
    ImageList5: TImageList;
    Rectangle5: TRectangle;
    rectSearch: TRectangle;
    imgSearchIcon: TImage;
    imgClearSearch: TImage;
    lblNoRecords: TLabel;
    imgNoRecordsFound: TGIFImage;
    StartDateEdit: TDateEdit;
    EndDateEdit: TDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    chkDateFilter: TCheckBox;
    grpDateFilter: TGroupBox;
    pnlShowNumRec: TRectangle;
    imgShowNumRec: TImage;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure tContrMainChange(Sender: TObject);
    procedure imgNaviBarMouseEnter(Sender: TObject);
    procedure FormResize(Sender: TObject);
    // procedure DonationsFlowResize;
    // procedure rectDonHeadTimeMouseEnter(Sender: TObject);
    // procedure rectDonHeadTimeMouseLeave(Sender: TObject);
    // procedure rectDonHeadDescMouseDown(Sender: TObject; Button: TMouseButton;
    // Shift: TShiftState; X, Y: Single);
    // procedure rectDonHeadTimeClick(Sender: TObject);
    // procedure rectDonHeadTimeMouseUp(Sender: TObject; Button: TMouseButton;
    // Shift: TShiftState; X, Y: Single);
    procedure FormDestroy(Sender: TObject);
    procedure cmbShowNumRecChange(Sender: TObject);
    procedure StringGrid1DrawColumnHeader(Sender: TObject;
      const Canvas: TCanvas; const Column: TColumn; const Bounds: TRectF);
    procedure rectScaleSettingsClick(Sender: TObject);
    procedure StringGrid1Resize(Sender: TObject);
    procedure edtDonationsSearchTyping(Sender: TObject);
    procedure imgClearSearchClick(Sender: TObject);
    procedure StringGrid1DrawColumnCell(Sender: TObject; const Canvas: TCanvas;
      const Column: TColumn; const Bounds: TRectF; const Row: Integer;
      const Value: TValue; const State: TGridDrawStates);
    procedure chkDateFilterChange(Sender: TObject);
    procedure StartDateEditChange(Sender: TObject);
    procedure EndDateEditChange(Sender: TObject);
    procedure lbl_showing_allClick(Sender: TObject);
    procedure imgShowNumRecClick(Sender: TObject);
    procedure chkMatchCaseChange(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    arrNavipanel: array [1 .. 8] of TNaviPanel;
    arrDashpanel: array [1 .. 6] of TDashPanel;
    arrSettingsPanel: array [1 .. 8] of TSettingsPanel;
    DonationFilterList, DonationList, donation_search_cells
      : array of array of string;
    sorttype: Integer;
    sortcolumn: Integer;
    sort: Boolean;
    MIN_SIZE_ENABLED: Boolean;
    donation_grid_head_size: Integer;
    CurAccount: string;
    procedure LoadDashboard;
    procedure LoadNavigationPanel;
    procedure HighlightStrings(searchstring: string);
    function ChangeColour(colour, option: string): string;
    procedure StringFilter(ACol: array of Integer; Filter: String);
    procedure DateFilter(StartDate, EndDate: TDate);
    function JoinStrings(const s: array of string; Delimiter: Char): string;
    procedure RestoreFilter;
    function StrArrayJoin(const StringArray: array of string;
      const Separator: string): string;
    function IsNumberInArray(const ANumber: Integer;
      const AArray: array of Integer): Boolean;
    procedure ScaleScreen;
    function GetScreenScale: Single;

  const
    MIN_HEIGHT: Integer = 600;
    MIN_WIDTH: Integer = 1020;
    iniWidth: Integer = 1360;
    iniHeight: Integer = 750;
  public
    { Public declarations }
    loading_status: string;
    procedure setCurAccount(accountName: string);
    procedure LoadDonations;
    class var donation_thread: TLoadDonations;
  end;

var
  Form1: TForm1;

implementation

uses
  uLogin;

{$R *.fmx}

function TForm1.IsNumberInArray(const ANumber: Integer;
  const AArray: array of Integer): Boolean;
var
  i: Integer;
begin
  for i := Low(AArray) to High(AArray) do
    if ANumber = AArray[i] then
      Exit(true);
  result := False;
end;

procedure TForm1.cmbShowNumRecChange(Sender: TObject);
var
  s: string;
begin
  edtDonationsSearch.Text := '';
  RestoreFilter;
  s := Copy(cmbShowNumRec.Items[cmbShowNumRec.ItemIndex],
    Pos(':', cmbShowNumRec.Items[cmbShowNumRec.ItemIndex]) + 2,
    length(cmbShowNumRec.Items[cmbShowNumRec.ItemIndex]));
  if s = 'All' then
  begin
    StringGrid1.RowCount := length(DonationList);
  end
  else
  begin
    StringGrid1.RowCount := strtoint(s);
  end;
  lbl_showing_donations.Text := 'Recent donations (showing up to ' +
    inttostr(StringGrid1.RowCount) + ' donations)';
end;

procedure TForm1.DateFilter(StartDate, EndDate: TDate);
var
  rowIndex, i, K, J: Integer;
begin
  lblNoRecords.Visible := False;
  imgNoRecordsFound.Visible := False;
  rowIndex := 0;
  SetLength(DonationFilterList, 0);
  for i := 0 to length(DonationList) - 1 do
  begin
    if Dateinrange(StrToDate(DonationList[i, 4]), StartDate, EndDate) then
    begin
      SetLength(DonationFilterList, rowIndex + 1, StringGrid1.ColumnCount);
      for J := 0 to StringGrid1.ColumnCount - 1 do
      begin
        DonationFilterList[rowIndex, J] := DonationList[i, J];
      end;
      Inc(rowIndex);
    end;
  end;
  StringGrid1.RowCount := length(DonationFilterList);
  if length(DonationFilterList) > 0 then
  begin
    for i := 0 to length(DonationFilterList) - 1 do
    begin
      for K := 0 to StringGrid1.ColumnCount - 1 do
      begin
        StringGrid1.cells[K, i] := DonationFilterList[i, K];
      end;
    end;
  end
  else
  begin
    lblNoRecords.Visible := true;
    imgNoRecordsFound.Visible := true;
  end;
  lbl_showing_donations.Text := 'Recent donations (showing up to ' +
    inttostr(length(DonationFilterList)) + ' donations)';
end;

procedure TForm1.edtDonationsSearchTyping(Sender: TObject);
var
  Cols: array of Integer;
begin
  Cols := [0, 1, 2, 3, 4, 5];
  if (length(Trim(edtDonationsSearch.Text)) > 0) then
  Begin
    try
      StringFilter(Cols, edtDonationsSearch.Text);
    except

    end;
    cmbShowNumRec.ItemIndex := 9;
    imgClearSearch.Visible := true;
  end
  else
  begin
    SetLength(donation_search_cells, 0);
    StringGrid1.RowCount := 0;
    RestoreFilter;
    imgClearSearch.Visible := False;
  end;
end;

procedure TForm1.EndDateEditChange(Sender: TObject);
begin
  DateFilter(StartDateEdit.Date, EndDateEdit.Date);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ScaleScreen;
  // Self.Hide;
  // if TSplashscreen.Execute then
  // Self.Show;
  rectSearch.Position.X := pnlDonationQuery.Width - rectSearch.Width -
    MultiView1.Width;
  rectSearch.BringToFront;
  MIN_SIZE_ENABLED := true;
  donation_grid_head_size := 20;
  loading_status := 'Starting application...';
  loading_status := 'Loading navigation panel...';
  LoadNavigationPanel;
  loading_status := 'Loading top panel...';
  lblAccount.Text := 'Welcome, ' + Application.Hint;
  Application.Hint := '';
  lblTab.Text := arrNavipanel[tContrMain.TabIndex + 1].GetLabel;
  loading_status := 'Loading botom panel...';
  lblCopyright.Text := 'Copyright © ' + FormatDateTime('yyyy', Now) +
    '. All rights reserved.';
  loading_status := 'loading dashboard panel...';
  LoadDashboard;
  loading_status := 'loading donations panel...';
  LoadDonations;
  sorttype := 0;
  sortcolumn := -1;
  sort := False;
  rectSearch.Position.X := pnlDonationQuery.Width - rectSearch.Width -
    MultiView1.Width;
  // ShowMessage(DataModule1.ADOQuery1.FieldByName('column_name').AsString);
  // ShowMessage(inttostr(StringGrid1.RowCount));
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  Hide;
  Application.Free;
end;

procedure TForm1.FormResize(Sender: TObject);
var
  i: Integer;
  LInput: TInput;
begin
  MultiView1.HideMaster;
  pnlTop.Width := ClientWidth - MultiView1.Width;
  tContrMain.Width := ClientWidth - MultiView1.Width;
  tContrMain.Height := ClientHeight - pnlTop.Height - rectCopyright.Height;
  rectCopyright.Width := ClientWidth - MultiView1.Width;
  flowHome.Width := ClientWidth - MultiView1.Width;
  flowHome.Height := ClientHeight;
  imgAccount.Position.X := ClientWidth - imgAccount.Width -
    MultiView1.Width - 10;
  lblAccount.Position.X := ClientWidth - imgAccount.Width - lblAccount.Width -
    MultiView1.Width - 25;
  lblDatetime.Width := ClientWidth - imgAccount.Width - lblAccount.Width -
    MultiView1.Width - 80 - lblDatetime.Width;
  lblDatetime.Position.X := lblTab.Width + MultiView1.Width;

  // Tab Donations
  StringGrid1.Width := ClientWidth - MultiView1.Width;
  imgNoRecordsFound.Position.X := StringGrid1.Width / 2 -
    imgNoRecordsFound.Width / 2;
  imgNoRecordsFound.Position.Y := pnlDonationQuery.Height + StringGrid1.Height /
    2 - imgNoRecordsFound.Height + pnlTop.Height;
  lblNoRecords.Position.X := StringGrid1.Width / 2 -
    lblNoRecords.BoundsRect.Width / 2;
  lblNoRecords.Position.Y := pnlDonationQuery.Height + StringGrid1.Height / 2 +
    pnlTop.Height;
  StringGrid1.Height := ClientHeight - pnlDonationQuery.Height;
  pnlDonationQuery.Width := ClientWidth - MultiView1.Width;
  rectSearch.Position.X := pnlDonationQuery.Width - rectSearch.Width;

  for i := 0 to StringGrid1.ColumnCount - 1 do
  begin
    StringGrid1.Columns[i].Width := StringGrid1.Width / StringGrid1.ColumnCount;
  end;

  if MIN_SIZE_ENABLED then
  begin
    If (ClientWidth < MIN_WIDTH) AND (tContrMain.TabIndex = 1) Then
    Begin
      ClientWidth := MIN_WIDTH;
      Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
    End;

    If (ClientHeight < MIN_HEIGHT) AND (tContrMain.TabIndex = 1) Then
    Begin
      ClientHeight := MIN_HEIGHT;
      Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
    End;
  end;
end;

function TForm1.GetScreenScale: Single;
var
  ScrService: IFMXScreenService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXScreenService,
    ScrService) then
  begin
    result := ScrService.GetScreenScale;
  end;
end;

procedure TForm1.HighlightStrings(searchstring: string);
var
  i, K: Integer;
begin
  SetLength(donation_search_cells, length(DonationFilterList) + 1,
    StringGrid1.ColumnCount);
  for i := 0 to length(DonationFilterList) - 1 do
  begin
    for K := 0 to StringGrid1.ColumnCount - 1 do
    begin
      if ContainsText(DonationFilterList[i, K], searchstring) then
      begin
        donation_search_cells[i, K] := 'Highlight';
      end;
    end;
  end;
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
  TRectangle(TImage(Sender).Parent).OnClick(TRectangle(TImage(Sender).Parent));
end;

procedure TForm1.imgShowNumRecClick(Sender: TObject);
begin
  cmbShowNumRec.DropDown;
end;

procedure TForm1.imgClearSearchClick(Sender: TObject);
begin
  edtDonationsSearch.Text := '';
  edtDonationsSearch.ShowHint := true;
  imgClearSearch.Visible := False;
  imgClearSearch.SetFocus;
  SetLength(donation_search_cells, 0);
  StringGrid1.RowCount := 0;
  RestoreFilter;
end;

procedure TForm1.imgNaviBarMouseEnter(Sender: TObject);
begin
  if MultiView1.Width = MultiView1.NavigationPaneOptions.CollapsedWidth then
    MultiView1.ShowMaster;
end;

procedure TForm1.LoadDashboard;
var
  i, Category, inventory_quantity, donation_quantity, payment_quantity,
    staff_quantity, low_stock_quantity: Integer;
  item_count, donation_count, staff_count: string;
begin
  with DataModule1.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT item_category,COUNT(*) FROM Inventory GROUP BY item_category');
    Open;
    Category := RecordCount;
  end;
  with DataModule1.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT SUM(item_quantity) AS TOTAL FROM Inventory');
    Open;
    inventory_quantity := FieldByName('TOTAL').AsInteger;
  end;
  if length(inttostr(inventory_quantity)) > 4 then
    item_count := FloatToStrF(inventory_quantity / 1000, ffGeneral, 3, 2) + 'k'
  else
    item_count := inttostr(inventory_quantity);
  with DataModule1.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT SUM(donation_quantity) AS TOTAL FROM Donations');
    Open;
    donation_quantity := FieldByName('TOTAL').AsInteger;
  end;
  if length(inttostr(donation_quantity)) > 4 then
    donation_count := FloatToStrF(donation_quantity / 1000, ffGeneral,
      3, 2) + 'k'
  else
    donation_count := inttostr(donation_quantity);
  with DataModule1.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT SUM(paid) AS TOTAL FROM Payments WHERE paid = FALSE');
    Open;
    payment_quantity := FieldByName('TOTAL').AsInteger;
  end;
  with DataModule1.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT COUNT(*) AS TOTAL FROM Employees WHERE access = "staff"');
    Open;
    staff_quantity := FieldByName('TOTAL').AsInteger;
  end;
  if length(inttostr(staff_quantity)) > 4 then
    staff_count := FloatToStrF(staff_quantity / 1000, ffGeneral, 3, 2) + 'k'
  else
    staff_count := inttostr(staff_quantity);
  with DataModule1.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT COUNT(*) AS TOTAL FROM Inventory WHERE item_quantity < minimum_quantity');
    Open;
    low_stock_quantity := FieldByName('TOTAL').AsInteger;
  end;
  for i := 1 to 6 do
  begin
    arrDashpanel[i] := TDashPanel.Create(Self, flowHome);
    arrDashpanel[i].opanel.Cursor := crHandPoint;
  end;
  arrDashpanel[1].GetTImage.Bitmap :=
    (ImageList1.Source.Items[0].MultiResBitmap.Bitmaps[1]);
  // (GetCurrentDir + '\..\..\..\..\Assets\Icons\items\items.png');
  arrDashpanel[1].setColor(StringToAlphaColor('#FF14bfe4'));
  arrDashpanel[1].SetLabel2('Total items');
  arrDashpanel[1].SetLabel1(item_count);
  arrDashpanel[2].GetTImage.Bitmap :=
    (ImageList1.Source.Items[1].MultiResBitmap.Bitmaps[1]);
  arrDashpanel[2].setColor(StringToAlphaColor('#FF14a659'));
  arrDashpanel[2].SetLabel2('Total categories');
  arrDashpanel[2].SetLabel1(inttostr(Category));
  arrDashpanel[3].GetTImage.Bitmap :=
    (ImageList1.Source.Items[2].MultiResBitmap.Bitmaps[1]);
  arrDashpanel[3].setColor(StringToAlphaColor('#FFec9e1b'));
  arrDashpanel[3].SetLabel2('Total donations');
  arrDashpanel[3].SetLabel1(donation_count);
  arrDashpanel[4].GetTImage.Bitmap :=
    (ImageList1.Source.Items[3].MultiResBitmap.Bitmaps[1]);
  arrDashpanel[4].setColor(StringToAlphaColor('#FFdd4c39'));
  arrDashpanel[4].SetLabel2('Outstanding expenses');
  arrDashpanel[4].SetLabel1(inttostr(payment_quantity));
  arrDashpanel[5].GetTImage.Bitmap :=
    (ImageList1.Source.Items[4].MultiResBitmap.Bitmaps[1]);
  arrDashpanel[5].setColor(StringToAlphaColor('#FF14bfe4'));
  arrDashpanel[5].SetLabel2('Total staff');
  arrDashpanel[5].SetLabel1(staff_count);
  arrDashpanel[6].GetTImage.Bitmap :=
    (ImageList1.Source.Items[6].MultiResBitmap.Bitmaps[1]);
  if low_stock_quantity < 1 then
    arrDashpanel[6].setColor(StringToAlphaColor('#FF14a659'))
  else
    arrDashpanel[6].setColor(StringToAlphaColor('#FFec9e1b'));
  arrDashpanel[6].SetLabel2('Low stock');
  arrDashpanel[6].SetLabel1(inttostr(low_stock_quantity));
end;

function TForm1.JoinStrings(const s: array of string; Delimiter: Char): string;
var
  i, c: Integer;
  p: PChar;
begin
  c := 0;
  for i := 0 to High(s) do
    Inc(c, length(s[i]));
  SetLength(result, c + High(s));
  p := PChar(result);
  for i := 0 to High(s) do
  begin
    if i > 0 then
    begin
      p^ := Delimiter;
      Inc(p);
    end;
    Move(PChar(s[i])^, p^, SizeOf(Char) * length(s[i]));
    Inc(p, length(s[i]));
  end;
end;

procedure TForm1.lbl_showing_allClick(Sender: TObject);
begin
  RestoreFilter;
  edtDonationsSearch.Text := '';
  cmbShowNumRec.ItemIndex := 9;
end;

procedure TForm1.LoadDonations;
var
  i: Integer;
  grey: Boolean;
  K: Integer;
  rows: array [0 .. 5] of string;
  temp_head: string;
begin
  with DataModule1.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM Donations');
    Open;
    First;
  end;
  lbl_showing_donations.Text := 'Recent donations (showing up to ' +
    inttostr(DataModule1.ADOQuery1.Recordset.RecordCount) + ' donations)';
  StringGrid1.RowCount := DataModule1.ADOQuery1.Recordset.RecordCount + 1;
  SetLength(DonationList, DataModule1.ADOQuery1.Recordset.RecordCount,
    DataModule1.ADOQuery1.FieldCount);
  for i := 0 to DataModule1.ADOQuery1.Recordset.RecordCount - 1 do
  begin
    for K := 0 to DataModule1.ADOQuery1.FieldCount - 1 do
    begin;
      DonationList[i, K] := DataModule1.ADOQuery1.Fields[K].AsString;
      temp_head := StringReplace(DataModule1.ADOQuery1.Fields[K].FieldName, '_',
        ' ', [rfReplaceAll]);
      temp_head[1] := UpCase(temp_head[1]);
      temp_head[Pos(' ', temp_head) + 1] :=
        UpCase(temp_head[Pos(' ', temp_head) + 1]);
      StringGrid1.Columns[K].Header := temp_head;
    end;
    DataModule1.ADOQuery1.Next;
  end;
  DataModule1.ADOQuery1.Free;
  StringGrid1.RowCount := length(DonationList);
  RestoreFilter;
  {
    ShowMessage(DataModule1.ADOQuery1.FieldByName('column_name').AsString);
    for I := 1 to DataModule1.ADOQuery1.RecordCount do
    begin
    // arrDonationPanel[I].SetLabelName
    // (DataModule1.ADOQuery1.FieldByName('item_id').AsString);
    // arrDonationPanel[I].SetLabelTime
    // (DataModule1.ADOQuery1.FieldByName('donation_date').AsString);
    if grey = True then
    begin
    // arrDonationPanel[I].setColor(StringToAlphaColor('#FFf9f9f9'));
    // grey := False;
    end
    else
    begin
    // arrDonationPanel[I].setColor(StringToAlphaColor('#FFffffff'));
    // grey := True;
    end;
    end;
    // DonationsFlowResize;
    ShowMessage(IntToStr(StringGrid1.RowCount));
  }
end;

procedure TForm1.LoadNavigationPanel;
var
  i: Integer;
begin
  for i := 1 to 8 do
  begin
    arrNavipanel[i] := TNaviPanel.Create(Self, flowNavibar);
    arrNavipanel[i].setTabControl(tContrMain);
    arrNavipanel[i].setTabIndex(i - 1);
  end;
  arrNavipanel[1].setClicked;
  arrNavipanel[1].SetLabel('Home');
  arrNavipanel[2].SetLabel('Donations');
  arrNavipanel[3].SetLabel('Payments');
  arrNavipanel[4].SetLabel('Inventory');
  arrNavipanel[5].SetLabel('Report');
  arrNavipanel[6].SetLabel('Backup');
  arrNavipanel[7].SetLabel('Settings');
  arrNavipanel[8].SetLabel('Help');
  arrNavipanel[1].GetTImage.Bitmap :=
    (ImageList2.Source.Items[0].MultiResBitmap.Bitmaps[1]);
  arrNavipanel[2].GetTImage.Bitmap :=
    (ImageList2.Source.Items[1].MultiResBitmap.Bitmaps[1]);
  arrNavipanel[3].GetTImage.Bitmap :=
    (ImageList2.Source.Items[2].MultiResBitmap.Bitmaps[1]);
  arrNavipanel[4].GetTImage.Bitmap :=
    (ImageList2.Source.Items[3].MultiResBitmap.Bitmaps[1]);
  arrNavipanel[5].GetTImage.Bitmap :=
    (ImageList2.Source.Items[4].MultiResBitmap.Bitmaps[1]);
  arrNavipanel[6].GetTImage.Bitmap :=
    (ImageList2.Source.Items[5].MultiResBitmap.Bitmaps[1]);
  arrNavipanel[7].GetTImage.Bitmap :=
    (ImageList2.Source.Items[6].MultiResBitmap.Bitmaps[1]);
  arrNavipanel[8].GetTImage.Bitmap :=
    (ImageList2.Source.Items[7].MultiResBitmap.Bitmaps[1]);
end;

procedure TForm1.rectScaleSettingsClick(Sender: TObject);
var
  i: Integer;
  J: TFmxObject;
begin
  if TRectangle(Sender).Height = 40 then
  begin
    TImage(TRectangle(Sender).Children[1]).Bitmap := ImageList5.Source.Items[0]
      .MultiResBitmap.Bitmaps[1];
    TRectangle(TRectangle(Sender).Children[0]).Height := 210;
    TRectangle(Sender).Height := 250;
  end
  else
  begin
    TImage(TRectangle(Sender).Children[1]).Bitmap := ImageList5.Source.Items[1]
      .MultiResBitmap.Bitmaps[1];
    TRectangle(TRectangle(Sender).Children[0]).Height := 0;
    TRectangle(Sender).Height := 40;
  end;
  TFlowLayout(TRectangle(Sender).Parent).FlowDirection :=
    TFlowDirection.LeftToRight;
end;

procedure TForm1.RestoreFilter;
var
  i: Integer;
  K: Integer;
begin
  SetLength(donation_search_cells, 0, 0);
  edtDonationsSearch.Text := '';
  lblNoRecords.Visible := False;
  imgNoRecordsFound.Visible := False;
  StringGrid1.RowCount := length(DonationList);
  for i := 0 to StringGrid1.RowCount - 1 do
  begin
    for K := 0 to StringGrid1.ColumnCount - 1 do
    begin
      StringGrid1.cells[K, i] := DonationList[i, K];
    end;
  end;
  lbl_showing_donations.Text := 'Recent donations (showing up to ' +
    inttostr(StringGrid1.RowCount) + ' donations)';
end;

procedure TForm1.ScaleScreen;
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

{
  procedure TForm1.rectDonHeadDescMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
  begin
  TRectangle(Sender).Fill.Color := StringToAlphaColor('#fff5f5f5');
  end;

  procedure TForm1.rectDonHeadTimeClick(Sender: TObject);
  var
  I: integer;
  begin
  sort := True;
  for I := 0 to flowDonationsHead.ChildrenCount - 1 do
  begin
  if flowDonationsHead.Children[I] = TComponent(Sender) then
  begin
  if I <> sortcolumn then
  sorttype := 0;
  if sorttype = 0 then
  begin
  TImage(TRectangle(flowDonationsHead.Children[I]).Children[1]).Bitmap :=
  ImageList3.Source.Items[2].MultiResBitmap.Bitmaps[1];
  sorttype := 1;
  end
  else
  begin
  TImage(TRectangle(flowDonationsHead.Children[I]).Children[1]).Bitmap :=
  ImageList3.Source.Items[1].MultiResBitmap.Bitmaps[1];
  sorttype := 0;
  end;
  sortcolumn := I;
  TRectangle(flowDonationsHead.Children[I]).Fill.Color :=
  StringToAlphaColor('#ffebebeb');
  end
  else
  begin
  TImage(TRectangle(flowDonationsHead.Children[I]).Children[1]).Bitmap :=
  ImageList3.Source.Items[0].MultiResBitmap.Bitmaps[1];
  TRectangle(flowDonationsHead.Children[I]).Fill.Color :=
  StringToAlphaColor('#ffffffff');
  end;
  end;
  end;
}

{
  procedure TForm1.rectDonHeadTimeMouseEnter(Sender: TObject);
  begin
  if sort then
  begin
  if flowDonationsHead.Children[sortcolumn] <> TComponent(Sender) then
  TRectangle(Sender).Fill.Color := StringToAlphaColor('#fffafafa');
  end
  else
  TRectangle(Sender).Fill.Color := StringToAlphaColor('#fffafafa');
  end;

  procedure TForm1.rectDonHeadTimeMouseLeave(Sender: TObject);
  begin
  if sort then
  begin
  if flowDonationsHead.Children[sortcolumn] <> TComponent(Sender) then
  TRectangle(Sender).Fill.Color := StringToAlphaColor('#ffffffff');
  end
  else
  TRectangle(Sender).Fill.Color := StringToAlphaColor('#ffffffff');
  end;

  procedure TForm1.rectDonHeadTimeMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
  begin
  if sort then
  begin
  if flowDonationsHead.Children[sortcolumn] <> TComponent(Sender) then
  TRectangle(Sender).Fill.Color := StringToAlphaColor('#fffafafa');
  end
  else
  TRectangle(Sender).Fill.Color := StringToAlphaColor('#fffafafa');
  end;
}

procedure TForm1.setCurAccount(accountName: string);
begin
  CurAccount := accountName;
end;

procedure TForm1.StringFilter(ACol: array of Integer; Filter: String);
var
  i, K, J, rowIndex, cellIndex: Integer;
  Skip: Boolean;
begin
  if Filter = '' then
  begin
    RestoreFilter;
    Exit;
  end;
  try
    lblNoRecords.Visible := False;
    imgNoRecordsFound.Visible := False;
    rowIndex := 0;
    cellIndex := 0;
    J := 0;
    SetLength(DonationFilterList, 0);
    SetLength(donation_search_cells, 0, 0);
    for i := 0 to length(DonationList) - 1 do
    begin
      Skip := False;
      for K := 0 to StringGrid1.ColumnCount - 1 do
      begin
        if IsNumberInArray(K, ACol) AND ContainsText(DonationList[i, K], Filter)
        then
        begin
          if Skip then
            Continue;
          SetLength(DonationFilterList, rowIndex + 1, StringGrid1.ColumnCount);
          for J := 0 to StringGrid1.ColumnCount - 1 do
          begin
            DonationFilterList[rowIndex, J] := DonationList[i, J];
          end;
          Inc(rowIndex);
          Skip := true;
        end;
      end;
    end;
    J := 0;
    StringGrid1.RowCount := 0;
    HighlightStrings(Filter);
    StringGrid1.RowCount := length(DonationFilterList);
    if length(DonationFilterList) > 0 then
    begin
      for i := 0 to length(DonationFilterList) - 1 do
      begin
        for J := 0 to StringGrid1.ColumnCount - 1 do
        begin
          StringGrid1.cells[J, i] := DonationFilterList[i, J];
        end;
      end;
    end
    else
    begin
      lblNoRecords.Visible := true;
      imgNoRecordsFound.Visible := true;
    end;
    lbl_showing_donations.Text := 'Recent donations (showing up to ' +
      inttostr(length(DonationFilterList)) + ' donations)';
  except
    edtDonationsSearch.Text := '';
    RestoreFilter;
    ShowMessage('Oops. Something went wrong!');
  end;
end;

procedure TForm1.StartDateEditChange(Sender: TObject);
begin
  DateFilter(StartDateEdit.Date, EndDateEdit.Date);
end;

function TForm1.StrArrayJoin(const StringArray: array of string;
  const Separator: string): string;
var
  i: Integer;
begin
  result := '';
  for i := low(StringArray) to high(StringArray) do
    result := result + StringArray[i] + Separator;
  Delete(result, length(result), 1);
end;

procedure TForm1.StringGrid1DrawColumnCell(Sender: TObject;
  const Canvas: TCanvas; const Column: TColumn; const Bounds: TRectF;
  const Row: Integer; const Value: TValue; const State: TGridDrawStates);
var
  newBounds: TRectF;
  painted: Boolean;
begin
  if length(donation_search_cells) > 0 then
    if donation_search_cells[Row, Column.Index] = 'Highlight' then
    begin
      Canvas.Fill.Color := TAlphaColors.Yellow;
      painted := true;
    end;
  if (Row mod 2 = 0) and (painted = False) then
  begin
    Canvas.Fill.Color := TAlphaColors.White;
  end
  else if (Row mod 2 > 0) and (painted = False) then
  begin
    Canvas.Fill.Color := StringToAlphaColor('#FFddebf7');
  end;
  Canvas.Stroke.Thickness := 0;
  newBounds := Bounds;
  newBounds.Left := newBounds.Left - 5;
  newBounds.Width := newBounds.Width + 5;
  newBounds.Top := newBounds.Top - 4;
  newBounds.Height := newBounds.Height + 4;
  Canvas.FillRect(newBounds, 0, 0, [], 1);
  Canvas.Font.Size := 16;
  Canvas.Fill.Color := TAlphaColorRec.Black;
  Canvas.FillText(Bounds, Value.ToString, False, 1, [], TTextAlign.Leading);
end;

procedure TForm1.StringGrid1DrawColumnHeader(Sender: TObject;
  const Canvas: TCanvas; const Column: TColumn; const Bounds: TRectF);
begin
  Canvas.Fill.Color := StringToAlphaColor('#FF5b9bd5');
  Canvas.Stroke.Thickness := 2;
  Canvas.Stroke.Color := TAlphaColors.Darkgray;
  Canvas.FillRect(Bounds, 0, 0, [], 1);
  Canvas.Font.Size := donation_grid_head_size;
  Canvas.Font.Style := Canvas.Font.Style + [TFontStyle.fsBold];
  Canvas.Fill.Color := TAlphaColorRec.White;
  Canvas.FillText(Bounds, Column.Header, False, 1, [], TTextAlign.Leading);
end;

procedure TForm1.StringGrid1Resize(Sender: TObject);
begin
  donation_grid_head_size := Round(20 * (StringGrid1.Width / 1293));
end;

procedure TForm1.tContrMainChange(Sender: TObject);
var
  i: Integer;
begin
  lblTab.Text := arrNavipanel[tContrMain.TabIndex + 1].GetLabel;
  MultiView1.HideMaster;
  for i := 1 to 8 do
  begin
    if arrNavipanel[i].GetTabIndex <> tContrMain.TabIndex then
    begin
      arrNavipanel[i].resetColor;
    end;
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  today: TDateTime;
begin
  today := Now;
  lblDatetime.Text := FormatDateTime('dddddd tt', today);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  FormStyle := TFormStyle.StayOnTop;
  if TfrmPreferences.Execute then
  begin

  end;
  FormStyle := TFormStyle.Normal;
end;

function TForm1.ChangeColour(colour, option: string): string;
var
  colour_string: string;
  Red, green, blue: Integer;
const
  change_by: Integer = 10;
begin
  colour_string := Copy(colour, 4, 6);
  Red := StrToInt64('$' + Copy(colour_string, 1, 2));
  green := StrToInt64('$' + Copy(colour_string, 3, 2));
  blue := StrToInt64('$' + Copy(colour_string, 5, 2));

  if option = 'lighten' then
    result := Copy(colour, 1, 3) + IntToHex(Red + change_by, 1) +
      IntToHex(green + change_by, 1) + IntToHex(blue + change_by, 1);
  if option = 'darken' then
    result := Copy(colour, 1, 3) + IntToHex(Red - change_by, 1) +
      IntToHex(green - change_by, 1) + IntToHex(blue - change_by, 1);
end;

procedure TForm1.chkDateFilterChange(Sender: TObject);
begin
  if chkDateFilter.IsChecked then
  begin
    grpDateFilter.Enabled := true;
    DateFilter(StartDateEdit.Date, EndDateEdit.Date);
  end
  else
  begin
    grpDateFilter.Enabled := False;
    RestoreFilter;
  end;
end;

procedure TForm1.chkMatchCaseChange(Sender: TObject);
begin
end;

{
  procedure TForm1.DonationsFlowResize;
  var
  childrenRect: TRectF;
  I: integer;
  begin
  if ((csLoading in flowDonations.ComponentState) = False) then
  begin
  childrenRect := TRectF.Empty;
  for I := 0 to flowDonations.ControlsCount - 1 do
  childrenRect := TRectF.Union(childrenRect,
  flowDonations.Controls[I].childrenRect);
  flowDonations.Height := childrenRect.Height;
  end;
  end;
}
end.

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
  System.StrUtils;

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
    TabControl1: TTabControl;
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
    Label5: TLabel;
    Edit1: TEdit;
    Label6: TLabel;
    ComboBox1: TComboBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
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
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
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
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    arrNavipanel: array [1 .. 8] of TNaviPanel;
    arrDashpanel: array [1 .. 6] of TDashPanel;
    arrDonationPanel: array [1 .. 100] of TDonationPanel;
    DonationList, DonationFilterList: TStringList;
    sorttype: integer;
    sortcolumn: integer;
    sort: Boolean;
    CurAccount: string;
    procedure LoadDashboard;
    procedure LoadNavigationPanel;
    function ChangeColour(colour, option: string): string;
    procedure SetFilter(ACol: array of integer; Filter: String);
    function JoinStrings(const s: array of string; Delimiter: Char): string;
    procedure RestoreFilter;
    function StrArrayJoin(const StringArray: array of string;
      const Separator: string): string;
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

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  try
    StringGrid1.RowCount := strtoint(ComboBox1.Items[ComboBox1.ItemIndex]);
  except
    if UPPERCASE(ComboBox1.Items[ComboBox1.ItemIndex]) = 'ALL' then
      StringGrid1.RowCount := DonationList.Count
  end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  if Edit1.Text <> '' then
  Begin
    SetFilter([0, 1, 2, 3, 4, 5], Edit1.Text);
  end
  else
    RestoreFilter;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  I: integer;
begin
  Self.Hide;
  if TSplashscreen.Execute then
    Self.Show;
  loading_status := 'Starting application...';
  loading_status := 'Loading navigation panel...';
  LoadNavigationPanel;
  loading_status := 'Loading top panel...';
  lblAccount.Text := 'Welcome, ' + Application.Hint;
  Application.Hint := '';
  lblTab.Text := arrNavipanel[TabControl1.TabIndex + 1].GetLabel;
  loading_status := 'Loading botom panel...';
  lblCopyright.Text := 'Copyright � ' + FormatDateTime('yyyy', Now) +
    '. All rights reserved.';
  loading_status := 'loading dashboard panel...';
  LoadDashboard;
  loading_status := 'loading donations panel...';
  sorttype := 0;
  sortcolumn := -1;
  sort := False;
  // End of form create
  TabControl1.TabIndex := 0;
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
  I: integer;
begin
  MultiView1.HideMaster;
  pnlTop.Width := ClientWidth - MultiView1.Width;
  TabControl1.Width := ClientWidth - MultiView1.Width;
  TabControl1.Height := ClientHeight - pnlTop.Height - rectCopyright.Height;
  rectCopyright.Width := ClientWidth - MultiView1.Width;
  flowHome.Width := ClientWidth;
  flowHome.Height := ClientHeight;
  StringGrid1.Width := ClientWidth - MultiView1.Width;
  StringGrid1.Height := ClientHeight - pnlTop.Height - rectCopyright.Height -
    pnlDonationQuery.Height;
  StringGrid1.Position.X := 0;
  pnlDonationQuery.Width := ClientWidth;
  for I := 1 to 100 do
  begin
    arrDonationPanel[I].resize;
  end;
end;

procedure TForm1.imgNaviBarMouseEnter(Sender: TObject);
begin
  if MultiView1.Width = MultiView1.NavigationPaneOptions.CollapsedWidth then
    MultiView1.ShowMaster;
end;

procedure TForm1.LoadDashboard;
var
  I, Category, inventory_quantity, donation_quantity, payment_quantity,
    staff_quantity, low_stock_quantity: integer;
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
  if length(IntToStr(inventory_quantity)) > 4 then
    item_count := FloatToStrF(inventory_quantity / 1000, ffGeneral, 3, 2) + 'k'
  else
    item_count := IntToStr(inventory_quantity);
  with DataModule1.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT SUM(donation_quantity) AS TOTAL FROM Donations');
    Open;
    donation_quantity := FieldByName('TOTAL').AsInteger;
  end;
  if length(IntToStr(donation_quantity)) > 4 then
    donation_count := FloatToStrF(donation_quantity / 1000, ffGeneral,
      3, 2) + 'k'
  else
    donation_count := IntToStr(donation_quantity);
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
  if length(IntToStr(staff_quantity)) > 4 then
    staff_count := FloatToStrF(staff_quantity / 1000, ffGeneral, 3, 2) + 'k'
  else
    staff_count := IntToStr(staff_quantity);
  with DataModule1.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT COUNT(*) AS TOTAL FROM Inventory WHERE item_quantity < minimum_quantity');
    Open;
    low_stock_quantity := FieldByName('TOTAL').AsInteger;
  end;
  for I := 1 to 6 do
  begin
    arrDashpanel[I] := TDashPanel.Create(Self, flowHome);
    arrDashpanel[I].opanel.Cursor := crHandPoint;
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
  arrDashpanel[2].SetLabel1(IntToStr(Category));
  arrDashpanel[3].GetTImage.Bitmap :=
    (ImageList1.Source.Items[2].MultiResBitmap.Bitmaps[1]);
  arrDashpanel[3].setColor(StringToAlphaColor('#FFec9e1b'));
  arrDashpanel[3].SetLabel2('Total donations');
  arrDashpanel[3].SetLabel1(donation_count);
  arrDashpanel[4].GetTImage.Bitmap :=
    (ImageList1.Source.Items[3].MultiResBitmap.Bitmaps[1]);
  arrDashpanel[4].setColor(StringToAlphaColor('#FFdd4c39'));
  arrDashpanel[4].SetLabel2('Outstanding expenses');
  arrDashpanel[4].SetLabel1(IntToStr(payment_quantity));
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
  arrDashpanel[6].SetLabel1(IntToStr(low_stock_quantity));
end;

function TForm1.JoinStrings(const s: array of string; Delimiter: Char): string;
var
  I, c: integer;
  p: PChar;
begin
  c := 0;
  for I := 0 to High(s) do
    Inc(c, length(s[I]));
  SetLength(Result, c + High(s));
  p := PChar(Result);
  for I := 0 to High(s) do
  begin
    if I > 0 then
    begin
      p^ := Delimiter;
      Inc(p);
    end;
    Move(PChar(s[I])^, p^, SizeOf(Char) * length(s[I]));
    Inc(p, length(s[I]));
  end;
end;

procedure TForm1.LoadDonations;
var
  I: integer;
  grey: Boolean;
  K: integer;
  rows: array [0 .. 5] of string;
begin
  with DataModule1.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM Donations');
    Open;
    First;
  end;
  grey := True;
  StringGrid1.RowCount:=DataModule1.ADOQuery1.Recordset.RecordCount+1;
  for K := 0 to DataModule1.ADOQuery1.Recordset.RecordCount do
  begin
    for I := 0 to DataModule1.ADOQuery1.FieldCount - 1 do
    begin;
      StringGrid1.cells[I, K] := DataModule1.ADOQuery1.Fields[I].AsString;
      rows[I] := DataModule1.ADOQuery1.Fields[I].AsString;
      // StringGrid1.Columns[I].Title.Caption:=DataModule1.ADOQuery1.FieldList[I].AsString;
    end;
    // DonationList.Add(JoinStrings(rows, ','));
    DataModule1.ADOQuery1.Next;
  end;
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
  I: integer;
begin
  for I := 1 to 8 do
  begin
    arrNavipanel[I] := TNaviPanel.Create(Self, flowNavibar);
    arrNavipanel[I].setTabControl(TabControl1);
    arrNavipanel[I].setTabIndex(I - 1);
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

procedure TForm1.RestoreFilter;
var
  I: integer;
  rows: TArray<String>;
  K: integer;
begin
  for I := 0 to DonationList.Count do
  begin
    rows := SplitString(DonationList[I], ',');
    for K := 0 to StringGrid1.ColumnCount - 1 do
    begin
      StringGrid1.cells[K, I] := rows[K];
    end;
  end;
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

procedure TForm1.SetFilter(ACol: array of integer; Filter: String);
var
  I, K, J: integer;
  rows: TArray<String>;
begin
  for I := 0 to DonationList.Count do
  begin
    rows := SplitString(DonationList[I], ',');
    for K := 0 to StringGrid1.ColumnCount - 1 do
    begin
      if (K IN [1, 4, 5]) and (Pos(Filter, rows[K]) > -1) then
      begin
        DonationFilterList.Add(DonationList[I]);
        for J := 0 to StringGrid1.ColumnCount - 1 do
        begin
          StringGrid1.cells[K, I] := rows[K];
        end;
      end;
    end;
  end;
end;

function TForm1.StrArrayJoin(const StringArray: array of string;
  const Separator: string): string;
var
  I: integer;
begin
  Result := '';
  for I := low(StringArray) to high(StringArray) do
    Result := Result + StringArray[I] + Separator;
  Delete(Result, length(Result), 1);
end;

procedure TForm1.TabControl1Change(Sender: TObject);
var
  I: integer;
begin
  lblTab.Text := arrNavipanel[TabControl1.TabIndex + 1].GetLabel;
  MultiView1.HideMaster;
  for I := 1 to 8 do
  begin
    if arrNavipanel[I].GetTabIndex <> TabControl1.TabIndex then
    begin
      arrNavipanel[I].resetColor;
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
  RestoreFilter;
end;

function TForm1.ChangeColour(colour, option: string): string;
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
    Result := copy(colour, 1, 3) + IntToHex(red + change_by, 1) +
      IntToHex(green + change_by, 1) + IntToHex(blue + change_by, 1);
  if option = 'darken' then
    Result := copy(colour, 1, 3) + IntToHex(red - change_by, 1) +
      IntToHex(green - change_by, 1) + IntToHex(blue - change_by, 1);
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
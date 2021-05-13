unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.MultiView, FMX.Objects, FMX.Layouts,
  uNaviPanel, FMX.StdCtrls, FMX.TabControl, uDashPanel, UIConsts, FMX.Edit,
  FMX.ListBox, uDonationPanel, System.ImageList, FMX.ImgList;

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
    flowDonations: TFlowLayout;
    flowDonationsHead: TFlowLayout;
    rectDonHeadTime: TRectangle;
    Label1: TLabel;
    Image1: TImage;
    rectDonHeadItemName: TRectangle;
    Label2: TLabel;
    Image2: TImage;
    pnlDonationQuery: TPanel;
    rectDonHeadDesc: TRectangle;
    Label3: TLabel;
    Image3: TImage;
    rectDonHeadQuantity: TRectangle;
    Label4: TLabel;
    Image4: TImage;
    Label5: TLabel;
    Edit1: TEdit;
    Label6: TLabel;
    ComboBox1: TComboBox;
    Label7: TLabel;
    scrollDonationsVert: TVertScrollBox;
    Label8: TLabel;
    Label9: TLabel;
    ImageList1: TImageList;
    ImageList2: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure MultiView1MouseLeave(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure imgNaviBarMouseEnter(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure LoadDonations;
    procedure DonationsFlowResize;
  private
    { Private declarations }
    arrNavipanel: array [1 .. 8] of TNaviPanel;
    arrDashpanel: array [1 .. 6] of TDashPanel;
    arrDonationPanel: array [1 .. 100] of TDonationPanel;
  public
    { Public declarations }
    loading_status: string;
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  loading_status := 'Starting application...';
  loading_status := 'Loading navigation panel...';
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
  arrNavipanel[1].GetTImage.Bitmap := (ImageList2.Source.Items[0].MultiResBitmap.Bitmaps[1]);
  arrNavipanel[2].GetTImage.Bitmap := (ImageList2.Source.Items[1].MultiResBitmap.Bitmaps[1]);
  arrNavipanel[3].GetTImage.Bitmap := (ImageList2.Source.Items[2].MultiResBitmap.Bitmaps[1]);
  arrNavipanel[4].GetTImage.Bitmap := (ImageList2.Source.Items[3].MultiResBitmap.Bitmaps[1]);
  arrNavipanel[5].GetTImage.Bitmap := (ImageList2.Source.Items[4].MultiResBitmap.Bitmaps[1]);
  arrNavipanel[6].GetTImage.Bitmap := (ImageList2.Source.Items[5].MultiResBitmap.Bitmaps[1]);
  arrNavipanel[7].GetTImage.Bitmap := (ImageList2.Source.Items[6].MultiResBitmap.Bitmaps[1]);
  arrNavipanel[8].GetTImage.Bitmap := (ImageList2.Source.Items[7].MultiResBitmap.Bitmaps[1]);
  loading_status := 'Loading top panel...';
  lblTab.Text := arrNavipanel[TabControl1.TabIndex + 1].GetLabel;
  loading_status := 'Loading botom panel...';
  lblCopyright.Text := 'Copyright � ' + FormatDateTime('yyyy', Now) +
    '. All rights reserved.';
  loading_status := 'loading home panel...';
  for I := 1 to 6 do
  begin
    arrDashpanel[I] := TDashPanel.Create(Self, flowHome);
  end;
  arrDashpanel[1].GetTImage.Bitmap := (ImageList1.Source.Items[0].MultiResBitmap.Bitmaps[1]);
    //(GetCurrentDir + '\..\..\..\..\Assets\Icons\items\items.png');
  arrDashpanel[1].setColor(StringToAlphaColor('#FF00bfee'));
  arrDashpanel[1].SetLabel2('Total items');
  arrDashpanel[2].GetTImage.Bitmap := (ImageList1.Source.Items[1].MultiResBitmap.Bitmaps[1]);
  arrDashpanel[2].setColor(StringToAlphaColor('#FF00a659'));
  arrDashpanel[2].SetLabel2('Total categories');
  arrDashpanel[3].GetTImage.Bitmap := (ImageList1.Source.Items[2].MultiResBitmap.Bitmaps[1]);
  arrDashpanel[3].setColor(StringToAlphaColor('#FFf39c11'));
  arrDashpanel[3].SetLabel2('Total donations');
  arrDashpanel[4].GetTImage.Bitmap := (ImageList1.Source.Items[3].MultiResBitmap.Bitmaps[1]);
  arrDashpanel[4].setColor(StringToAlphaColor('#FFdd4c39'));
  arrDashpanel[4].SetLabel2('Outstanding expenses');;
  arrDashpanel[5].GetTImage.Bitmap := (ImageList1.Source.Items[4].MultiResBitmap.Bitmaps[1]);
  arrDashpanel[5].setColor(StringToAlphaColor('#FF00bfee'));
  arrDashpanel[5].SetLabel2('Total staff');
  arrDashpanel[6].GetTImage.Bitmap := (ImageList1.Source.Items[5].MultiResBitmap.Bitmaps[1]);
  arrDashpanel[6].setColor(StringToAlphaColor('#FF00a659'));
  arrDashpanel[6].SetLabel2('Total income');
  LoadDonations;

  // End of form create
  TabControl1.TabIndex := 0;
end;

procedure TForm1.FormResize(Sender: TObject);
var
  I: Integer;
begin
  MultiView1.HideMaster;
  pnlTop.Width := ClientWidth - MultiView1.Width;
  TabControl1.Width := ClientWidth - MultiView1.Width;
  TabControl1.Height := ClientHeight - pnlTop.Height - rectCopyright.Height;
  rectCopyright.Width := ClientWidth - MultiView1.Width;
  flowHome.Width := ClientWidth;
  flowHome.Height := ClientHeight;
  scrollDonationsVert.Width := ClientWidth - MultiView1.Width;
  scrollDonationsVert.Height := ClientHeight - pnlTop.Height -
    rectCopyright.Height - pnlDonationQuery.Height - flowDonationsHead.Height;
  flowDonations.Width := scrollDonationsVert.Width;
  flowDonationsHead.Width := ClientWidth;
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

procedure TForm1.LoadDonations;
var
  I: Integer;
  grey:boolean;
begin
  grey:=True;
  for I := 1 to 100 do
  begin
    arrDonationPanel[I] := TDonationPanel.Create(Self, flowDonations);
    if grey=True then
    begin
      arrDonationPanel[I].setColor(stringtoalphacolor('#FFf9f9f9'));
      grey:=False;
      end
    else
    begin
      arrDonationPanel[I].setColor(stringtoalphacolor('#FFffffff'));
      grey:=True;
    end;
  end;
  DonationsFlowResize;
end;

procedure TForm1.MultiView1MouseLeave(Sender: TObject);
begin
  MultiView1.HideMaster;
end;

procedure TForm1.TabControl1Change(Sender: TObject);
var
  I: Integer;
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

procedure TForm1.DonationsFlowResize;
var
  childrenRect: TRectF;
  I: Integer;
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

end.

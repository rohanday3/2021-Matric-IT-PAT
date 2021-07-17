unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.MultiView, FMX.Objects, FMX.Layouts,
  uNaviPanel, FMX.StdCtrls, FMX.TabControl, uDashPanel;

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
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    TabItem5: TTabItem;
    Button2: TButton;
    FlowLayout2: TFlowLayout;
    Label3: TLabel;
    rectNotifications: TRectangle;
    Rectangle2: TRectangle;
    lblTab: TLabel;
    rectCopyright: TRectangle;
    lblCopyright: TLabel;
    flowHome: TFlowLayout;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure MultiView1MouseLeave(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure imgNaviBarMouseEnter(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    arrNavipanel: array [1 .. 8] of TNaviPanel;
    arrDashpanel: array [1..4] of TDashPanel;
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
  arrNavipanel[1].SetLabel('Home');
  arrNavipanel[2].SetLabel('Inventory');
  arrNavipanel[3].SetLabel('Report');
  arrNavipanel[4].SetLabel('Backup');
  arrNavipanel[5].SetLabel('Settings');
  arrNavipanel[6].SetLabel('Help');
  arrNavipanel[1].SetImage
    ('C:\Users\DELL\Documents\IT PAT 2021\Assets\Icons\Home\black-48dp\2x\outline_home_white_48dp.png');
  arrNavipanel[2].SetImage
    ('C:\Users\DELL\Documents\IT PAT 2021\Assets\Icons\Inventory\black-48dp\2x\outline_inventory_2_white_48dp.png');
  arrNavipanel[3].SetImage
    ('C:\Users\DELL\Documents\IT PAT 2021\Assets\Icons\Report\black-48dp\2x\outline_summarize_white_48dp.png');
  arrNavipanel[4].SetImage
    ('C:\Users\DELL\Documents\IT PAT 2021\Assets\Icons\Backup\black-48dp\2x\outline_backup_white_48dp.png');
  arrNavipanel[5].SetImage
    ('C:\Users\DELL\Documents\IT PAT 2021\Assets\Icons\Settings\black-48dp\2x\outline_settings_white_48dp.png');
  arrNavipanel[6].SetImage
    ('C:\Users\DELL\Documents\IT PAT 2021\Assets\Icons\Help\black-48dp\2x\outline_help_outline_white_48dp.png');
  loading_status := 'Loading top panel...';
  lblTab.Text := arrNavipanel[TabControl1.TabIndex + 1].GetLabel;
  loading_status:='Loading botom panel...';
  lblCopyright.Text:='Copyright � ' + FormatDateTime('yyyy', Now)+'. All rights reserved.';
  loading_status:='loading home panel...';
  for I := 1 to 4 do
  begin
    arrDashpanel[I]:=TDashPanel.Create(Self, flowHome);
  end;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
pnlTop.Width:=ClientWidth-MultiView1.Width;
TabControl1.Width:=ClientWidth-MultiView1.Width;
TabControl1.Height:=ClientHeight-pnlTop.Height-rectCopyright.Height;
rectCopyright.Width:=ClientWidth-MultiView1.Width;
flowHome.Width:=ClientWidth;
flowHome.Height:=ClientHeight;
end;

procedure TForm1.imgNaviBarMouseEnter(Sender: TObject);
begin
  if MultiView1.Width = MultiView1.NavigationPaneOptions.CollapsedWidth then
    MultiView1.ShowMaster;
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
  // MultiView1.HideMaster;
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

end.
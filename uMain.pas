unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.MultiView, FMX.Objects, FMX.Layouts,
  uNaviPanel, FMX.StdCtrls, FMX.TabControl;

type
  TForm1 = class(TForm)
    MultiView1: TMultiView;
    StyleBook1: TStyleBook;
    Image1: TImage;
    FlowLayout1: TFlowLayout;
    Panel1: TPanel;
    Image2: TImage;
    Label1: TLabel;
    Timer1: TTimer;
    Label2: TLabel;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    TabItem5: TTabItem;
    Button2: TButton;
    Panel2: TPanel;
    FlowLayout2: TFlowLayout;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Image1MouseEnter(Sender: TObject);
    procedure MultiView1MouseLeave(Sender: TObject);
  private
    { Private declarations }
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
  arrNavipanel: array [1 .. 8] of TNaviPanel;
  I: Integer;
begin
  loading_status := 'Starting application...';
  loading_status := 'Loading navigation panel...';
  for I := 1 to 8 do
  begin
    arrNavipanel[I] := TNaviPanel.Create(Self, FlowLayout1);
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

end;

procedure TForm1.Image1MouseEnter(Sender: TObject);
begin
  if MultiView1.Width = MultiView1.NavigationPaneOptions.CollapsedWidth then
    MultiView1.ShowMaster;
end;

procedure TForm1.MultiView1MouseLeave(Sender: TObject);
begin
  MultiView1.HideMaster;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  today: TDateTime;
begin
  today := Now;
  Label1.Text := FormatDateTime('dddddd tt', today);
end;

end.

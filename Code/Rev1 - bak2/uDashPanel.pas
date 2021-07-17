unit uDashPanel;

interface

uses
  FMX.StdCtrls, FMX.Objects, FMX.Controls, FMX.Layouts, FMX.Types, UIConsts,
  UITypes, FMX.TabControl;

Type
  TDashPanel = Class(TPanel)
  public
    { public fields }
    constructor Create(AOwner, AParent: TFmxObject);
    procedure SetLabel(caption: string);
    function GetLabel: string;
    procedure SetImage(image: string);
    procedure resetColor;
  protected
    { protected fields }
    { protected methods }
  private
    { private fields }
    olabel: TLabel;
    oimage: TImage;
    opanel: TRectangle;
    tabcontrolindex: integer;
    TabControl: TTabControl;
    selected: boolean;
    { private methods }
    procedure onMouseEnter(Sender: TObject);
    procedure onMouseLeave(Sender: TObject);
    procedure onPanelClick(Sender: TObject);
  end;

implementation

{ TDashPanel }

constructor TDashPanel.Create(AOwner, AParent: TFmxObject);
begin
opanel:=TRectangle.Create(AOwner);
opanel.Parent:=AParent;
opanel.Width:=300;
opanel.Height:=150;
opanel.Margins.Top:=10;
opanel.Margins.Left:=10;
opanel.margins.Right:=10;
opanel.Margins.Bottom:=10;
end;

function TDashPanel.GetLabel: string;
begin

end;

procedure TDashPanel.onMouseEnter(Sender: TObject);
begin

end;

procedure TDashPanel.onMouseLeave(Sender: TObject);
begin

end;

procedure TDashPanel.onPanelClick(Sender: TObject);
begin

end;

procedure TDashPanel.resetColor;
begin

end;

procedure TDashPanel.SetImage(image: string);
begin

end;

procedure TDashPanel.SetLabel(caption: string);
begin

end;

end.
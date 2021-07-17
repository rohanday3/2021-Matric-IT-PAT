unit uDonationPanel;

interface

uses
  FMX.StdCtrls, FMX.Objects, FMX.Controls, FMX.Layouts, FMX.Types, UIConsts,
  UITypes, FMX.TabControl, FMX.Forms;

Type
  TDonationPanel = Class(TPanel)
  public
    { public fields }
    constructor Create(AOwner, AParent: TFmxObject);
    procedure SetLabel1(caption: string);
    procedure SetLabel2(caption: string);
    function GetLabel1: string;
    procedure SetImage(image: string);
    procedure resetColor;
    procedure setColor(Color: TAlphaColor);
    procedure resize;
  protected
    { protected fields }
    { protected methods }
  private
    { private fields }
    olabelName: TLabel;
    olabelTime: TLabel;
    olabelDesc:TLabel;
    olabelQuantity:TLabel;
    oimage: TImage;
    opanel: TRectangle;
    opanelTime: TRectangle;
    opanelName:TRectangle;
    opanelDesc:TRectangle;
    opanelQuantity: TRectangle;
    tabcontrolindex: integer;
    TabControl: TTabControl;
    selected: boolean;
    { private methods }
    procedure onMouseEnter(Sender: TObject);
    procedure onMouseLeave(Sender: TObject);
    procedure onPanelClick(Sender: TObject);
  end;

implementation

{ TDonationPanel }

constructor TDonationPanel.Create(AOwner, AParent: TFmxObject);
begin
  opanel := TRectangle.Create(AOwner);
  opanel.Parent := AParent;
  opanel.Width := TFlowLayout(AParent).Width; // TForm(AOwner).ClientWidth;
  opanel.Height := 65;
  opanel.Margins.Top := 0;
  opanel.Margins.Left := 0;
  opanel.Margins.Right := 0;
  opanel.Margins.Bottom := 0;
  opanel.Stroke.Thickness := 0.8;
  opanel.Stroke.Color:=StringToAlphaColor('#FFf4f4f4');

  opanelTime := TRectangle.Create(AOwner);
  opanelTime.Parent := opanel;
  opanelTime.Width := 145; // TForm(AOwner).ClientWidth;
  opanelTime.Height := 65;
  opanelTime.Margins.Top := 0;
  opanelTime.Margins.Left := 0;
  opanelTime.Margins.Right := 0;
  opanelTime.Margins.Bottom := 0;
  opanelTime.Stroke.Thickness := 0.8;
  opanelTime.Fill.Color:=StringToAlphaColor('#00ffffff');
  opanelTime.Stroke.Color:=StringToAlphaColor('#FFf4f4f4');

  opanelName := TRectangle.Create(AOwner);
  opanelName.Parent := opanel;
  opanelName.Width := 225; // TForm(AOwner).ClientWidth;
  opanelName.Height := 65;
  opanelName.Position.X:=opanelTime.Width;
  opanelName.Margins.Top := 0;
  opanelName.Margins.Left := 0;
  opanelName.Margins.Right := 0;
  opanelName.Margins.Bottom := 0;
  opanelName.Stroke.Thickness := 0.8;
  opanelName.Fill.Color:=StringToAlphaColor('#00ffffff');
  opanelName.Stroke.Color:=StringToAlphaColor('#FFf4f4f4');

  opanelDesc := TRectangle.Create(AOwner);
  opanelDesc.Parent := opanel;
  opanelDesc.Width := 400; // TForm(AOwner).ClientWidth;
  opanelDesc.Height := 65;
  opanelDesc.Position.X:=opanelTime.Width + opanelName.Width;
  opanelDesc.Margins.Top := 0;
  opanelDesc.Margins.Left := 0;
  opanelDesc.Margins.Right := 0;
  opanelDesc.Margins.Bottom := 0;
  opanelDesc.Stroke.Thickness := 0.8;
  opanelDesc.Fill.Color:=StringToAlphaColor('#00ffffff');
  opanelDesc.Stroke.Color:=StringToAlphaColor('#FFf4f4f4');

  opanelQuantity := TRectangle.Create(AOwner);
  opanelQuantity.Parent := opanel;
  opanelQuantity.Width := 225; // TForm(AOwner).ClientWidth;
  opanelQuantity.Height := 65;
  opanelQuantity.Position.X:=opanelTime.Width + opanelName.Width + opanelDesc.Width;
  opanelQuantity.Margins.Top := 0;
  opanelQuantity.Margins.Left := 0;
  opanelQuantity.Margins.Right := 0;
  opanelQuantity.Margins.Bottom := 0;
  opanelQuantity.Stroke.Thickness := 0.8;
  opanelQuantity.Fill.Color:=StringToAlphaColor('#00ffffff');
  opanelQuantity.Stroke.Color:=StringToAlphaColor('#FFf4f4f4');

  olabelTime := TLabel.Create(AOwner);
  olabelTime.Text := '2020-07-09 21:41:31';
  olabelTime.Parent := opanelTime;
  olabelTime.Width:=140;
  olabelTime.Position.X := 10;
  olabelTime.Position.Y := 15;
  olabelTime.StyledSettings := [];
  olabelTime.FontColor := StringToAlphaColor('#FF008800');
  olabelTime.Font.Size := 14;

  olabelName := TLabel.Create(AOwner);
  olabelName.Text := 'Baby powder';
  olabelName.Parent := opanelName;
  olabelName.Width:=200;
  olabelName.Position.X := 10;
  olabelName.Position.Y := 15;
  olabelName.StyledSettings := [];
  olabelName.FontColor := StringToAlphaColor('#FF008800');
  olabelName.Font.Size := 14;

  olabelDesc := TLabel.Create(AOwner);
  olabelDesc.Text := 'Johnson' + '''' + 's Baby Powder 400g';
  olabelDesc.Parent := opanelDesc;
  olabelDesc.Width:=200;
  olabelDesc.Position.X := 10;
  olabelDesc.Position.Y := 15;
  olabelDesc.StyledSettings := [];
  olabelDesc.FontColor := StringToAlphaColor('#FF008800');
  olabelDesc.Font.Size := 14;

  olabelQuantity := TLabel.Create(AOwner);
  olabelQuantity.Text := '10';
  olabelQuantity.Parent := opanelQuantity;
  olabelQuantity.Width:=200;
  olabelQuantity.Position.X := 10;
  olabelQuantity.Position.Y := 15;
  olabelQuantity.StyledSettings := [];
  olabelQuantity.FontColor := StringToAlphaColor('#FF008800');
  olabelQuantity.Font.Size := 14;

end;

function TDonationPanel.GetLabel1: string;
begin

end;

procedure TDonationPanel.onMouseEnter(Sender: TObject);
begin

end;

procedure TDonationPanel.onMouseLeave(Sender: TObject);
begin

end;

procedure TDonationPanel.onPanelClick(Sender: TObject);
begin

end;

procedure TDonationPanel.resetColor;
begin

end;

procedure TDonationPanel.resize;
begin
  opanel.Width := TFlowLayout(opanel.Parent).Width;
end;

procedure TDonationPanel.setColor(Color: TAlphaColor);
begin
  opanel.Fill.Color := Color;
end;

procedure TDonationPanel.SetImage(image: string);
begin

end;

procedure TDonationPanel.SetLabel1(caption: string);
begin

end;

procedure TDonationPanel.SetLabel2(caption: string);
begin

end;

end.

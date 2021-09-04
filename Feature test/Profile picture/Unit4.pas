unit Unit4;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm4 = class(TForm)
    rectCreateAccountPicture: TRectangle;
    lblCreateAccountPictureSubtitle: TLabel;
    lblCreateAccountPictureTitle: TLabel;
    Circle1: TCircle;
    rectlblCreateAccountPictureRemove: TRectangle;
    lblCreateAccountPictureRemove: TLabel;
    rectlblCreateAccountPictureUpload: TRectangle;
    lblCreateAccountPictureUpload: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure Circle1Click(Sender: TObject);
    procedure rectlblCreateAccountPictureRemoveClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}

procedure TForm4.Button1Click(Sender: TObject);
begin
  ShowMessage(BoolToStr(Circle1.Fill.Kind = TBrushKind.Bitmap));
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
  Circle1.Fill.Kind := TBrushKind.Bitmap;
  // Circle1.Fill.Bitmap.Bitmap.LoadFromFile(FileName);
end;

procedure TForm4.Circle1Click(Sender: TObject);
begin
  with TOpenDialog.Create(nil) do
  begin
    Filter := 'Image Files|*.bmp;*.gif;*.jpeg;*.jpg;*.ico;*.png;*.tiff|All Files|*.*';
    if Execute then
    begin
      Circle1.Fill.Kind := TBrushKind.Bitmap;
      Circle1.Fill.Bitmap.Bitmap.LoadFromFile(FileName);
      Circle1.Fill.Bitmap.WrapMode:=TWrapMode.TileStretch;
      rectlblCreateAccountPictureUpload.Position.X := 126;
      rectlblCreateAccountPictureRemove.Position.X := 227;
      lblCreateAccountPictureRemove.Visible := True;
    end;
  end;
end;

procedure TForm4.rectlblCreateAccountPictureRemoveClick(Sender: TObject);
begin
  rectlblCreateAccountPictureUpload.Position.X := 176;
  lblCreateAccountPictureRemove.Visible := False;
  Circle1.Fill.Kind := TBrushKind.Solid;
end;

end.

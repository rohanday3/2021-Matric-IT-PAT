unit Unit4;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Ani,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm4 = class(TForm)
    Button1: TButton;
    Rectangle1: TRectangle;
    Image1: TImage;
    Opacity: TFloatAnimation;
    Height: TFloatAnimation;
    FloatAnimation1: TFloatAnimation;
    Width: TFloatAnimation;
    procedure Button1Click(Sender: TObject);
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
Height.Start;
Opacity.Start;
end;

end.

unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, System.ImageList, FMX.ImgList,
  FMX.Objects;

type
  TForm1 = class(TForm)
    lblHeader: TLabel;
    lblLength: TLabel;
    lblNumber: TLabel;
    lblUpp: TLabel;
    lblLow: TLabel;
    lblSpecial: TLabel;
    imgLen: TImage;
    imgNum: TImage;
    imgUp: TImage;
    imgLow: TImage;
    imgSpecial: TImage;
    ImageList1: TImageList;
    Rectangle1: TRectangle;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

end.

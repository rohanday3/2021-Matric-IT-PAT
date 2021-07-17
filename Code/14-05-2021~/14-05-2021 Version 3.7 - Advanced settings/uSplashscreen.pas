unit uSplashscreen;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  uDonationsThread, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects;

type
  TSplashscreen = class(TForm)
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    procedure onDonationsLoaded(Sender: TObject);
  public
    { Public declarations }
    class function Execute: boolean;
  end;

var
  Splashscreen: TSplashscreen;
  donation_thread: TLoadDonations;

implementation

{$R *.fmx}

procedure TSplashscreen.FormCreate(Sender: TObject);
begin
  donation_thread := TLoadDonations.Create();
  donation_thread.OnTerminate := onDonationsLoaded;
end;

procedure TSplashscreen.onDonationsLoaded(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TSplashscreen.Timer1Timer(Sender: TObject);
begin
  ProgressBar1.Value := ProgressBar1.Value + 1;
  if ProgressBar1.Value=ProgressBar1.Max then
    Timer1.Enabled:=False;
end;

class function TSplashscreen.Execute: boolean;
begin
  with TSplashscreen.Create(nil) do
    try
      Result := ShowModal = mrOk;
    finally
      Free;
      donation_thread.Free;
    end;
end;

end.
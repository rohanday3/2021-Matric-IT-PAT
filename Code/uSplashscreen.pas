{ ******************************************************************************
  ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤIT MATRIC PAT 2021 - Robin Hood
  ㅤㅤㅤㅤㅤCopyright (C) 2021 by Rohan Dayaram <rohanday4@gmail.com>
  ㅤㅤㅤㅤㅤㅤㅤhttps://github.com/rohanday3/2021-Matric-IT-PAT
  ******************************************************************************
  Robin Hood is a multi-purpose company management system for the financial and
  inventory systems etc of the Robin Hood© foundation which is for the purposes
  of my matric pat, an NGO dedicated to feeding homeless children under the ages
  of 3.  The  company needed a system to manage their inventory,  payments  and
  other systems which would otherwise be managed by staff and recorded on paper.
  The design is a modern one with a  dashboard and a multiview drawer  which is
  used to navigate the other tabs.  Many additional "nice to have" features are
  included as well which are docuemented in the help tab as well as the feature
  docuement included in the same folder as the project and can also be found on
  my github page stated above.
  ****************************************************************************** }

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
  if ProgressBar1.Value = ProgressBar1.Max then
    Timer1.Enabled := False;
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

unit uRDCollapsibleLayout;

interface

uses
  System.SysUtils, System.Classes;

type
  TRDCollapsibleLayout = class(TComponent)
  private
    { Private declarations }
    fNumberOfPanels: Integer;
    procedure SetNumberOfPanels(const Value: Integer);
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  published
    { Published declarations }
    property NumberOfPanels: Integer read fNumberOfPanels
      write SetNumberOfPanels;

  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Layouts', [TRDCollapsibleLayout]);
end;

{ TRDCollapsibleLayout }

constructor TRDCollapsibleLayout.Create(AOwner: TComponent);
begin
  inherited;

end;

procedure TRDCollapsibleLayout.SetNumberOfPanels(const Value: Integer);
begin
  if (fNumberOfPanels <> Value) then
  begin
    fNumberOfPanels := Value;
  end;
end;

end.

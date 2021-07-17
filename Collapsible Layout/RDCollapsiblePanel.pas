unit RDCollapsiblePanel;

interface

uses
  System.SysUtils, System.Classes, FMX.Types, FMX.Controls, FMX.Objects;

type
  TRDCollapsiblePanel = class(TRectangle)
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
  published
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TRDCollapsiblePanel]);
end;

end.

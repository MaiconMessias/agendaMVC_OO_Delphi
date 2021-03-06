unit UntTelefoneTipo;

interface

uses
  UntITelefoneTipo;

type
  TTelefoneTipo = class(TInterfacedObject, ITelefoneTipo)
    FId: integer;
    FTipo: string;
    // setters
    procedure Tipo(Value: string);
    // getters
    function getTipo(): string;
    function getId(): integer;
  end;

implementation

{ TTelefoneTipo }

function TTelefoneTipo.getId: integer;
begin
  result := FId;
end;

function TTelefoneTipo.getTipo: string;
begin
  result := FTipo;
end;

procedure TTelefoneTipo.Tipo(Value: string);
begin
  FTipo := Value;
end;

end.

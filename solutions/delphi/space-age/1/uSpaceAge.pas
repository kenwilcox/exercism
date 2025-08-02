unit uSpaceAge;

interface

type
  ISpaceAge = interface ['{648B61D9-B783-41DD-9DC0-05527509252D}']
    function OnMercury: double;
    function OnVenus: double;
    function OnEarth: double;
    function OnMars: double;
    function OnJupiter: double;
    function OnSaturn: double;
    function OnUranus: double;
    function OnNeptune: double;
  end;

type
  NewSpaceAge = class(TInterfacedObject, ISpaceAge)
  private
    seconds: double;
  public
    constructor Create(value: double);
    function OnMercury: double;
    function OnVenus: double;
    function OnEarth: double;
    function OnMars: double;
    function OnJupiter: double;
    function OnSaturn: double;
    function OnUranus: double;
    function OnNeptune: double;
  end;

implementation

{ NewSpaceAge }

constructor NewSpaceAge.Create(value: double);
begin
  seconds := value;
end;

function NewSpaceAge.OnMercury: double;
begin
  Result := OnEarth / 0.2408467;
end;

function NewSpaceAge.OnVenus: double;
begin
  Result := OnEarth /  0.61519726;
end;

function NewSpaceAge.OnEarth: double;
begin
  Result := seconds / 31557600.0;
end;

function NewSpaceAge.OnMars: double;
begin
  Result := OnEarth / 1.8808158;
end;

function NewSpaceAge.OnJupiter: double;
begin
  Result := OnEarth / 11.862615;
end;

function NewSpaceAge.OnSaturn: double;
begin
  Result := OnEarth / 29.447498;
end;

function NewSpaceAge.OnUranus: double;
begin
  Result := OnEarth / 84.016846;
end;

function NewSpaceAge.OnNeptune: double;
begin
  Result := OnEarth / 164.79132;
end;

end.

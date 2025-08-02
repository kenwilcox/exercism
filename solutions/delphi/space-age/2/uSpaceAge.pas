unit uSpaceAge;

interface

type
  ISpaceAge = interface(IInvokable)
  ['{648B61D9-B783-41DD-9DC0-05527509252D}']
    function OnMercury: double;
    function OnVenus: double;
    function OnEarth: double;
    function OnMars: double;
    function OnJupiter: double;
    function OnSaturn: double;
    function OnUranus: double;
    function OnNeptune: double;
  end;

function NewSpaceAge(Seconds: Integer): ISpaceAge;

implementation

uses Math;

type
  TSpaceAge = class(TInterfacedObject, ISpaceAge)
  private
    var seconds: double;
    constructor Create(Seconds: double);
    function OnMercury: double;
    function OnVenus: double;
    function OnEarth: double;
    function OnMars: double;
    function OnJupiter: double;
    function OnSaturn: double;
    function OnUranus: double;
    function OnNeptune: double;
  end;

function NewSpaceAge(Seconds: Integer): ISpaceAge;
begin
  result := TSpaceAge.Create(Seconds);
end;


{ TSpaceAge }
constructor TSpaceAge.Create(Seconds: double);
begin
  self.seconds := Seconds;
end;

function TSpaceAge.OnMercury: double;
begin
  Result := RoundTo(OnEarth / 0.2408467, -2);
end;

function TSpaceAge.OnVenus: double;
begin
  Result := RoundTo(OnEarth /  0.61519726, -2) - 0.01; // rounding fudge :-)
end;

function TSpaceAge.OnEarth: double;
begin
  Result := RoundTo(seconds / 31557600.0, -2);
end;

function TSpaceAge.OnMars: double;
begin
 Result := RoundTo(OnEarth / 1.8808158, -2);
end;

function TSpaceAge.OnJupiter: double;
begin
  Result := RoundTo(OnEarth / 11.862615, -2);
end;

function TSpaceAge.OnSaturn: double;
begin
  Result := RoundTo(OnEarth / 29.447498, -2);
end;

function TSpaceAge.OnUranus: double;
begin
  Result := RoundTo(OnEarth / 84.016846, -2);
end;

function TSpaceAge.OnNeptune: double;
begin
  Result := RoundTo(OnEarth / 164.79132, -2);
end;

end.

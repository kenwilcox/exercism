unit uHighScores;

interface

uses System.Generics.Collections;

  type
    IScores = interface(IInvokable)
    ['{488DA0B1-9914-46E5-8650-AD945B7A1A4E}']
    function Highest: Integer;
    function Latest: Integer;
    function Scores: TList<Integer>;
    function PersonalTopThree: TList<Integer>;
    function Report: String;
    end;

  function NewScores(Scores: array of Integer): IScores;

implementation
uses SysUtils, DateUtils;

type
  TScores = class(TInterfacedObject, IScores)
  private
    var values: TList<Integer>;
    constructor Create(items: array of Integer);
    function Highest: Integer;
    function Latest: Integer;
    function Scores: TList<Integer>;
    function PersonalTopThree: TList<Integer>;
    function Report: String;
  end;

function NewScores(Scores: array of Integer): IScores;
begin
  Result := TScores.Create(Scores);
end;

{ TScore }

constructor TScores.Create(items: array of Integer);
begin
  values := TList<Integer>.Create;
  values.AddRange(items);
end;

function TScores.Highest: Integer;
var
  ret: TList<Integer>;
begin
  ret := TList<Integer>.Create(self.values);
  ret.Sort;
  ret.Reverse;
  Result := ret[0];
end;

function TScores.Latest: Integer;
begin
  Result := self.values[pred(self.values.Count)];
end;

function TScores.PersonalTopThree: TList<Integer>;
var
  ret: TList<Integer>;
  min: Integer;
  i: Integer;
begin
  ret := TList<Integer>.Create(self.values);
  ret.Sort;
  ret.Reverse;

  min := 3;
  if ret.Count < min then min := ret.Count;

  for i := pred(ret.Count) downto min do
    ret.Delete(i);

  Result := ret;
end;

function TScores.Report: String;
var
  last: Integer;
  max: Integer;
  diff: Integer;
begin
  last := self.values[pred(self.values.Count)];
  max := Highest;
  diff := max - last;

  Result := 'Your latest score was ' + IntToStr(last);

  if diff = 0 then
    Result := Result + '. That''s your personal best!'
  else
    Result := Result +  '. That''s ' + IntToStr(diff)
      +  ' short of your personal best!'

end;

function TScores.Scores: TList<Integer>;
begin
  Result := values;
end;

end.


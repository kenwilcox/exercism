unit uResistorColor;

interface

  type
    TResistor = class
      public
      class function colorCode(color: String): Integer;
      class function colors: TArray<string>;
    end;
implementation
uses SysUtils, Classes;

var
 lookup: TStringList;

  class function TResistor.colorCode(color: String): Integer;
  begin
    Result := StrToInt(lookup.Values[color]);
  end;

  class function TResistor.colors:TArray<string>;
  var
    i: Integer;
  begin
    SetLength(Result, lookup.Count);
    for i := 0 to lookup.Count-1 do
    begin
      Result[i] := lookup.Names[i];
    end;
  end;

  initialization
    lookup := TStringList.Create();
    lookup.CommaText := 'black=0, brown=1, red=2,orange=3,yellow=4, green=5, blue=6, violet=7, grey=8, white=9';
  finalization
    lookup.Free;
end.


unit uResistorColor;

interface
  type
    TResistorColors = TArray<string>;

  type
    TResistor = class
      private
        const ColorsValues: TResistorColors = ['black', 'brown', 'red',
          'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white'];
      public
      class function colorCode(color: String): Integer;
      class function colors: TArray<string>;
    end;
implementation
uses Generics.Collections;

  class function TResistor.colorCode(color: String): Integer;
  begin
    var ColorList := TList<string>.Create;
    ColorList.AddRange(ColorsValues);
    Result := ColorList.IndexOf(color);
  end;

  class function TResistor.colors:TArray<string>;
  begin
    Result := ColorsValues;
  end;

end.


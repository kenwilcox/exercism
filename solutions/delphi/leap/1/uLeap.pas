unit uLeap;

interface

  type
    TYear = class
      public
      class function IsLeap(year: Integer): Boolean;
    end;
implementation

  class function TYear.IsLeap(year: Integer): Boolean;
  begin
    Result := (year mod 4 = 0) and ((year mod 100 <> 0) or (year mod 400 = 0));
  end;
end.


unit uGigasecond;

interface

  type
    TGigasecond = class
      public
      class function Add(dateStr: String): String;
    end;
implementation
uses SysUtils, DateUtils;

  class function TGigasecond.Add(dateStr: String): String;
  var
    date: TDateTime;
  begin
    date := ISO8601ToDate(dateStr);
    date := IncSecond(date, 1000000000);
    Result := DateToISO8601(date).Remove(19);
  end;
end.


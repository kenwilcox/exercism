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
    settings: TFormatSettings;
  begin
    settings := TFormatSettings.Create();
    settings.ShortDateFormat := 'yyyy-mm-dd';
    settings.DateSeparator := '-';
    date := StrToDate(dateStr, settings);
    date := IncSecond(date, 1000000000);
    Result := FormatDateTime('yyyy-mm-dd', date) + 'T' + FormatDateTime('hh:nn:ss', date);
  end;
end.


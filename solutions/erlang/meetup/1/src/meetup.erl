-module(meetup).

-export([meetup/4]).


meetup(_Year, _Month, _DayOfWeek, _Week) ->
    meetup(days_in_month(_Year, _Month, _DayOfWeek), _Week).

meetup(Days, first)  -> hd(Days);
meetup(Days, second) -> lists:nth(2, Days);
meetup(Days, third)  -> lists:nth(3, Days);
meetup(Days, fourth) -> lists:nth(4, Days);
meetup(Days, fifth)  -> lists:nth(5, Days);
meetup(Days, last)   -> lists:last(Days);
meetup(Days, teenth) -> hd(lists:filter(fun({_Y,_M,D}) -> D >= 13 end, Days)).

days_in_month(Y, M, monday)    -> days_in_month(Y, M, 1);
days_in_month(Y, M, tuesday)   -> days_in_month(Y, M, 2);
days_in_month(Y, M, wednesday) -> days_in_month(Y, M, 3);
days_in_month(Y, M, thursday)  -> days_in_month(Y, M, 4);
days_in_month(Y, M, friday)    -> days_in_month(Y, M, 5);
days_in_month(Y, M, saturday)  -> days_in_month(Y, M, 6);
days_in_month(Y, M, sunday)    -> days_in_month(Y, M, 7);
days_in_month(Year, Month, DayOfWeek) ->
  lists:filter(fun({Y, M, D}) -> calendar:day_of_the_week(Y, M, D) == DayOfWeek end, dates_in_month(Year, Month)).

dates_in_month(Y, M) -> [{Y, M, D} || D <- lists:seq(1, 31), calendar:valid_date(Y, M, D)].
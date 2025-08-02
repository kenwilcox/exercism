-module(all_your_base).

-export([rebase/3]).

rebase(_, InputBase, _) when InputBase < 2 -> {error, "input base must be >= 2"};
rebase(_, _, OutputBase) when OutputBase < 2 -> {error, "output base must be >= 2"};
rebase(Digits, InputBase, OutputBase) -> 
    case lists:all(fun (X) -> 0 =< X andalso X < InputBase end, Digits) of
        true ->
            Value = lists:foldl(fun (X, Acc) -> X + Acc * InputBase end, 0, Digits),
            {ok, to_base(Value, OutputBase, [])};
        false ->
            {error, "all digits must satisfy 0 <= d < input base"}
    end.
to_base(0, _, []) -> [0];
to_base(0, _, Acc) -> Acc;
to_base(Value, Base, Acc) -> to_base(Value div Base, Base, [Value rem Base | Acc]).

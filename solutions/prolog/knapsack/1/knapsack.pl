maximum_value([], _, 0).
maximum_value(Items, Capacity, Value):-
    maximum_value(Items, Capacity, 0, Value).
maximum_value([], _, Value, Value):-
    Value > 0.
maximum_value([item(W,V)|Items], Capacity, Acc, Value):-
    Capacity >= W,
    NewCapacity is Capacity - W,
    Acc1 is V + Acc,
    maximum_value(Items, NewCapacity, Acc1, Value).
maximum_value([_|Items], Capacity, Acc, Value):-
    maximum_value(Items, Capacity, Acc, Value).

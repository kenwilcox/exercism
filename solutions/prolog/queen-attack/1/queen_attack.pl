create((DimX, DimY)) :-
    between(0, 7, DimX),
    between(0, 7, DimY).

attack((FromX, FromY), (ToX, ToY)) :-
    (FromX =:= ToX, !);
    (FromY =:= ToY, !);
    abs(FromX - ToX) =:= abs(FromY - ToY).

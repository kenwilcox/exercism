sums([_], []).
sums([X,Y|T], [X1|T1]) :- X1 is X + Y, sums([Y|T], T1).

pascal(0, []) :- !.
pascal(1, [[1]]) :- !.
pascal(N, P) :- N1 is N - 1,  pascal(N1, P1), last(P1, Row), sums(Row, Sums), append([1|Sums], [1], Row1), append(P1, [Row1], P),!.
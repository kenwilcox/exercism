valid(A, B, C) :- A+B>C,A+C>B,B+C>A,A>0,B>0,C>0.

triangle(Side1, Side1, Side1, "equilateral") :- valid(Side1, Side1, Side1), !.
triangle(Side1, Side1, Side2, "isosceles") :- valid(Side1, Side1, Side2),!.
triangle(Side1, Side2, Side1, "isosceles") :- valid(Side1, Side1, Side2),!.
triangle(Side2, Side1, Side1, "isosceles") :- valid(Side1, Side1, Side2),!.
triangle(Side1, Side2, Side3, "scalene") :- valid(Side1, Side2, Side3), \+ triangle(Side1, Side2, Side3, "isosceles").
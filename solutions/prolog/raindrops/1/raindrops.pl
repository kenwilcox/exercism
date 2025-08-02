convert(N, Sounds) :-
    (0 is N mod 3 -> Pling = "Pling" ; Pling = ""),
    (0 is N mod 5 -> Plang = "Plang" ; Plang = ""),
    (0 is N mod 7 -> Plong = "Plong" ; Plong = ""),
    (Pling = Plang, Plang = Plong, Pling = ""
      -> number_string(N, Sounds)
      ; string_concat(Pling, Plang, Temp),
        string_concat(Temp, Plong, Sounds)
    ).

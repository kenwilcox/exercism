abbreviate(Sentence, Acronym) :-
    split_string(Sentence, " _-,.!?", " _-,.!?", Words),
    maplist(first_letter, Words, Letters),
    string_chars(Acronym, Letters).

first_letter(Word, Letter) :-
    sub_string(Word, 0, 1, _, First),
    upcase_atom(First, Letter).
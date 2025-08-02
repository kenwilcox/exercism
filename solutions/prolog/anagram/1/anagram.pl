anagram(Word, Candidates, Anagrams) :- include(anagram(Word), Candidates, Anagrams).

anagram(Word1, Word2) :-
  word(Word1, LWord1, Sorted),
  word(Word2, LWord2, Sorted),
  LWord1 \= LWord2.

word(Word, LWord, Sorted) :-
  string_lower(Word, LWord),
  string_codes(LWord, Codes),
  msort(Codes, Sorted).
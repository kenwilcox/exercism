rna_transcription(Rna, Dna) :-
  string_chars(Rna, Xs),
  maplist(dna_rna, Xs, Ys),
  string_chars(Dna, Ys).

dna_rna('G', 'C').
dna_rna('C', 'G').
dna_rna('T', 'A').
dna_rna('A', 'U').
-- Schema: CREATE TABLE "rna-transcription" ("dna" TEXT, "result" TEXT);
-- Task: update the rna-transcription table and set the result based on the dna field.

update 'rna-transcription'
set result = replace(replace(replace(replace(replace(dna, "A", "U"), "T", "A"), "C", "X"), "G", "C"), "X", "G")
;
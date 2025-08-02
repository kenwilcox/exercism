Red [
	description: {"Protein Translation" exercise solution for exercism platform}
	author: "Ken Wilcox"
]

proteins: function [
	strand
] [
	parse strand [collect any [
		"AUG" 									keep ("Methionine")
		| "UGG"									keep ("Tryptophan")
		| ["UUU" | "UUC"]						keep ("Phenylalanine")
		| ["UUA" | "UUG"]						keep ("Leucine")
		| ["UCU" | "UCC" | "UCA" | "UCG"]		keep ("Serine")
		| ["UAU" | "UAC"]						keep ("Tyrosine")
		| ["UGU" | "UGC"]						keep ("Cysteine")		
		| ["UAA" | "UAG" | "UGA"] thru end
    ]]
]


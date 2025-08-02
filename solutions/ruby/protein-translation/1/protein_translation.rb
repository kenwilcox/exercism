class Translation
  PROTEINS = { Methionine: ['AUG'], Phenylalanine: ['UUU', 'UUC'], Leucine: ['UUA', 'UUG'], Serine: %w(UCU UCC UCA UCG), Tyrosine: %w(UAU UAC), Cysteine: %w(UGU UGC), Tryptophan: %w(UGG), STOP: %w(UAA UAG UGA)}
  CODONS = PROTEINS.values
  MAP = PROTEINS.keys.map(&:to_s)

  def self.of_rna(strand)
    codes = strand.scan(/.../)
    raise InvalidCodonError if codes.any?{|c| !CODONS.flatten.include?(c)} ||strand.length%3 != 0 && !codes.any?{|c| PROTEINS[:STOP].include?(c)}
    answer = codes.map {|code| MAP[CODONS.index(CODONS.find{|c| c.find{|x| x == code}})]}
    answer.any?{|a| a == "STOP"} ? answer[0...answer.find_index("STOP")] : answer
  end
end

class InvalidCodonError < StandardError;end

class Hamming
  def self.compute(s1, s2)
    s1.size == s2.size ?
      s1.chars.zip(s2.chars).select { |x,y| x != y }.size
      : raise(ArgumentError)
  end
end

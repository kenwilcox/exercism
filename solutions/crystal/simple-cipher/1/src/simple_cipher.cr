class SimpleCipher
  getter key : String

  def initialize
    lowercase = [*'a'..'z']
    @key = (0..100).map {lowercase.sample}.join
  end

  def initialize(@key : String)
  end

  def encode(text : String)
    text.chars.map_with_index do |char, i|
      ((char.ord + key[i % key.size].ord - 2 * 'a'.ord) % 26 + 'a'.ord).chr
    end.join
  end

  def decode(text : String)
    text.chars.map_with_index do |char, i|
      ((char.ord - key[i % key.size].ord) % 26 + 'a'.ord).chr
    end.join
  end
end

class FoodChain
  VERSE = [
    { name: 'fly', phrase: "I don't know why she swallowed the fly. Perhaps she'll die." },
    { name: 'spider', phrase: 'It wriggled and jiggled and tickled inside her.', add: ' that wriggled and jiggled and tickled inside her'},
    { name: 'bird', phrase: 'How absurd to swallow a bird!' },
    { name: 'cat', phrase: 'Imagine that, to swallow a cat!' },
    { name: 'dog', phrase: 'What a hog, to swallow a dog!' },
    { name: 'goat', phrase: 'Just opened her throat and swallowed a goat!' },
    { name: 'cow', phrase: "I don't know how she swallowed a cow!" },
    { name: 'horse', phrase: "She's dead, of course!"}
  ]
  def self.song
    (0...VERSE.size).map { |n| verse(n, '') }.join("\n")
  end
  def self.verse(n, acc)
    acc << "I know an old lady who swallowed a %{name}.\n%{phrase}\n" % { name: VERSE[n][:name], phrase: VERSE[n][:phrase] } if acc == ''
    return acc if n == 0 || VERSE[n][:name] == 'horse'
    acc << "She swallowed the %{name} to catch the %{name_prev}%{add}.\n" % { name: VERSE[n][:name], name_prev: VERSE[n-1][:name], add: VERSE[n-1][:add] || '' }
    acc << (VERSE[n- 1][:phrase] + "\n") if n == 1
    verse(n - 1, acc)
  end
end

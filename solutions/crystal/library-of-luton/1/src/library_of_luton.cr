class Library
  def self.first_letter(title : String) : Char
    title[0]
  end

  def self.initials(first_name : String, last_name : String) : String
    "#{first_name[0]}.#{last_name[0]}"
  end

  def self.decrypt_character(character : Char) : Char
    return 'z' if character == 'a'
    return 'Z' if character == 'A'
    character.pred
  end

  def self.decrypt_text(text : String) : String
    text.chars.map { |c| c.ascii_letter? ? decrypt_character(c) : c }.join
  end
end

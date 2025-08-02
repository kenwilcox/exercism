class Bob
  def self.hey(remark)
    yelling = remark.upcase
    question = remark.strip[-1] == '?'
    alpha_count = remark.count("a-zA-Z")
    
    return "Sure." if question and (remark != yelling or alpha_count == 0)
    return "Calm down, I know what I'm doing!" if question and remark == yelling
    return "Whoa, chill out!" if remark == yelling and alpha_count > 0
    return "Fine. Be that way!" if remark.strip.empty?
    return "Whatever."
  end
end
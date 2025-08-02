class PasswordLock
  alias Password = (String | Int32 | Float64)
  def initialize(@password : Password)
  end

  def encrypted(password : Password)
    if password.is_a?(Int32)
      password // 2
    elsif password.is_a?(String)
      password.reverse
    else
      password * 4
    end
  end

  def encrypt
    @password = encrypted(@password)
  end

  def unlock?(password : Password)
    if encrypted(password) == @password && (!@password.is_a?(Int32) || password == 2 * @password.as(Int32))
      "Unlocked"
    else
      nil
    end
  end
end

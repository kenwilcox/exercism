class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  def self.calculate(first_operand, second_operand, operation)
    raise UnsupportedOperation unless ALLOWED_OPERATIONS.include?(operation)
    raise ArgumentError unless valid(first_operand) && valid(second_operand)

    result = answer(first_operand, second_operand, operation)
    "#{first_operand} #{operation} #{second_operand} = #{result}"
  rescue ZeroDivisionError
    'Division by zero is not allowed.'
  end

  def self.answer(first_operand, second_operand, operation)
    case operation
    when '+'
      first_operand + second_operand
    when '/'
      first_operand / second_operand
    when '*'
      first_operand * second_operand
    end
  end

  def self.valid(p)
    p.is_a? Integer
  end

  class UnsupportedOperation < StandardError
  end
end


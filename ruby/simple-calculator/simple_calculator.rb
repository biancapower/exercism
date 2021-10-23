class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

begin

  UnsupportedOperation = Class.new(StandardError)
  ZeroDivisionError = Class.new(StandardError)

  def self.calculate(first_operand, second_operand, operation)
    raise ArgumentError unless first_operand.is_a?(Numeric) && second_operand.is_a?(Numeric)
  
    case operation
    when '+'
      answer = first_operand + second_operand
    when '/'
      if second_operand ==  0
        # raise ZeroDivisionError.new("Division by zero is not allowed.")
        return "Division by zero is not allowed."
      end
      answer = first_operand / second_operand
    when '*'
      answer = first_operand * second_operand
    else
      raise UnsupportedOperation.new
    end

    "#{first_operand} #{operation} #{second_operand} = #{answer}"
  end

  rescue ZeroDivisionError => e
    e
  end
end

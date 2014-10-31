class RomanNumeral
  ROMAN_SYMBOLS = {
    I: 1,
    V: 5,
    X: 10,
    L: 50,
    C: 100,
    D: 500,
    M: 1000
  }

  def initialize(roman_str)
    @roman_str = roman_str
  end

  def value
    result, index = 0, 0

    while index < @roman_str.length
      current_symbol = @roman_str[index]
      multiplier = subtract?(current_symbol, @roman_str[index + 1]) ? -1 : 1
      result += (value_of current_symbol) * multiplier
      index += 1
    end

    result
  end

  private

  def subtract?(current_symbol, next_symbol)
    return false if next_symbol.nil?
    value_of(current_symbol) < value_of(next_symbol)
  end

  def value_of(roman_symbol)
    value = ROMAN_SYMBOLS[roman_symbol.to_sym]
    fail 'invalid roman symbol' if value.nil?
    value
  end
end

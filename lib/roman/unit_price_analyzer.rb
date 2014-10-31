require_relative 'roman_numeral'

class UnitPriceAnalyzer
  ANALYZER_REGREX = /^(?<quantity>[\w\s]+)\s(?<commodity>\w+)\sis\s(?<price>\d+)\sCredits$/

  def initialize(mapper)
    @galaxy_number_mapper = mapper
  end

  def analyze_unit_price(sentence)
    quantity, commodity, price = parse sentence
    { commodity => price.to_f / quantity }
  end

  def parse(sentence)
    quantity_str, commodity, price = parse_sentense sentence
    quantity = parse_quantity quantity_str
    [quantity, commodity, price.to_i]
  end

  def parse_quantity(quantity_str)
    roman_number = quantity_str.split(' ').map do |word|
      @galaxy_number_mapper[word.to_sym]
    end.join
    RomanNumeral.new(roman_number).value
  end

  def parse_sentense(str)
    result = ANALYZER_REGREX.match str
    [result[:quantity], result[:commodity], result[:price]]
  end
end

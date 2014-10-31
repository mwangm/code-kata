class CommodityPriceCalculator
  REGEX = /^how many Credits is (?<quantity>[\w\s]+)\s(?<commodity>\w+)\s+\?$/

  def initialize(number_mapper, commodity_price)
    @galaxy_number_mapper = number_mapper
    @commodity_price = commodity_price
  end

  def exec(str)
    quantity_str, commodity = parse str
    quantity = parse_quantity quantity_str
    price = quantity * @commodity_price[commodity.to_sym]
    "#{quantity_str} #{commodity} is #{price} Credits"
  end

  def parse(str)
    result = str.match REGEX
    p str
    [result[:quantity], result[:commodity]]
  end

  def parse_quantity(quantity_str)
    roman_number = quantity_str.split(' ').map do |word|
      @galaxy_number_mapper[word.to_sym]
    end.join
    RomanNumeral.new(roman_number).value
  end
end

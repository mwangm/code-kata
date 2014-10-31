class GalaxyNumberParser
  NUMBER_MAP_REGEX = /^(?<word>[\w\s]+)\sis\s(?<roman_number>\w+)$/

  def self.parse(str)
    result = str.match NUMBER_MAP_REGEX
    { result[:word] => result[:roman_number] }
  end
end

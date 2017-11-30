#!/usr/bin/env ruby

class NumberToWords
  UNITS = [
    'one',
    'two',
    'three',
    'four',
    'five',
    'six',
    'seven',
    'eight',
    'nine',
    'ten',
    'eleven',
    'twelve',
    'thirteen',
    'fourteen',
    'fifteen',
    'sixteen',
    'seventeen',
    'eighteen',
    'nineteen'
  ]

  TENS = [
    "ten",
    "twenty",
    "thirty",
    "forty",
    "fifty",
    "sixty",
    "seventy",
    "eighty",
    "ninety"
  ]

  def parts(number)
    number.to_s.chars.map(&:to_i)
  end

  def tens(number)
    ten, unit = parts(number)
    if unit > 0
      return "#{TENS[ten-1]} #{UNITS[unit-1]}"
    else
      return TENS[ten-1]
    end
  end

  def hundreds(number)
    hundred, ten, unit = parts(number)
    if ten > 0 || unit > 0
      tens = "#{ten}#{unit}".to_i
      return "#{convert(hundred)} hundred and #{convert(tens)}"
    else
      return "#{convert(hundred)} hundred"
    end
  end

  def thousands(number)
    thousand, hundred, ten, unit = parts(number)
    if ten > 0 || unit > 0 || hundred > 0
      if hundred == 0
        tens = "#{ten}#{unit}".to_i
        return "#{convert(thousand)} thousand and #{convert(tens)}"
      else
        hundreds = "#{hundred}#{ten}#{unit}".to_i
        return "#{convert(thousand)} thousand #{convert(hundreds)}"
      end
    else
      return "#{convert(thousand)} thousand"
    end
  end

  def convert(number)
    if number < 20
      return UNITS[number - 1];
    elsif number < 100
      tens(number)
    elsif number < 1000
      hundreds(number)
    elsif number < 10000
      thousands(number)
    elsif number < 1000000
      first = number.to_s[0..-4].to_i
      second = number.to_s[-3..-1].to_i
      if second > 0
        if second < 100
          "#{convert(first)} thousand and #{convert(second)}"
        else
          "#{convert(first)} thousand #{convert(second)}"
        end
      else
        "#{convert(first)} thousand"
      end
    elsif number == 1000000
      "one million"
    else
      "TOO BIG"
    end
  end
end

p NumberToWords.new.convert(ARGV[0].to_i)


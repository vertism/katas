#!/usr/bin/env ruby

class LookAndSay

  def run(initial, iterations)
    current = 0
    values = iterations.times.map do |i|
      if i == 0
        current = initial
      else
        current = nextNumber(current)
        current
      end
    end

    values.join(', ')
  end

  def nextNumber(number)
    chunked = number.to_s.chars.chunk_while{ |a, b| a == b }.to_a
    chunked.map do |i|
      [i.size, i[0]]
    end.flatten.join('')
  end
end

p LookAndSay.new.run(ARGV[0].to_i, ARGV[1].to_i)


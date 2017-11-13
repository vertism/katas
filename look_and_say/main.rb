#!/usr/bin/env ruby

class LookAndSay
  def run(initial, iterations)
    current = initial
    values = iterations.times.map do |i|
      current = nextNumber(current) if i > 0
      current
    end

    values.join(', ')
  end

  def nextNumber(number)
    chunked = number.to_s.chars.chunk_while{ |a, b| a == b }
    chunked.flat_map do |chunk|
      [chunk.size, chunk.first]
    end.join
  end
end

p LookAndSay.new.run(ARGV[0].to_i, ARGV[1].to_i)


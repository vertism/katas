require_relative 'main'
require 'minitest/autorun'

describe LookAndSay do

  subject { LookAndSay.new }

  describe('starting at 1') do
    it('works') do
      subject.run(1, 5).must_equal "1, 11, 21, 1211, 111221"
    end
  end

  describe('starting at 2') do
    it('works') do
      subject.run(2, 5).must_equal "2, 12, 1112, 3112, 132112"
    end
  end

  describe('starting at 3') do
    it('works') do
      subject.run(2, 5).must_equal "3, 13, 1113, 3113, 132113"
    end
  end
end
require 'pry'
class SumOfMultiples
  attr_reader :multiples
  def initialize(*multiples)
    @multiples = multiples
  end

  def self.to(n)
    obj = SumOfMultiples.new(3, 5)
    return 0 if n == 1
    results = (1...n).to_a.select do |value|
      (value % obj.multiples.first).zero? || (value % obj.multiples.last).zero?
    end
    results.reduce(:+)
  end

  def to(n)
    results = (1...n).to_a.select do |value|
      value if multiple?(value)
      # binding.pry
    end
    results.reduce(:+)
  end

  def multiple?(n)
    flag = false
    multiples.each do |value|
      # binding.pry
      flag = true if (n % value).zero?
    end
    # binding.pry
    flag
  end
end

p SumOfMultiples.new(7,13,17).to(20)

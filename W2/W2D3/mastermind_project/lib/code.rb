require 'byebug'

class Code
  POSSIBLE_PEGS = {
    'R' => :red,
    'G' => :green,
    'B' => :blue,
    'Y' => :yellow
  }
  attr_reader :pegs

  def self.valid_pegs?(arr)
    arr.all? { |p| POSSIBLE_PEGS.key?(p.upcase) }
  end

  def initialize(arr)
    new_arr = arr.map(&:upcase)
    raise 'Invalid pegs' unless Code.valid_pegs?(new_arr)

    @pegs = new_arr
  end

  def self.random(rand_length)
    random_arr = Array.new(rand_length) { POSSIBLE_PEGS.keys[rand(4)] }
    Code.new(random_arr)
  end

  def self.from_string(str)
    Code.new(str.split(''))
  end

  def [](index)
    pegs[index]
  end

  def length
    pegs.length
  end

  def num_exact_matches(code)
    code.pegs.each_index.count { |i| code.pegs[i] == pegs[i] }
  end

  def num_near_matches(code)
    hash = Hash.new(0)
    code.pegs.each { |peg| hash[peg] += 1 }
    counter = pegs.uniq.map {|peg| hash[peg]}.sum
    counter - num_exact_matches(code)
  end

  def ==(code)
    return false if pegs.length != code.pegs.length
    (0...pegs.length).each.all? { |x| code.pegs[x] == pegs[x]}
  end
end




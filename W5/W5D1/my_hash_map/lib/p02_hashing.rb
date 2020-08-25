class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    hash = 0
    self.each do |ele|
      hash ^= ele.hash + hash
      # hash += (hash << 2 + hash) + ele
    end
    hash
  end
end

class String
  def hash
    hash = 0
    self.each_char do |char|
      hash ^= char.ord + hash
    end
    hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.sort.flatten.hash
  end
end

class MaxIntSet
  attr_reader :max_size, :store
  def initialize(max)
    @store = Array.new(max)
    @max_size = max
  end

  def insert(num)
    raise 'Out of bounds' unless is_valid?(num)

    store[num] = true
  end

  def remove(num)

    store[num] = false
  end

  def include?(num)
    raise 'out of bound' unless is_valid?(num)
    
    store[num]
  end

  private

  def is_valid?(num)
    num.between?(0, max_size - 1)
  end

  def validate!(num)
  end

end


class IntSet
  attr_reader :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num unless include?(num)
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless include?(num)
      resize! if count == num_buckets 
      self[num] << num
      @count += 1
    end
  end

  def remove(num)
    @count -= 1 if self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    tmp = ResizingIntSet.new(num_buckets * 2)
    @store.each do |bucket|
      bucket.each {|el| tmp.insert(el)}
    end
    @store = tmp.store

  end
end

class HashSet
  attr_accessor :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless include?(key)
      resize! if count == num_buckets
      self[key.hash] << key 
      self.count += 1
    end
  end

  def include?(key)
    self[key.hash].include?(key)
  end

  def remove(key)
    self.count -= 1 if self[key.hash].delete(key)
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
    tmp = HashSet.new(num_buckets * 2)
    @store.each do |bucket|
      bucket.each {|el| tmp.insert(el)}
    end
    @store = tmp.store
  end
end

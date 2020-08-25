require "byebug"
class StaticArray
  attr_reader :store

  def initialize(capacity)
    @store = Array.new(capacity)
  end

  def [](i)
    validate!(i)
    self.store[i]
  end

  def []=(i, val)
    validate!(i)
    self.store[i] = val
  end

  def length
    self.store.length
  end

  private

  def validate!(i)
    raise "Overflow error" unless i.between?(0, self.store.length - 1)
  end
end

class DynamicArray
  include Enumerable
  attr_accessor :count

  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
    @count = 0
  end

  def [](i)
    if i >= capacity || count + i < 0
      nil
    elsif i < 0 
      @store[count + i]
    else
      @store[i]
    end
  end
  
  def []=(i, val)
    if i >= capacity || count + i < 0
      nil
    elsif i < 0 
      @store[count + i] = val
    else
      @store[i] = val
    end
    
  end

  def capacity
    @store.length
  end

  def include?(val)
    self.any? {|el| el == val}
  end

  def push(val)
    resize! if count == capacity
    self[count] = val
    self.count += 1
  end

  def unshift(val)
    resize! if count == capacity
    i = count
    while i > 0
      self[i] = self[i-1]
      i -= 1
    end
    self[i] = val
    self.count += 1
  end

  def pop
    return nil if @count == 0
    self.count -= 1
    tmp = self[count]
    self[count] = nil
    tmp
  end

  def shift
    return nil if @count == 0

    tmp = first
    i = 0
    while i < count
      self[i] = self[i + 1]
      i += 1
    end
    self[count] = nil
    self.count -= 1
    tmp
  end

  def first
    self[0]
  end

  def last
    self[count - 1]
  end

  def each
    if block_given?
      (0...count).each { |i| yield(self[i])}
    end
  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    count == other.count
    each_with_index.all? { |el, i| el == other[i]}
  end

  alias_method :inspect, :to_s
  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private

  def resize!
    tmp = StaticArray.new(capacity * 2)
    @store.store.each_with_index {|el, i| tmp[i] = el}
    @store = tmp
  end
end

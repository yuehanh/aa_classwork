class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    self.prev.next = self.next
    self.next.prev = self.prev
    self.next = nil
    self.prev = nil
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new(:head)
    @tail = Node.new(:tail)
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    tmp = @head.next
    while tmp && tmp.key != key
      tmp = tmp.next
    end
    tmp ? tmp.val : nil
  end

  def include?(key)
    !get(key).nil?
  end

  def append(key, val)
    new_node = Node.new(key, val)
    self.last.next = new_node
    new_node.next = @tail
    new_node.prev = self.last
    @tail.prev = new_node
  end

  def update(key, val)
    tmp = @head.next
    while tmp && tmp.key != key
      tmp = tmp.next
    end
    tmp ? tmp.val = val : nil
  end

  def remove(key)
    tmp = @head.next
    while tmp && tmp.key != key
      tmp = tmp.next
    end
    tmp ? tmp.remove : nil
  end

  def each(&prc)
    tmp = @head.next
    until tmp == @tail
      prc.call(tmp)
      tmp = tmp.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end

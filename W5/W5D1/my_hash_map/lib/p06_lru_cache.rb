require_relative 'p05_hash_map'
require_relative 'p04_linked_list'
require "byebug"
class LRUCache
  attr_reader :store
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map[key]
      update_node!(@map[key])
    else
      calc!(key)
    end
    @map[key].val

  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    self.eject! if count == @max
    @map[key] = @store.append(key, @prc.call(key))
  end
  
  def update_node!(node)
    node.remove
    node.next = @store.last.next
    @store.last.next = node
    node.prev = @store.last
    node.next.prev = node
    # @map[node.key] = new_node
    # suggested helper method; move a node to the end of the list
  end
  
  def eject!
    oldest = @store.first
    @store.first.remove
    @map.delete(oldest.key)
  end
end

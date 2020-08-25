require_relative 'p04_linked_list'

class HashMap
    include Enumerable
    attr_accessor :count, :store

    def initialize(num_buckets = 8)
        @store = Array.new(num_buckets) { LinkedList.new }
        @count = 0
    end

    def include?(key)
        bucket(key).include?(key)
    end

    def set(key, val)
        unless bucket(key).update(key, val)
            resize! if count == num_buckets
            bucket(key).append(key, val)
            @count += 1
        end
    end

    def get(key)
        bucket(key).get(key)
    end

    def delete(key)
        if include?(key)
            bucket(key).remove(key)
            @count -= 1
        end
    end

    def each(&prc)
        @store.each do |linked_list|
            linked_list.each do |node|
                prc.call(node.key, node.val)
            end
        end
    end

    # uncomment when you have Enumerable included
    def to_s
        pairs = inject([]) do |strs, (k, v)|
            strs << "#{k} => #{v}"
        end
        "{\n" + pairs.join(",\n") + "\n}"
    end

    alias [] get
    alias []= set

    private

    def num_buckets
        @store.length
    end

    def resize!
        tmp = HashMap.new(num_buckets * 2)
        @store.each do |bucket|
            bucket.each { |node| tmp.set(node.key, node.val) }
        end
        @store = tmp.store
    end

    def bucket(key)
        # optional but useful; return the bucket corresponding to `key`
        @store[key.hash % num_buckets]
    end
end

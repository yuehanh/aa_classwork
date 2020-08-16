require_relative './item.rb'
class List
    attr_accessor :label
    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description="")
        if Item.valid_date?(deadline)
            @items << Item.new(title, deadline, description)
            return true

        else
            return false
        end
    end

    def size
        @items.length

    end

    def valid_index?(index)
        index >= 0 && index < size
    end

    def swap(index_1,index_2)
        if !(valid_index?(index_1) && valid_index?(index_2))
            false
        else
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            true
        end
    end

    def [](index)
        valid_index?(index) ? @items[index] : nil
    end

    def priority
        @items[0]
    end

    def print
        @titlerow = "Index".ljust(8)+ "|" + "Item".ljust(30)+ "|" +"Deadline".ljust(15)+"|" +"Status".ljust(10)
        # n = 60
        @markd = "\u2764"
        @marktd ="\u2661"
        n = @titlerow.length
        puts "-" * n
        puts label.upcase.rjust(30).ljust(2*(30 - label.length / 2 ))
        puts "-" * n
        puts @titlerow
        puts "-" * n
        @items.each.with_index do |item, i|
            status =  item.done ? @markd.encode('utf-8') : @marktd.encode('utf-8')
            puts "#{i.to_s.ljust("Index".ljust(8).length)}|" +"#{item.title.ljust("Item".ljust(30).length)}|"+ "#{item.deadline.ljust("Deadline".ljust(15).length)}|" + "#{status.ljust("Status".ljust(10).length)}"
        end
        puts "-" * n        
    end

    def print_full_item(index)
        status =  @items[index].done ? "#{@markd.encode('utf-8')}" : "#{@marktd.encode('utf-8')}"
        n = @titlerow.length
        puts "-" * n
        puts "#{@items[index].title} #{@items[index].deadline.rjust(n-@items[index].title.length)}"
        puts "#{@items[index].description} #{status.rjust(n-@items[index].description.length)}"
        puts "-" * n
    end

    def print_priority
        print_full_item(0)
    end
    
    def up(index, amount=1)
        return false if !valid_index?(index)
        while amount > 0 && index > 0
            swap(index, index - 1)
            amount -= 1
            index -= 1
        end
        return true
    end

    def down(index, amount=1)
        return false if !valid_index?(index)
        while amount > 0 && index < size
            swap(index, index + 1)
            amount -= 1
            index += 1
        end
        return true
    end

    def sort_by_date!
        @items.sort_by! {|item| item.deadline}
    end

    def toggle_item(index)
        @items[index].toggle if valid_index?(index)
    end

    def remove_item(index)
        return false unless valid_index?(index)
        @items.delete_at(index)
        true
    end

    def purge
        i = size - 1
        while i >= 0
            remove_item(i) if @items[i].done
            i -= 1
        end
    end

end
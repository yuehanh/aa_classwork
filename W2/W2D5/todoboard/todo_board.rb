require_relative 'list.rb'
class TodoBoard
    def initialize
        @list = {}
    end

    def get_command
        print "\nEnter a command: "
        cmd, *args = gets.chomp.split(' ')

        case cmd
        when 'mklist'
            @list[args[0]] = List.new(args[0])
        when 'ls'
            puts @list.keys
        when 'showall'
            @list.values.each {|todo| todo.print}
        when 'mktodo'
            @list[args[0]].add_item(*args[1..-1])
        when 'up'
            args[1..-1].map! {|ele| ele.to_i}
            @list[args[0]].up(*args[1..-1])
        when 'down'
            args[1..-1].map! {|ele| ele.to_i}
            @list[args[0]].down(*args[1..-1])
        when 'swap'
            args[1..-1].map! {|ele| ele.to_i}
            @list[args[0]].swap(*args[1..-1])
        when 'sort'
            @list[args[0]].sort_by_date!
        when 'priority'
            @list[args[0]].print_priority
        when 'toggle'
            @list[args[0]].toggle_item(args[1].to_i)
        when 'rm'
            @list[args[0]].remove_item(args[1].to_i)
        when 'purge'
            @list[args[0]].purge
        when 'print'
            if args.length == 1
                @list[args[0]].print
            else
                @list[args[0]].print_full_item(args[1].to_i)
            end
        when 'quit'
            return false
        else
            print "Sorry, that command is not recognized."
        end

        true
    end

    def run 
        while get_command
            get_command
        end
    end
end
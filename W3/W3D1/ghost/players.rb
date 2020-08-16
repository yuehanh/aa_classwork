require 'set'
class Player
    ALPHA = Set.new('a'..'z')
    attr_reader :name

    def initialize(name)
        @name = name
    end

    def guess
        puts "Player #{@name} need a guess"
        input = gets.chomp.downcase
        until ALPHA === input   #=== is same as .include?? for Set
            puts "Player #{@name} needs to enter a single letter"
            input = gets.chomp.downcase
        end
        input
    end
end

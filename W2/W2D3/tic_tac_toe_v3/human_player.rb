class HumanPlayer

    attr_reader :mark

    def initialize
        print "Set your mark!\n"
        @mark = gets.chomp
        if @mark == "_"
            raise "you suck, cheater"
        end
    end

    def get_position(legal_pos)
        
        print "Player '#{@mark}': enter position with space in between: e.g., 4 7\n"
        input = gets.chomp.split(" ")        
        until input.length == 2     
            p "Invalid position"   
            input = gets.chomp.split(" ")            
        end
        # change for higher dimensions...including initialize
        pos = input.map(&:to_i)
    end
end
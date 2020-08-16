class ComputerPlayer

    attr_reader :mark

    def initialize
        print "Set computer's mark!\n"
        @mark = gets.chomp
        if @mark == "_"
            raise "INSTANT WIN FOR THE COMPUTER"
        end
    end

    def get_position(legal_pos)
        legal_pos[rand(legal_pos.length)]
    end
end






# do what they say re: computer playing randomly

# sufficient winning test 
# necessary loss preventing test

# board  : M of legal loves
# board-m, calls itself recrusively & switiches player

#Either there is no way

class Player
    def get_move
        Kernel.print "enter a position with coordinates separated with a space like `4 7`'"
        pos = gets.chomp.split(" ").map(&:to_i)
    end
end


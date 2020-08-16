require_relative 'board.rb'

class Sudoku
    def initialize(puzzlefile)
        @board = Board.new(puzzlefile)
        @checker = (1..9).to_a
    end

    def run
        until win?
            system("clear")
            @board.render
            pos, value = get_value
            @board[pos] = value
            @board.validate_values
        end
        system("clear")
        puts "!!!!!!CONGRATULATIONS!!!! YOU WON!!!!"
        @board.render
        puts "!!!!!!CONGRATULATIONS!!!! YOU WON!!!!"
    end

    def win?
        @board.row? && @board.col? && @board.square?
    end

    def get_value
        puts "Enter coordinates and a value separated with a space like `4 7 5`'"
        x, y, value = gets.chomp.split(" ").map(&:to_i)
        until valid_position?([x,y])
            puts 'Please enter a valid position'
            x, y, value = gets.chomp.split(" ").map(&:to_i)
        end
        [[x, y], value]
    end

    def valid_position?(pos)
        @board[pos] && @board[pos].changable?
    end
end


if $PROGRAM_NAME == __FILE__
    game = Sudoku.new('./puzzles/sudoku1_almost.txt')
  
    game.run
   
  end
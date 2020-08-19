require_relative 'piece'

class Board
    attr_reader :grid
    def initialize
        @grid = Array.new(8){Array.new(8, NullPiece.new)}
        place_pieces
    end

    def place_pieces
        grid[1].map! { |el| Pawn.new }
        grid[6].map! { |el| Pawn.new }
        [0,7].each do |row|
            grid[row][0] = Rook.new
            grid[row][1] = Knight.new
            grid[row][2] = Bishop.new
            grid[row][3] = Queen.new
            grid[row][4] = King.new
            grid[row][5] = Bishop.new
            grid[row][6] = Knight.new
            grid[row][7] = Rook.new
        end
    end

    def valid_move?(end_pos)
        true
    end
    
    def [](pos)
        grid[pos.first][pos.last]
    end



    def invalid_pos?(pos)
        self[pos].is_a?(NullPiece)
    end

    def move_piece(start_pos, end_pos)
        piece = self[start_pos]
        
        if invalid_pos?(start_pos)
            raise NoPieceError
        elsif valid_move?(end_pos)
            self[start_pos] = NullPiece.new
            self[end_pos] = piece
        else
            raise NotAValidMove
        end
    end

protected
    def []=(pos,val)
        grid[pos.first][pos.last] = val
    end
end

class NoPieceError < StandardError
end

class NotAValidMove < StandardError
end
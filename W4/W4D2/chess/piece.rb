class Piece
    def initialize(color,board, pos)
        @color = color
        @board = board
        @pos = pos
    end
end


class Queen < Piece
    def symbol
        :Q
    end

    protected

    def move_dirs
        'Both'
    end
end

class Rook < Piece
    def symbol
        :R
    end

    protected
    
    def move_dirs
        'rowcol'
    end
end

class Bishop < Piece
    def symbol
        :B
    end

    protected
    
    def move_dirs
        'diag'
    end
end

class Knight < Piece
    def symbol
        :Kn
    end
end


class King < Piece
    def symbol
        :K
    end
end

class Pawn < Piece
    def symbol
        :P
    end
end

class NullPiece < Piece
    def symbol
        :N
    end
end

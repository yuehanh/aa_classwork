module Stepable
    def move_diffs
        raise "you need to define move diffs in your piece class"
    end

    def moves
        move_diffs.reject do |move|
            !board.valid_index?(move) || self.color == board[move].color
        end
    end
end
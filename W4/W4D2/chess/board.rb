require_relative 'piece'
require 'set'
require 'byebug'
class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8) { Array.new(8, NullPiece.instance) }
    place_pieces
  end

  def place_pieces
    grid[1].map!.with_index { |_el, i| Pawn.new('b', self, [1, i]) }
    grid[6].map!.with_index { |_el, i| Pawn.new('w', self, [6, i]) }
    [0, 7].each do |row|
      color = (row == 0 ? 'b' : 'w')
      grid[row][0] = Rook.new(color, self, [row, 0])
      grid[row][1] = Knight.new(color, self, [row, 1])
      grid[row][2] = Bishop.new(color, self, [row, 2])
      grid[row][3] = Queen.new(color, self, [row, 3])
      grid[row][4] = King.new(color, self, [row, 4])
      grid[row][5] = Bishop.new(color, self, [row, 5])
      grid[row][6] = Knight.new(color, self, [row, 6])
      grid[row][7] = Rook.new(color, self, [row, 7])
    end
  end

  def valid_move?(piece, end_pos)
    piece.moves.include?(end_pos)
  end

  def [](pos)
    if grid[pos.first].nil?
      nil
    else
      grid[pos.first][pos.last]
    end
  end

  def valid_index?(pos)
    (pos.first.between?(0, 7) && pos.last.between?(0, 7))
  end

  def invalid_pos?(pos)
    self[pos].empty?
  end

  def move_piece(start_pos, end_pos)
    piece = self[start_pos]

    if invalid_pos?(start_pos)
      raise NoPieceError
    elsif valid_move?(piece, end_pos)
      self[start_pos] = NullPiece.instance
      self[end_pos] = piece
      piece.pos = end_pos
    else
      raise NotAValidMove
    end
  end

  def in_check?(color)
    attack_array = []
    king_pos = []
    grid.each_with_index do |row, i|
      row.each_with_index do |piece, j|
        # debugger
        unless piece.color == color || piece.empty?
          attack_array += piece.moves
          next
          end
        king_pos = [i, j] if piece.is_a?(King)
      end
    end
    attack_array.include?(king_pos)
  end

  def checkmate?(color)
    # in_check?(color) && !valid_moves?(color)
  end

  protected

  def []=(pos, val)
    grid[pos.first][pos.last] = val
  end
end

class NoPieceError < StandardError
end

class NotAValidMove < StandardError
end

# if $PROGRAM_NAME == __FILE__

# end

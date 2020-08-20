require_relative 'slidable_module'
require_relative 'stepable_module'
require_relative 'board'
require 'singleton'

require 'byebug'
class Piece
  attr_reader :color, :board
  attr_accessor :pos
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def empty?
    self.is_a?(NullPiece)    
  end

  def inspect
    "#{self.symbol} and #{self.color}"
  end
end

class Queen < Piece
  include Slideable
  def symbol
    "\u2655"
  end

  protected

  def move_dirs
    'both'
  end
end

class Rook < Piece
  include Slideable
  def symbol
    "\u2656"
  end

  protected

  def move_dirs
    # debugger
    'rowcol'
  end
end

class Bishop < Piece
  include Slideable
  def symbol
    "\u2657"
  end

  protected

  def move_dirs
    'diag'
  end
end

class Knight < Piece
  include Stepable
  def symbol
    "\u2658"
  end

  def move_diffs
    x, y = pos
    [[x + 2, y + 1],
     [x + 2, y - 1],
     [x - 2, y + 1],
     [x - 2, y - 1],
     [x + 1, y + 2],
     [x + 1, y - 2],
     [x - 1, y + 2],
     [x - 1, y - 2]]
  end
end

class King < Piece
  include Stepable
  def symbol
    "\u2654"
  end

  def move_diffs
    x, y = pos
    [[x + 1, y + 1],
     [x + 1, y - 1],
     [x - 1, y + 1],
     [x - 1, y - 1],
     [x, y + 1],
     [x, y - 1],
     [x + 1, y],
     [x - 1, y]]
  end
end

class Pawn < Piece
  def symbol
    "\u2659"
  end

  def moves
    forward_steps + side_attacks
  end
  private
  
  def at_start_row?
    # debugger
    if self.color == "w" 
        self.pos.first == 6 
    else
        self.pos.first == 1
    end
  end

  def forward_dir
    self.color == "w" ? -1 : 1
  end

  def forward_steps
    forward_moves = []
    x,y = self.pos
    if at_start_row?
        i = 2
    else
        i = 1
    end
    (1..i).each do |j|
        forward_moves << [forward_dir * j + x,  y]
    end
    forward_moves
  end

  def side_attacks
    x,y = self.pos
    dir = forward_dir + x
    [[dir, y + 1], [dir, y - 1]].select do |move|
        board.valid_index?(move) && board[move].color != self.color
    end
 end
    
    
  
  
end

class NullPiece < Piece
  include Singleton
  def initialize
    super(nil, nil, nil)
  end

  def symbol 
    '_'
  end
end

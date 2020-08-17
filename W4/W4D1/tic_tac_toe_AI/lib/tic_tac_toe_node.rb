require_relative 'tic_tac_toe'
require 'byebug'
class TicTacToeNode
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @curr_mark = (next_mover_mark == :x ? :o : :x)
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if self.board.won?
        return self.board.winner != evaluator
    end
    return false if self.board.tied?
    if self.next_mover_mark == evaluator
      self.children.all? { |child| child.losing_node?(evaluator)}
    else
      self.children.any? {|child| child.losing_node?(evaluator)}
    end
    
  end

  def winning_node?(evaluator)
    if self.board.won?
      return self.board.winner == evaluator
    end
    return false if self.board.tied?
    if self.next_mover_mark == evaluator
      self.children.any? {|child| child.winning_node?(evaluator)}
    else
      self.children.all? {|child| child.winning_node?(evaluator)}
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    avaliable_pos = []
    board.rows.each_with_index do |row, i|
      row.each_with_index do |cell,j|
        if cell.nil?
          childboard = board.dup
          childboard[[i,j]] = next_mover_mark
          avaliable_pos << TicTacToeNode.new(childboard, curr_mark, [i,j])
        end
      end
    end
    avaliable_pos
  end
  

  attr_reader :board, :next_mover_mark, :prev_move_pos, :curr_mark
end

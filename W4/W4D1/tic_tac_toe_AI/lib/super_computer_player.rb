require_relative 'tic_tac_toe_node'
require 'byebug'
class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    @pos_nodes = TicTacToeNode.new(game.board, mark)
    @mark = mark

    find_nonlosing.prev_move_pos
    # debugger
    find_nonlosing.prev_move_pos
  end

  def find_nonlosing
    nonlosing = []
    @pos_nodes.children.each do |child|
      # debugger
      return child if child.winning_node?(@mark)

      # debugger
      nonlosing << child unless child.losing_node?(@mark)
      # debugger
    end
    raise 'cannot compute' if nonlosing.empty?

    nonlosing.first
  end
end

if __FILE__ == $PROGRAM_NAME
  puts 'Play the brilliant computer!'
  hp = HumanPlayer.new('Jeff')
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end

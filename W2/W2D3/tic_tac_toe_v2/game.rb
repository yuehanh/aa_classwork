require './board.rb'
require './human_player.rb'

class Game
  attr_reader :cpi, :players

  def initialize(num_players, n, _dim = 2)
    @players = []
    num_players.times do
      @players << HumanPlayer.new
    end

    @cpi = 0 # current player position

    @board = Board.new(n)
  end

  def switch_turn
    @cpi = (@cpi + 1) % @players.length
  end

  def play
    while @board.empty_positions?
      @board.print
      pos = @players[@cpi].get_position
      until @board.place_mark(pos, @players[@cpi].mark)
        p 'Illegal board position'
        pos = @players[@cpi].get_position
      end

      if @board.win?(@players[@cpi].mark)
        puts "Tic Tac *SMACK*! YOU WON PLAYER #{@players[@cpi].mark}"
        return
      else
        switch_turn
      end
    end
    puts 'YOU ALL WON BUT MORE IMPORTANTLY YOU ALL LOST'
  end
end

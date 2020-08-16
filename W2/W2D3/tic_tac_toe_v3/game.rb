require './board.rb'
require './human_player.rb'
require './computer_player.rb'

class Game
  attr_reader :cpi, :players

  # initialize(4, true, true)
  # initialize(4, true, false)
  
  def  
    @players = []
    tolplayers.each do |p| 
      if p  
        @players << HumanPlayer.new 
      else
        @players << ComputerPlayer.new
      end
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
      pos = @players[@cpi].get_position(@board.legal_positions)
      until @board.place_mark(pos, @players[@cpi].mark)
        p 'Illegal board position'
        pos = @players[@cpi].get_position(@board.legal_positions)
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

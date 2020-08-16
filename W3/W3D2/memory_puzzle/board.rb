require_relative 'card.rb'


class Board
    MATCH_N = 2
  def initialize(size)
    @size = size
    array = []
    @unseen_pos = []
    @board = Array.new(size){Array.new(size)}
    (1..size**2).each do |i|
      array << Card.new(size - i - (i % MATCH_N))
    end
    array.shuffle.each_with_index do |el,i|
        @board[i / size][i % size] = el
        @unseen_pos << [i / size, i % size]
    end
  end

  attr_reader :unseen_pos
  
  def render
    print "  #{(0...@size).to_a.join(' ')}\n"
    @board.each_with_index do |row, i|
        print "#{i} " 
        row.each do |card| 
            if card.revealed?
                print  "#{card.name} "
            else
                print "  "
            end
        end
        puts
    end
    return
    end
    
    def [](pos)
        return nil unless @board[pos[0]]

        @board[pos[0]][pos[1]]
    end

    def toggle(pos)
        self[pos].toggle
    end
end
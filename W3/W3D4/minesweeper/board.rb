require_relative 'tiles'
class Board
  def initialize(num_of_bombs)
    @board = Array.new(9) { Array.new(9) }
    bombs = []
    num_of_bombs.times do
      bombs << Tile.new(true)
    end
    bombs.shuffle
    bombs.shuffle!

    # 81 - num_of_
  end
end

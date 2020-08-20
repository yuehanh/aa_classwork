require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display
  attr_reader :grid, :cursor_pos
  def initialize(board)
    @cursor = Cursor.new([0, 0], board)
    @grid = board.grid
  end

  def render
    grid.each_with_index do |row, i|
      print "#{8 - i} "
      row.each_with_index do |piece, j|
        color = if @cursor.cursor_pos == [i, j]
                  (@cursor.selected ? :green : :blue)
                else
                  (piece.color == 'w' ? :white : :red)
                end
        print piece.symbol.encode('utf-8').ljust(3).to_s.colorize(color)
      end
      puts
    end
    puts "  #{('a'..'h').to_a.join('  ')}"
    nil
  end

  def move_cursors
    loop do
      system('clear')
      render
      @cursor.get_input
    end
  end
end

if $PROGRAM_NAME == __FILE__
  testboard = Board.new
  play = Display.new(testboard)
  play.render
  testboard.move_piece([6, 5], [4, 5])
  testboard.move_piece([1, 4], [2, 4])
  testboard.move_piece([6, 6], [4, 6])
  testboard.move_piece([0, 3], [4, 7])
  play.render
  puts testboard.in_check?('w')

end

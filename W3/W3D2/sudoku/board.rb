require 'colorize'
require_relative 'tile.rb'
require 'byebug'
class Board
  def initialize(puzzlefile)
    raw = File.readlines(puzzlefile).map(&:chomp)
    @board = Array.new(9) { Array.new(9) }
    @boardvalue = Array.new(9) { Array.new(9) }
    @square = Array.new(9) { Array.new(9) }
    raw.each_with_index do |row, i|
      row.each_char.with_index do |value, j|
        @board[i][j] = Tile.new(value.to_i)
        @boardvalue[i][j] = value.to_i
        @square[(i / 3) * 3 + j / 3] [i % 3 * 3 + j % 3] = value.to_i
      end
    end
    @checker =(1..9).to_a
  end

  attr_reader :square, :boardvalue

  def [](pos)
    return nil unless @board[pos[0]]

    @board[pos[0]][pos[1]]
  end

  def []=(pos, value)
    return nil unless @board[pos[0]]

    i, j = pos
    @board[i][j].value = value
    @boardvalue[i][j] = value
    @square[(i / 3) * 3 + j / 3] [i % 3 * 3 + j % 3] = value
  end

  def row?(i = nil)
    if i
        @checker - @boardvalue[i] == []
    else
        @boardvalue.all? {|row| @checker - row == []}
    end
  end

  def col?(i = nil)
    if i
        @checker - @boardvalue.transpose[i] == []
    else
        @boardvalue.transpose.all? {|col| @checker - col == []}
    end
  end

  def square?(i = nil)
    if i
        @checker - @square[i] == []
    else
        @square.all? {|square| @checker - square == []}
    end
  end 

  def validate_values
    @board.transpose.each_with_index do |col, i|
        if col?(i) 
            col.each {|tile| tile.valid = true}
        else
            col.each {|tile| tile.valid = false}
        end
    end
    @board.each_with_index do |row, i|
        row.each_with_index do |tile, j| 
            tile.valid = false unless row?(i) && square?((i / 3) * 3 + j / 3)
        end
    end
  end


  def render
    print "  #{(0..8).to_a.join(' ')}\n"
    @board.each_with_index do |row, i|
      print "#{i} "
      row.each do |tile|
        if !tile.changable?
          print "#{tile.value} ".colorize(:blue)
        elsif tile.value.zero?
          print '_ '
        elsif tile.valid
          print "#{tile.value} ".colorize(:green)
        else
          print "#{tile.value} ".colorize(:red)
        end
      end
      puts
    end
    nil
  end
end

if $PROGRAM_NAME == __FILE__
  game = Board.new('./puzzles/sudoku1.txt')

  game.render
  game[[0, 0]] = 2
  game.render
  p game.boardvalue

  puts '--------------------'
  p game.square
end

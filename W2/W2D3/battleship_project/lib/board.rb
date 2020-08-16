require 'byebug'
class Board
  attr_reader :size

  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n * n
    @n = n
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def []=(pos, value)
    @grid[pos[0]][pos[1]] = value
  end

  def num_ships
    @grid.map do |row|
      row.count { |ele| ele == :S }
    end.sum
  end

  def attack(pos)
    if self[pos] == :S
      self[pos] = :H
      puts 'you sunk my battleship!' # have to call the kernel on print since we have a instance method defined on print
      true
    else
      self[pos] = :X
      false
    end
  end

  def place_random_ships
    arr = Array.new(size, 0)
    (0...size / 4).each { |x| arr[x] = 1 }
    arr.shuffle!
    n = @grid.length
    (0...size).each { |x| self[[x / n, x % n]] = :S if arr[x] == 1 }
  end

  def hidden_ships_grid
    fake_grid = Array.new(@n) { Array.new(@n) }
    @grid.each_with_index do |row, ri|
      row.each_with_index do |ele, ci|
        fake_grid[ri][ci] = ele == :S ? :N : ele
      end
    end
    fake_grid
  end

  def self.print_grid(other_grid)
    # debugger
    other_n = other_grid.length
    other_grid.flatten.each_with_index do |ele, index|
      # debugger
      if (index + 1) % other_n == 0
        Kernel.print "#{ele}\n" # have to call the kernel on print since we have a instance method defined on print
      else
        Kernel.print "#{ele} "
        # have to call the kernel on print since we have a instance method defined on print
      end
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end
end

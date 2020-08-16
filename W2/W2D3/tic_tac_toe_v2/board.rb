class Board
  def initialize(n)

    #do a n time recursion here doesnt work that assigns to each
    @grid = Array.new(n) { Array.new(n, '_') } # need scale up for multi-dimentsion
    @n = n
    @num_empty = n * n
   end

  # n-dimensional arrray....1-dimensional array o size 725
  # 5x5x5 : convert  (x, y, z) x* 25^2 + y * 25 + z

  def valid?(pos)
    pos.each_index.all? { |i| pos[i] >= 0 && pos[i] < @n }
  end

  def empty?(pos)
    @grid[pos[0]][pos[1]] == '_'
  end

  # validate() : checks everythign and riases

  def place_mark(pos, mark)
    return false if !valid?(pos) || !empty?(pos)
    @grid[pos[0]][pos[1]] = mark
    @num_empty -= 1
    true
  end

  def print
    (0...@n).each do |row|
      (0...@n).each do |col|
        Kernel.print "#{@grid[row][col]} "
      end
      puts
    end
  end

  def win_row?(mark)
    @grid.any? { |row| row.uniq == [mark] }
  end

  def win_col?(mark)
    @grid.transpose.any? { |row| row.uniq == [mark] }
  end

  def win_diagonal?(mark)
    return true if (0...@n).all? { |j| mark == @grid[j][j] }
    return true if (0...@n).all? { |j| mark == @grid[j][-1 - j] }

    false
  end

  def win?(mark)
    win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
  end

  def empty_positions?
    @num_empty != 0
  end
end

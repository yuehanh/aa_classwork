class Board
  attr_reader :stacks

  def initialize(num)
    raise 'Num of disks needs to be an positive integer' unless num.is_a?(Integer) && num.positive?

    @stacks = Array.new(3) { [] }
    num.downto(1) { |el| @stacks[0] << el }
    @complete_stacks = @stacks[0].dup
  end

  def move(start, dest)
    raise 'Position needs to be between 0 and 2' unless start.between?(0, 2) && dest.between?(0, 2)

    disk = stacks[start].pop
    unless stacks[dest].empty?
      raise 'You cannot do that' if stacks[dest][-1] < disk
    end
    stacks[dest].push(disk)
  end

  def won?
    @stacks[2] == @complete_stacks
  end

  def get_input
    input = gets.chomp.split(' ').map(&:to_i)
    start, dest = input
    move(start, dest)
  rescue StandardError
    puts 'invalid input try again'
    retry
  end

  def run
    until won?
      puts 'how do you wanna do this? input two stacks with space between 0 2'
      get_input
      p stacks
    end
    puts 'you won'
  end
end

if $PROGRAM_NAME == __FILE__
  game = Board.new(2)
  game.run
end

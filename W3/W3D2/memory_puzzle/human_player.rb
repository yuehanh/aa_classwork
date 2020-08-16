class HumanPlayer
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def prioritize(memory)

  end

  def guess(unseen_pos)
    input = gets.chomp.split(' ').map(&:to_i)
  end
end
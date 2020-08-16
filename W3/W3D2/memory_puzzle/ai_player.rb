class AiPlayer
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def prioritize(memory)
    @memory = memory
    @priority = memory.select { |card, pos| pos.length == 2 }.keys
  end

  def priority?
    @priority.length > 0
  end

  def guess(unseen_pos)
    if priority?
      @memory[@priority[0]].rotate!
      @memory[@priority[0]].last
    else
      unseen_pos.sample
    end
  end
end
class Card
  CARD_SELECTION = ('A'..'Z').to_a
  attr_reader :name
  def initialize(value)
    @name = CARD_SELECTION[value]
    @revealed = false
  end

  def revealed?
    @revealed
  end

  def toggle
    @revealed = !@revealed
  end

  def ==(other_card)
    self.name == other_card.name
  end
end
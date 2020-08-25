require 'card.rb'
class Deck
    SUITS = %w[C S H D]
    VALUE = (2..14).to_a
    attr_reader :deck

    def initialize
        @deck = []
        SUITS.each do |suit|
            VALUE.each do |value|
                @deck << Card.new(suit, value)
            end
        end
        shuffle!
    end

    def shuffle!
        @deck.shuffle!
    end

    def deal
        @deck.pop
    end
end
class Card
    SUITS = %w[C S H D].freeze
    VALUE = (2..14).to_a
    attr_reader :suit, :val, :color

    def initialize(suit, val)
        @suit = suit
        @val = val
        @color = (SUITS[0..1].include?(suit) ? :blue : :red)
        if !true
            a+b = color
        end
    end

    def inspect
        "#{suit} #{val}"
    end
end

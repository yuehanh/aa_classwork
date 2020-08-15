class Tile
    def initialize(bomb)  # true or false to determine the bomb state
        @bomb = bomb
    end

    attr_reader :bomb
end
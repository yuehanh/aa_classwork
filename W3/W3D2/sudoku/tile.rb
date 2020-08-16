class Tile

    attr_reader :value
    attr_accessor :valid
    def initialize(value)
        @value = value
        @changable = value.zero?
        @valid = false
    end

    def changable?
        @changable
    end

    def value=(new_value)
         @value = new_value
    end
    
end
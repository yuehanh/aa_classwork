class Item
    attr_reader :done
    attr_accessor :title, :deadline, :description

    def self.valid_date?(date_string)
        date = date_string.split('-')
        monthRange = (1..12).to_a
        dayRange = (1..31).to_a
        monthRange.include?(date[1].to_i) && dayRange.include?(date[2].to_i)
    end

    def initialize(title, deadline, description)
        if Item.valid_date?(deadline)
            @deadline = deadline
        else
            raise "Enter a valid date"
        end
        @title = title
        @description = description
        @done = false
    end

    def deadline=(newDate)
        if Item.valid_date?(newDate)
            @deadline = newDate
        else
            raise "Enter a valid date"
        end
    end
    
    def toggle
        @done = !@done
    end
end
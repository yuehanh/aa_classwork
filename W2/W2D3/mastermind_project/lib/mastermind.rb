require_relative "code.rb"

class Mastermind
    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(code)
        print @secret_code.num_exact_matches(code)
        print @secret_code.num_near_matches(code)
    end

    def ask_user_for_guess
        print 'Enter a code'
        code = Code.from_string(gets.chomp)
        print_matches(code)
        @secret_code == code
    end
end



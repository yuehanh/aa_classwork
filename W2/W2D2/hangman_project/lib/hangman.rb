class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end
    
  def initialize()
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.include?(char) 
  end

  def get_matching_indices(char)
    arr = []
    @secret_word.each_char.with_index do |c, i|
      arr << i if c == char
    end
    arr
  end

  def fill_indices(char, arr)
    arr.each do |i|
      @guess_word[i] = char
    end
  end

  def try_guess(char)
    if already_attempted?(char) 
      p 'that has already been attempted' 
      false
    else
      @attempted_chars << char
      if !@secret_word.include?(char)
        @remaining_incorrect_guesses -= 1
      else
        fill_indices(char, get_matching_indices(char))
      end
      true
    end
  end

    def ask_user_for_guess
      p "Enter a char:"
      input = gets.chomp
      try_guess(input)
    end

    def win?
      if @guess_word.join("") == @secret_word
        p "WIN"
        true
      else
        false
      end
    end

    def lose?
      if @remaining_incorrect_guesses.zero?
        p "LOSE"
        true
      else
        false
      end
    end

    def game_over?
      if win?
        p @secret_word
        true
      elsif lose?
        p @secret_word
        true
      else
        false
      end
    end


end

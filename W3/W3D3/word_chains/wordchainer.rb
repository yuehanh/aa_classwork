require "set"
require "byebug"

class WordChainer
  attr_reader :seen

  def initialize
    @dictionary = Set.new(File.readlines("dictionary.txt").map(&:chomp))
  end

  def adjacent_word(word)
    @dictionary.select { |el| el.length == word.length && differ_by_one(word, el) }
  end

  def differ_by_one(word_one, word_two)
    (0...word_one.length).one? { |i| word_one[i] != word_two[i] }
  end

  def explore_current_words(source, target)
    @target = target
    @seen = { source => nil }
    @current_words = [source]
    until @current_words.empty?
      @new_current_words = []
      @current_words.each do |word|
        adjacent_word(word).each do |adword|
          unless @seen.key?(adword)
            @new_current_words << adword
            @seen[adword] = word
            break if @seen.key?(target)
          end
          break if @seen.key?(target)
        end
        break if @seen.key?(target)
      end
      @current_words = @new_current_words
      break if @seen.key?(target)
    end
  end

  def build_path
    key = @target
    result = [key]
    while @seen[key]
      result.unshift(@seen[key])
      key = @seen[key]
    end
    result
  end
end

if $PROGRAM_NAME == __FILE__
  test = WordChainer.new
  test.explore_current_words("duck", "ruby")
  p test.build_path
end

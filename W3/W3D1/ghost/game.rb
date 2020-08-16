require 'set'
require 'byebug'

require_relative 'players.rb'

class GhostGame
  MAX_LOSS_COUNT = 5

  def initialize(number_of_players)
    system("clear")
    @players = []
    number_of_players.times do
      puts 'Enter your name: '
      input = gets.chomp
      @players << Player.new(input)
    end

    @dictionary = Set.new(File.readlines("dictionary.txt").map(&:chomp))
    @scoreboard = Hash.new(0)
    @players.each { |player| @scoreboard[player.name] = 0 }
  end


  def run
    until @players.length == 1
      play_round
      eliminate
    end
    puts "#{@players[0].name} wins the game"
  end

  private # making all following methods non-callable by user
  def current_player
    @players.first
  end

  def previous_player
    @players.last
  end

  def play_round
    @fragment = ''
    while take_turn
    end
    p @scoreboard
  end

  def switch_player!
    @players.rotate!
  end
  def prompt_for_guesses
    puts "#{current_player.name} do you want to challenge #{previous_player.name} on '#{@fragment}'? (y/n)"
    input = gets.chomp.downcase
    input = gets.chomp.downcase until 'yn'.include?(input)
    input
  end
  def take_turn
    case prompt_for_guesses
    when 'y'
      challenge_previous_player
      false
    when 'n'  #not challenge
      @fragment += current_player.guess
      switch_player!
      true
    end
  end

  def valid_play?(string)
    return false if @dictionary === string
    trim_dictionary(string)
    @dictionary.length.positive?
  end

  def trim_dictionary(string)
    @dictionary.select! { |word| word.start_with?(string) }
  end

  def challenge_previous_player
    if valid_play?(@fragment)
      puts "Player #{current_player.name} lost the round"
      @scoreboard[current_player.name] += 1
    else
      puts "Player #{previous_player.name} lost the round"
      @scoreboard[previous_player.name] += 1
    end
  end

  def eliminate
    if @scoreboard[current_player.name] == MAX_LOSS_COUNT
      puts "#{@players.shift} has been eliminated!!"
      puts "The remaining players are #{@players}."
    end
    if @scoreboard[previous_player.name] == MAX_LOSS_COUNT
      puts "#{@players.pop} has been eliminated!!"
      puts "The remaining players are #{@players}."
    end
  end
end



# if $PROGRAM_NAME == __FILE__
#   game = Game.new(
#     Player.new("Gizmo"), 
#     Player.new("Breakfast"), 
#     Player.new("Toby"),
#     Player.new("Leonardo")
#     )

#   game.run
# end
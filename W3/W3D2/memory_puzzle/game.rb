require_relative "human_player.rb"
require_relative "board.rb"
require_relative "ai_player.rb"
require 'set'

class MemoryPuzzle
    def initialize(size, num_players, num_AIs)
        @board = Board.new(size)
        system("clear")
        @players = []
        num_players.times do 
            puts "Enter your name"
            name = gets.chomp
            @players << HumanPlayer.new(name)
        end

        num_AIs.times do 
            puts "Enter AI's name"
            name = gets.chomp
            @players << AiPlayer.new(name)
        end

        @counter = size ** 2
        @memory = Hash.new { |hash, key| hash[key] = [] }
        @unseen_pos=@board.unseen_pos
    end

    def current_player
        @players.first
    end

    def switch_players
        @players.rotate!
    end

    def valid_position?(pos)
        @board[pos] && !@board[pos].revealed?
    end

    def prompt_for_guess
        puts "#{current_player.name} please enter a position in the form of '4 7'"
        pos = current_player.guess(@unseen_pos)
        until valid_position?(pos)
            puts 'Please enter a valid position'
            pos = current_player.guess(@unseen_pos)
        end
        pos
    end

    def take_turn
        @board.render
        current_player.prioritize(@memory)
        first_pos = prompt_for_guess
        memory_update(@board[first_pos].name, first_pos)
        @unseen_pos.delete(first_pos)
        @board.toggle(first_pos)
        system("clear")
        @board.render
        current_player.prioritize(@memory)
        second_pos = prompt_for_guess
        memory_update(@board[second_pos].name, second_pos)
        @unseen_pos.delete(second_pos)
        @board.toggle(second_pos)
        system("clear")
        @board.render
        if @board[first_pos] != @board[second_pos]
            @board.toggle(first_pos)
            @board.toggle(second_pos)
        else
            @counter -= 2  #scale up for higher MATCH GAME
            matched(@board[first_pos].name)
        end
        sleep(1)
    end

    def run
        until 2 > @counter
            system("clear")
            take_turn
            switch_players
        end
    end

    private

    def memory_update(card_name, pos)
        @memory[card_name] = @memory[card_name] | [pos]
    end
    
    def matched(card_name)
        @memory.delete(card_name)
    end
end


if $PROGRAM_NAME == __FILE__
    # puts "Please enter the size of the board"
    # size = gets.chomp.to_i
    # puts "Please enter the number of players"
    # players = gets.chomp.to_i

    # puts "Please enter the number of AIs"
    # ais = gets.chomp.to_i
#   game = MemoryPuzzle.new(size,players,ais)
game = MemoryPuzzle.new(3,0,2)
  game.run
end
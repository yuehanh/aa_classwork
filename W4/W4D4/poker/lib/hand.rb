require_relative 'card'
require "byebug"



class Hand

    def initialize(arr)
        @hand = arr
        @rank = [0]
        @hsh_suits = Hash.new(0)
        @hsh_unsorted = Hash.new(0)
        hash_hand
        rank_hand
        
    end

    def <=>(other_hand)
        rank <=> other_hand.rank
    end

    def show_hand
        hand
    end
    
    # protected
    attr_reader :hand
    attr_accessor :hsh_suits, :rank, :hand_value_pair, :hsh_unsorted

    def hash_hand
        hand.each do |card|
            hsh_suits[card.suit] += 1
        end

        hand.each do |card|
            hsh_unsorted[card.val] += 1
        end
        
        @hand_value_pair = hsh_unsorted.sort_by {|k,v| [-v,-k] } 
        
    end

    def flush
        hsh_suits.values.length == 1 ? 9 : 0
    end

    def straight
        (hand_value_pair.length == 5 && (hand_value_pair[0][0] - hand_value_pair[-1][0]) == 4) ? 8 : 0
    end

    def like_kinds
        largest_count = @hand_value_pair[0][1]
        num_uniqs = @hand_value_pair.length

        case largest_count
        when 4 # four of a kind(11)
            11
        when 3 # full house(10) or three of a kind(7)
            num_uniqs == 2 ? 10 : 7
        when 2 # 2 pairs(6) or 1 pair(3)
            num_uniqs == 3 ? 6 : 3
        when 1 #high card(0)
            0
        end
    end

    def rank_hand
        rank[0] += flush + straight + like_kinds
        rank[0] = 18 if rank[0] == 17 && hsh_unsorted.key?(14)
        
        @hand_value_pair.each do |el|
            @rank += [el[0]]*el[1]   
        end

        rank
    end


end

if $PROGRAM_NAME == __FILE__
    arr = [Card.new('S',5),Card.new('D',2),Card.new('C',2),Card.new('D',5),Card.new('C',5)]
    arr2 = [Card.new('D',2),Card.new('D',3),Card.new('D',4),Card.new('D',5),Card.new('D',6)]
    testhand = Hand.new(arr)
    testhand2 = Hand.new(arr2)
    p testhand.rank
    p testhand2.rank
    p testhand <=> testhand2
    p testhand.show_hand
end
# @[value= 1 ..19, 14,13,12,4,2 ]
# @[value ,    6,5,4,2,2]   hand1 <=> hand2
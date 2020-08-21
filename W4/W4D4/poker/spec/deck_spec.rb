require 'rspec'
require 'deck'
describe 'Deck' do
    subject(:new_deck) { Deck.new }
    describe '#initialize' do
      it 'initializes a deck of 52 unique cards' do
        expect(new_deck.deck.uniq.length).to eq(52)
      end
    end
  
    describe '#shuffle!' do
      it 'shuffles the deck' do
        original_deck = new_deck.deck.dup
        new_deck.shuffle!
        expect(new_deck.deck).to_not eq(original_deck)
      end
    end
  
    describe '#deal' do
      it 'returns the last card of the deck' do
          last_card = new_deck.deck.last
          expect(new_deck.deal).to eq(last_card)
      end
  
      it 'shrinks the deck by 1 card' do
         card_length = new_deck.deck.length
          new_deck.deal
          expect(new_deck.deck.length).to eq(card_length - 1)
      end
    end
  end
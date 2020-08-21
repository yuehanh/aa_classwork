require 'rspec'
require 'card'

describe 'Card' do
  describe '#initialize' do
    subject { Card.new('D', 4) }
    suits = %w[D S H C]
    value = (2..14).to_a
    colors = %i[blue red]
    it 'has colors that are either blue or red' do
      expect(colors).to include(subject.color)
    end

    it 'has a value between 2 and Ace' do
      expect(value).to include(subject.val) #whyu cant we use cover
    end

    it 'has a valid suits' do
      expect(suits).to include(subject.suit)
    end
  end

  # describe '<=>' do
  #   it 'should compare the values of two cards' do
  #     let(:card1) { Card.new('D', 2) }
  #     let(:card2) { Card.new('D', 3) }
  #     let(:card3) { Card.new('S', 3) }

  #     expect(card1 <=> card2).to eq(-1)
  #     expect(card2 <=> card1).to eq(1)
  #     expect(card2 <=> card3).to eq(0)
  #   end
#   end
end




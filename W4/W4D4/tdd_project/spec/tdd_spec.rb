require 'rspec'
require 'tdd'

describe '#my_uniq' do
  context 'when input is not empty' do
    it 'return unique elements' do
      expect([1, 2, 1, 3, 3].my_uniq).to eq([1, 2, 3])
    end
  end

  context 'when the input is alreay uniq' do
    it 'return orginal array' do
      expect([1, 2, 3].my_uniq).to eq([1, 2, 3])
    end
  end

  context 'when input is empty' do
    it 'return an empty array' do
      expect([].my_uniq).to eq([])
    end
  end
end

describe '#two_sum' do
  context 'when input is empty' do
    it 'return an empty array' do
      expect([].two_sum).to eq([])
    end
  end

  context 'when there are pairs that sum to zero' do
    it "return all pairs' index in order" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
  end

  context 'when there are no pairs' do
    it 'return an empty array' do
      expect([1, 2, 3, 4].two_sum).to eq([])
    end
  end
end

describe '#my_transpose' do
  it 'tranposes the matrix' do
    matrix = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8]
    ]
    transposed = [[0, 3, 6],
                  [1, 4, 7],
                  [2, 5, 8]]
    expect(my_transpose(matrix)).to eq(transposed)
  end
end

describe '#stock_picker' do
    it "returns the index of the most profitable pair" do
        prices = [0, 10, 5, 17, 20, 23, 2]
        expect(stock_picker(prices)).to eq([0, 5])
    end

end


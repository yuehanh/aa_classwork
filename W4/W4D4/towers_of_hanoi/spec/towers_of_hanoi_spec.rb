require 'rspec'
require 'towers_of_hanoi'
require 'byebug'
describe 'Board' do
  subject { Board.new(5) }

  describe '#initialize' do
    it 'takes in a positive int as argument' do
      expect { Board.new('1212') }.to raise_error('Num of disks needs to be an positive integer')
      expect { Board.new(0) }.to raise_error('Num of disks needs to be an positive integer')
    end

    it 'create a board with 3 stacks' do
      expect(subject.stacks.length).to eq(3)
    end

    it 'starts first stack with all disks sorted and rest of stacks empty' do
      disks = [5, 4, 3, 2, 1]
      expect(subject.stacks[0]).to eq(disks)
      expect(subject.stacks[1..-1]).to eq([[], []])
    end
  end

  describe '#move' do
    it 'only takes valid positions' do
      expect { subject.move(0, 3) }.to raise_error('Position needs to be between 0 and 2')
      expect { subject.move(3, 0) }.to raise_error('Position needs to be between 0 and 2')
    end

    it 'move the disk to the destination stack' do
      subject.move(0, 1)
      expect(subject.stacks[0]).to eq([5, 4, 3, 2])
      expect(subject.stacks[1]).to eq([1])
      expect(subject.stacks[2]).to be_empty
    end

    context 'when attempting to put a larger disk on top of a small disk' do
      it 'raise an error' do
        subject.move(0, 1)
        state = subject.stacks.dup
        # debugger
        expect { subject.move(0, 1) }.to raise_error('You cannot do that')
        expect(subject.stacks).to eq(state)
      end
    end
  end

  describe '#won?' do
    context 'when won' do
      it 'return true' do
        stacks_1 = [
          [],
          [],
          [5, 4, 3, 2, 1]
        ]
        subject.instance_variable_set(:@stacks, stacks_1)
        expect(subject.won?).to be true
      end
    end
    context 'when not won' do
      it 'return false' do
        stacks_1 = [
          [],
          [5],
          [4, 3, 2, 1]
        ]
        subject.instance_variable_set(:@stacks, stacks_1)
        expect(subject.won?).to be false
      end
    end
  end
end

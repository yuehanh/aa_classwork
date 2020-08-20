class Array
  def my_uniq
    hsh = {}

    each { |ele| hsh[ele] = true }
    hsh.keys
  end

  def two_sum
    answer = []

    each_with_index do |_ele, idx1|
      (idx1 + 1...length).each do |idx2|
        answer << [idx1, idx2] if (self[idx1] + self[idx2]) == 0
      end
    end

    answer
  end
end

def my_transpose(arr)
  transposed = Array.new(arr.length) { [] }

  arr.each do |row|
    row.each_with_index do |ele, col_i|
      transposed[col_i] << ele
    end
  end

  transposed
end

def stock_picker(arr)
    
    profits = (0...arr.length - 1).map do |idx|
        arr[idx + 1..-1].max - arr[idx]
    end

    max_profit = profits.max
    i = profits.index(max_profit)

    [i, arr.index(arr[i+1 .. -1].max)]

end

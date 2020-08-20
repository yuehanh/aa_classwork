module Slideable
    HORIZONTAL_DIRS =[
        [1, 0],
        [-1,0],
        [0, -1],
        [0, 1]
    ]

    DIAGONAL_DIRS =[
        [1,  1],
        [-1, -1],
        [-1, 1],
        [1, -1],
    ]
    def horizontal_dirs
        ['both', 'rowcol'].include?(self.move_dirs) ? HORIZONTAL_DIRS : []
    end

    def diagonal_dirs
        ['both', 'diag'].include?(self.move_dirs) ? DIAGONAL_DIRS : []
    end

    def moves
        # debugger
        dirs = horizontal_dirs + diagonal_dirs
        moves_array = []
        dirs.each do |dir|
        moves_array += grow_unblocked_moves_in_dir(dir.first,dir.last)
        end
        moves_array
    end

    private
    def move_dirs #overwirtten by subclass
        raise "you need move_dirs for your piece"
    end

    def grow_unblocked_moves_in_dir(dx,dy)
        x, y = self.pos
        unblocked_array = []
        i, j = dx, dy
        while board.valid_index?([x + i, y + j]) && board[[x + i, y + j]].empty? 
            unblocked_array << [x + i, y + j]
            i += dx
            j += dy
        end
        
        if board.valid_index?([x + i,y + j]) && self.color != board[[x + i, y + j]].color
            unblocked_array << [x + i, y + j]
        end
        unblocked_array
    end
end
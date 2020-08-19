module slideable
    def horizontal_dirs
        ['both', 'rowcol'].include?(self.move_dirs)
    end

    def diagonal_dirs
        ['both', 'diag'].include?(self.move_dirs)
    end

    def moves
    end

    private
    def move_dirs #overwirtten by subclass
    end

    def grow_unblocked_moves_in_dir(dx,dy)
    end
end
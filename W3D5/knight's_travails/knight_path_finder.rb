require '../poly_tree_node/lib/00_tree_node.rb'
require 'set'
require 'byebug'

class KnightPathFinder
  attr_reader :root_node, :considered_positions

  def self.root_node(starting_pos)
    root_node = PolyTreeNode.new(starting_pos)
    new(root_node)
  end

  def initialize(root_node)
    @root_node = root_node
    @considered_positions = Set.new
    @considered_positions << @root_node.value
  end

  def new_move_postions(current_pos)
    x, y = current_pos.value
    new_moves = []
    legal_moves = [[x + 2, y + 1],
                   [x + 2, y - 1],
                   [x - 2, y + 1],
                   [x - 2, y - 1],
                   [x + 1, y + 2],
                   [x + 1, y - 2],
                   [x - 1, y + 2],
                   [x - 1, y - 2]]
    legal_moves.each do |position|
      if valid_moves?(position) && !(considered_positions === position)
        new_moves << position
        considered_positions << position
      end
    end
    new_moves
  end

  def valid_moves?(pos)
    pos[0].between?(0, 7) && pos[1].between?(0, 7)
  end

  def build_move_tree(start_pos = root_node)
    # debugger
    child = new_move_postions(start_pos)
    # debugger
    start_pos.add_child(PolyTreeNode.new(child.shift)) until child.empty?

    start_pos.children.each { |child| build_move_tree(child) }
  end
end

# tree = KnightPathFinder.root_node([4, 4])
# tree.build_move_tree
# p tree.root_node

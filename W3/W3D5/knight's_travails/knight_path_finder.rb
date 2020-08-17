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
    @considered_positions = Set.new([@root_node.value])
  end

  def new_move_positions(current_pos)
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

  def build_move_tree
    queue = [root_node]
    
    until queue.empty?
      node = queue.shift
      new_moves = new_move_positions(node)
      new_moves.each {|move| node.add_child(PolyTreeNode.new(move))}
      queue += node.children
    end

  end


  def find_path(target_pos)
    target_node = root_node.bfs(target_pos)
    trace_path_back(target_node)
  end

  def trace_path_back(target_node)
    tmp = target_node
    path = [tmp.value]
    while tmp.parent
      tmp = tmp.parent
      path.unshift(tmp.value)
    end
    path
  end
end

tree = KnightPathFinder.root_node([0, 0])
tree.build_move_tree
p tree.root_node
p tree.considered_positions
p tree.find_path([7, 6])
p tree.find_path([6, 2])
# tree.root_node.children.each do |child| 
#   p child
#   p child.children
# end
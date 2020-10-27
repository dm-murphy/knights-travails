# Find depth of tree
# Calculate depth of leaf node matching finish to the start root and set to a depth variable

# How to display the path of nodes from start to finish?
# Starting from start root to leaf node matching finish, add each child node along the way into a new path_array
# Pass path_array and depth variables to output_result method

class Tree
  attr_accessor :start, :finish

  def knight_moves(start, finish)
    @start = Knode.new(start)
    @finish = finish
    @visited = [start]
    build_tree
    p @visited
  end

  def build_tree(start = @start)
    return if start.coord == @finish
    # find possible moves for starting position
    start.possible_moves.each do |move|
      # if a move from possible_moves is included in @visited, skip to the next move?
      next if @visited.include?(move)
      # for each move, create child node
      knight_child = Knode.new(move)
      # push each child node into children array of starting node
      start.children.push(knight_child) # previously was (move)
      # for each child node set a parent node of starting node
      knight_child.parent = start
      # push each child node coordinates to @visited array
      @visited.push(knight_child.coord)
      # recursively call build_tree with child node
      build_tree(knight_child)
    end
  end
end

class Knode
  attr_accessor :coord, :possible_moves, :children, :parent

  def initialize(coord)
    @coord = coord
    @possible_moves = []
    @children = []
    @parent = nil
    find_moves(coord)
  end

  def find_moves(coord)

    coord_changes = [[1, 2],
                     [2, 1],
                     [2, -1],
                     [1, -2],
                     [-1, -2],
                     [-2, -1],
                     [-2, 1],
                     [-1, 2]
                    ]

    available_moves = []

    coord_moves = coord_changes.map do |x, y|
      [coord[0] + x, coord[1] + y]
    end

    coord_moves.map do |x, y|
      available_moves.push([x, y]) if x.between?(0, 7) && y.between?(0,7)
    end

    @possible_moves = available_moves
  end
end

game = Tree.new
game.knight_moves([0, 0], [1, 2])
puts
puts
puts
# game.knight_moves([1,2], [3,3])
# puts
# puts
# puts
# game.knight_moves([2,1], [3,3])
# puts
# game.start.possible_moves






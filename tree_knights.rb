# How to display the path of nodes from start to finish?
# Starting from start root to leaf node matching finish, add each child node along the way into a new path_array
# Pass path_array and depth variables to output_result method




# Also still need to print out the path

class Tree
  attr_accessor :start, :finish

  def knight_moves(start, finish)
    @start = Knight.new(start)
    @finish = finish
    @visited = [start]
    build_tree
  end

  def build_tree(queue = [@start])
    return if queue.empty?

    #Keep for debugging
    puts "Coordinates in queue: " 
    queue.each {|a| p a.coord}
    puts
    puts "Current coordinates = queue.last.coord: "
    p queue.last.coord
    puts
    ###

    current = queue.last
    if current.coord == @finish
      puts "Finish Found!" # Keep for debugging
      depth(current)
      return
    end
      
    current.possible_moves.each do |move|
      next if @visited.include?(move)

      knight_child = Knight.new(move)
      current.children.push(knight_child)
      knight_child.parent = current
      @visited.push(knight_child.coord)
      queue.unshift(knight_child)
    end

    queue.pop
    build_tree(queue)
  end

  def depth(node, counter = 0, array = [])
    array.unshift node.coord
    if node == @start
      puts counter
      p array
      return counter 
    end  
    depth(node.parent, counter + 1, array)
  end
end

class Knight
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
                     [-1, 2]]
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
game.knight_moves([0, 0], [3, 3])

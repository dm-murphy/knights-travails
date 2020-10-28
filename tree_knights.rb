# Find depth of tree
# Calculate depth of leaf node matching finish to the start root and set to a depth variable

# How to display the path of nodes from start to finish?
# Starting from start root to leaf node matching finish, add each child node along the way into a new path_array
# Pass path_array and depth variables to output_result method




# OK, so GREAT it works and prints number of moves.
# BUT it keeps going and going afterwards
# Also still need to print out the path

class Tree
  attr_accessor :start, :finish

  def knight_moves(start, finish)
    @start = Knight.new(start)
    @finish = finish
    @visited = [start]
    return build_tree
    #p @visited
    #puts
    #p @start    
  end

  def depth(node, counter = 0, root_node = @start)
    if node == root_node
      puts counter
      return counter 
    end
    #puts "Node: #{node.coord} / Parent: #{node.parent.coord}"
    
    depth(node.parent, counter + 1, @start)
  end

  def build_tree(queue = [@start])
    #Keep for debugging
    puts "This is the method's queue:" 
    puts queue
    queue.each {|a| p a.coord}
    puts
    puts "Build Tree queue.last.coord: #{queue.last.coord}"
    ###
    current = queue.last
    if current.coord == @finish
      puts "Finish Found!" # Keep for debugging
      depth(current)
      return
    end

    until queue.empty?
      return nil if queue.nil?

      
      current.possible_moves.each do |move|
        next if @visited.include?(move)

        knight_child = Knight.new(move)
        current.children.push(knight_child)
        knight_child.parent = current
        @visited.push(knight_child.coord)
        queue.unshift(knight_child)



        
        # build_tree(queue)


      end
      # Keep for debugging
      puts "This queue will carry over"
      puts queue
      queue.each {|a| p a.coord}
      puts 
      puts "Except now popped this queue will carry over"
      queue.pop
      puts queue
      queue.each {|a| p a.coord}
      puts
      
      build_tree(queue)
    end
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

  # def build_tree_OG(start = @start)
  #   puts "Build Tree start.coord: #{start.coord}"
  #   if start.coord == @finish
  #     puts "pizza"
  #     depth(start)
  #     return 
  #   end

  #   # DEBUG
  #   #p start.possible_moves

  #   # find possible moves for starting position
  #   start.possible_moves.each do |move|

  #     # if a move from possible_moves is included in @visited, skip to the next move?
  #     next if @visited.include?(move)

  #     # for each move, create child node
  #     knight_child = Knight.new(move)

  #     # push each child node into children array of starting node
  #     start.children.push(knight_child)

  #     # for each child node set a parent node of starting node
  #     knight_child.parent = start

  #     # push each child node coordinates to @visited array
  #     @visited.push(knight_child.coord)

  #     # DEBUG
  #     puts "Knight_child.coord: #{knight_child.coord}" 

  #     # recursively call build_tree with new child node
  #     build_tree_OG(knight_child)
  #   end
  # end


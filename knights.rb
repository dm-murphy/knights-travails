class Node
  attr_accessor :coord

  def initialize(coord)
    @coord = coord
  end
end

class Board
  attr_accessor :knight, :start, :finish

  def initialize
    @knight = nil
    @start = nil
    @finish = nil
  end

  def knight_moves(start, finish)
    @start = Node.new(start)
    @finish = Node.new(finish)
    @knight = @start
  end

  def generate_unvisited
    # Start with list of all possible coordinates
    # Remove the Start position
    # Remove the Knight position
    # Return remaining positions as array

    positions = [[0,0],[0,1],[0,2],[0,3],[0,4],[0,5],[0,6],[0,7],
                 [1,0],[1,1],[1,2],[1,3],[1,4],[1,5],[1,6],[1,7],
                 [2,0],[2,1],[2,2],[2,3],[2,4],[2,5],[2,6],[2,7],
                 [3,0],[3,1],[3,2],[3,3],[3,4],[3,5],[3,6],[3,7],
                 [4,0],[4,1],[4,2],[4,3],[4,4],[4,5],[4,6],[4,7],
                 [5,0],[5,1],[5,2],[5,3],[5,4],[5,5],[5,6],[5,7],
                 [6,0],[6,1],[6,2],[6,3],[6,4],[6,5],[6,6],[6,7],
                 [7,0],[7,1],[7,2],[7,3],[7,4],[7,5],[7,6],[7,7]]
    
    positions.delete_if { |s| s == @start.coord }
    positions.delete_if { |k| k == @knight.coord }
    positions
  end

  def generate_moves
    # generate array listing all nodes on unvisited list within board bounds and one move away from current position
    #available_moves 
    move1 = [@knight.coord[0] + 1, @knight.coord[1] + 2]
    coord_match?(move1)

    # What if you just made the knight?
    # @knight = [@knight.coord[0] + 1, @knight.coord[1] + 2]

    # move2 = [@knight.coord[0] + 2, @knight.coord[1] + 1]
    # move3 = [@knight.coord[0] + 2, @knight.coord[1] - 1]
    # move4 = [@knight.coord[0] + 1, @knight.coord[1] - 2]
    # move5 = [@knight.coord[0] - 1, @knight.coord[1] - 2]
    # move6 = [@knight.coord[0] - 2, @knight.coord[1] - 1]
    # move7 = [@knight.coord[0] - 2, @knight.coord[1] + 1]
    # move8 = [@knight.coord[0] - 1, @knight.coord[1] + 2]
    
    #possible = move1, move2, move3, move4, move5, move6, move7, move8
    #positions = generate_unvisited
    #visited = positions.map{|x,y| [x,y]} - possible.map{|x,y| [x,y]}

    # What I want:
    # If the move is NOT in @positions, I don't want it returned.

    # But wait, why? What happens when you double up in two routes and they cross
    # the same position? Can that happen? YES But that's when using an instance variable
    # what if we localize the method and just keep calling it new?

    #################################################################

    # Maybe just start with 1 move and finish it through to get it's counter and path
    # Then move onto the next move from start
    # Then the next until all 8 are completed.

    # So take Move 1
    # Is it the @finish move?
      # If YES, then set counter and path somehow
      # Else if no, then check if valid
    # Is it a valid move?
      # Could check it with math and make sure coordinates are legit
      # OR could compare it to unvisited moves and make sure it exists?
        # If it has not been visited yet, remove from the visited list
        # Next, rerun generate_moves and continue, while also adding a counter

  end
    




  # def uncheck_visited
    # remove coordinates from unvisited list

  def coord_match?(coord)
    # compare @end with set coordinates
      # if match
        # then stop the set
      # else
        # keep set looping
    coord == @finish

  end


  # def compare_sets
    # go through each set and find smallest counter
    # call display_result(set)

  # def display_result(set)
    # output the counter for shortest route
    # output the route path  

end

# Driver Script

board = Board.new
board.knight_moves([3, 3], [4, 3])
puts "Knight: #{board.knight.coord}"
puts "Start: #{board.start.coord}"
puts "Finish: #{board.finish.coord}"
puts "Unvisited: "
p board.generate_unvisited
puts
puts
p board.generate_moves
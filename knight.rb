# frozen_string_literal: true

# Creates knight (node) objects for Tree class with coordinates, possible moves and links to parent and children nodes
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

    coord_moves = coord_changes.map do |x, y|
      [coord[0] + x, coord[1] + y]
    end
    coord_moves.map do |x, y|
      @possible_moves.push([x, y]) if x.between?(0, 7) && y.between?(0,7)
    end
  end
end

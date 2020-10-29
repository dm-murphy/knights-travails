# frozen_string_literal: true

require_relative 'tree.rb'
require_relative 'knight.rb'

game = Tree.new
game.knight_moves([0, 0], [3, 3])

# Project

This assignment from [The Odin Project](https://www.theodinproject.com/courses/ruby-programming/lessons/knights-travails) is the first part of working towards making a working chess game, the final project in the Ruby course.

In this task, a data structure similar to a binary tree is constructed to keep track of the knight piece's moves. In chess, the knight can reach any square on the board with enough turns by moving in a two steps forward and one step to the side pattern. 

This assingment calculates all the available moves for the knight piece and outputs the shortest path between the starting position and desired position.

This program uses recursion, breadth-first tree traversal and a FIFO queue approach.

There are a number of ways to approach this project, such as graphing or Dijkstra's algorithm, but here a simple tree of nodes (or Knights) was formed on the fly as the tree searches level by level from the starting coordinates to locate the ending position.

# Repl.it

Check it out on [Repl.it](https://repl.it/@dmmurphy/RubyKnightsTravails#main.rb)


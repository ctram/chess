# -*- coding: utf-8 -*-
require_relative 'piece'

class Pawn < Piece
  PAWN_DELTAS = [ [1,0], [2,0], [1, 1], [1, -1] ]
  attr_reader :moved

  def initialize(position, board, color)
    super(position, board, color)
    @moved = false
  end

  def possible_moves
    positions = []

    if color == :black
      adjuster = 1
    else
      adjuster = -1
    end

    adjusted_deltas = PAWN_DELTAS.map do |delta|
      x = delta[0] * adjuster
      y = delta[1] * adjuster
      [x,y]
    end

    if moved == false # very first move
      adjusted_deltas
    else # if you have moved
      adjusted_deltas.delete_at(1)
    end

    # else , he can move up one, or up diagonally ONLY if there's an enemy to his diagonal.
    adjusted_deltas.each do |delta|
     new_pos = (delta[0] + pos[0]), (delta[1] + pos[1])
     positions << new_pos
    end

   # at the pawn's diagonal position, is there an enemy?

    2.times do |i|
      testing_position = positions[i-2]
      x = testing_position[0]
      y = testing_position[1]
      if board.grid[x][y].nil? or board.grid[x][y].color == color
        positions.delete_at(i-2)
      end
    end

    positions
  end

  def symbol(color)
    hash = { white: 'P', black: 'p' }
    hash[color]
  end
end

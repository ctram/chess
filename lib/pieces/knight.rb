# -*- coding: utf-8 -*-
require_relative 'piece'
require_relative 'stepable'

class Knight < Piece
  include Stepable
  KNIGHT_DELTAS = [
    [ 1,  2],
    [ -1, 2],
    [ 1, -2],
    [-1, -2],
    [ 2,  1],
    [ 2, -1],
    [-2,  1],
    [-2, -1]
  ]


  def symbol(color)
    hash = { white: 'H', black: 'h' }
    hash[color]
  end

  def directions
    KNIGHT_DELTAS
  end

end

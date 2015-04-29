# -*- coding: utf-8 -*-
require_relative 'piece'
require_relative 'stepable'

class Knight < Piece
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

  def directions
    KNIGHT_DELTAS
  end

end

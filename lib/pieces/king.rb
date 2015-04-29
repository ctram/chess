# -*- coding: utf-8 -*-
require_relative 'piece'
require_relative 'stepable'

class King < Piece
  include Stepable

  KING_DELTAS = [
      [ 1 , 1],
      [-1, -1],
      [ 1, -1],
      [-1,  1],
      [ 0,  1],
      [ 0, -1],
      [-1,  0],
      [ 1,  0]
    ]

    def directions
      KING_DELTAS
    end

end

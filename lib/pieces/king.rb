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


    def symbol(color)
      hash = { white: 'K', black: 'k' }
      hash[color]
    end


    def directions
      KING_DELTAS
    end

end

# -*- coding: utf-8 -*-
require_relative 'piece'
require_relative 'slideable'

class Queen < Piece
  include Slideable

  def symbol(color)
    hash = { white: 'Q', black: 'q' }
    hash[color]
  end

  def directions
    diag_deltas + straight_deltas
  end

end

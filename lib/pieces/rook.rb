# -*- coding: utf-8 -*-
require_relative 'piece'
require_relative 'slideable'

class Rook < Piece
  include Slideable


  def initialize(start_position, board, color)
    super
  end

  def directions
    straight_deltas
  end
end

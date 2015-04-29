# -*- coding: utf-8 -*-
require_relative 'piece'
require_relative 'slideable'

class Rook < Piece
  include Slideable

  DIRECTIONS = [[1, 0], [0, 1], [-1, 0], [0, -1]]

  def initialize(start_position, board, color)
    super
  end

  def directions
    DIRECTIONS
  end
end

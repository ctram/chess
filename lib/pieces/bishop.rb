# -*- coding: utf-8 -*-
require_relative 'piece'
require_relative 'slideable'

class Bishop < Piece
  include Slideable

  attr_accessor :board

  DIRECTIONS = [[1, 1], [-1, -1], [1, -1], [-1, 1]]

  def initialize(start_position, board, color)
    super
  end

  def directions
    DIRECTIONS
  end
end

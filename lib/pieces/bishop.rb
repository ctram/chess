# -*- coding: utf-8 -*-
require_relative 'piece'
require_relative 'slideable'

class Bishop < Piece
  include Slideable

  attr_accessor :board

  # def initialize(start_position, board, color)
  #   super
  # end

  def directions
    diag_deltas
  end
end

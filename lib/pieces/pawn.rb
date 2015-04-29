# -*- coding: utf-8 -*-
require_relative 'piece'

class Pawn < Piece

  def symbol(color)
    hash = { white: 'P', black: 'p' }
    hash[color]
  end


end

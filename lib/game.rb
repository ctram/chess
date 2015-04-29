require 'byebug'
require_relative 'board'

class Game

  def play
    until win
    end
  end
end

class HumanPlayer
end


b = Board.new(true)

b.render

rook = b.grid[1][0]
rook.move([5,5])
b.render

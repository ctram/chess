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

king = b.grid[0][3]
rook = b.grid[1][0]
king.move([5,3])
b.render
p b.in_check?(king.color)

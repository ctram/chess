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

k = King.new([0,0], b, :black)

bish = Bishop.new([7,7], b, :white)

k.possible_moves

# bish.possible_moves

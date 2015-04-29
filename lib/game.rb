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


bish = Bishop.new([4,4], b, :white)
k = King.new([0,0], b,  :black)
puts "KINGS"
p k.possible_moves
#
puts "BISHOPS"
p bish.possible_moves.inspect
#
# p b.occupied?([0,0])
# p b.piece_at([0,0])
# p b[[0,0]]
# p b[[-1,-1]]

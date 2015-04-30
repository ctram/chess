require 'byebug'
require_relative 'board'

class Game

  def play
    until over?
      # render the board
      player_takes_a_turn
        # does the move put the current player in check
      # toggle the player
    end
  end

  def player_takes_a_turn
    # check to see whether player's choice is valid i.e. does not put him into check
    player_new_board = Board.new(false)

    player_new_board.in_check?

    board.in_check

  end



end

class HumanPlayer
end


c = Board.new(true)

# king = b.grid[0][3]
# rook = b.grid[1][0]
c.grid[1][4].move([3,4])
c.grid[6][5].move([5,5])
c.grid[6][6].move([4,6])
c.grid[0][3].move([4,7])

c.render
p c.in_check?(:white)
p c.checkmate?(:white)

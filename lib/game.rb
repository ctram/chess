require 'byebug'
require_relative 'board'

class Game

  def initialize(player1, player2)
    @board = Board.new(true)
    player1.color = :white
    player2.color = :black

    @current_player = player1

  end

  def play


    until over?
      @board.render
      start_pos, end_pos = @current_player.get_move
      @board[start_pos].move(end_pos)

    end
  end

  def switch_player
    @current_player = @current_player == player1 ? player2 : player1
  end

  def over?
    @board.checkmate?(:black) || @board.checkmate?(:white)
  end


end

class HumanPlayer

  def initialize
  end

  def get_move
    prints "specify starting coordinates ( x,y ) :"
    start_pos = gets.chomp.split(",").map! { |str| str.to_i }
      # unless board.piece_at(start_pos).color == @current_player.color
    prints "specify ending coordinates ( x,y ) :"
    end_pos = gets.chomp.split(", ").map! { |str| str.to_i }
    [start_pos, end_pos]
  end



end

#
# c = Board.new(true)
#
# # king = b.grid[0][3]
# # rook = b.grid[1][0]
# c.grid[1][4].move([3,4])
# c.grid[6][5].move([5,5])
# c.grid[6][6].move([4,6])
# c.grid[0][3].move([4,7])
#
# c.render
# p c.in_check?(:white)
# p c.checkmate?(:white)

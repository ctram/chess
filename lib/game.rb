require 'byebug'
require_relative 'board'

class Game

  def initialize(player1, player2)
    @board = Board.new(true)
    player1 = HumanPlayer.new(:white)
    player2 = HumanPlayer.new(:black)

    @current_player = player1

  end


  def accidental_checking?(player_choices)
    s_pos, e_pos = player_choices
    new_board = board.dup
    board.piece_at(s_pos).move(e_pos)
    if board.in_check?
      puts "You can not put yourself into check."
      true
    end
    false
  end

  def commit_move(player_choices)
    s_pos, e_pos = player_choices
    board.piece_at(s_pos).move(e_pos)
  end

  def play
    puts 'Game begins. Player1 goes first.'
    until over?
      @board.render
      player_choices = @current_player.take_turn
      next if self.accidental_checking?(player_choices)
      commit_move(player_choices)
      switch_current_player
    end
  end

  def switch_current_player
    @current_player = @current_player == player1 ? player2 : player1
    puts "#{@current_player} is no"
  end

  def over?
    @board.checkmate?(:black) || @board.checkmate?(:white)
  end


end

class HumanPlayer
  attr_reader :color

  def initialize(color)
    @color = color

  end

  # return position, an array.
  def get_move(pos_type)
    if pos_type == :pick_piece
      prints "Specify starting coordinates ( x,y ) :"
      s_pos = gets.chomp.split(",").map! { |str| str.to_i }
    else
      puts 'Pick destination for your piece.'
      start_pos = gets.chomp.split(",").map! { |str| str.to_i }
    end
  end

  def take_turn
    s_pos = nil
    until valid_start_position?(pos)
      s_pos = get_move(:pick_piece)
    end
    e_pos = nil
    until valid_end_position?(pos)
      e_pos = get_move(:place_piece)
    end
    [s_pos, e_pos]
  end

  def valid_end_position?(pos)
    unless board.on_board?(pos) and board.piece_at(pos).color != color
      puts 'You must place your piece onto valid board coordinates and it must not be placed onto your own pieces.'
    end
  end

  def valid_start_position?(pos)
    unless board.on_board?(pos) and board.piece_at(pos).color == color
      puts 'You must pick a position on the board and your own piece.'
      false
    end
    true
  end


end

#
board = Board.new(true)
p board.empty?([1,1])
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

require 'byebug'
require_relative 'board'

class Game
  attr_accessor :current_player

  def initialize(player1, player2)
    @messages = []

    @board = Board.new(true)

    @player1 = player1
    @player2 = player2

    @player1.color = :white
    @player2.color = :black

    @player1.board = @board
    @player2.board = @board

    @player1.name = 'Player 1'
    @player2.name = 'Player 2'

    @current_player = @player1
  end

  def accidental_checking?(player_choices, player_color)
    s_pos, e_pos = player_choices
    # TODO: need to deep dup the board to avoid in_check? from moving the original board's pieces
    new_board = @board.dup_board
    new_board.piece_at(s_pos).move(e_pos)
    if new_board.in_check? player_color
      puts "You cannot put yourself into check."
      return true
    end
    false
  end

  def commit_move(player_choices)
    s_pos, e_pos = player_choices
    @board.piece_at(s_pos).move(e_pos)
  end

  def over?
    @board.checkmate?(:black) || @board.checkmate?(:white)
  end

  def play
    puts 'Game begins. Player 1 goes first.'
    until over?
      @board.render
      player_choices = self.take_turn
      piece = @board.piece_at player_choices.first
      # until the move that the player picked is a valid move of the piece, running take_turn()

      player_color = @current_player.color
      next if ((self.accidental_checking? player_choices, player_color) or (!self.valid_move_pattern? piece, player_choices.last))
      commit_move(player_choices)
      switch_current_player
    end
  end

  def print_messages
    @messages.each {|msg| puts msg}
    puts
    @messages = []
  end

  def switch_current_player
    @current_player = @current_player == @player1 ? @player2 : @player1
    puts "Now it is #{@current_player}'s turn"
    puts
  end

  def take_turn
    print_messages

    begin
      puts "#{@current_player.name}'s turn to move:"
      s_pos = @current_player.get_move(:pick_piece)
      puts
    end until @current_player.valid_start_position?(s_pos)
    begin
      puts "Choose a destination:"
      e_pos = @current_player.get_move(:place_piece)
      puts
    end until @current_player.valid_end_position?(e_pos)
    [s_pos, e_pos]
    # TODO: need to check that the move is within the piece's accepted movement pattern.
  end

  def valid_move_pattern? piece, e_pos
    # FIXME: message is not being printed becaue game is clearing the message upon the next rendering of the board.
    # takes in a piece and an array of start and end positions
    unless piece.possible_moves.include? e_pos
      @messages.push "That is not a valid move for your piece. Please try again."
      return false
    end
    true
  end
end

class HumanPlayer
  attr_accessor :color, :board, :name

  def initialize(name)
    @color = nil
    @name = name
  end

  # return position, an array.
  def get_move(pos_type)
    if pos_type == :pick_piece
      print "Specify starting coordinates (row, col): "
      s_pos = gets.chomp.split(",").map! { |str| str.to_i }
    else
      puts 'Pick destination for your piece (row, col): '
      start_pos = gets.chomp.split(",").map! { |str| str.to_i }
    end
  end

  def valid_end_position?(pos)
    # TODO: a valid end position is one where there is an empty space?
    unless (board.piece_at(pos) == nil) or (board.on_board?(pos) and board.piece_at(pos).color != color)
      puts 'You must place your piece onto valid board coordinates and it must not be placed onto your own pieces.'
      return false
    end
    true
  end

  def valid_start_position?(pos)
    # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    # FIXME: NEXT you want to use game.messages but that is in the game object, and this method is in the human object - need to pass in the the game to the player....?
    debugger
    unless board.on_board?(pos) and board.piece_at(pos) != nil and board.piece_at(pos).color == color
      @messages.push 'You must pick a position on the board and your own piece.'
      return false
    end
    true
  end
end
player1 = HumanPlayer.new('Player 1')
player2 = HumanPlayer.new('player 2')

game = Game.new(player1, player2)
game.play
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

require_relative 'pieces'
require 'byebug'
class Board
  attr_accessor :grid

  def initialize(fill_board = true)
    make_starting_grid(fill_board)
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, piece)
    x, y = pos
    @grid[x][y] = piece
  end

  def checkmate?(color)
    # if incheck, need to check whether the king's color's pieces include possible moves that will lead to a board state that is not in check.

    friendly_pieces = find_pieces_of_color(color)
    # friendly_possible_moves = []
    friendly_pieces.any? do |piece|
      piece.possible_moves.any? do |pos|
        new_board = self.dup_board
        x = piece.pos[0] # piece's current position
        y = piece.pos[1]
        new_board.grid[x][y].move(pos)
        !new_board.in_check?(color)
      end
    end
  end

  def in_check?(color)
    king_pos = find_king(color).pos
    color = (color == :black ? :white : :black)
    enemy_pieces = find_pieces_of_color(color)
    enemy_possible_moves = []
    enemy_pieces.each do |piece|
      enemy_possible_moves += piece.possible_moves
    end
    # byebug

    enemy_possible_moves.include?(king_pos) ? true : false
  end

  # def checkmate?(color)
  #
  #   king = find_king(color)
  #   king.possible_moves.none? do |pos|
  #     new_board = self.dup
  #     new_board.find_king(color).move(pos)
  #     new_board.in_check?(color)
  #   end
  # end

  def dup_board
    new_board = Board.new(false)
    pieces = get_pieces
    pieces.each do |piece|
      piece.dup(new_board)
    end
    new_board
  end

  def get_pieces
    @grid.flatten.compact
  end

  def fill_back_rows(color)
    back_pieces = [Rook, Bishop, Knight, Queen, King, Knight, Bishop, Rook]
    back_pieces.each_with_index do |piece, col|
      row = color == :black ? 0 : 7
      @grid[row][col] = piece.new([row, col], self, color)
    end
  end

  def fill_pawn_rows(color)
    row = color == :black ? 1 : 6
    8.times do |col|
      @grid[row][col] = Pawn.new([row, col], self, color)
    end
  end

  def render
    system 'clear'
    puts "______________________________"
    @grid.each do |row|   # right now grid is an array of pieces,
       row.each do |piece|
        print "#{piece.symbol(piece.color)}  " if piece != nil
        print " . " if piece == nil
      end
      print "\n"
    end
  end


  def find_pieces_of_color(color)
    pieces = @grid.flatten.compact.select{|piece| piece.color == color}
  end

  def find_king(color)
    # begin
    king = @grid.flatten.compact.find do |piece|
      piece.is_a?(King) && piece.color == color
    end
    if king == nil

      raise "No King found"
    else
      king
    end
  end


  def make_starting_grid(fill_board)
    @grid = Array.new(8) { Array.new(8) }
    return unless fill_board
    [:black, :white].each do |color|
      fill_back_rows(color)
      fill_pawn_rows(color)
    end
  end

  def piece_at(pos)
    self[pos]
  end

  def occupied?(pos)
    self.piece_at(pos) != nil ? true : false
  end

  def on_board?(pos)
    x, y = pos
    (x < @grid.size and x > 0) and (y < @grid.size and y > 0)
  end




end

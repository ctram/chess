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
    @grid[x][y]= piece
  end

  def check?
  end

  def checkmate?(color)
    what color?
    king.possible_moves
  end

  # def dup
  #
  # end

# original code
  # def deep_dup
  #   @grid.map do |e|
  #     if e.is_a? Array
  #       e.deep_dup
  #     else
  #       e
  #     end
  #   end
  # end

  # brainstorm
  # def deep_dup
  #   @grid.map do |e|
  #     if e.is_a? Array
  #       e.deep_dup
  #     else
  #       e.deep_dup <- this is a Piece object - you need to deep_dup it(?) because the piece will have references to the original board but you want a new board(?)
  #     end
  #   end
  # end

  def fill_back_rows(color)
    back_pieces = [Rook, Bishop, Knight, King, Queen, Knight, Bishop, Rook]
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
    @grid.each do |row|   # right now grid is an array of pieces,
       row.each do |piece|
        print "#{piece.symbol(piece.color)}  " if piece != nil
        print " . " if piece == nil
      end
      print "\n"
    end
  end

  def in_check?(color)
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

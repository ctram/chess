class Piece
  attr_accessor :pos, :color, :board

  def initialize(starting_pos, board, color)
    @pos = starting_pos
    @board = board
    @color = color

  end

  def dup(new_board)
    new_piece = self.class.new(@pos, new_board, @color)
    x, y = @pos
    new_board.grid[x][y] = new_piece
    new_piece
  end

  def move(new_pos)
    @moved = true if !@moved
    @board[@pos]= nil
    # byebug
    @pos = new_pos
    @board[@pos]= self
  end


  def possible_moves
    raise "not yet implemented"
  end


  # def valid_moves(positions)
  #   positions.reject do |pos|
  #     # in_check?(color)
  #
  # end
  # #
  # def player_turn (
  #   vali
  #   )


end

class Piece
  attr_accessor :pos

  # DIRECTIONS = [[1, 1], [-1, -1], [1, -1], [-1, 1]]


  def initialize(starting_pos, board, color)
    @pos = starting_pos
    @board = board
    @color = color
  end

  def move(new_pos)
    @moved = true if !@moved
    @board[@pos] = nil
    @board[new_pos] = self
    @pos = new_pos
  end


  def possible_moves
    raise "not yet implemented"
  end


  def valid_moves

  end

end

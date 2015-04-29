module Slideable
  DIAG_DELTAS = [
    [ 1 ,  1],
    [-1,  -1],
    [ 1,  -1],
    [-1,   1]
  ]

  STRAIGHT_DELTAS = [
    [ 0,  1],
    [ 0, -1],
    [-1,  0],
    [ 1,  0]
  ]

  def diag_deltas
    DIAG_DELTAS
  end

  def straight_deltas
    STRAIGHT_DELTAS
  end

  def possible_moves
    positions = []
    i = 1
    directions.each do |dir|
      until i == @board.grid.size
        new_x = @pos[0] + dir[0] * i
        new_y = @pos[1] + dir[1] * i
        new_pos = [new_x, new_y]
        if !@board.on_board?(new_pos)
          i = 1
          break
        end
        # if !board.on_board?(new_pos) and i == @board.grid.size
        #

        if @board.occupied?(new_pos)
          if @board.piece_at?(new_pos).color == @color
            i = 1
            break
          else
            i = 1
            positions << new_pos
            break
          end
        else
          i +=1
          positions << new_pos
        end
      end
    end

    positions
  end



end

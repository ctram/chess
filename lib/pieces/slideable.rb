module Slideable
  def possible_moves
    # byebug
    positions = []
    i = 1
    directions.each do |dir|
      until i == @board.grid.size
        new_x = @pos[0] + dir[0] * i
        new_y = @pos[1] + dir[1] * i
        new_pos = [new_x, new_y]
        if !@board.on_board?(new_pos)
          i = 1
          next
        end

        if @board.occupied?(new_pos)
          if @board.piece_at?(new_pos).color == @color
            i = 1
            next
          else
            i = 1
            positions << new_pos
            next
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

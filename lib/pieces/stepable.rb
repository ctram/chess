module Stepable

  def possible_moves
    positions = []
    directions.each do |dir|
      del_x, del_y = dir
      cur_x, cur_y = pos
      new_x, new_y = del_x + cur_x, del_y + cur_y
      new_pos = [new_x, new_y]
      if board.on_board?(new_pos)
        positions << [new_x, new_y]
      end
    end

    positions
  end
end

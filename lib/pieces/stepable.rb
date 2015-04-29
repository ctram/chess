module Stepable

  def possible_moves
    positions = []
    directions.each do |dir|
      del_x, del_y = dir
      cur_x, cur_y = pos

      possible_moves << [del_x + cur_x, del_y + cur_y]
    end

    positions
  end
end

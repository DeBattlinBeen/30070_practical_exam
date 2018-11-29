class Point
  def initialize(coord_x, coord_y)
    @coord_x = coord_x
    @coord_y = coord_y
  end

  def to_s
    "(#{@coord_x.round(1)},#{@coord_y.round(1)})"
  end
end
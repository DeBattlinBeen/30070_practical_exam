class Point
  attr_reader :coord_x, :coord_y

  def initialize(coord_x, coord_y)
    @coord_x = coord_x
    @coord_y = coord_y
  end

  def line_segment(other_point)
    Math.sqrt((coord_x-other_point.coord_x)**2 + (coord_y-other_point.coord_y)**2)
  end

  def to_s
    "(#{@coord_x.round(1)},#{@coord_y.round(1)})"
  end
end
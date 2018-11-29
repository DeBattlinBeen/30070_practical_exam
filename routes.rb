class Routes
  include Enumerable

  def initialize
    @routes = []
  end

  def add_route(route)
    @routes <<  route
  end

  def each
    @routes.each {|r| yield r}
  end

  def length(route_id)
    sum = 0.0
    route = @routes[0]
    each {|r| route = @routes[0] if r.id == route_id}

    route.each_line_segment {|len| sum += len}
    sum.round(2)
  end

  def to_s
    str = ""
    each {|r| str += "#{r}\n"}
    str
  end
end
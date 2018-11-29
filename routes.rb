class Routes
  def initialize
    @routes = []
  end

  def add_route(route)
    @routes << route
  end

  def to_s
    str = ""
    @routes.each {|r| str += "#{r}\n"}
    str
  end
end
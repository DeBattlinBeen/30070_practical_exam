require_relative 'bus_stop.rb'

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
    each {|r| route = r if r.id == route_id}
    route.each_line_segment {|len| sum += len}
    sum.round(2)
  end

  def find_next_stops(stop_id)
    next_stops = []
    each do |r|
      r.each_stop do |s, index|
        if s.id == stop_id
          unless r.stop(index + 1).nil?
            next_stops << r.stop(index + 1).id
          end
        end
      end
    end
    next_stops
  end

  def to_s
    str = ""
    each {|r| str += "#{r}\n"}
    str
  end
end
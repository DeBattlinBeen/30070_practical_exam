require_relative 'bus_stop.rb'
require_relative 'point.rb'

class Route
  attr_reader :id

  def initialize(id)
    @id = id
    @bus_stops = []
  end

  def add_bus_stop(bus_stop)
    @bus_stops << bus_stop
  end

  def stop(index)
    @bus_stops[index]
  end

  def each_stop
    @bus_stops.each_with_index {|stop, index| yield stop, index}
  end

  def each_line_segment
    i = 0
    (@bus_stops.size-1).times do
      yield @bus_stops[i].point.line_segment(@bus_stops[i+1].point)
      i += 1
    end
  end

  def to_s
    str = "Route \##{@id}: "
    i = 0
    (@bus_stops.size).times do
      str += "#{@bus_stops[i].name}"
      if i < @bus_stops.size-1
        str += ", "
      end
      i += 1
    end
    str
  end
end
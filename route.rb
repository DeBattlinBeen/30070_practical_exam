require_relative 'bus_stop.rb'

class Route
  def initialize(id)
    @id = id
    @bus_stops = []
  end

  def add_bus_stop(bus_stop)
    @bus_stops << bus_stop
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
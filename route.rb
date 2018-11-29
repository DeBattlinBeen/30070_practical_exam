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
    @bus_stops.each {|s| str += "#{s.name}, "}
    str
  end
end
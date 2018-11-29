require_relative 'bus_stop.rb'

class BusStops
  def initialize
    @bus_stops = []
  end

  def add_bus_stop(bus_stop)
    @bus_stops << bus_stop
  end

  def to_s
    str = ""
    @bus_stops.each {|s| str += "#{s}\n"}
    str
  end
end
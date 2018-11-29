require_relative 'bus_stop.rb'

class BusStops
  def initialize
    @bus_stops = []
  end

  def add_bus_stop(bus_stop)
    @bus_stops << bus_stop
  end

  def bus_stop(id)
    @bus_stops.each {|s| return s if s.id == id}
  end

  def sort_by_name!
    @bus_stops.sort! {|a,b| a.<=>(b)}
  end

  def to_s
    str = ""
    @bus_stops.each {|s| str += "#{s}\n"}
    str
  end
end
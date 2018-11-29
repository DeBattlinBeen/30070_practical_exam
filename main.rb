require_relative 'bus_stops.rb'
require_relative 'bus_stop.rb'
require_relative 'point.rb'

# Part 1
puts "\nPart 1:"

bus_stops = BusStops.new
begin
  IO.foreach("stops.txt") do |line|
    data = line.split
    bus_stops.add_bus_stop(BusStop.new(data[0].to_s, data[1].to_i, Point.new(data[2].to_f, data[3].to_f)))

  end rescue abort "Couldn't read 'stops.txt'"
end

puts bus_stops.to_s

# Part 2
puts "\nPart 2:"


# Part 3
puts "\nPart 3:"


# Part 4
puts "\nPart 4:"
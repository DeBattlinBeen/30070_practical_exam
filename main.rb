require_relative 'bus_stops.rb'
require_relative 'bus_stop.rb'
require_relative 'point.rb'
require_relative 'route.rb'
require_relative 'routes.rb'

# Part 1
puts "\nPart 1:"

bus_stops = BusStops.new
begin
  IO.foreach("stops.txt") do |line|
    data = line.split
    bus_stops.add_bus_stop(BusStop.new(data[0].to_s, data[1].to_i, Point.new(data[2].to_f, data[3].to_f)))

  end rescue abort "Couldn't read 'stops.txt'"
end

bus_stops.sort_by_name!
puts bus_stops.to_s

# Part 2
puts "\nPart 2:"

routes = Routes.new
begin
  IO.foreach("routes.txt") do |line|
    data = line.split
    route = Route.new(data[0].to_i)
    stop_index = data.size-1
    while stop_index > 0
      route.add_bus_stop(bus_stops.bus_stop(data[data.size-stop_index].to_i))
      stop_index -= 1
    end

    routes.add_route(route)
  end
end

puts routes.to_s


# Part 3
puts "\nPart 3:"


# Part 4
puts "\nPart 4:"
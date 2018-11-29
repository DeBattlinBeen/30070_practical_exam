require_relative 'bus_stop.rb'

class PathFinder
  def initialize(stops,routes)
    @bus_stops = stops
    @bus_routes = routes
  end

  def find_all_paths(stop)
    paths = [[stop.id]]
    create_path(paths, paths.size-1, stop)

    str = "All paths starting from stop #{stop.id}\n"
    paths.each do |path|
      str += "#{path.to_s}\n"
    end
    str
  end

  ## Recursive Function to create paths
  def create_path(paths, index, current_stop)
    next_stops = @bus_routes.find_next_stops(current_stop)

    unless next_stops.size == 0
      path = Array.new(paths[index])
      next_stops.each do |next_stop|
        if next_stop == next_stops[0]
          paths[index] << next_stop.id
          create_path(paths, index, next_stop)
        else
          path_1 = Array.new(path)
          path_1 << next_stop.id
          paths << path_1
          create_path(paths, paths.size-1, next_stop)
        end
      end
    end
  end
end
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

  def create_path(paths, index, stop)
    next_stops = @bus_routes.find_next_stops(stop)

    unless next_stops.size == 0
      path = Array.new(paths[index])
      next_stops.each do |s|
        if s == next_stops[0]
          paths[index] << s.id
          create_path(paths, index, s)
        else
          path_1 = Array.new(path)
          path_1 << s.id
          paths << path_1
          create_path(paths, paths.size-1, s)
        end
      end
    end
  end
end
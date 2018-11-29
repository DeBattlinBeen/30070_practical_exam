class PathFinder
  def initialize(routes)
    @bus_routes = routes
  end

  def find_all_paths(stop_id)
    paths = [[stop_id]]
    create_path(paths, paths.size-1, stop_id)

    str = "All paths starting from stop #{stop_id}\n"
    paths.each do |path|
      str += "#{path.to_s}\n"
    end
    str
  end

  def create_path(paths, index, stop_id)
    next_stops = @bus_routes.find_next_stops(stop_id)

    unless next_stops.size == 0
      path = Array.new(paths[index])
      next_stops.each do |s_id|
        if s_id == next_stops[0]
          paths[index] << s_id
          create_path(paths, index, s_id)
        else
          path_1 = Array.new(path)
          path_1 << s_id
          paths << path_1
          create_path(paths, paths.size-1, s_id)
        end
      end
    end
  end
end
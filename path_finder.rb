class PathFinder
  def initialize(routes)
    @bus_routes = routes
  end

  def find_all_paths(stop_id)
    paths = []
    next_stops = @bus_routes.find_next_stops(stop_id)
    index = 0
    next_stops.each do |s|
      new_path = [stop_id,s]
      paths[index] = new_path
      create_path(paths,index,s)
      index += 1
    end
    puts paths.to_s
  end

  def create_path(paths, index, stop_id)
    next_stops = @bus_routes.find_next_stops(stop_id)
    if next_stops.size == 0
      paths[index]
    else
      i = 0
      path = Array.new(paths[index])
      next_stops.each do |s_id|
        if i == 0
          paths[index] << s_id
          create_path(paths, index, s_id)
          i += 1
        else
          path_1 = Array.new(path)
          path_1 << s_id
          paths << path_1
          index = paths.size-1
          create_path(paths,index,s_id)
          i += 1
        end
      end
    end
  end
end
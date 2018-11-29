require_relative 'point.rb'

class BusStop
  include Comparable
  attr_reader :name, :id, :point

  def <=>(other)
    @name <=> other.name
  end

  def initialize(name, id, point)
    @id = id
    @name = name
    @point = point
  end

  def to_s
    "Bus stop \##{@id}: \"#{@name}\" located at #{@point}"
  end
end
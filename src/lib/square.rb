class Square

  attr_reader :location

  def initialize(location)
    @location = location
    @player = false
  end

  # View
  def to_s
    @player ? "[X]" : "[#{location}]"
  end

  # Model
  def landed
    @player = !@player
  end

end
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
  def landed(player_position)
    if player_position = @location
      @player = true
    end
  end

  def moved(player_position)
    if player_position != @location
      @player = false
    end
  end

  def location
    @location
  end

end

# new_square = Square.new(0, 1)
# puts new_square
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
    if player_position = location
      @player = !@player
    end
  end

end
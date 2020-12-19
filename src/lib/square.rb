class Square

  attr_reader :location, :type, :destination, :player, :draw

  attr_accessor :players

  def initialize(location)
    @location = location
    @player = false
    @type = 0
    @destination = 0
    @players = []
    @draw = "[#{location}]"
  end

  # Model
  # Flags the player has landed on the square
  def landed(player_position)
    if player_position = @location
      @player = true
    end 
  end

  # Flags the player has left the sqaure
  def moved(player_position)
    if player_position = @location
      @player = false
    end
  end

  # Sets the additional attributes for 'snake' and 'ladder' squares
  def snakeorladder(type, destination)
    @type = type
    @destination = destination
  end

end
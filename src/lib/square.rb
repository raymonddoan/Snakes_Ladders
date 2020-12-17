require 'colorize'
require_relative 'game'

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

  # View
  def to_s
    # if @player = true
    #   @players.each do |player|
    #     if player.position == @location
    #       return player.piece
    #     end
    #   end
    # else
    #   return "[#{@location}]"
    # end
    @player ? "[X]".colorize(:blue) : "[#{location}]"
  end

  # Model
  def landed(player_position)
    if player_position = @location
      @player = true

    end 
  end

  def moved(player_position)
    if player_position = @location
      @player = false
    end
  end

  def location
    @location
  end

  def snakeorladder(type, destination)
    @type = type
    @destination = destination
  end

end

# new_square 

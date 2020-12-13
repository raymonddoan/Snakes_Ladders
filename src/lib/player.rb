class Player

  attr_reader :name, :die_rolls, :dice

  attr_accessor :position

  def initialize(name, position, dice: dice)
    @name = name
    @position = position
  end

  # View


  # Model
  def to_s
    name
  end

  @position = 1
  def update_position(roll)
    @position += roll
  end
  
end
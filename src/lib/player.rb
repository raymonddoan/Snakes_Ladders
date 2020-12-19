require_relative 'dice'

class Player
  MOVE = 1
  WIN = 2

  attr_reader :name, :dice, :die_rolls

  attr_accessor :position, :color, :piece

  def initialize(name:)
    @name = name
    @position = 0
    @die_rolls = []
    @dice = Dice
    @color = ""
    @piece = piece
  end

  # View
  def rolls_array
    @die_rolls
  end

  # Model
  def to_s
    @name
  end

  def roll
    roll = @dice.roll_die
    @die_rolls.push(roll)
  end

  def last_roll
    @die_rolls.last
  end

  def current_position
    @position += last_roll()
  end

  # Represents the player's piece on the board in their colour
  def set_piece
    if @color == "green"
      @piece = "[X]".colorize(:green)
    elsif @color == "yellow"
      @piece = "[X]".colorize(:yellow)
    elsif @color == "blue"
      @piece = "[X]".colorize(:blue)
    elsif @color == "red"
      @piece = "[X]".colorize(:red)
    elsif @color == "magenta"
      @piece = "[X]".colorize(:magenta)
    elsif @color == "cyan"
      @piece = "[X]".colorize(:cyan)
    end
  end
  
end
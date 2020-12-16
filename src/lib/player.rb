require_relative 'dice'
require_relative 'board'

class Player
  MOVE = 1
  WIN = 2

  attr_reader :name, :dice, :die_rolls

  attr_accessor :position

  def initialize(name:, position: 0, die_rolls: [], dice: Dice)
    @name = name
    @position = position
    @die_rolls = die_rolls
    @dice = dice
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
    if @position + roll >= 99
      return roll, WIN      
    else
      return roll, MOVE
    end
  end

  def last_roll
    @die_rolls.last
  end

  def current_position
    @position += last_roll()
  end

  def position
    @position
  end
  
end
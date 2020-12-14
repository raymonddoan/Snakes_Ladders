require_relative 'player'
require_relative 'board'
require_relative 'square'

class Game

  attr_accessor :board, :player

  def initialize
    @board = Board.new
    @player = Player.new(name: "John")
  end

  # View

  # Model
  def turn 
    @player.roll
    @board.update_board(@player.now_position)
    
    puts @board.printBoard
    puts @player.rolls_array
    puts "#{@player} rolls #{@player.last_roll}"
  end

  def simulation
    i = 0
    for i in 1..5 do
      turn()
      sleep(0.1)
      # if i < 20
      #   system('clear')
      # end
      i += 1
    end
  end
  
end

game = Game.new
game.simulation

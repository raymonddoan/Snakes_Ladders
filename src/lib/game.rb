require_relative 'player'
require_relative 'board'
require_relative 'square'

MOVE = 1
WIN = 2

class Game

  attr_accessor :board, :player

  def initialize
    @board = Board.new
    @player = Player.new(name: "John")
  end

  # View

  # Model
  def turn
    # @playersCount = @player.count
    # while true
    #   for p in 0 .. @playersCount - 1 do
    #     puts
    #     puts
    #     if (p == 0)
    #       print "#{@player[p].name}, your turn. Your position is cell #{@player[p].position}. \n Press [RETURN] to roll the die."
    #       gets

    #     else
          
    #     end
    #   end  
    # end
    @board.removeX_board(@player.position)
    @player.roll
    @board.update_board(@player.now_position)
    
    puts @board.printBoard
    # puts @player.rolls_array
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
  
  def loadsnakeladder
    @board.setsnakesladders
  end

end

game = Game.new
game.loadsnakeladder
game.simulation

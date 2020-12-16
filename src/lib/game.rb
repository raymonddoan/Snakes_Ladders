require_relative 'player'
require_relative 'board'
require_relative 'square'

class Game

  NONE = 0
  LADDER = 1
  SNAKE = 2

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
    puts "#{@player} rolls #{@player.last_roll}"
    pos1 = @player.current_position

    s = @board.show_hash[pos1].type

    if s == NONE
      @board.update_board(pos1)
      puts "You have landed on #{pos1}"
    else
      pos1 = @board.show_hash[pos1].destination
      case s
      when SNAKE
        puts "You have landed on a snake."
      when LADDER
        puts "Lucky! You have landed on a ladder."
      end
      puts "Your new position is #{pos1}"
      @board.update_board(pos1)
      @player.position = pos1
    end

    # @board.update_board(@player.current_position)
    puts @board.printBoard
    # puts @player.rolls_array
  end

  def simulation
    i = 0
    for i in 1..3 do
      turn()
      # sleep(0.1)
      gets
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

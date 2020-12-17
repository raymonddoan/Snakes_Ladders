require_relative 'player'
require_relative 'board'
require_relative 'square'

require 'colorize'

class Game

  NONE = 0
  LADDER = 1
  SNAKE = 2

  attr_accessor :board, :player

  def initialize
    @board = Board.new

    system('clear')
    puts "Welcome to Snakes and Ladders - the only game you will ever want to play ! Let's get started. "

    @players = Array.new
    puts "Please enter all players' names: (Max 4 players)"
    p = 0
    for p in 0..3 do
      input = gets.chomp.capitalize
      break if input == ''
      @players << Player.new(name: input)
      p += 1
    end

    puts "Please enter what color you would like: (blue, red, green, yellow)"
    p = 0
    for p in 0..3 do
      color = gets.chomp.downcase # Set error message
      break if color == ''
      @players[p].color = color
      @players[p].set_piece()
      p += 1
    end

    @board.make_squares(@players)
  end

  # View

  # Model
  def play
    @playersCount = @players.count
    @board.setsnakesladders
    
    while true
      for p in 0 .. @playersCount - 1 do
        puts 
        if (p == 0)
          puts
          print "#{@players[p]}".colorize(:"#{@players[p].color}")
          puts ", your turn. Your position is square #{@players[p].position}. \n Press [RETURN] to roll the die."
          gets
          system('clear')
          @board.removeX_board(@players[p].position)
          @players[p].roll
          print "#{@players[p]}".colorize(:"#{@players[p].color}")
          puts " rolls #{@players[p].last_roll}"
          player_current_pos = @players[p].current_position

          if player_current_pos >= @board.hash_size
            print "#{@players[p]}".colorize(:"#{@players[p].color}")
            print " reached position #{@board.hash_size} and won the game!!!!\n"
            puts @board.printBoard
            puts "Press [RETURN] to exit the game"
            gets
            exit
          end

        else
          @board.removeX_board(@players[p].position)
          @players[p].roll
          print "#{@players[p]}".colorize(:"#{@players[p].color}")
          puts " rolls #{@players[p].last_roll}"
          player_current_pos = @players[p].current_position

          if player_current_pos >= @board.hash_size
            print "#{@players[p]}".colorize(:"#{@players[p].color}")
            print " reached position #{@board.hash_size} and won the game!!!!\n"
            puts @board.printBoard
            puts "Press [RETURN] to exit the game"
            gets
            exit
          end
        end

        type = @board.show_hash[player_current_pos].type
        if type == NONE
          @board.update_board(player_current_pos)
          print "#{@players[p]}".colorize(:"#{@players[p].color}") 
          puts " has landed on #{player_current_pos}"
        else
          player_current_pos = @board.show_hash[player_current_pos].destination
          case type
          when SNAKE
            print "Unlucky! " + "#{@players[p]}".colorize(:"#{@players[p].color}")
            puts " has landed on a snake."
          when LADDER
            print "Lucky! " + "#{@players[p]}".colorize(:"#{@players[p].color}")
            puts " has landed on a ladder."
          end
          puts "Your new position is #{player_current_pos}"
          @board.update_board(player_current_pos)
          @players[p].position = player_current_pos
        end
        puts @board.printBoard
        sleep(0.1)
      end  
    end
  end

  def players_array
    @players
  end
end

# game = Game.new
# game.play
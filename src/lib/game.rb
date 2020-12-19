require 'colorize'
require 'tty-prompt'

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

    system('clear')
    puts "Welcome to Snakes and Ladders - the only game you will ever want to play ! Let's get started. "

    # Instantiate the players and list them in an array
    @players = Array.new
    prompt = TTY::Prompt.new
    color_choices = %w(blue red green yellow magenta cyan)
    puts "Please enter all players' names: (Max 2 players)"
    p = 0
    for p in 0..1 do
      print "\nPlayer #{p + 1} name: "
      input = gets.chomp.capitalize
      break if input == ''
      @players << Player.new(name: input)

      # Allows players their colour of choice
      color = prompt.select("Please enter what colour you would like: ", color_choices)
      # Error handling if player chooses the same colour as the previous player
      while color == @players[p - 1].color
        puts "\nPlayer 1 has already selected this colour. Please select a different colour.".colorize(:red)
        color = prompt.select("Please enter what colour you would like: ", color_choices)
      end
      @players[p].color = color
      @players[p].set_piece()
      p += 1
    end

    @board.make_squares(@players)
  end

  def play
    @playersCount = @players.count

    # Instantiates the snakes and ladders logic on the board
    @board.setsnakesladders
    
    while true
      for p in 0 .. @playersCount - 1 do
        puts 
        puts

        # Start of game logic
        print "#{@players[p]}".colorize(:"#{@players[p].color}")
        puts ", your turn. Your position is square #{@players[p].position}. \n Press [RETURN] to roll the die."
        gets
        system('clear')
        @board.player_left(@players[p].position)

        # Players roll die and move position
        @players[p].roll
        print "#{@players[p]}".colorize(:"#{@players[p].color}")
        puts " rolls #{@players[p].last_roll}"
        player_current_pos = @players[p].current_position

        # Win Condition
        if player_current_pos >= @board.end_board
          print "#{@players[p]}".colorize(:"#{@players[p].color}")
          print " reached position #{@board.end_board} and won the game!!!!\n"
          puts @board.printBoard
          puts "Press [RETURN] to exit the game"
          gets
          exit
        end

        # Portals Logic
        type = @board.shash[player_current_pos].type
        if type == NONE
          @board.player_landed(player_current_pos)
          print "#{@players[p]}".colorize(:"#{@players[p].color}") 
          puts " has landed on #{player_current_pos}"
        else
          player_current_pos = @board.shash[player_current_pos].destination
          case type
          when SNAKE
            print "Unlucky! " + "#{@players[p]}".colorize(:"#{@players[p].color}")
            puts " has landed on a snake."
          when LADDER
            print "Lucky! " + "#{@players[p]}".colorize(:"#{@players[p].color}")
            puts " has landed on a ladder."
          end
          puts "Your new position is #{player_current_pos}"
          @board.player_landed(player_current_pos)
          @players[p].position = player_current_pos
        end

        # Update and print the board
        puts @board.printBoard
        sleep(0.1)
      end  
    end
  end

  # Access to the list of players
  def players_array
    @players
  end

end


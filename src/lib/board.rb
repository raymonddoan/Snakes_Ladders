require 'tty-table'
require 'colorize'
require_relative "square"

class Board
  NONE = 0
  LADDER = 1
  SNAKE = 2

  attr_reader :board, :hash

  attr_accessor :players

  def initialize
    @board = []
    @hash = {}
    @players_array = []
  end

  def make_squares(players_array)
    i = 0
    while i != 100
      @hash[i] = Square.new(i)
      @hash[i].players = players_array
      @players_array = players_array
      i += 1
    end
  end

  # Visual
  def printBoard
    r1 = []
    r2 = []
    r3 = []
    r4 = []
    r5 = []
    r6 = []
    r7 = []
    r8 = []
    r9 = []
    r10 = []
    i = 0
    while i != 101
      case i
      when 0..9
        r1 << @hash[i]
      when 10..19
        r2.unshift(@hash[i])
      when 20..29
        r3 << @hash[i]
      when 30..39
        r4.unshift(@hash[i])
      when 40..49
        r5 << @hash[i]
      when 50..59
        r6.unshift(@hash[i])
      when 60..69
        r7 << @hash[i]
      when 70..79
        r8.unshift(@hash[i])
      when 80..89
        r9 << @hash[i]
      when 90..99
        r10.unshift(@hash[i])
      end
      i += 1
    end
    
    # for every item in r1 do this and take an index
    r1.each_with_index do |x, index| 
      #for every player in player array do this
      @players_array.each do |player|
        # check if current location is not already taken by player 1
          if r1[index] != @players_array[0].piece
            # check if player position doesnt equal the location
            if player.position != x.location
              # r1 now equals [0]..[9]
              r1[index] = x.draw
            else
              # change r1 to the players piece
              r1[index] = player.piece
            end
          end
      end
    end

    # board = []
    # board.push(r10, r9, r8, r7, r6, r5, r4, r3, r2, r1) 
    # board = [[99,98,97,...],[]]


    # @board = TTY::Table.new([board])
    @board = TTY::Table.new([r10, r9, r8, r7, r6, r5, r4, r3, r2, r1])

  end

  def show_hash
    @hash
  end

  def hash_size
    @hash.length
  end

  # Method
  def update_board(position)
    @hash[position].landed(position)
  end

  def removeX_board(position)
    @hash[position].moved(position)
  end

  def setsnakesladders
    @hash[3].snakeorladder( LADDER, 13 ); 
    @hash[8].snakeorladder( LADDER, 30 ); 
    @hash[19].snakeorladder( LADDER, 37 );
    @hash[27].snakeorladder( LADDER, 83 );
    @hash[39].snakeorladder( LADDER, 58 ); 
    @hash[50].snakeorladder( LADDER, 66 );
    @hash[62].snakeorladder( LADDER, 80 ); 
    @hash[70].snakeorladder( LADDER, 90 ); 
    @hash[16].snakeorladder( SNAKE, 6 );
    @hash[61].snakeorladder( SNAKE, 18 ); 
    @hash[86].snakeorladder( SNAKE, 23 ); 
    @hash[53].snakeorladder( SNAKE, 33 );
    @hash[63].snakeorladder( SNAKE, 59 ); 
    @hash[92].snakeorladder( SNAKE, 72 ); 
    @hash[94].snakeorladder( SNAKE, 74 ); 
    @hash[98].snakeorladder( SNAKE, 77 );
  end

end

# oldboard = Board.new
# # oldboard.update_board(1)
# p oldboard.show_hash
# puts oldboard.setsnakesladders

# newboard = Board.new
# puts newboard.board_squares
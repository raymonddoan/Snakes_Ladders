require 'tty-table'
require_relative "square"

class Board

  attr_reader :board

  def initialize
    @board = []
  end

  # Visual
  def printBoard
    i = 1
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
    while i != 101
        case i
        when 1..10
          r1 << eval("s#{i} = Square.new(#{i})")
        when 11..20
          r2 << eval("s#{i} = Square.new(#{i})")
        when 21..30
          r3 << eval("s#{i} = Square.new(#{i})")
        when 31..40
          r4 << eval("s#{i} = Square.new(#{i})")
        when 41..50
          r5 << eval("s#{i} = Square.new(#{i})")
        when 51..60
          r6 << eval("s#{i} = Square.new(#{i})")
        when 61..70
          r7 << eval("s#{i} = Square.new(#{i})")
        when 71..80
          r8 << eval("s#{i} = Square.new(#{i})")
        when 81..90
          r9 << eval("s#{i} = Square.new(#{i})")
        when 91..100
          r10 << eval("s#{i} = Square.new(#{i})")
        end
        i += 1
    end

    @board = TTY::Table.new([r10, r9, r8, r7, r6, r5, r4, r3, r2, r1])
    puts @board
  end  

end

new_board = Board.new
new_board.printBoard




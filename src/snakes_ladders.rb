require_relative 'lib/game'

def how_to_play
  system('clear')
  puts "
  Snakes and Ladders, known originally as Moksha Patam, is an ancient Indian board game for two or more players regarded today as a worldwide classic.
  It is played on a game board with numbered, gridded squares. A number of \"ladders\" and \"snakes\" are pictured on the board, each connecting two specific board squares.

  To play the game:
    1. Each player enters in their name and selects the colour they want to be represented on the board. 
      (NOTE: there is currently a maximum of 2 players available for this game.)
    2. Once completed, Player 1 will be required to press the [RETURN] key to start the game and roll the dice.
    3. Once Player 1 rolls, it will be Player 2's turn to roll the dice by pressing the [RETURN] key.
    4. Continue to alternate between both players in rolling the dice.
    5. Whoever reaches the end of the board first WINS the game !!!
  "
end

def version
  system('clear')
  puts "
  Snakes and Ladders Version 1.0.0 by Raymond Doan
  Summary: A visual rendering of the game Snakes and Ladders
  Homepage: https://github.com/whywesmurfing/Snakes_Ladders

  Contact Me through these media platforms:
  GitHub: https://github.com/whywesmurfing/
  LinkedIn: https://www.linkedin.com/in/raymonddoan/
  Twitter: https://twitter.com/raydoan94
  "
end

def directory
  system('clear')
  puts "
  usage: ruby snakes_ladders.rb [--directory] [--version] [--help]

  These are common CMD-Line Arguments available in this application:

    -d, --directory      Shows you all the available CMD-Line Arguments and a description of each.
    -v, --version        Shows the version of the Snakes and Ladders you are currently using.
    -h, --help           A description of how Snakes and Ladders are played.
    [nil]                This will launch the game.
  "
end

def launch_game
  game = Game.new
  game.play
end

if ARGV[0] == "-h" || ARGV[0] == "--help"
  how_to_play()
elsif ARGV[0] == "-v" || ARGV[0] == "--version"
  version()
elsif ARGV[0] == "-d" || ARGV[0] == "--directory"
  directory()
else
  launch_game()
end